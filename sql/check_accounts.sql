-- 检查B创建的测试账号
USE ry-vue;

-- 检查学生账号
SELECT user_id, user_name, nick_name, status, del_flag 
FROM sys_user 
WHERE user_id BETWEEN 2001 AND 2010 
ORDER BY user_id;

-- 检查教师账号
SELECT user_id, user_name, nick_name, status, del_flag 
FROM sys_user 
WHERE user_id BETWEEN 1001 AND 1008 
ORDER BY user_id;

-- 检查账号状态
SELECT 
    user_id, 
    user_name, 
    status as account_status, 
    del_flag as deleted_flag,
    CASE 
        WHEN status = '0' AND del_flag = '0' THEN '正常'
        WHEN status = '1' THEN '已停用'
        WHEN del_flag = '2' THEN '已删除'
        ELSE '异常'
    END as status_desc
FROM sys_user 
WHERE user_id BETWEEN 1001 AND 2010 
ORDER BY user_id;

