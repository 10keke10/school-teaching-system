-- 备份现有数据（按天时间戳）
CREATE TABLE IF NOT EXISTS course_backup_20260104 AS SELECT * FROM course;
CREATE TABLE IF NOT EXISTS course_class_backup_20260104 AS SELECT * FROM course_class;
CREATE TABLE IF NOT EXISTS class_time_slot_backup_20260104 AS SELECT * FROM class_time_slot;
CREATE TABLE IF NOT EXISTS term_backup_20260104 AS SELECT * FROM term;

-- 插入课程（仅当不存在时插入），课程名与课程号一一对应且保持一致
INSERT INTO course (course_code, course_name, credit_hours, course_type, description, create_time)
SELECT 'MA201', '线性代数', 3, '必修', '线性代数基础与应用', NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM course WHERE course_code = 'MA201');

INSERT INTO course (course_code, course_name, credit_hours, course_type, description, create_time)
SELECT 'CS201', '计算机网络', 3, '必修', '计算机网络原理与协议', NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM course WHERE course_code = 'CS201');

INSERT INTO course (course_code, course_name, credit_hours, course_type, description, create_time)
SELECT 'CS203', '数据库系统', 3, '必修', '数据库原理与实践', NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM course WHERE course_code = 'CS203');

INSERT INTO course (course_code, course_name, credit_hours, course_type, description, create_time)
SELECT 'ENG301', '学术英语', 2, '选修', '学术英语综合训练', NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM course WHERE course_code = 'ENG301');

INSERT INTO course (course_code, course_name, credit_hours, course_type, description, create_time)
SELECT 'PHY201', '电磁学', 3, '必修', '电磁学基础与应用', NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM course WHERE course_code = 'PHY201');

-- 读取课程ID
SET @ma201_id = (SELECT course_id FROM course WHERE course_code = 'MA201' LIMIT 1);
SET @cs201_id = (SELECT course_id FROM course WHERE course_code = 'CS201' LIMIT 1);
SET @cs203_id = (SELECT course_id FROM course WHERE course_code = 'CS203' LIMIT 1);
SET @eng301_id = (SELECT course_id FROM course WHERE course_code = 'ENG301' LIMIT 1);
SET @phy201_id = (SELECT course_id FROM course WHERE course_code = 'PHY201' LIMIT 1);

-- 学期与教师（使用已存在的教师账户）
SET @term_fall = '2025-2026-fall';
-- 教师账号自动匹配（支持 'teacher%' 与 'b_teacher%'，过滤停用/删除）
SET @t1 = (
  SELECT user_id FROM sys_user
  WHERE (user_name LIKE 'teacher%' OR user_name LIKE 'b_teacher%')
    AND status = '0' AND del_flag = '0'
  ORDER BY create_time, user_id
  LIMIT 0, 1
);
SET @t2 = (
  SELECT user_id FROM sys_user
  WHERE (user_name LIKE 'teacher%' OR user_name LIKE 'b_teacher%')
    AND status = '0' AND del_flag = '0'
  ORDER BY create_time, user_id
  LIMIT 1, 1
);
SET @t3 = (
  SELECT user_id FROM sys_user
  WHERE (user_name LIKE 'teacher%' OR user_name LIKE 'b_teacher%')
    AND status = '0' AND del_flag = '0'
  ORDER BY create_time, user_id
  LIMIT 2, 1
);
SET @t4 = (
  SELECT user_id FROM sys_user
  WHERE (user_name LIKE 'teacher%' OR user_name LIKE 'b_teacher%')
    AND status = '0' AND del_flag = '0'
  ORDER BY create_time, user_id
  LIMIT 3, 1
);
SET @t5 = (
  SELECT user_id FROM sys_user
  WHERE (user_name LIKE 'teacher%' OR user_name LIKE 'b_teacher%')
    AND status = '0' AND del_flag = '0'
  ORDER BY create_time, user_id
  LIMIT 4, 1
);

