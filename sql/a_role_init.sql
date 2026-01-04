-- 1. 补全按钮权限 (如果已存在则忽略，但通常建议清理后重新插入以确保准确)
-- 删除可能冲突的 ID 范围
DELETE FROM sys_menu WHERE menu_id BETWEEN 2300 AND 2334;

-- 学期管理 (2205)
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES
(2300, '学期查询', 2205, 1, '#', '', 1, 0, 'F', '0', '0', 'edu:admin:term:query',        '#', 'admin', NOW(), '', NULL, ''),
(2301, '学期新增', 2205, 2, '#', '', 1, 0, 'F', '0', '0', 'edu:admin:term:add',          '#', 'admin', NOW(), '', NULL, ''),
(2302, '学期修改', 2205, 3, '#', '', 1, 0, 'F', '0', '0', 'edu:admin:term:edit',         '#', 'admin', NOW(), '', NULL, ''),
(2303, '学期删除', 2205, 4, '#', '', 1, 0, 'F', '0', '0', 'edu:admin:term:remove',       '#', 'admin', NOW(), '', NULL, ''),
(2304, '学期导出', 2205, 5, '#', '', 1, 0, 'F', '0', '0', 'edu:admin:term:export',       '#', 'admin', NOW(), '', NULL, '');

-- 课程管理 (2206)
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES
(2310, '课程查询', 2206, 1, '#', '', 1, 0, 'F', '0', '0', 'edu:admin:course:query',      '#', 'admin', NOW(), '', NULL, ''),
(2311, '课程新增', 2206, 2, '#', '', 1, 0, 'F', '0', '0', 'edu:admin:course:add',        '#', 'admin', NOW(), '', NULL, ''),
(2312, '课程修改', 2206, 3, '#', '', 1, 0, 'F', '0', '0', 'edu:admin:course:edit',       '#', 'admin', NOW(), '', NULL, ''),
(2313, '课程删除', 2206, 4, '#', '', 1, 0, 'F', '0', '0', 'edu:admin:course:remove',     '#', 'admin', NOW(), '', NULL, ''),
(2314, '课程导出', 2206, 5, '#', '', 1, 0, 'F', '0', '0', 'edu:admin:course:export',     '#', 'admin', NOW(), '', NULL, '');

-- 教学班管理 (2207)
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES
(2320, '教学班查询', 2207, 1, '#', '', 1, 0, 'F', '0', '0', 'edu:admin:courseClass:query', '#', 'admin', NOW(), '', NULL, ''),
(2321, '教学班新增', 2207, 2, '#', '', 1, 0, 'F', '0', '0', 'edu:admin:courseClass:add',   '#', 'admin', NOW(), '', NULL, ''),
(2322, '教学班修改', 2207, 3, '#', '', 1, 0, 'F', '0', '0', 'edu:admin:courseClass:edit',  '#', 'admin', NOW(), '', NULL, ''),
(2323, '教学班删除', 2207, 4, '#', '', 1, 0, 'F', '0', '0', 'edu:admin:courseClass:remove','#', 'admin', NOW(), '', NULL, ''),
(2324, '教学班导出', 2207, 5, '#', '', 1, 0, 'F', '0', '0', 'edu:admin:courseClass:export','#', 'admin', NOW(), '', NULL, '');

-- 学分规则 (2208)
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) VALUES
(2330, '规则查询', 2208, 1, '#', '', 1, 0, 'F', '0', '0', 'edu:admin:creditRule:query',  '#', 'admin', NOW(), '', NULL, ''),
(2331, '规则新增', 2208, 2, '#', '', 1, 0, 'F', '0', '0', 'edu:admin:creditRule:add',    '#', 'admin', NOW(), '', NULL, ''),
(2332, '规则修改', 2208, 3, '#', '', 1, 0, 'F', '0', '0', 'edu:admin:creditRule:edit',   '#', 'admin', NOW(), '', NULL, ''),
(2333, '规则删除', 2208, 4, '#', '', 1, 0, 'F', '0', '0', 'edu:admin:creditRule:remove', '#', 'admin', NOW(), '', NULL, ''),
(2334, '规则导出', 2208, 5, '#', '', 1, 0, 'F', '0', '0', 'edu:admin:creditRule:export', '#', 'admin', NOW(), '', NULL, '');

-- 2. 创建角色
DELETE FROM sys_role WHERE role_id = 100;
INSERT INTO sys_role (role_id, role_name, role_key, role_sort, data_scope, menu_check_strictly, dept_check_strictly, status, del_flag, create_by, create_time, update_by, update_time, remark) VALUES
(100, '选课管理员', 'enroll_admin', 2, '1', 1, 1, '0', '0', 'admin', NOW(), '', NULL, '负责学期、课程、教学班及学分规则管理');

-- 3. 关联角色-菜单
DELETE FROM sys_role_menu WHERE role_id = 100;
-- 插入目录和主菜单
INSERT INTO sys_role_menu (role_id, menu_id) VALUES (100, 2000); -- 教务管理
INSERT INTO sys_role_menu (role_id, menu_id) VALUES (100, 2205); -- 学期管理
INSERT INTO sys_role_menu (role_id, menu_id) VALUES (100, 2206); -- 课程管理
INSERT INTO sys_role_menu (role_id, menu_id) VALUES (100, 2207); -- 教学班管理
INSERT INTO sys_role_menu (role_id, menu_id) VALUES (100, 2208); -- 学分规则

-- 插入按钮权限
INSERT INTO sys_role_menu (role_id, menu_id) SELECT 100, menu_id FROM sys_menu WHERE menu_id BETWEEN 2300 AND 2334;

-- 4. 创建示例用户 (密码: admin123)
DELETE FROM sys_user WHERE user_id = 3000;
INSERT INTO sys_user (user_id, dept_id, user_name, nick_name, user_type, email, phonenumber, sex, avatar, password, status, del_flag, login_ip, login_date, create_by, create_time, remark) VALUES
(3000, 103, 'admin_edu', '教务管理员', '00', 'edu@school.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZv5w8vng.BO7zQVRDlC7MXXb3b/O3.n.1Hgh1.d5.', '0', '0', '', NULL, 'admin', NOW(), 'A角色测试账号');

-- 5. 关联用户-角色
DELETE FROM sys_user_role WHERE user_id = 3000;
INSERT INTO sys_user_role (user_id, role_id) VALUES (3000, 100);
