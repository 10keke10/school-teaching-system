USE `ry-vue`;
SET NAMES utf8mb4;

-- ==========================================
-- 演示数据脚本 (修正版)
-- 用途：生成全新的课程和班级，避免"同课程号"冲突
-- ==========================================

-- 1. 插入新课程 DEMO101 (用于演示满员状态)
INSERT INTO course (course_code, course_name, credit_hours, course_type, description, create_by, remark)
VALUES ('DEMO101', '触发器演示-满员课', 2, '选修', '用于展示已满员状态，验证UI拦截', 'admin', 'Demo data');

-- 2. 插入新课程 DEMO102 (用于演示并发/边界选课)
INSERT INTO course (course_code, course_name, credit_hours, course_type, description, create_by, remark)
VALUES ('DEMO102', '触发器演示-边界课', 2, '选修', '用于展示并发选课触发器拦截', 'admin', 'Demo data');

-- 3. 插入班级 (对应 DEMO101, 容量10, 已选10)
INSERT INTO course_class (course_id, teacher_id, term_id, class_time, location, capacity, selected_count, status, remark)
SELECT 
    course_id, 
    1002, 
    '2025-2026-fall', 
    '周五1-2节', 
    'DemoBldg-101', 
    10, 
    10, 
    1,
    'Demo data: Full class (10/10)'
FROM course WHERE course_code = 'DEMO101' LIMIT 1;

-- 4. 插入班级 (对应 DEMO102, 容量10, 已选9)
INSERT INTO course_class (course_id, teacher_id, term_id, class_time, location, capacity, selected_count, status, remark)
SELECT 
    course_id, 
    1003, 
    '2025-2026-fall', 
    '周五3-4节', 
    'DemoBldg-102', 
    10, 
    9, 
    1,
    'Demo data: Boundary class (9/10)'
FROM course WHERE course_code = 'DEMO102' LIMIT 1;
