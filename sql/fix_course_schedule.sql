-- 文件：fix_course_schedule.sql
-- 描述：修复课表显示问题（同步 class_time_slot 表），并建立触发器自动维护
-- 作者：Pair Programmer
-- 日期：2026-01-06

SET NAMES utf8mb4;
USE `ry-vue`;

-- =============================================
-- 1. 创建存储过程：解析时间字符串并更新 slot 表
-- =============================================
DROP PROCEDURE IF EXISTS sp_refresh_class_slots;

DELIMITER $$

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
    
    -- 1. 清理该班级旧的时间片
    DELETE FROM class_time_slot WHERE class_id = p_class_id;
    
    -- 2. 获取当前时间字符串
    SELECT class_time INTO v_time_str FROM course_class WHERE class_id = p_class_id;
    
    -- 3. 解析逻辑
    IF v_time_str IS NOT NULL AND v_time_str != '' THEN
        -- 追加逗号以便循环处理最后一个元素
        SET v_time_str = CONCAT(v_time_str, ',');
        
        parse_loop: WHILE CHAR_LENGTH(v_time_str) > 0 DO
            -- 提取逗号前的片段
            SET v_comma_pos = LOCATE(',', v_time_str);
            IF v_comma_pos = 0 THEN
                SET v_segment = v_time_str;
                SET v_time_str = '';
            ELSE
                SET v_segment = TRIM(SUBSTRING(v_time_str, 1, v_comma_pos - 1));
                SET v_time_str = SUBSTRING(v_time_str, v_comma_pos + 1);
            END IF;
            
            IF CHAR_LENGTH(v_segment) > 0 THEN
                -- 解析 "周x"
                SET v_week_day = 0;
                IF v_segment LIKE '%周一%' THEN SET v_week_day = 1;
                ELSEIF v_segment LIKE '%周二%' THEN SET v_week_day = 2;
                ELSEIF v_segment LIKE '%周三%' THEN SET v_week_day = 3;
                ELSEIF v_segment LIKE '%周四%' THEN SET v_week_day = 4;
                ELSEIF v_segment LIKE '%周五%' THEN SET v_week_day = 5;
                ELSEIF v_segment LIKE '%周六%' THEN SET v_week_day = 6;
                ELSEIF v_segment LIKE '%周日%' THEN SET v_week_day = 7;
                END IF;
                
                -- 解析 "Y-Z节"
                IF v_week_day > 0 THEN
                    SET v_dash_pos = LOCATE('-', v_segment);
                    SET v_jie_pos = LOCATE('节', v_segment);
                    
                    IF v_dash_pos > 0 AND v_jie_pos > v_dash_pos THEN
                        -- 提取开始节次：'周x' (2字符) 之后，'-' 之前
                        -- SUBSTRING(str, pos, len)
                        -- 假设 '周x' 占 2 个字符长度 (char_length)
                        SET v_start = CAST(SUBSTRING(v_segment, 3, v_dash_pos - 3) AS UNSIGNED);
                        -- 提取结束节次：'-' 之后，'节' 之前
                        SET v_end = CAST(SUBSTRING(v_segment, v_dash_pos + 1, v_jie_pos - v_dash_pos - 1) AS UNSIGNED);
                        
                        -- 插入 slot
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

DELIMITER ;

-- =============================================
-- 2. 创建触发器：自动同步 (INSERT & UPDATE)
-- =============================================
DROP TRIGGER IF EXISTS trg_sync_slots_insert;
DROP TRIGGER IF EXISTS trg_sync_slots_update;

DELIMITER $$

CREATE TRIGGER trg_sync_slots_insert
AFTER INSERT ON course_class
FOR EACH ROW
BEGIN
    CALL sp_refresh_class_slots(NEW.class_id);
END$$

CREATE TRIGGER trg_sync_slots_update
AFTER UPDATE ON course_class
FOR EACH ROW
BEGIN
    -- 仅当 class_time 发生变化时才执行
    IF OLD.class_time != NEW.class_time OR (OLD.class_time IS NULL AND NEW.class_time IS NOT NULL) OR (OLD.class_time IS NOT NULL AND NEW.class_time IS NULL) THEN
        CALL sp_refresh_class_slots(NEW.class_id);
    END IF;
END$$

DELIMITER ;

-- =============================================
-- 3. 全量修复现有数据
-- =============================================
-- 使用临时存储过程遍历所有课程进行修复
DROP PROCEDURE IF EXISTS sp_fix_all_slots;
DELIMITER $$
CREATE PROCEDURE sp_fix_all_slots()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_id BIGINT;
    DECLARE cur CURSOR FOR SELECT class_id FROM course_class;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_id;
        IF done THEN
            LEAVE read_loop;
        END IF;
        CALL sp_refresh_class_slots(v_id);
    END LOOP;
    CLOSE cur;
END$$
DELIMITER ;

-- 执行修复
CALL sp_fix_all_slots();

-- 清理临时过程 (保留 sp_refresh_class_slots 供触发器使用)
DROP PROCEDURE IF EXISTS sp_fix_all_slots;

SELECT 'Success: Time slots synced and triggers installed.' as result;
