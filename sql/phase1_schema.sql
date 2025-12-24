-- =========================
-- Phase 1: 教学事务核心表
-- =========================

-- 1. 学期表
CREATE TABLE term (
                      term_id VARCHAR(20) PRIMARY KEY,
                      term_name VARCHAR(50) NOT NULL,
                      start_date DATE,
                      end_date DATE,
                      remark VARCHAR(200)
);

-- 2. 教学班表
CREATE TABLE course_class (
    class_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    course_id BIGINT NOT NULL,
    teacher_id BIGINT NOT NULL,
    term_id VARCHAR(20) NOT NULL,
    capacity INT NOT NULL,
    selected_count INT DEFAULT 0,
    schedule_info VARCHAR(200),
    status VARCHAR(20) DEFAULT 'OPEN'
);

-- 3. 选课表
CREATE TABLE enrollment (
                            enroll_id BIGINT PRIMARY KEY AUTO_INCREMENT,
                            student_id BIGINT NOT NULL,
                            class_id BIGINT NOT NULL,
                            status VARCHAR(20) NOT NULL,
                            grade DECIMAL(5,2),
                            grade_status VARCHAR(20),
                            create_time DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 4. 学分规则表
CREATE TABLE credit_rule (
                             rule_id BIGINT PRIMARY KEY AUTO_INCREMENT,
                             max_credit INT NOT NULL,
                             remark VARCHAR(200)
);

-- =========================
-- Triggers
-- =========================

-- BEFORE INSERT
DELIMITER $$

CREATE TRIGGER trg_enroll_before_insert
    BEFORE INSERT ON enrollment
    FOR EACH ROW
BEGIN
    DECLARE cur_count INT;
  DECLARE max_cap INT;

    SELECT selected_count, capacity
    INTO cur_count, max_cap
    FROM course_class
    WHERE class_id = NEW.class_id;

    IF cur_count >= max_cap THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = '教学班容量已满';
END IF;
END$$

DELIMITER ;

-- AFTER INSERT
CREATE TRIGGER trg_enroll_after_insert
    AFTER INSERT ON enrollment
    FOR EACH ROW
    UPDATE course_class
    SET selected_count = selected_count + 1
    WHERE class_id = NEW.class_id;

-- AFTER UPDATE
CREATE TRIGGER trg_enroll_after_update
    AFTER UPDATE ON enrollment
    FOR EACH ROW
BEGIN
    IF OLD.status = 'ENROLLED' AND NEW.status = 'DROPPED' THEN
    UPDATE course_class
    SET selected_count = selected_count - 1
    WHERE class_id = NEW.class_id;
END IF;
END;

-- =========================
-- Stored Procedure
-- =========================

DELIMITER $$

CREATE PROCEDURE sp_calc_term_credits(
    IN p_student_id BIGINT,
    IN p_term_id VARCHAR(20),
    OUT total_credit INT
)
BEGIN
SELECT SUM(c.credit)
INTO total_credit
FROM enrollment e
         JOIN course_class cc ON e.class_id = cc.class_id
         JOIN course c ON cc.course_id = c.course_id
WHERE e.student_id = p_student_id
  AND cc.term_id = p_term_id
  AND e.status = 'ENROLLED';
END$$

DELIMITER ;