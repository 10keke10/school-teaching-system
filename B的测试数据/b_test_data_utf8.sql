-- b_test_data_utf8.sql
USE ry-vue;

START TRANSACTION;

-- ==================== 第一部分：创建学期 ====================
INSERT INTO term (term_id, term_name, is_active, enroll_start, enroll_end, drop_deadline) VALUES 
('b_2024_fall', 'B测试秋季学期', 1, '2024-09-01', '2024-09-30', '2024-10-15'),
('b_2024_spring', 'B测试春季学期', 0, '2025-03-01', '2025-03-31', '2025-04-15'),
('b_2024_summer', 'B测试夏季学期', 1, '2025-07-01', '2025-07-31', '2025-08-15');

-- ==================== 第二部分：创建课程 ====================
INSERT INTO course (course_code, course_name, credit_hours, course_type, description) VALUES 
('B_CS101', '计算机基础', 3, '必修', '计算机科学入门课程'),
('B_CS201', '数据结构', 4, '必修', '数据结构与算法'),
('B_MATH101', '高等数学', 4, '必修', '大学数学基础课程'),
('B_ENG101', '大学英语', 2, '选修', '英语听说读写训练'),
('B_PHY101', '大学物理', 3, '必修', '物理学基础'),
('B_CHEM101', '大学化学', 3, '选修', '化学基础知识'),
('B_PE101', '大学体育', 1, '选修', '体育锻炼课程'),
('B_ART101', '艺术鉴赏', 2, '选修', '艺术欣赏与评论');

-- ==================== 第三部分：创建教学班 ====================
-- 获取课程ID
SET @cs101_id = (SELECT course_id FROM course WHERE course_code = 'B_CS101');
SET @cs201_id = (SELECT course_id FROM course WHERE course_code = 'B_CS201');
SET @math101_id = (SELECT course_id FROM course WHERE course_code = 'B_MATH101');
SET @eng101_id = (SELECT course_id FROM course WHERE course_code = 'B_ENG101');
SET @phy101_id = (SELECT course_id FROM course WHERE course_code = 'B_PHY101');
SET @chem101_id = (SELECT course_id FROM course WHERE course_code = 'B_CHEM101');
SET @pe101_id = (SELECT course_id FROM course WHERE course_code = 'B_PE101');
SET @art101_id = (SELECT course_id FROM course WHERE course_code = 'B_ART101');

-- 秋季学期教学班
INSERT INTO course_class (course_id, teacher_id, term_id, capacity, selected_count, class_time, location) VALUES
(@cs101_id, 1001, 'b_2024_fall', 60, 58, '周一1-2节，周三3-4节', '教学楼A201'),
(@cs101_id, 1001, 'b_2024_fall', 60, 25, '周二1-2节，周四3-4节', '教学楼A202'),
(@cs201_id, 1002, 'b_2024_fall', 50, 50, '周一3-4节，周三5-6节', '教学楼B301'),
(@math101_id, 1003, 'b_2024_fall', 55, 30, '周二3-4节，周五1-2节', '教学楼C101'),
(@eng101_id, 1004, 'b_2024_fall', 40, 15, '周三7-8节', '外语楼D201'),
-- 春季学期
(@phy101_id, 1005, 'b_2024_spring', 45, 20, '周四5-6节', '实验楼E101'),
(@chem101_id, 1006, 'b_2024_spring', 35, 10, '周五3-4节', '化学楼F201'),
-- 夏季学期
(@pe101_id, 1007, 'b_2024_summer', 100, 80, '周一5-6节，周三7-8节', '体育馆'),
(@art101_id, 1008, 'b_2024_summer', 60, 25, '周二7-8节', '艺术楼G101');

-- ==================== 第四部分：获取班级ID ====================
SET @cs101_class1 = (SELECT class_id FROM course_class WHERE course_id = @cs101_id AND teacher_id = 1001 AND term_id = 'b_2024_fall' ORDER BY class_id LIMIT 1);
SET @cs101_class2 = (SELECT class_id FROM course_class WHERE course_id = @cs101_id AND teacher_id = 1001 AND term_id = 'b_2024_fall' ORDER BY class_id DESC LIMIT 1);
SET @cs201_class = (SELECT class_id FROM course_class WHERE course_id = @cs201_id AND term_id = 'b_2024_fall');
SET @math_class = (SELECT class_id FROM course_class WHERE course_id = @math101_id AND term_id = 'b_2024_fall');
SET @eng_class = (SELECT class_id FROM course_class WHERE course_id = @eng101_id AND term_id = 'b_2024_fall');
SET @phy_class = (SELECT class_id FROM course_class WHERE course_id = @phy101_id AND term_id = 'b_2024_spring');
SET @chem_class = (SELECT class_id FROM course_class WHERE course_id = @chem101_id AND term_id = 'b_2024_spring');
SET @pe_class = (SELECT class_id FROM course_class WHERE course_id = @pe101_id AND term_id = 'b_2024_summer');
SET @art_class = (SELECT class_id FROM course_class WHERE course_id = @art101_id AND term_id = 'b_2024_summer');

