-- ============================================================
-- B负责：角色、菜单、用户账号初始化脚本
-- 数据库：ry-vue
-- 说明：创建学生和教师角色，配置菜单权限，创建测试账号
-- ============================================================

-- 设置字符集
SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;

USE ry-vue;

START TRANSACTION;

-- ============================================================
-- 第一部分：创建角色（学生角色、教师角色）
-- ============================================================

-- 删除已存在的角色（如果存在，避免重复）
DELETE FROM sys_role WHERE role_key IN ('student', 'teacher');

-- 插入学生角色（B负责的数据统一加b_前缀标识）
INSERT INTO sys_role (role_id, role_name, role_key, role_sort, data_scope, menu_check_strictly, dept_check_strictly, status, del_flag, create_by, create_time, remark) 
VALUES 
(3, '学生', 'student', 3, '1', 1, 1, '0', '0', 'b_admin', NOW(), '[B]学生角色，只能访问学生功能模块'),
(4, '教师', 'teacher', 4, '1', 1, 1, '0', '0', 'b_admin', NOW(), '[B]教师角色，只能访问教师功能模块');

-- ============================================================
-- 第二部分：创建教务管理菜单
-- ============================================================

-- 删除已存在的教务菜单（如果存在）
DELETE FROM sys_menu WHERE menu_id >= 2000 AND menu_id < 3000;

-- 一级菜单：教务管理（B负责的数据统一加b_前缀标识）
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, route_name, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, remark) 
VALUES 
(2000, '教务管理', 0, 5, 'edu', NULL, '', '', 1, 0, 'M', '0', '0', '', 'education', 'b_admin', NOW(), '[B]教务管理目录');

-- 二级菜单：学生模块（B负责的数据统一加b_前缀标识）
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, route_name, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, remark) 
VALUES 
(2001, '可选课程', 2000, 1, 'student/course', 'edu/student/course/index', '', 'StudentCourse', 1, 0, 'C', '0', '0', 'edu:student:course', 'course', 'b_admin', NOW(), '[B]学生选课页面'),
(2002, '我的课表', 2000, 2, 'student/timetable', 'edu/student/timetable/index', '', 'StudentTimetable', 1, 0, 'C', '0', '0', 'edu:student:timetable', 'timetable', 'b_admin', NOW(), '[B]学生课表查询'),
(2003, '成绩查询', 2000, 3, 'student/grades', 'edu/student/grades/index', '', 'StudentGrades', 1, 0, 'C', '0', '0', 'edu:student:grades', 'score', 'b_admin', NOW(), '[B]学生成绩查询'),
(2004, '学分统计', 2000, 4, 'student/credits', 'edu/student/credits/index', '', 'StudentCredits', 1, 0, 'C', '0', '0', 'edu:statistics:credits', 'chart', 'b_admin', NOW(), '[B]学生学分统计');

-- 二级菜单：教师模块（B负责的数据统一加b_前缀标识）
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, route_name, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, remark) 
VALUES 
(2005, '我的班级', 2000, 5, 'teacher/classes', 'edu/teacher/classes/index', '', 'TeacherClasses', 1, 0, 'C', '0', '0', 'edu:teacher:classes', 'class', 'b_admin', NOW(), '[B]教师查看所教班级'),
(2006, '成绩管理', 2000, 6, 'teacher/grades', 'edu/teacher/grades/index', '', 'TeacherGrades', 1, 0, 'C', '0', '0', 'edu:teacher:grades', 'edit', 'b_admin', NOW(), '[B]教师成绩录入和发布');

-- 学生功能按钮权限（B负责的数据统一加b_前缀标识）
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, route_name, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, remark) 
VALUES 
(2101, '选课', 2001, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'edu:student:enroll', '#', 'b_admin', NOW(), '[B]学生选课按钮'),
(2102, '退课', 2001, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'edu:student:drop', '#', 'b_admin', NOW(), '[B]学生退课按钮'),
(2103, '查询课表', 2002, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'edu:student:timetable', '#', 'b_admin', NOW(), '[B]查询课表按钮'),
(2104, '查询成绩', 2003, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'edu:student:grades', '#', 'b_admin', NOW(), '[B]查询成绩按钮'),
(2105, '查询学分', 2004, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'edu:statistics:credits', '#', 'b_admin', NOW(), '[B]查询学分统计按钮');

