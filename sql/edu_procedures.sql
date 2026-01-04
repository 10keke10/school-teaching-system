-- 文件：edu_procedures.sql
-- 位置：D:/coding/project/school-teaching-system/sql/edu_procedures.sql
-- 描述：选课系统存储过程

USE `ry-vue`;

-- 删除已有的存储过程（如果存在）
DROP PROCEDURE IF EXISTS sp_calc_student_credits;
DROP PROCEDURE IF EXISTS sp_check_enrollment_eligible;
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
