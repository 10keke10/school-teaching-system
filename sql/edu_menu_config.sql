-- 菜单配置SQL脚本

-- 1. 学期管理
INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES('学期管理', 2000, 1, 'term', 'edu/admin/term/index', 1, 0, 'C', '0', '0', 'edu:admin:term:list', 'date', 'admin', sysdate(), '', null, '学期管理菜单');

-- 2. 课程管理
INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES('课程管理', 2000, 2, 'course', 'edu/admin/course/index', 1, 0, 'C', '0', '0', 'edu:admin:course:list', 'education', 'admin', sysdate(), '', null, '课程管理菜单');

-- 3. 教学班管理
INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES('教学班管理', 2000, 3, 'courseClass', 'edu/admin/courseClass/index', 1, 0, 'C', '0', '0', 'edu:admin:courseClass:list', 'peoples', 'admin', sysdate(), '', null, '教学班管理菜单');

-- 4. 学分规则
INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES('学分规则', 2000, 4, 'creditRule', 'edu/admin/creditRule/index', 1, 0, 'C', '0', '0', 'edu:admin:creditRule:list', 'skill', 'admin', sysdate(), '', null, '学分规则菜单');

-- 按钮权限配置 (仅示例部分关键按钮，完整权限需根据Controller注解添加)

-- 学期管理按钮
INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES('学期查询', (SELECT menu_id FROM sys_menu WHERE menu_name = '学期管理'), 1, '#', '', 1, 0, 'F', '0', '0', 'edu:admin:term:query', '#', 'admin', sysdate(), '', null, '');

INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES('学期新增', (SELECT menu_id FROM sys_menu WHERE menu_name = '学期管理'), 2, '#', '', 1, 0, 'F', '0', '0', 'edu:admin:term:add', '#', 'admin', sysdate(), '', null, '');

INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES('学期修改', (SELECT menu_id FROM sys_menu WHERE menu_name = '学期管理'), 3, '#', '', 1, 0, 'F', '0', '0', 'edu:admin:term:edit', '#', 'admin', sysdate(), '', null, '');

INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES('学期删除', (SELECT menu_id FROM sys_menu WHERE menu_name = '学期管理'), 4, '#', '', 1, 0, 'F', '0', '0', 'edu:admin:term:remove', '#', 'admin', sysdate(), '', null, '');

-- 课程管理按钮
INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES('课程查询', (SELECT menu_id FROM sys_menu WHERE menu_name = '课程管理'), 1, '#', '', 1, 0, 'F', '0', '0', 'edu:admin:course:query', '#', 'admin', sysdate(), '', null, '');

INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES('课程新增', (SELECT menu_id FROM sys_menu WHERE menu_name = '课程管理'), 2, '#', '', 1, 0, 'F', '0', '0', 'edu:admin:course:add', '#', 'admin', sysdate(), '', null, '');

INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES('课程修改', (SELECT menu_id FROM sys_menu WHERE menu_name = '课程管理'), 3, '#', '', 1, 0, 'F', '0', '0', 'edu:admin:course:edit', '#', 'admin', sysdate(), '', null, '');

INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES('课程删除', (SELECT menu_id FROM sys_menu WHERE menu_name = '课程管理'), 4, '#', '', 1, 0, 'F', '0', '0', 'edu:admin:course:remove', '#', 'admin', sysdate(), '', null, '');

-- 教学班管理按钮
INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES('教学班查询', (SELECT menu_id FROM sys_menu WHERE menu_name = '教学班管理'), 1, '#', '', 1, 0, 'F', '0', '0', 'edu:admin:courseClass:query', '#', 'admin', sysdate(), '', null, '');

INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES('教学班新增', (SELECT menu_id FROM sys_menu WHERE menu_name = '教学班管理'), 2, '#', '', 1, 0, 'F', '0', '0', 'edu:admin:courseClass:add', '#', 'admin', sysdate(), '', null, '');

INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES('教学班修改', (SELECT menu_id FROM sys_menu WHERE menu_name = '教学班管理'), 3, '#', '', 1, 0, 'F', '0', '0', 'edu:admin:courseClass:edit', '#', 'admin', sysdate(), '', null, '');

INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES('教学班删除', (SELECT menu_id FROM sys_menu WHERE menu_name = '教学班管理'), 4, '#', '', 1, 0, 'F', '0', '0', 'edu:admin:courseClass:remove', '#', 'admin', sysdate(), '', null, '');

-- 学分规则按钮
INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES('学分规则查询', (SELECT menu_id FROM sys_menu WHERE menu_name = '学分规则'), 1, '#', '', 1, 0, 'F', '0', '0', 'edu:admin:creditRule:query', '#', 'admin', sysdate(), '', null, '');

INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES('学分规则新增', (SELECT menu_id FROM sys_menu WHERE menu_name = '学分规则'), 2, '#', '', 1, 0, 'F', '0', '0', 'edu:admin:creditRule:add', '#', 'admin', sysdate(), '', null, '');

INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES('学分规则修改', (SELECT menu_id FROM sys_menu WHERE menu_name = '学分规则'), 3, '#', '', 1, 0, 'F', '0', '0', 'edu:admin:creditRule:edit', '#', 'admin', sysdate(), '', null, '');

INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES('学分规则删除', (SELECT menu_id FROM sys_menu WHERE menu_name = '学分规则'), 4, '#', '', 1, 0, 'F', '0', '0', 'edu:admin:creditRule:remove', '#', 'admin', sysdate(), '', null, '');
