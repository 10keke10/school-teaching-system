INSERT INTO term (term_id, term_name, enroll_start, enroll_end, drop_deadline, is_active, create_time)
SELECT '2024_spring', '2024春季学期', '2024-02-20 00:00:00', '2024-03-10 23:59:59', '2024-04-01 23:59:59', 0, NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM term WHERE term_id = '2024_spring');
INSERT INTO term (term_id, term_name, enroll_start, enroll_end, drop_deadline, is_active, create_time)
SELECT '2024_fall', '2024秋季学期', '2024-08-20 00:00:00', '2024-09-10 23:59:59', '2024-10-01 23:59:59', 0, NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM term WHERE term_id = '2024_fall');
INSERT INTO term (term_id, term_name, enroll_start, enroll_end, drop_deadline, is_active, create_time)
SELECT '2025_spring', '2025春季学期', '2025-02-20 00:00:00', '2025-03-10 23:59:59', '2025-04-01 23:59:59', 1, NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM term WHERE term_id = '2025_spring');
INSERT INTO course (course_code, course_name, credit_hours, course_type, description, create_time)
SELECT 'CS101', '数据结构', 3, '必修', '数据结构与算法基础', NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM course WHERE course_code = 'CS101');
INSERT INTO course (course_code, course_name, credit_hours, course_type, description, create_time)
SELECT 'CS102', '操作系统', 3, '必修', '操作系统原理与实践', NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM course WHERE course_code = 'CS102');
INSERT INTO course (course_code, course_name, credit_hours, course_type, description, create_time)
SELECT 'MA101', '高等数学', 4, '必修', '微积分基础与应用', NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM course WHERE course_code = 'MA101');
INSERT INTO course (course_code, course_name, credit_hours, course_type, description, create_time)
SELECT 'ENG201', '大学英语', 2, '选修', '大学英语综合能力', NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM course WHERE course_code = 'ENG201');
INSERT INTO course (course_code, course_name, credit_hours, course_type, description, create_time)
SELECT 'PHY101', '物理学', 3, '必修', '力学热学电磁学基础', NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM course WHERE course_code = 'PHY101');
