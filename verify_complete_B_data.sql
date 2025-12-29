-- verify_complete_B_data.sql
USE ry-vue;

SELECT '=== B完整测试数据验证 ===' as title;

-- 计数验证
SELECT 'term表(b_前缀):' as table_name, COUNT(*) as count FROM term WHERE term_id LIKE 'b_%'
UNION ALL
SELECT 'course表(B_前缀):', COUNT(*) FROM course WHERE course_code LIKE 'B_%'
UNION ALL
SELECT 'course_class表:', COUNT(*) FROM course_class WHERE term_id LIKE 'b_%'
UNION ALL
SELECT 'enrollment表(学生2001-2003):', COUNT(*) FROM enrollment WHERE student_id IN (2001,2002,2003)
UNION ALL
SELECT 'class_time_slot表:', COUNT(*) FROM class_time_slot;

-- 数据详情
SELECT '\n=== 数据详情 ===' as title;
SELECT 'term表:' as table_info, term_id, term_name, is_active FROM term WHERE term_id LIKE 'b_%';
SELECT 'course表:' as table_info, course_id, course_code, course_name, credit_hours FROM course WHERE course_code LIKE 'B_%';
SELECT 'course_class表:' as table_info, class_id, course_id, teacher_id, term_id, capacity, selected_count FROM course_class WHERE term_id LIKE 'b_%';
SELECT 'enrollment表:' as table_info, enrollment_id, student_id, class_id, term_id, status, grade, grade_status FROM enrollment WHERE student_id IN (2001,2002,2003);
SELECT 'class_time_slot表:' as table_info, slot_id, class_id, week_day, start_slot, end_slot FROM class_time_slot;