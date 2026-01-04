SELECT COUNT(*) AS cnt_courses FROM course;
SELECT COUNT(*) AS cnt_classes FROM course_class;
SELECT c.course_name, c.course_code, COUNT(*) AS class_count
FROM course c INNER JOIN course_class cc ON cc.course_id = c.course_id
GROUP BY c.course_name, c.course_code ORDER BY class_count DESC;
SELECT cc.class_id, cc.term_id, cc.teacher_id, c.course_name, c.course_code
FROM course_class cc INNER JOIN course c ON c.course_id = cc.course_id
ORDER BY cc.term_id, c.course_code, cc.class_id LIMIT 50;
SELECT class_id FROM course_class WHERE status = 1 AND term_id = '2025_spring' LIMIT 10;