-- 教师功能按钮权限（B负责的数据统一加b_前缀标识）
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, route_name, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, remark) 
VALUES 
(2201, '查看学生', 2005, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'edu:teacher:students', '#', 'b_admin', NOW(), '[B]查看班级学生按钮'),
(2202, '录入成绩', 2006, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'edu:teacher:grades:edit', '#', 'b_admin', NOW(), '[B]录入成绩按钮'),
(2203, '发布成绩', 2006, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'edu:teacher:grades:publish', '#', 'b_admin', NOW(), '[B]发布成绩按钮'),
(2204, '班级统计', 2005, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'edu:teacher:statistics', '#', 'b_admin', NOW(), '[B]班级成绩统计按钮');

-- ============================================================
-- 第三部分：创建测试账号（学生和教师）
-- ============================================================

-- 删除已存在的测试账号（如果存在）
DELETE FROM sys_user WHERE user_id BETWEEN 2001 AND 2010;
DELETE FROM sys_user WHERE user_id BETWEEN 1001 AND 1008;

-- 密码统一为：123456（BCrypt加密后的值：$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2）
-- 创建学生账号（user_id对应enrollment表中的student_id）
-- B负责的数据统一加b_前缀标识
INSERT INTO sys_user (user_id, dept_id, user_name, nick_name, user_type, email, phonenumber, sex, avatar, password, status, del_flag, create_by, create_time, remark) 
VALUES 
(2001, 103, 'b_student2001', '张三', '00', 'b_student2001@test.com', '13800002001', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', 'b_admin', NOW(), '[B]学生测试账号1'),
(2002, 103, 'b_student2002', '李四', '00', 'b_student2002@test.com', '13800002002', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', 'b_admin', NOW(), '[B]学生测试账号2'),
(2003, 103, 'b_student2003', '王五', '00', 'b_student2003@test.com', '13800002003', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', 'b_admin', NOW(), '[B]学生测试账号3'),
(2004, 103, 'b_student2004', '赵六', '00', 'b_student2004@test.com', '13800002004', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', 'b_admin', NOW(), '[B]学生测试账号4'),
(2005, 103, 'b_student2005', '钱七', '00', 'b_student2005@test.com', '13800002005', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', 'b_admin', NOW(), '[B]学生测试账号5'),
(2006, 103, 'b_student2006', '孙八', '00', 'b_student2006@test.com', '13800002006', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', 'b_admin', NOW(), '[B]学生测试账号6'),
(2007, 103, 'b_student2007', '周九', '00', 'b_student2007@test.com', '13800002007', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', 'b_admin', NOW(), '[B]学生测试账号7'),
(2008, 103, 'b_student2008', '吴十', '00', 'b_student2008@test.com', '13800002008', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', 'b_admin', NOW(), '[B]学生测试账号8'),
(2009, 103, 'b_student2009', '郑十一', '00', 'b_student2009@test.com', '13800002009', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', 'b_admin', NOW(), '[B]学生测试账号9'),
(2010, 103, 'b_student2010', '王十二', '00', 'b_student2010@test.com', '13800002010', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', 'b_admin', NOW(), '[B]学生测试账号10');

-- 创建教师账号（user_id对应course_class表中的teacher_id）
-- B负责的数据统一加b_前缀标识
INSERT INTO sys_user (user_id, dept_id, user_name, nick_name, user_type, email, phonenumber, sex, avatar, password, status, del_flag, create_by, create_time, remark) 
VALUES 
(1001, 103, 'b_teacher1001', '张老师', '00', 'b_teacher1001@test.com', '13900001001', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', 'b_admin', NOW(), '[B]教师测试账号1（计算机基础）'),
(1002, 103, 'b_teacher1002', '李老师', '00', 'b_teacher1002@test.com', '13900001002', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', 'b_admin', NOW(), '[B]教师测试账号2（数据结构）'),
(1003, 103, 'b_teacher1003', '王老师', '00', 'b_teacher1003@test.com', '13900001003', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', 'b_admin', NOW(), '[B]教师测试账号3（高等数学）'),
(1004, 103, 'b_teacher1004', '赵老师', '00', 'b_teacher1004@test.com', '13900001004', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', 'b_admin', NOW(), '[B]教师测试账号4（大学英语）'),
(1005, 103, 'b_teacher1005', '钱老师', '00', 'b_teacher1005@test.com', '13900001005', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', 'b_admin', NOW(), '[B]教师测试账号5（大学物理）'),
(1006, 103, 'b_teacher1006', '孙老师', '00', 'b_teacher1006@test.com', '13900001006', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', 'b_admin', NOW(), '[B]教师测试账号6（大学化学）'),
(1007, 103, 'b_teacher1007', '周老师', '00', 'b_teacher1007@test.com', '13900001007', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', 'b_admin', NOW(), '[B]教师测试账号7（大学体育）'),
(1008, 103, 'b_teacher1008', '吴老师', '00', 'b_teacher1008@test.com', '13900001008', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', 'b_admin', NOW(), '[B]教师测试账号8（艺术鉴赏）');

-- ============================================================
-- 第四部分：关联用户和角色
-- ============================================================

-- 删除已存在的用户角色关联
DELETE FROM sys_user_role WHERE user_id BETWEEN 2001 AND 2010;
DELETE FROM sys_user_role WHERE user_id BETWEEN 1001 AND 1008;

-- 为学生账号分配学生角色
INSERT INTO sys_user_role (user_id, role_id) 
VALUES 
(2001, 3), (2002, 3), (2003, 3), (2004, 3), (2005, 3),
(2006, 3), (2007, 3), (2008, 3), (2009, 3), (2010, 3);

-- 为教师账号分配教师角色
INSERT INTO sys_user_role (user_id, role_id) 
VALUES 
(1001, 4), (1002, 4), (1003, 4), (1004, 4), 
(1005, 4), (1006, 4), (1007, 4), (1008, 4);

-- ============================================================
-- 第五部分：关联角色和菜单权限
-- ============================================================

-- 删除已存在的角色菜单关联
DELETE FROM sys_role_menu WHERE role_id = 3 OR role_id = 4;

-- 学生角色菜单权限（只能看到学生模块）
INSERT INTO sys_role_menu (role_id, menu_id) 
VALUES 
-- 一级菜单
(3, 2000),
-- 学生二级菜单
(3, 2001), (3, 2002), (3, 2003), (3, 2004),
-- 学生按钮权限
(3, 2101), (3, 2102), (3, 2103), (3, 2104), (3, 2105);

-- 教师角色菜单权限（只能看到教师模块）
INSERT INTO sys_role_menu (role_id, menu_id) 
VALUES 
-- 一级菜单
(4, 2000),
-- 教师二级菜单
(4, 2005), (4, 2006),
-- 教师按钮权限
(4, 2201), (4, 2202), (4, 2203), (4, 2204);

COMMIT;

-- ============================================================
-- 查询验证
-- ============================================================

SELECT '=== 角色创建完成 ===' as info;
SELECT role_id, role_name, role_key, status FROM sys_role WHERE role_id IN (3, 4);

SELECT '=== 菜单创建完成 ===' as info;
SELECT menu_id, menu_name, parent_id, path, perms FROM sys_menu WHERE menu_id BETWEEN 2000 AND 2204 ORDER BY menu_id;

SELECT '=== 学生账号创建完成 ===' as info;
SELECT user_id, user_name, nick_name, status FROM sys_user WHERE user_id BETWEEN 2001 AND 2010;

SELECT '=== 教师账号创建完成 ===' as info;
SELECT user_id, user_name, nick_name, status FROM sys_user WHERE user_id BETWEEN 1001 AND 1008;

SELECT '=== 用户角色关联完成 ===' as info;
SELECT ur.user_id, u.user_name, r.role_name 
FROM sys_user_role ur 
JOIN sys_user u ON ur.user_id = u.user_id 
JOIN sys_role r ON ur.role_id = r.role_id 
WHERE ur.user_id BETWEEN 1001 AND 2010 
ORDER BY ur.user_id;

SELECT '=== 角色菜单关联完成 ===' as info;
SELECT rm.role_id, r.role_name, COUNT(*) as menu_count 
FROM sys_role_menu rm 
JOIN sys_role r ON rm.role_id = r.role_id 
WHERE rm.role_id IN (3, 4) 
GROUP BY rm.role_id, r.role_name;

SELECT '=== 配置完成！可以使用以下账号登录测试 ===' as info;
SELECT '学生账号：b_student2001 ~ b_student2010，密码：admin123' as student_accounts;
SELECT '教师账号：b_teacher1001 ~ b_teacher1008，密码：admin123' as teacher_accounts;
SELECT '注意：所有B负责的数据已添加b_前缀标识' as note;

