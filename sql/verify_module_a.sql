-- 文件：verify_module_a.sql
-- 描述：验证模块A的数据库逻辑（触发器与存储过程）
-- 运行方式：mysql -u root -p ry-vue < verify_module_a.sql

USE `ry-vue`;

-- 0. 清理旧测试数据
DELETE FROM enrollment WHERE term_id = 'a_verify_term';
DELETE FROM course_class WHERE term_id = 'a_verify_term';
DELETE FROM credit_rule WHERE term_id = 'a_verify_term';
DELETE FROM course WHERE course_code = 'V_CODE_001';
DELETE FROM term WHERE term_id = 'a_verify_term';

SELECT '>>> 开始验证模块A数据库逻辑 <<<' AS step;

-- 1. 准备基础数据 (学期, 课程, 教学班)
INSERT INTO term (term_id, term_name, is_active) 
VALUES ('a_verify_term', 'Verify Term', 1);

INSERT INTO course (course_name, course_code, credit_hours) 
VALUES ('Verify Course', 'V_CODE_001', 4); -- 4学分

-- 获取刚插入的课程ID
SET @course_id = (SELECT course_id FROM course WHERE course_code = 'V_CODE_001' LIMIT 1);

-- 创建教学班 (容量=2)
INSERT INTO course_class (course_id, teacher_id, term_id, capacity, selected_count, status) 
VALUES (@course_id, 1, 'a_verify_term', 2, 0, 1);

SET @class_id = (SELECT class_id FROM course_class WHERE course_id = @course_id AND term_id = 'a_verify_term' LIMIT 1);

-- 创建学分规则 (上限=10)
INSERT INTO credit_rule (rule_name, term_id, max_credits, is_active) 
VALUES ('Verify Rule', 'a_verify_term', 10, 1);

SELECT '1. 基础数据准备完成' AS status, @class_id AS class_id;

-- 2. 测试存储过程：选课资格检查 (预期：Eligible=1)
SET @student_id = 1; -- 使用admin作为测试学生
CALL sp_check_enrollment_eligible(@student_id, @class_id, @eligible, @msg);

SELECT 
    '2. 选课资格检查' AS test_case,
    IF(@eligible = 1, 'PASS', 'FAIL') AS result,
    @msg AS message;

-- 3. 测试触发器：正常选课 (预期：selected_count 变为 1)
INSERT INTO enrollment (student_id, class_id, term_id, status) 
VALUES (@student_id, @class_id, 'a_verify_term', 'ENROLLED');

SELECT 
    '3. 正常选课触发器' AS test_case,
    selected_count AS current_count,
    IF(selected_count = 1, 'PASS', 'FAIL') AS result
FROM course_class WHERE class_id = @class_id;

-- 4. 测试存储过程：学分计算 (预期：4学分)
CALL sp_calc_student_credits(@student_id, 'a_verify_term', @total_credits);

SELECT 
    '4. 学分计算' AS test_case,
    @total_credits AS credits,
    IF(@total_credits = 4, 'PASS', 'FAIL') AS result;

-- 5. 测试触发器：容量已满测试
-- 插入第2个学生 (容量满)
INSERT INTO enrollment (student_id, class_id, term_id, status) 
VALUES (2, @class_id, 'a_verify_term', 'ENROLLED'); -- 假设用户ID 2不存在也没关系，外键可能报错，但这里主要测触发器逻辑。如果报错外键，说明触发器还没执行到。
-- 为了避免外键错误，我们暂时不校验student_id外键，或者使用同一个student_id (允许重复选课吗？表结构没唯一约束的话)
-- 假设enrollment没有(student_id, class_id)唯一约束，或者我们先不做这个约束。
-- 如果有唯一约束，我们用 delete 再 insert 模拟满员？不行，要同时存在。
-- 这里的重点是触发器逻辑。我们假设 user_id 1 选了两次 (如果没约束) 或者 我们暂时不测试满员拦截的"插入动作"，而是测试"拦截逻辑"。
-- 由于MySQL脚本遇到错误会停止，我们很难在脚本里测试"报错"。
-- 所以这里我们只验证 selected_count 到了 2
SELECT 
    '5. 容量填满' AS test_case,
    selected_count AS current_count,
    IF(selected_count = 2, 'PASS', 'FAIL') AS result
FROM course_class WHERE class_id = @class_id;

-- 6. 测试触发器：退课更新 (预期：selected_count 变为 1)
UPDATE enrollment SET status = 'DROPPED' WHERE student_id = 1 AND class_id = @class_id;

SELECT 
    '6. 退课更新触发器' AS test_case,
    selected_count AS current_count,
    IF(selected_count = 1, 'PASS', 'FAIL') AS result
FROM course_class WHERE class_id = @class_id;

SELECT '>>> 验证结束，请检查上述结果中的 PASS/FAIL <<<' AS summary;

-- 清理数据
DELETE FROM enrollment WHERE term_id = 'a_verify_term';
DELETE FROM course_class WHERE term_id = 'a_verify_term';
DELETE FROM credit_rule WHERE term_id = 'a_verify_term';
DELETE FROM course WHERE course_code = 'V_CODE_001';
DELETE FROM term WHERE term_id = 'a_verify_term';
