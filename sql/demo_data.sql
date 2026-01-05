USE `ry-vue`;
SET NAMES utf8mb4;

-- ==========================================
-- 演示数据脚本
-- 用途：生成演示用的特定课程班级数据
-- ==========================================

-- 1. 增加一条容量为10，已选人数为10的课程信息（用于演示满员无法选课）
-- 课程：CS203 (数据库系统)
-- 教师：1002
-- 时间：Fri 1-2
INSERT INTO course_class (course_id, teacher_id, term_id, class_time, location, capacity, selected_count, status, remark)
SELECT 
    course_id, 
    1002, 
    '2025-2026-fall', 
    'Fri 1-2', 
    'DemoBldg-101', 
    10, 
    10, 
    1,
    'Demo data: Full class'
FROM course WHERE course_code = 'CS203' LIMIT 1;

-- 2. 增加一条容量为10，已选人数为9的课程信息（用于演示选课后变满员）
-- 课程：CS204 (操作系统)
-- 教师：1003
-- 时间：Fri 3-4
INSERT INTO course_class (course_id, teacher_id, term_id, class_time, location, capacity, selected_count, status, remark)
SELECT 
    course_id, 
    1003, 
    '2025-2026-fall', 
    'Fri 3-4', 
    'DemoBldg-102', 
    10, 
    9, 
    1,
    'Demo data: Boundary class'
FROM course WHERE course_code = 'CS204' LIMIT 1;

-- 3. 确保有一些学生的选课记录（可选，用于演示已选列表）
-- 假设 student2004 (id 2004) 选修了上面的 CS204 (id 将自动生成，这里演示手动插入enrollment需要知道class_id，
-- 由于class_id是自增的，我们这里只插入班级数据，选课操作建议在界面演示)

-- 4. 插入一个用于测试学分上限的选课记录（假设学分上限20）
-- 如果需要，可以在这里插入更多数据。目前上述两条已满足核心演示需求。
