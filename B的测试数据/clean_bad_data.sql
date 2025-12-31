-- clean_bad_data.sql
USE ry-vue;

-- 删除所有B的测试数据（包括乱码的）
START TRANSACTION;

-- 1. 先删除关联表数据
DELETE FROM enrollment WHERE student_id BETWEEN 2000 AND 2010;
DELETE FROM class_time_slot;

-- 2. 删除B创建的教学班
DELETE FROM course_class WHERE term_id LIKE 'b_%';

-- 3. 删除B创建的课程
DELETE FROM course WHERE course_code LIKE 'B_%';

-- 4. 删除B创建的学期
DELETE FROM term WHERE term_id LIKE 'b_%';

COMMIT;

SELECT '所有B的测试数据（包括乱码）已清理完成！' as result;