-- 插入教学班（不同上课时间，覆盖同一学期内的多个课程）
INSERT INTO course_class (course_id, teacher_id, term_id, class_time, location, capacity, selected_count, status, create_time)
SELECT @ma201_id, @t1, @term_fall, '周一 08:00-09:40', '数理楼-410', 80, 0, 1, NOW()
FROM DUAL WHERE @t1 IS NOT NULL AND NOT EXISTS (SELECT 1 FROM course_class WHERE course_id=@ma201_id AND teacher_id=@t1 AND term_id=@term_fall);

INSERT INTO course_class (course_id, teacher_id, term_id, class_time, location, capacity, selected_count, status, create_time)
SELECT @cs201_id, @t2, @term_fall, '周一 10:00-11:40', '科教楼-310', 60, 0, 1, NOW()
FROM DUAL WHERE @t2 IS NOT NULL AND NOT EXISTS (SELECT 1 FROM course_class WHERE course_id=@cs201_id AND teacher_id=@t2 AND term_id=@term_fall);

INSERT INTO course_class (course_id, teacher_id, term_id, class_time, location, capacity, selected_count, status, create_time)
SELECT @cs203_id, @t3, @term_fall, '周三 14:00-15:40', '科教楼-311', 60, 0, 1, NOW()
FROM DUAL WHERE @t3 IS NOT NULL AND NOT EXISTS (SELECT 1 FROM course_class WHERE course_id=@cs203_id AND teacher_id=@t3 AND term_id=@term_fall);

INSERT INTO course_class (course_id, teacher_id, term_id, class_time, location, capacity, selected_count, status, create_time)
SELECT @eng301_id, @t4, @term_fall, '周五 16:00-17:40', '外语楼-520', 40, 0, 1, NOW()
FROM DUAL WHERE @t4 IS NOT NULL AND NOT EXISTS (SELECT 1 FROM course_class WHERE course_id=@eng301_id AND teacher_id=@t4 AND term_id=@term_fall);

INSERT INTO course_class (course_id, teacher_id, term_id, class_time, location, capacity, selected_count, status, create_time)
SELECT @phy201_id, @t5, @term_fall, '周四 08:00-09:40', '物理楼-620', 80, 0, 1, NOW()
FROM DUAL WHERE @t5 IS NOT NULL AND NOT EXISTS (SELECT 1 FROM course_class WHERE course_id=@phy201_id AND teacher_id=@t5 AND term_id=@term_fall);

-- 获取教学班ID（用于结构化时间槽）
SET @ma201_class = (SELECT class_id FROM course_class WHERE course_id=@ma201_id AND teacher_id=@t1 AND term_id=@term_fall LIMIT 1);
SET @cs201_class = (SELECT class_id FROM course_class WHERE course_id=@cs201_id AND teacher_id=@t2 AND term_id=@term_fall LIMIT 1);
SET @cs203_class = (SELECT class_id FROM course_class WHERE course_id=@cs203_id AND teacher_id=@t3 AND term_id=@term_fall LIMIT 1);
SET @eng301_class = (SELECT class_id FROM course_class WHERE course_id=@eng301_id AND teacher_id=@t4 AND term_id=@term_fall LIMIT 1);
SET @phy201_class = (SELECT class_id FROM course_class WHERE course_id=@phy201_id AND teacher_id=@t5 AND term_id=@term_fall LIMIT 1);

-- 插入结构化时间槽（便于时间冲突与课表显示）
-- 周一 08:00-09:40 -> 第1-2节；周一 10:00-11:40 -> 第3-4节；周三 14:00-15:40 -> 第5-6节；周五 16:00-17:40 -> 第7-8节；周四 08:00-09:40 -> 第1-2节
INSERT INTO class_time_slot (class_id, week_day, start_slot, end_slot, create_time)
SELECT @ma201_class, 1, 1, 2, NOW()
FROM DUAL WHERE @ma201_class IS NOT NULL AND NOT EXISTS (SELECT 1 FROM class_time_slot WHERE class_id=@ma201_class AND week_day=1 AND start_slot=1 AND end_slot=2);

INSERT INTO class_time_slot (class_id, week_day, start_slot, end_slot, create_time)
SELECT @cs201_class, 1, 3, 4, NOW()
FROM DUAL WHERE @cs201_class IS NOT NULL AND NOT EXISTS (SELECT 1 FROM class_time_slot WHERE class_id=@cs201_class AND week_day=1 AND start_slot=3 AND end_slot=4);

