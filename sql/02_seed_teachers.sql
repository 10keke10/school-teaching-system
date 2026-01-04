INSERT INTO sys_user (dept_id, user_name, nick_name, password, status, create_time)
SELECT NULL, 'teacher1001', '教师1001', '$2a$10$1eG8tKcYQ8zYjZV8yK0V2eZ8pW8D0u3Wm3Cw4b8JrZy3d5b0WvC9e', '0', NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM sys_user WHERE user_name = 'teacher1001');
INSERT INTO sys_user (dept_id, user_name, nick_name, password, status, create_time)
SELECT NULL, 'teacher1002', '教师1002', '$2a$10$1eG8tKcYQ8zYjZV8yK0V2eZ8pW8D0u3Wm3Cw4b8JrZy3d5b0WvC9e', '0', NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM sys_user WHERE user_name = 'teacher1002');
INSERT INTO sys_user (dept_id, user_name, nick_name, password, status, create_time)
SELECT NULL, 'teacher1003', '教师1003', '$2a$10$1eG8tKcYQ8zYjZV8yK0V2eZ8pW8D0u3Wm3Cw4b8JrZy3d5b0WvC9e', '0', NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM sys_user WHERE user_name = 'teacher1003');
INSERT INTO sys_user (dept_id, user_name, nick_name, password, status, create_time)
SELECT NULL, 'teacher1004', '教师1004', '$2a$10$1eG8tKcYQ8zYjZV8yK0V2eZ8pW8D0u3Wm3Cw4b8JrZy3d5b0WvC9e', '0', NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM sys_user WHERE user_name = 'teacher1004');
INSERT INTO sys_user (dept_id, user_name, nick_name, password, status, create_time)
SELECT NULL, 'teacher1005', '教师1005', '$2a$10$1eG8tKcYQ8zYjZV8yK0V2eZ8pW8D0u3Wm3Cw4b8JrZy3d5b0WvC9e', '0', NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM sys_user WHERE user_name = 'teacher1005');
SET @t1 = (SELECT user_id FROM sys_user WHERE user_name = 'teacher1001' LIMIT 1);
SET @t2 = (SELECT user_id FROM sys_user WHERE user_name = 'teacher1002' LIMIT 1);
SET @t3 = (SELECT user_id FROM sys_user WHERE user_name = 'teacher1003' LIMIT 1);
SET @t4 = (SELECT user_id FROM sys_user WHERE user_name = 'teacher1004' LIMIT 1);
SET @t5 = (SELECT user_id FROM sys_user WHERE user_name = 'teacher1005' LIMIT 1);
