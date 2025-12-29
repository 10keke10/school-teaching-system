-- complete_B_test_data.sql
USE ry-vue;

START TRANSACTION;

-- 1. 清理旧的B测试数据（只清理B的数据）
DELETE FROM enrollment WHERE student_id IN (2001, 2002, 2003);
DELETE FROM class_time_slot WHERE class_id IN (
    SELECT class_id FROM course_class WHERE term_id LIKE 'b_%'
);
DELETE FROM course_class WHERE term_id LIKE 'b_%';
DELETE FROM course WHERE course_code LIKE 'B_%';
DELETE FROM term WHERE term_id LIKE 'b_%';

-- 2. 插入B的学期
INSERT INTO term (term_id, term_name, is_active) VALUES 
('b_2024_fall', 'B测试学期', 1);

-- 3. 插入B的课程
INSERT INTO course (course_code, course_name, credit_hours, course_type) VALUES 
('B_CS101', 'Computer Basics', 3, 'required'),
('B_MATH201', 'Advanced Math', 4, 'required');

-- 4. 获取课程ID
SET @cs_course_id = (SELECT course_id FROM course WHERE course_code = 'B_CS101');
SET @math_course_id = (SELECT course_id FROM course WHERE course_code = 'B_MATH201');

-- 5. 插入教学班
INSERT INTO course_class (course_id, teacher_id, term_id, capacity, selected_count) VALUES
(@cs_course_id, 1001, 'b_2024_fall', 60, 25),
(@math_course_id, 1002, 'b_2024_fall', 50, 45);

-- 6. 获取班级ID
SET @cs_class_id = (SELECT class_id FROM course_class WHERE course_id = @cs_course_id AND term_id = 'b_2024_fall');
SET @math_class_id = (SELECT class_id FROM course_class WHERE course_id = @math_course_id AND term_id = 'b_2024_fall');

-- 7. 插入选课记录
INSERT INTO enrollment (student_id, class_id, term_id, status, grade, grade_status) VALUES
(2001, @cs_class_id, 'b_2024_fall', 'ENROLLED', 85.5, 'PUBLISHED'),
(2001, @math_class_id, 'b_2024_fall', 'ENROLLED', 92.0, 'DRAFT'),
(2002, @cs_class_id, 'b_2024_fall', 'DROPPED', NULL, NULL),
(2003, @cs_class_id, 'b_2024_fall', 'ENROLLED', 78.5, 'PUBLISHED');

-- 8. 插入时间槽
INSERT INTO class_time_slot (class_id, week_day, start_slot, end_slot) VALUES
(@cs_class_id, 1, 1, 2),   -- 周一1-2节
(@cs_class_id, 3, 3, 4),   -- 周三3-4节
(@math_class_id, 2, 5, 6); -- 周二5-6节

COMMIT;

SELECT 'B完整测试数据插入成功!' as result;