INSERT INTO class_time_slot (class_id, week_day, start_slot, end_slot, create_time)
SELECT @cs203_class, 3, 5, 6, NOW()
FROM DUAL WHERE @cs203_class IS NOT NULL AND NOT EXISTS (SELECT 1 FROM class_time_slot WHERE class_id=@cs203_class AND week_day=3 AND start_slot=5 AND end_slot=6);

INSERT INTO class_time_slot (class_id, week_day, start_slot, end_slot, create_time)
SELECT @eng301_class, 5, 7, 8, NOW()
FROM DUAL WHERE @eng301_class IS NOT NULL AND NOT EXISTS (SELECT 1 FROM class_time_slot WHERE class_id=@eng301_class AND week_day=5 AND start_slot=7 AND end_slot=8);

INSERT INTO class_time_slot (class_id, week_day, start_slot, end_slot, create_time)
SELECT @phy201_class, 4, 1, 2, NOW()
FROM DUAL WHERE @phy201_class IS NOT NULL AND NOT EXISTS (SELECT 1 FROM class_time_slot WHERE class_id=@phy201_class AND week_day=4 AND start_slot=1 AND end_slot=2);

-- =========================
-- 春季学期数据插入
-- =========================

-- 补充春季学期（如果不存在）
INSERT INTO term (term_id, term_name, is_active, create_time)
SELECT '2025-2026-spring', '2025-2026学年春季学期', 0, NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM term WHERE term_id = '2025-2026-spring');

-- 插入课程（保持课程号-课程名一致）
INSERT INTO course (course_code, course_name, credit_hours, course_type, description, create_time)
SELECT 'CS202', '数据结构', 3, '必修', '数据结构与算法基础', NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM course WHERE course_code = 'CS202');

INSERT INTO course (course_code, course_name, credit_hours, course_type, description, create_time)
SELECT 'CS204', '操作系统', 3, '必修', '操作系统原理与实践', NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM course WHERE course_code = 'CS204');

INSERT INTO course (course_code, course_name, credit_hours, course_type, description, create_time)
SELECT 'MA202', '概率论与数理统计', 3, '必修', '概率与统计基础', NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM course WHERE course_code = 'MA202');

INSERT INTO course (course_code, course_name, credit_hours, course_type, description, create_time)
SELECT 'PHY202', '大学物理B', 3, '必修', '大学物理基础（B类）', NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM course WHERE course_code = 'PHY202');

INSERT INTO course (course_code, course_name, credit_hours, course_type, description, create_time)
SELECT 'INN301', '创新创业', 2, '选修', '创新创业基础与实践', NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM course WHERE course_code = 'INN301');

-- 读取课程ID
SET @cs202_id = (SELECT course_id FROM course WHERE course_code = 'CS202' LIMIT 1);
SET @cs204_id = (SELECT course_id FROM course WHERE course_code = 'CS204' LIMIT 1);
SET @ma202_id = (SELECT course_id FROM course WHERE course_code = 'MA202' LIMIT 1);
SET @phy202_id = (SELECT course_id FROM course WHERE course_code = 'PHY202' LIMIT 1);
SET @inn301_id = (SELECT course_id FROM course WHERE course_code = 'INN301' LIMIT 1);

-- 春季学期与教师
SET @term_spring = '2025-2026-spring';
-- 复用前文自动匹配到的教师账号 @t1..@t5

-- 插入春季教学班
INSERT INTO course_class (course_id, teacher_id, term_id, class_time, location, capacity, selected_count, status, create_time)
SELECT @cs202_id, @t1, @term_spring, '周一 14:00-15:40', '一教-205', 60, 0, 1, NOW()
FROM DUAL WHERE @t1 IS NOT NULL AND NOT EXISTS (SELECT 1 FROM course_class WHERE course_id=@cs202_id AND teacher_id=@t1 AND term_id=@term_spring);

