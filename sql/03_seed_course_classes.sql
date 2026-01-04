SET @cs101_id = (SELECT course_id FROM course WHERE course_code = 'CS101' LIMIT 1);
SET @cs102_id = (SELECT course_id FROM course WHERE course_code = 'CS102' LIMIT 1);
SET @ma101_id = (SELECT course_id FROM course WHERE course_code = 'MA101' LIMIT 1);
SET @eng201_id = (SELECT course_id FROM course WHERE course_code = 'ENG201' LIMIT 1);
SET @phy101_id = (SELECT course_id FROM course WHERE course_code = 'PHY101' LIMIT 1);
SET @term_2024_spring = '2024_spring';
SET @term_2024_fall = '2024_fall';
SET @term_2025_spring = '2025_spring';
SET @t1 = (SELECT user_id FROM sys_user WHERE user_name = 'teacher1001' LIMIT 1);
SET @t2 = (SELECT user_id FROM sys_user WHERE user_name = 'teacher1002' LIMIT 1);
SET @t3 = (SELECT user_id FROM sys_user WHERE user_name = 'teacher1003' LIMIT 1);
SET @t4 = (SELECT user_id FROM sys_user WHERE user_name = 'teacher1004' LIMIT 1);
SET @t5 = (SELECT user_id FROM sys_user WHERE user_name = 'teacher1005' LIMIT 1);
INSERT INTO course_class (course_id, teacher_id, term_id, class_time, location, capacity, selected_count, status, create_time)
SELECT @cs101_id, @t1, @term_2024_spring, '周一 08:00-09:40', '一教-101', 60, 0, 1, NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM course_class WHERE course_id=@cs101_id AND teacher_id=@t1 AND term_id=@term_2024_spring);
INSERT INTO course_class (course_id, teacher_id, term_id, class_time, location, capacity, selected_count, status, create_time)
SELECT @cs101_id, @t2, @term_2024_spring, '周三 10:00-11:40', '一教-102', 60, 0, 1, NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM course_class WHERE course_id=@cs101_id AND teacher_id=@t2 AND term_id=@term_2024_spring);
INSERT INTO course_class (course_id, teacher_id, term_id, class_time, location, capacity, selected_count, status, create_time)
SELECT @cs101_id, @t3, @term_2024_fall, '周二 14:00-15:40', '二教-201', 70, 0, 1, NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM course_class WHERE course_id=@cs101_id AND teacher_id=@t3 AND term_id=@term_2024_fall);
INSERT INTO course_class (course_id, teacher_id, term_id, class_time, location, capacity, selected_count, status, create_time)
SELECT @cs101_id, @t1, @term_2025_spring, '周四 16:00-17:40', '二教-202', 70, 0, 1, NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM course_class WHERE course_id=@cs101_id AND teacher_id=@t1 AND term_id=@term_2025_spring);
INSERT INTO course_class (course_id, teacher_id, term_id, class_time, location, capacity, selected_count, status, create_time)
SELECT @cs102_id, @t2, @term_2024_spring, '周一 10:00-11:40', '科教楼-301', 50, 0, 1, NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM course_class WHERE course_id=@cs102_id AND teacher_id=@t2 AND term_id=@term_2024_spring);
INSERT INTO course_class (course_id, teacher_id, term_id, class_time, location, capacity, selected_count, status, create_time)
SELECT @cs102_id, @t4, @term_2024_fall, '周五 08:00-09:40', '科教楼-302', 55, 0, 1, NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM course_class WHERE course_id=@cs102_id AND teacher_id=@t4 AND term_id=@term_2024_fall);
INSERT INTO course_class (course_id, teacher_id, term_id, class_time, location, capacity, selected_count, status, create_time)
SELECT @cs102_id, @t5, @term_2025_spring, '周三 14:00-15:40', '科教楼-303', 55, 0, 1, NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM course_class WHERE course_id=@cs102_id AND teacher_id=@t5 AND term_id=@term_2025_spring);
INSERT INTO course_class (course_id, teacher_id, term_id, class_time, location, capacity, selected_count, status, create_time)
SELECT @ma101_id, @t3, @term_2024_spring, '周二 08:00-09:40', '数理楼-401', 100, 0, 1, NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM course_class WHERE course_id=@ma101_id AND teacher_id=@t3 AND term_id=@term_2024_spring);
INSERT INTO course_class (course_id, teacher_id, term_id, class_time, location, capacity, selected_count, status, create_time)
SELECT @ma101_id, @t4, @term_2024_fall, '周四 10:00-11:40', '数理楼-402', 100, 0, 1, NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM course_class WHERE course_id=@ma101_id AND teacher_id=@t4 AND term_id=@term_2024_fall);
INSERT INTO course_class (course_id, teacher_id, term_id, class_time, location, capacity, selected_count, status, create_time)
SELECT @eng201_id, @t5, @term_2024_fall, '周三 08:00-09:40', '外语楼-501', 40, 0, 1, NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM course_class WHERE course_id=@eng201_id AND teacher_id=@t5 AND term_id=@term_2024_fall);
INSERT INTO course_class (course_id, teacher_id, term_id, class_time, location, capacity, selected_count, status, create_time)
SELECT @eng201_id, @t2, @term_2025_spring, '周五 14:00-15:40', '外语楼-502', 40, 0, 1, NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM course_class WHERE course_id=@eng201_id AND teacher_id=@t2 AND term_id=@term_2025_spring);
INSERT INTO course_class (course_id, teacher_id, term_id, class_time, location, capacity, selected_count, status, create_time)
SELECT @phy101_id, @t1, @term_2024_spring, '周四 08:00-09:40', '物理楼-601', 80, 0, 1, NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM course_class WHERE course_id=@phy101_id AND teacher_id=@t1 AND term_id=@term_2024_spring);
INSERT INTO course_class (course_id, teacher_id, term_id, class_time, location, capacity, selected_count, status, create_time)
SELECT @phy101_id, @t3, @term_2025_spring, '周二 10:00-11:40', '物理楼-602', 80, 0, 1, NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM course_class WHERE course_id=@phy101_id AND teacher_id=@t3 AND term_id=@term_2025_spring);
