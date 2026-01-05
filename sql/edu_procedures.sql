-- 文件：edu_procedures.sql
-- 位置：D:/coding/project/school-teaching-system/sql/edu_procedures.sql
-- 描述：选课系统存储过程

USE `ry-vue`;

-- 删除已有的存储过程（如果存在）
DROP PROCEDURE IF EXISTS sp_calc_student_credits;
DROP PROCEDURE IF EXISTS sp_check_enrollment_eligible;
DROP PROCEDURE IF EXISTS sp_refresh_class_slots;
DROP FUNCTION IF EXISTS fn_get_student_credits;

DELIMITER $$

-- 存储过程：计算学生某学期已选课程总学分
-- 契约：GET /edu/statistics/student/{id}/credits
CREATE PROCEDURE sp_calc_student_credits(
    IN p_student_id BIGINT,
    IN p_term_id VARCHAR(20),
    OUT p_total_credits INT
)
BEGIN
    DECLARE v_total INT DEFAULT 0;
    
    -- 计算学生在该学期已选课程的总学分
    -- 注意：term_id可能需要处理前缀
    SELECT COALESCE(SUM(c.credit_hours), 0) INTO v_total
    FROM enrollment e
    JOIN course_class cc ON e.class_id = cc.class_id
    JOIN course c ON cc.course_id = c.course_id
    WHERE e.student_id = p_student_id
      AND e.term_id LIKE CONCAT('%', p_term_id, '%')  -- 模糊匹配，兼容前缀
      AND e.status = 'ENROLLED'
      AND cc.status = 1;  -- 只计算开放选课的课程
    
    SET p_total_credits = v_total;
END$$

-- 存储过程：检查学生是否可以选课（学分上限+时间冲突）
CREATE PROCEDURE sp_check_enrollment_eligible(
    IN p_student_id BIGINT,
    IN p_class_id INT,
    OUT p_is_eligible BOOLEAN,
    OUT p_error_message VARCHAR(200)
)
BEGIN
    DECLARE v_current_credits INT DEFAULT 0;
    DECLARE v_course_credits INT DEFAULT 0;
    DECLARE v_max_credits INT DEFAULT 20;
    DECLARE v_term_id VARCHAR(20);
    
    -- 获取课程信息和学期
    SELECT cc.term_id, c.credit_hours INTO v_term_id, v_course_credits
    FROM course_class cc
    JOIN course c ON cc.course_id = c.course_id
    WHERE cc.class_id = p_class_id;
    
    -- 计算当前已选学分
    CALL sp_calc_student_credits(p_student_id, v_term_id, v_current_credits);
    
    -- 获取学分上限
    SELECT COALESCE(MAX(max_credits), 20) INTO v_max_credits
    FROM credit_rule 
    WHERE term_id = v_term_id AND is_active = 1;
    
    -- 检查学分上限
    IF v_current_credits + v_course_credits > v_max_credits THEN
        SET p_is_eligible = FALSE;
        SET p_error_message = CONCAT('超过学分上限：当前', v_current_credits, '学分，本课程', v_course_credits, '学分，上限', v_max_credits, '学分');
    ELSE
        SET p_is_eligible = TRUE;
        SET p_error_message = NULL;
    END IF;
END$$

-- 存储过程：解析时间字符串并更新 slot 表
-- 供触发器调用，自动同步 class_time_slot
CREATE PROCEDURE sp_refresh_class_slots(IN p_class_id BIGINT)
BEGIN
    DECLARE v_time_str VARCHAR(255);
    DECLARE v_segment VARCHAR(255);
    DECLARE v_week_day INT;
    DECLARE v_start INT;
    DECLARE v_end INT;
    DECLARE v_comma_pos INT;
    DECLARE v_dash_pos INT;
    DECLARE v_jie_pos INT;
    
    DELETE FROM class_time_slot WHERE class_id = p_class_id;
    SELECT class_time INTO v_time_str FROM course_class WHERE class_id = p_class_id;
    
    IF v_time_str IS NOT NULL AND v_time_str != '' THEN
        SET v_time_str = CONCAT(v_time_str, ',');
        parse_loop: WHILE CHAR_LENGTH(v_time_str) > 0 DO
            SET v_comma_pos = LOCATE(',', v_time_str);
            IF v_comma_pos = 0 THEN
                SET v_segment = v_time_str;
                SET v_time_str = '';
            ELSE
                SET v_segment = TRIM(SUBSTRING(v_time_str, 1, v_comma_pos - 1));
                SET v_time_str = SUBSTRING(v_time_str, v_comma_pos + 1);
            END IF;
            
            IF CHAR_LENGTH(v_segment) > 0 THEN
                SET v_week_day = 0;
                IF v_segment LIKE '%周一%' THEN SET v_week_day = 1;
                ELSEIF v_segment LIKE '%周二%' THEN SET v_week_day = 2;
                ELSEIF v_segment LIKE '%周三%' THEN SET v_week_day = 3;
                ELSEIF v_segment LIKE '%周四%' THEN SET v_week_day = 4;
                ELSEIF v_segment LIKE '%周五%' THEN SET v_week_day = 5;
                ELSEIF v_segment LIKE '%周六%' THEN SET v_week_day = 6;
                ELSEIF v_segment LIKE '%周日%' THEN SET v_week_day = 7;
                END IF;
                
                IF v_week_day > 0 THEN
                    SET v_dash_pos = LOCATE('-', v_segment);
                    SET v_jie_pos = LOCATE('节', v_segment);
                    IF v_dash_pos > 0 AND v_jie_pos > v_dash_pos THEN
                        SET v_start = CAST(SUBSTRING(v_segment, 3, v_dash_pos - 3) AS UNSIGNED);
                        SET v_end = CAST(SUBSTRING(v_segment, v_dash_pos + 1, v_jie_pos - v_dash_pos - 1) AS UNSIGNED);
                        IF v_start > 0 AND v_end >= v_start THEN
                            INSERT INTO class_time_slot (class_id, week_day, start_slot, end_slot, create_time, update_time)
                            VALUES (p_class_id, v_week_day, v_start, v_end, NOW(), NOW());
                        END IF;
                    END IF;
                END IF;
            END IF;
        END WHILE parse_loop;
    END IF;
END$$

-- 函数：获取学生学分（方便SQL中调用）
CREATE FUNCTION fn_get_student_credits(p_student_id BIGINT, p_term_id VARCHAR(20))
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_credits INT;
    CALL sp_calc_student_credits(p_student_id, p_term_id, v_credits);
    RETURN v_credits;
END$$

DELIMITER ;

-- 验证存储过程创建成功
SELECT '存储过程创建完成' as status;