INSERT INTO course_class (course_id, teacher_id, term_id, class_time, location, capacity, selected_count, status, create_time)
SELECT @cs204_id, @t2, @term_spring, '周二 10:00-11:40', '一教-206', 60, 0, 1, NOW()
FROM DUAL WHERE @t2 IS NOT NULL AND NOT EXISTS (SELECT 1 FROM course_class WHERE course_id=@cs204_id AND teacher_id=@t2 AND term_id=@term_spring);

INSERT INTO course_class (course_id, teacher_id, term_id, class_time, location, capacity, selected_count, status, create_time)
SELECT @ma202_id, @t3, @term_spring, '周四 08:00-09:40', '数理楼-412', 80, 0, 1, NOW()
FROM DUAL WHERE @t3 IS NOT NULL AND NOT EXISTS (SELECT 1 FROM course_class WHERE course_id=@ma202_id AND teacher_id=@t3 AND term_id=@term_spring);

INSERT INTO course_class (course_id, teacher_id, term_id, class_time, location, capacity, selected_count, status, create_time)
SELECT @phy202_id, @t4, @term_spring, '周三 16:00-17:40', '物理楼-622', 80, 0, 1, NOW()
FROM DUAL WHERE @t4 IS NOT NULL AND NOT EXISTS (SELECT 1 FROM course_class WHERE course_id=@phy202_id AND teacher_id=@t4 AND term_id=@term_spring);

INSERT INTO course_class (course_id, teacher_id, term_id, class_time, location, capacity, selected_count, status, create_time)
SELECT @inn301_id, @t5, @term_spring, '周五 14:00-15:40', '创新中心-301', 100, 0, 1, NOW()
FROM DUAL WHERE @t5 IS NOT NULL AND NOT EXISTS (SELECT 1 FROM course_class WHERE course_id=@inn301_id AND teacher_id=@t5 AND term_id=@term_spring);

-- 获取春季教学班ID
SET @cs202_class = (SELECT class_id FROM course_class WHERE course_id=@cs202_id AND teacher_id=@t1 AND term_id=@term_spring LIMIT 1);
SET @cs204_class = (SELECT class_id FROM course_class WHERE course_id=@cs204_id AND teacher_id=@t2 AND term_id=@term_spring LIMIT 1);
SET @ma202_class = (SELECT class_id FROM course_class WHERE course_id=@ma202_id AND teacher_id=@t3 AND term_id=@term_spring LIMIT 1);
SET @phy202_class = (SELECT class_id FROM course_class WHERE course_id=@phy202_id AND teacher_id=@t4 AND term_id=@term_spring LIMIT 1);
SET @inn301_class = (SELECT class_id FROM course_class WHERE course_id=@inn301_id AND teacher_id=@t5 AND term_id=@term_spring LIMIT 1);

-- 插入结构化时间槽（春季）
-- 周一 14:00-15:40 -> 第5-6节（周一=1）
INSERT INTO class_time_slot (class_id, week_day, start_slot, end_slot, create_time)
SELECT @cs202_class, 1, 5, 6, NOW()
FROM DUAL WHERE @cs202_class IS NOT NULL AND NOT EXISTS (SELECT 1 FROM class_time_slot WHERE class_id=@cs202_class AND week_day=1 AND start_slot=5 AND end_slot=6);

-- 周二 10:00-11:40 -> 第3-4节（周二=2）
INSERT INTO class_time_slot (class_id, week_day, start_slot, end_slot, create_time)
SELECT @cs204_class, 2, 3, 4, NOW()
FROM DUAL WHERE @cs204_class IS NOT NULL AND NOT EXISTS (SELECT 1 FROM class_time_slot WHERE class_id=@cs204_class AND week_day=2 AND start_slot=3 AND end_slot=4);

-- 周四 08:00-09:40 -> 第1-2节（周四=4）
INSERT INTO class_time_slot (class_id, week_day, start_slot, end_slot, create_time)
SELECT @ma202_class, 4, 1, 2, NOW()
FROM DUAL WHERE @ma202_class IS NOT NULL AND NOT EXISTS (SELECT 1 FROM class_time_slot WHERE class_id=@ma202_class AND week_day=4 AND start_slot=1 AND end_slot=2);