-- ==================== 第五部分：插入选课记录 ====================
-- 学生2001：多学期多课程
INSERT INTO enrollment (student_id, class_id, term_id, status, grade, grade_status, enroll_time) VALUES
(2001, @cs101_class1, 'b_2024_fall', 'ENROLLED', 85.5, 'PUBLISHED', '2024-09-05 09:00:00'),
(2001, @math_class, 'b_2024_fall', 'ENROLLED', 92.0, 'PUBLISHED', '2024-09-06 10:00:00'),
(2001, @eng_class, 'b_2024_fall', 'ENROLLED', 78.0, 'DRAFT', '2024-09-07 11:00:00'),
(2001, @phy_class, 'b_2024_spring', 'ENROLLED', 88.5, 'PUBLISHED', '2025-03-02 09:00:00'),
(2001, @pe_class, 'b_2024_summer', 'ENROLLED', 95.0, 'PUBLISHED', '2025-07-03 14:00:00'),

-- 学生2002：有退课记录
(2002, @cs101_class1, 'b_2024_fall', 'DROPPED', NULL, NULL, '2024-09-05 09:30:00'),
(2002, @cs101_class2, 'b_2024_fall', 'ENROLLED', 67.5, 'PUBLISHED', '2024-09-10 09:00:00'),
(2002, @cs201_class, 'b_2024_fall', 'ENROLLED', 73.0, 'PUBLISHED', '2024-09-08 10:00:00'),

-- 学生2003：成绩待发布
(2003, @cs101_class1, 'b_2024_fall', 'ENROLLED', 91.0, 'DRAFT', '2024-09-06 09:00:00'),
(2003, @math_class, 'b_2024_fall', 'ENROLLED', 82.5, 'DRAFT', '2024-09-07 10:00:00'),
(2003, @art_class, 'b_2024_summer', 'ENROLLED', NULL, 'DRAFT', '2025-07-04 15:00:00'),

-- 学生2004：只选1门课
(2004, @cs101_class2, 'b_2024_fall', 'ENROLLED', 88.0, 'PUBLISHED', '2024-09-12 09:00:00'),

-- 学生2005：接近学分上限
(2005, @cs101_class1, 'b_2024_fall', 'ENROLLED', 79.0, 'PUBLISHED', '2024-09-05 09:00:00'),
(2005, @math_class, 'b_2024_fall', 'ENROLLED', 84.5, 'PUBLISHED', '2024-09-06 10:00:00'),
(2005, @eng_class, 'b_2024_fall', 'ENROLLED', 90.0, 'PUBLISHED', '2024-09-07 11:00:00'),
(2005, @chem_class, 'b_2024_spring', 'ENROLLED', 81.5, 'PUBLISHED', '2025-03-03 10:00:00'),

-- 学生2006：新选课无成绩
(2006, @cs101_class2, 'b_2024_fall', 'ENROLLED', NULL, 'DRAFT', NOW()),

-- 学生2007：满员课程
(2007, @cs201_class, 'b_2024_fall', 'ENROLLED', 76.0, 'PUBLISHED', '2024-09-01 09:00:00'),

-- 学生2008：时间冲突测试
(2008, @cs101_class1, 'b_2024_fall', 'ENROLLED', 85.0, 'PUBLISHED', '2024-09-05 09:00:00'),

-- 学生2009：成绩优异
(2009, @cs101_class1, 'b_2024_fall', 'ENROLLED', 96.5, 'PUBLISHED', '2024-09-05 09:00:00'),
(2009, @math_class, 'b_2024_fall', 'ENROLLED', 98.0, 'PUBLISHED', '2024-09-06 10:00:00'),
(2009, @phy_class, 'b_2024_spring', 'ENROLLED', 94.5, 'PUBLISHED', '2025-03-02 09:00:00'),

-- 学生2010：成绩较差
(2010, @cs101_class2, 'b_2024_fall', 'ENROLLED', 61.5, 'PUBLISHED', '2024-09-12 09:00:00'),
(2010, @math_class, 'b_2024_fall', 'ENROLLED', 58.0, 'PUBLISHED', '2024-09-07 10:00:00');

-- ==================== 第六部分：插入时间槽 ====================
INSERT INTO class_time_slot (class_id, week_day, start_slot, end_slot) VALUES
-- 计算机基础班1：周一1-2，周三3-4
(@cs101_class1, 1, 1, 2),
(@cs101_class1, 3, 3, 4),
-- 计算机基础班2：周二1-2，周四3-4
(@cs101_class2, 2, 1, 2),
(@cs101_class2, 4, 3, 4),
-- 数据结构班：周一3-4，周三5-6（与数学班冲突）
(@cs201_class, 1, 3, 4),
(@cs201_class, 3, 5, 6),
-- 数学班：周一3-4，周三1-2（与数据结构班冲突）
(@math_class, 1, 3, 4),
(@math_class, 3, 1, 2),
-- 英语班：周三7-8
(@eng_class, 3, 7, 8),
-- 物理班：周四5-6
(@phy_class, 4, 5, 6),
-- 化学班：周五3-4
(@chem_class, 5, 3, 4),
-- 体育班：周一5-6，周三7-8
(@pe_class, 1, 5, 6),
(@pe_class, 3, 7, 8),
-- 艺术班：周二7-8
(@art_class, 2, 7, 8);

COMMIT;

SELECT 'B测试数据插入成功！' as result;
SELECT '覆盖测试场景：' as info;
SELECT '1. 多学期选课' as 场景 UNION ALL
SELECT '2. 课程容量测试（满员/接近满员）' UNION ALL
SELECT '3. 时间冲突设计' UNION ALL
SELECT '4. 成绩状态分布' UNION ALL
SELECT '5. 退课记录' UNION ALL
SELECT '6. 学分上限测试' UNION ALL
SELECT '7. 成绩优异/较差' UNION ALL
SELECT '8. 新选课无成绩';