-- guaranteed_B_data.sql
USE ry-vue;

-- 先只插入最简单的数据，不删除任何现有数据
-- 插入一个测试学期（确保不冲突）
INSERT IGNORE INTO term (term_id, term_name) VALUES 
('b_test_term_1', 'Test Term B');

-- 插入测试课程（如果不存在）
INSERT IGNORE INTO course (course_code, course_name, credit_hours) VALUES 
('B_TEST_001', 'Test Course 1', 3);

-- 获取课程ID
SET @course_id = (SELECT course_id FROM course WHERE course_code = 'B_TEST_001');

-- 插入测试班级（如果不存在）
INSERT IGNORE INTO course_class (course_id, teacher_id, term_id) VALUES 
(@course_id, 1001, 'b_test_term_1');

-- 获取班级ID
SET @class_id = (SELECT class_id FROM course_class WHERE course_id = @course_id AND term_id = 'b_test_term_1');

-- 插入测试选课记录
-- 先删除可能存在的冲突记录
DELETE FROM enrollment WHERE student_id = 9999;
INSERT INTO enrollment (student_id, class_id, term_id, status) VALUES
(9999, @class_id, 'b_test_term_1', 'ENROLLED');

-- 插入测试时间槽
DELETE FROM class_time_slot WHERE class_id = @class_id;
INSERT INTO class_time_slot (class_id, week_day, start_slot, end_slot) VALUES
(@class_id, 1, 1, 2);

SELECT '测试数据插入成功!' as result;
SELECT '插入的记录:' as info;
SELECT 'term:', term_id, term_name FROM term WHERE term_id = 'b_test_term_1';
SELECT 'course:', course_code, course_name FROM course WHERE course_code = 'B_TEST_001';
SELECT 'enrollment:', enrollment_id, student_id, status FROM enrollment WHERE student_id = 9999;