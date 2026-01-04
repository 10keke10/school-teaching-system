SET @default_teacher = (SELECT user_id FROM sys_user WHERE user_name = 'teacher1001' LIMIT 1);
UPDATE course_class SET teacher_id = @default_teacher WHERE teacher_id IS NULL OR teacher_id = 0;