-- 周三 16:00-17:40 -> 第7-8节（周三=3）
INSERT INTO class_time_slot (class_id, week_day, start_slot, end_slot, create_time)
SELECT @phy202_class, 3, 7, 8, NOW()
FROM DUAL WHERE @phy202_class IS NOT NULL AND NOT EXISTS (SELECT 1 FROM class_time_slot WHERE class_id=@phy202_class AND week_day=3 AND start_slot=7 AND end_slot=8);

-- 周五 14:00-15:40 -> 第5-6节（周五=5）
INSERT INTO class_time_slot (class_id, week_day, start_slot, end_slot, create_time)
SELECT @inn301_class, 5, 5, 6, NOW()
FROM DUAL WHERE @inn301_class IS NOT NULL AND NOT EXISTS (SELECT 1 FROM class_time_slot WHERE class_id=@inn301_class AND week_day=5 AND start_slot=5 AND end_slot=6);

-- =========================
-- 规范化 class_time 文本并补齐缺失的时间槽
-- =========================

-- 备份（规范化前）
CREATE TABLE IF NOT EXISTS course_class_backup_norm_20260104 AS SELECT * FROM course_class;
CREATE TABLE IF NOT EXISTS class_time_slot_backup_norm_20260104 AS SELECT * FROM class_time_slot;

-- 为不存在结构化时间槽的教学班，依据已有class_time字符串插入时间槽（仅处理常见时间段）
-- 规则：08:00-09:40 => 1-2节；10:00-11:40 => 3-4节；14:00-15:40 => 5-6节；16:00-17:40 => 7-8节
-- 星期映射：周一=1，周二=2，周三=3，周四=4，周五=5，周六=6，周日=7
INSERT INTO class_time_slot (class_id, week_day, start_slot, end_slot, create_time)
SELECT 
  cc.class_id,
  CASE
    WHEN cc.class_time LIKE '周一%' THEN 1
    WHEN cc.class_time LIKE '周二%' THEN 2
    WHEN cc.class_time LIKE '周三%' THEN 3
    WHEN cc.class_time LIKE '周四%' THEN 4
    WHEN cc.class_time LIKE '周五%' THEN 5
    WHEN cc.class_time LIKE '周六%' THEN 6
    WHEN cc.class_time LIKE '周日%' THEN 7
    ELSE NULL
  END AS week_day,
  CASE
    WHEN cc.class_time LIKE '%08:00-09:40%' THEN 1
    WHEN cc.class_time LIKE '%10:00-11:40%' THEN 3
    WHEN cc.class_time LIKE '%14:00-15:40%' THEN 5
    WHEN cc.class_time LIKE '%16:00-17:40%' THEN 7
    ELSE NULL
  END AS start_slot,
  CASE
    WHEN cc.class_time LIKE '%08:00-09:40%' THEN 2
    WHEN cc.class_time LIKE '%10:00-11:40%' THEN 4
    WHEN cc.class_time LIKE '%14:00-15:40%' THEN 6
    WHEN cc.class_time LIKE '%16:00-17:40%' THEN 8
    ELSE NULL
  END AS end_slot,
  NOW()
FROM course_class cc
LEFT JOIN class_time_slot ts ON ts.class_id = cc.class_id
WHERE ts.class_id IS NULL
  AND cc.class_time IS NOT NULL
  AND (
    cc.class_time LIKE '%08:00-09:40%' OR
    cc.class_time LIKE '%10:00-11:40%' OR
    cc.class_time LIKE '%14:00-15:40%' OR
    cc.class_time LIKE '%16:00-17:40%'
  )
  AND (
    cc.class_time LIKE '周一%' OR cc.class_time LIKE '周二%' OR cc.class_time LIKE '周三%' OR
    cc.class_time LIKE '周四%' OR cc.class_time LIKE '周五%' OR cc.class_time LIKE '周六%' OR
    cc.class_time LIKE '周日%'
  );

