-- 备份与修复教师姓名乱码（utf8mb4）
-- 执行前请确认数据库连接的字符集为 utf8mb4
-- 建议按顺序执行：备份 -> 转换字符集 -> 重写受影响记录 -> 验证

-- 1) 备份 sys_user 表
CREATE TABLE IF NOT EXISTS backup_sys_user_20260104 AS
SELECT * FROM sys_user;

-- 2) 将 sys_user 表转换为 utf8mb4 编码（若已为 utf8mb4 可跳过）
ALTER TABLE sys_user CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- 3) 重写受影响教师账号的昵称（避免早期以错误字符集写入导致的“???”）
-- 注意：以下账号来源于早期种子：teacher1003/teacher1004/teacher1005
-- 如果你的环境中账号不同，请按需调整 WHERE 条件
UPDATE sys_user SET nick_name = '教师1003' WHERE user_name = 'teacher1003';
UPDATE sys_user SET nick_name = '教师1004' WHERE user_name = 'teacher1004';
UPDATE sys_user SET nick_name = '教师1005' WHERE user_name = 'teacher1005';

-- 4) 可选：统一其它以“教师”开头但被错误写入的昵称（匹配包含问号的场景）
UPDATE sys_user SET nick_name = REPLACE(nick_name, '?', '') WHERE nick_name LIKE '%?%';

-- 5) 统一为规范的中文姓名（不含“老师”、不含数字，且各不重复）
-- 为避免环境差异，这里同时按user_id与user_name进行更新
-- A组（历史teacherId：1001..1008，或 user_name=b_teacher100x）
UPDATE sys_user SET nick_name = '罗浩' WHERE user_id = 1001 OR user_name = 'b_teacher1001';
UPDATE sys_user SET nick_name = '宋亦' WHERE user_id = 1002 OR user_name = 'b_teacher1002';
UPDATE sys_user SET nick_name = '林峰' WHERE user_id = 1003 OR user_name = 'b_teacher1003';
UPDATE sys_user SET nick_name = '曹宁' WHERE user_id = 1004 OR user_name = 'b_teacher1004';
UPDATE sys_user SET nick_name = '韩雪' WHERE user_id = 1005 OR user_name = 'b_teacher1005';
UPDATE sys_user SET nick_name = '程越' WHERE user_id = 1006 OR user_name = 'b_teacher1006';
UPDATE sys_user SET nick_name = '吕倩' WHERE user_id = 1007 OR user_name = 'b_teacher1007';
UPDATE sys_user SET nick_name = '邱晨' WHERE user_id = 1008 OR user_name = 'b_teacher1008';

-- B组（当前“可选课程”页面联查出现的teacherId：3001..3005，或 user_name=teacher100x）
UPDATE sys_user SET nick_name = '陈楠' WHERE user_id = 3001 OR user_name = 'teacher1001';
UPDATE sys_user SET nick_name = '赵敏' WHERE user_id = 3002 OR user_name = 'teacher1002';
UPDATE sys_user SET nick_name = '郑凯' WHERE user_id = 3003 OR user_name = 'teacher1003';
UPDATE sys_user SET nick_name = '唐婧' WHERE user_id = 3004 OR user_name = 'teacher1004';
UPDATE sys_user SET nick_name = '杜睿' WHERE user_id = 3005 OR user_name = 'teacher1005';

-- 6) 验证结果
SELECT user_id, user_name, nick_name, status
FROM sys_user
WHERE user_name IN ('teacher1001','teacher1002','teacher1003','teacher1004','teacher1005',
                    'b_teacher1001','b_teacher1002','b_teacher1003','b_teacher1004','b_teacher1005',
                    'b_teacher1006','b_teacher1007','b_teacher1008');

-- 7) 验证“可选课程”联查是否能显示教师姓名
SELECT cc.class_id, c.course_name, cc.teacher_id, u.nick_name AS teacher_name, cc.term_id
FROM course_class cc
LEFT JOIN course c ON c.course_id = cc.course_id
LEFT JOIN sys_user u ON u.user_id = cc.teacher_id
ORDER BY cc.class_id ASC;
