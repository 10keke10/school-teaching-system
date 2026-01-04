INSERT INTO term (term_id, term_name, enroll_start, enroll_end, drop_deadline, is_active, create_time)
SELECT '2025-2026-fall', '2025-2026秋季', '2025-09-01 00:00:00', '2026-02-01 00:00:00', NULL, 1, NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM term WHERE term_id = '2025-2026-fall');
INSERT INTO term (term_id, term_name, enroll_start, enroll_end, drop_deadline, is_active, create_time)
SELECT '2025-2026-spring', '2025-2026春季', '2026-03-01 00:00:00', '2026-07-01 00:00:00', NULL, 1, NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM term WHERE term_id = '2025-2026-spring');
UPDATE term 
SET term_name='2025-2026秋季', enroll_start='2025-09-01 00:00:00', enroll_end='2026-02-01 00:00:00', update_time=NOW()
WHERE term_id='2025-2026-fall';
UPDATE term 
SET term_name='2025-2026春季', enroll_start='2026-03-01 00:00:00', enroll_end='2026-07-01 00:00:00', update_time=NOW()
WHERE term_id='2025-2026-spring';
UPDATE course_class 
SET term_id='2025-2026-fall'
WHERE term_id IN ('2024_fall','a_2024-2025-1','a_2025-2026-1','a_2025-2026_1');
UPDATE course_class 
SET term_id='2025-2026-spring'
WHERE term_id IN ('2024_spring','2025_spring','a_2024-2025-2');
UPDATE enrollment 
SET term_id='2025-2026-fall'
WHERE term_id IN ('2024_fall','a_2024-2025-1','a_2025-2026-1','a_2025-2026_1');
UPDATE enrollment 
SET term_id='2025-2026-spring'
WHERE term_id IN ('2024_spring','2025_spring','a_2024-2025-2');
DELETE FROM term WHERE term_id NOT IN ('2025-2026-fall','2025-2026-spring');
UPDATE course_class
SET class_time = CASE (class_id % 5)
    WHEN 0 THEN '周一1-2节, 周三3-4节'
    WHEN 1 THEN '周二1-2节, 周四3-4节'
    WHEN 2 THEN '周三1-2节, 周五3-4节'
    WHEN 3 THEN '周四1-2节, 周一3-4节'
    ELSE '周五1-2节, 周二3-4节'
END;
UPDATE course_class
SET location = CONCAT(
    '教学楼',
    CASE (class_id % 5)
        WHEN 0 THEN 'A'
        WHEN 1 THEN 'B'
        WHEN 2 THEN 'C'
        WHEN 3 THEN 'D'
        ELSE 'E'
    END,
    '-', LPAD(100 + ((class_id % 12) + 1), 3, '0')
);