-- 使用结构化时间槽生成标准化文本：如“周二1-2节, 周四3-4节”
UPDATE course_class cc
JOIN (
  SELECT class_id,
         GROUP_CONCAT(
           CONCAT(
             CASE week_day
               WHEN 1 THEN '周一'
               WHEN 2 THEN '周二'
               WHEN 3 THEN '周三'
               WHEN 4 THEN '周四'
               WHEN 5 THEN '周五'
               WHEN 6 THEN '周六'
               WHEN 7 THEN '周日'
             END,
             start_slot, '-', end_slot, '节'
           )
           ORDER BY week_day, start_slot
           SEPARATOR ', '
         ) AS new_class_time
  FROM class_time_slot
  GROUP BY class_id
) s ON s.class_id = cc.class_id
SET cc.class_time = s.new_class_time;

-- 验证：是否仍存在没有结构化时间槽的教学班
-- 可在执行脚本后运行：SELECT COUNT(*) FROM course_class cc LEFT JOIN class_time_slot ts ON ts.class_id=cc.class_id WHERE ts.class_id IS NULL;

-- 针对仍缺失的教学班，根据标准节次文本补齐结构化时间槽
INSERT INTO class_time_slot (class_id, week_day, start_slot, end_slot, create_time)
SELECT
  t.class_id,
  CASE
    WHEN t.token LIKE '周一%' THEN 1
    WHEN t.token LIKE '周二%' THEN 2
    WHEN t.token LIKE '周三%' THEN 3
    WHEN t.token LIKE '周四%' THEN 4
    WHEN t.token LIKE '周五%' THEN 5
    WHEN t.token LIKE '周六%' THEN 6
    WHEN t.token LIKE '周日%' THEN 7
    ELSE NULL
  END AS week_day,
  CASE
    WHEN t.token LIKE '%08:00-09:40%' THEN 1
    WHEN t.token LIKE '%10:00-11:40%' THEN 3
    WHEN t.token LIKE '%14:00-15:40%' THEN 5
    WHEN t.token LIKE '%16:00-17:40%' THEN 7
    WHEN t.token REGEXP '^周(.)[0-9]+-[0-9]+节' THEN CAST(SUBSTRING_INDEX(SUBSTRING(SUBSTRING_INDEX(t.token,'节',1), 3), '-', 1) AS UNSIGNED)
    ELSE NULL
  END AS start_slot,
  CASE
    WHEN t.token LIKE '%08:00-09:40%' THEN 2
    WHEN t.token LIKE '%10:00-11:40%' THEN 4
    WHEN t.token LIKE '%14:00-15:40%' THEN 6
    WHEN t.token LIKE '%16:00-17:40%' THEN 8
    WHEN t.token REGEXP '^周(.)[0-9]+-[0-9]+节' THEN CAST(SUBSTRING_INDEX(SUBSTRING(SUBSTRING_INDEX(t.token,'节',1), 3), '-', -1) AS UNSIGNED)
    ELSE NULL
  END AS end_slot,
  NOW()
FROM (
  SELECT cc.class_id, TRIM(SUBSTRING_INDEX(cc.class_time, ', ', 1)) AS token
  FROM course_class cc
  LEFT JOIN class_time_slot ts ON ts.class_id = cc.class_id
  WHERE ts.class_id IS NULL AND cc.class_time IS NOT NULL AND cc.class_time <> ''
  UNION ALL
  SELECT cc.class_id, TRIM(SUBSTRING_INDEX(cc.class_time, ', ', -1)) AS token
  FROM course_class cc
  LEFT JOIN class_time_slot ts ON ts.class_id = cc.class_id
  WHERE ts.class_id IS NULL AND cc.class_time LIKE '%, %'
) t
WHERE (
  t.token REGEXP '^周(.)[0-9]+-[0-9]+节' OR
  t.token LIKE '%08:00-09:40%' OR
  t.token LIKE '%10:00-11:40%' OR
  t.token LIKE '%14:00-15:40%' OR
  t.token LIKE '%16:00-17:40%'
);
SET @inn_course = (SELECT course_id FROM course WHERE course_code = 'INN301' LIMIT 1);
SET @hanxue = (SELECT user_id FROM sys_user WHERE nick_name = '韩雪' OR user_name IN ('teacher1005','b_teacher1005') LIMIT 1);
UPDATE course_class SET capacity = 2 WHERE course_id = @inn_course AND teacher_id = @hanxue AND term_id = '2025-2026-spring';
