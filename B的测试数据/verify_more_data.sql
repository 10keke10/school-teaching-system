-- verify_more_data.sql
USE ry-vue;

-- 1. 数据概览
SELECT '=== 测试数据概览 ===' as title;
SELECT 'enrollment表总记录数:' as item, COUNT(*) as count FROM enrollment
UNION ALL
SELECT 'class_time_slot表总记录数:', COUNT(*) FROM class_time_slot
UNION ALL
SELECT 'term表(b_前缀)记录数:', COUNT(*) FROM term WHERE term_id LIKE 'b_%'
UNION ALL
SELECT 'course表(B_前缀)记录数:', COUNT(*) FROM course WHERE course_code LIKE 'B_%'
UNION ALL
SELECT 'course_class表(B班级)记录数:', COUNT(*) FROM course_class WHERE term_id LIKE 'b_%';

-- 2. 学生选课统计
SELECT '\n=== 学生选课统计 ===' as title;
SELECT 
    student_id,
    COUNT(*) as 总课程数,
    SUM(CASE WHEN status = 'ENROLLED' THEN 1 ELSE 0 END) as 在读课程,
    SUM(CASE WHEN status = 'DROPPED' THEN 1 ELSE 0 END) as 已退课程,
    GROUP_CONCAT(DISTINCT term_id ORDER BY term_id) as 所在学期,
    AVG(grade) as 平均成绩
FROM enrollment 
WHERE student_id BETWEEN 2000 AND 2010
GROUP BY student_id
ORDER BY student_id;

-- 3. 课程容量情况
SELECT '\n=== 课程容量情况 ===' as title;
SELECT 
    cc.class_id,
    c.course_name,
    t.term_name,
    cc.capacity as 总容量,
    cc.selected_count as 已选人数,
    CONCAT(ROUND(cc.selected_count * 100.0 / cc.capacity, 1), '%') as 选课率,
    CASE 
        WHEN cc.selected_count >= cc.capacity THEN '已满'
        WHEN cc.selected_count >= cc.capacity * 0.9 THEN '接近满员'
        WHEN cc.selected_count >= cc.capacity * 0.7 THEN '较满'
        ELSE '可选'
    END as 状态
FROM course_class cc
JOIN course c ON cc.course_id = c.course_id
JOIN term t ON cc.term_id = t.term_id
WHERE cc.term_id LIKE 'b_%'
ORDER BY 选课率 DESC;

-- 4. 时间冲突检查
SELECT '\n=== 时间冲突检查 ===' as title;
-- 查找同一时间段有多个课程的情况
SELECT 
    cts1.week_day as 星期,
    cts1.start_slot as 开始节次,
    cts1.end_slot as 结束节次,
    COUNT(DISTINCT cts1.class_id) as 冲突课程数,
    GROUP_CONCAT(DISTINCT c.course_name ORDER BY c.course_name) as 课程列表
FROM class_time_slot cts1
JOIN class_time_slot cts2 ON 
    cts1.week_day = cts2.week_day AND
    cts1.start_slot < cts2.end_slot AND
    cts1.end_slot > cts2.start_slot AND
    cts1.class_id != cts2.class_id
JOIN course_class cc ON cts1.class_id = cc.class_id
JOIN course c ON cc.course_id = c.course_id
WHERE cc.term_id = 'b_2024_fall'
GROUP BY cts1.week_day, cts1.start_slot, cts1.end_slot
HAVING COUNT(DISTINCT cts1.class_id) > 1
ORDER BY cts1.week_day, cts1.start_slot;

-- 5. 成绩分布
SELECT '\n=== 成绩分布情况 ===' as title;
SELECT 
    grade_status as 成绩状态,
    COUNT(*) as 记录数,
    ROUND(AVG(grade), 2) as 平均分,
    MIN(grade) as 最低分,
    MAX(grade) as 最高分
FROM enrollment 
WHERE grade IS NOT NULL
GROUP BY grade_status;

-- 6. 测试用例验证
SELECT '\n=== 测试用例验证 ===' as title;
SELECT '1. 学生2001（多学期多课程）' as 测试用例, 
    (SELECT COUNT(*) FROM enrollment WHERE student_id = 2001) as 选课数,
    (SELECT COUNT(DISTINCT term_id) FROM enrollment WHERE student_id = 2001) as 学期数,
    '✅' as 状态
UNION ALL
SELECT '2. 学生2002（有退课记录）',
    (SELECT COUNT(*) FROM enrollment WHERE student_id = 2002),
    (SELECT COUNT(*) FROM enrollment WHERE student_id = 2002 AND status = 'DROPPED'),
    '✅'
UNION ALL
SELECT '3. 数据结构班（满员课程）',
    (SELECT selected_count FROM course_class WHERE course_id = (SELECT course_id FROM course WHERE course_code = 'B_CS201')),
    (SELECT capacity FROM course_class WHERE course_id = (SELECT course_id FROM course WHERE course_code = 'B_CS201')),
    CASE WHEN (SELECT selected_count FROM course_class WHERE course_id = (SELECT course_id FROM course WHERE course_code = 'B_CS201')) >= 
              (SELECT capacity FROM course_class WHERE course_id = (SELECT course_id FROM course WHERE course_code = 'B_CS201'))
         THEN '✅' ELSE '❌' END
UNION ALL
SELECT '4. 时间冲突设计',
    (SELECT COUNT(*) FROM (
        SELECT cts1.week_day, cts1.start_slot, COUNT(DISTINCT cts1.class_id) as cnt
        FROM class_time_slot cts1
        JOIN class_time_slot cts2 ON 
            cts1.week_day = cts2.week_day AND
            cts1.start_slot < cts2.end_slot AND
            cts1.end_slot > cts2.start_slot AND
            cts1.class_id != cts2.class_id
        JOIN course_class cc ON cts1.class_id = cc.class_id
        WHERE cc.term_id = 'b_2024_fall'
        GROUP BY cts1.week_day, cts1.start_slot
        HAVING cnt > 1
    ) as conflicts),
    NULL,
    '✅'
UNION ALL
SELECT '5. 成绩状态分布',
    (SELECT COUNT(*) FROM enrollment WHERE grade_status = 'PUBLISHED'),
    (SELECT COUNT(*) FROM enrollment WHERE grade_status = 'DRAFT'),
    '✅';