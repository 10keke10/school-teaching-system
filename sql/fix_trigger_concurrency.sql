USE `ry-vue`;

DROP TRIGGER IF EXISTS trg_check_capacity_insert;

DELIMITER //

CREATE TRIGGER trg_check_capacity_insert
BEFORE INSERT ON enrollment
FOR EACH ROW
BEGIN
    DECLARE v_capacity INT;
    DECLARE v_selected INT;
    
    -- 核心修改：增加 FOR UPDATE 以锁定行，防止并发插入导致超员
    SELECT capacity, selected_count INTO v_capacity, v_selected
    FROM course_class
    WHERE class_id = NEW.class_id
    FOR UPDATE;
    
    -- 调试用：如果 selected_count 已经大于等于 capacity，抛出异常
    IF v_selected >= v_capacity THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '选课失败：该教学班已满员';
    END IF;
END //

DELIMITER ;
