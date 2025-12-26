-- 文件：edu_tables_final.sql
-- 位置：项目根目录/临时目录/edu_tables_final.sql

-- ==================== 选课系统核心业务表 ====================
-- 设计者：A（系统平台表） + B（业务表）
-- 版本：1.0
-- 日期：2024-XX-XX

-- 注意：使用IF NOT EXISTS，避免重复创建

-- 1. 学期表 (A)
CREATE TABLE IF NOT EXISTS `term` (
                                      `term_id` VARCHAR(20) PRIMARY KEY COMMENT '学期ID，格式：2024-2025-1',
                                      `term_name` VARCHAR(50) NOT NULL COMMENT '学期名称，如：2024-2025秋季',
                                      `enroll_start` DATETIME COMMENT '选课开始时间',
                                      `enroll_end` DATETIME COMMENT '选课结束时间',
                                      `drop_deadline` DATETIME COMMENT '退课截止时间',
                                      `is_active` TINYINT(1) DEFAULT 1 COMMENT '是否当前学期（1是，0否）',
                                      `create_by` VARCHAR(64) DEFAULT '' COMMENT '创建者',
                                      `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                      `update_by` VARCHAR(64) DEFAULT '' COMMENT '更新者',
                                      `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                      `remark` VARCHAR(500) DEFAULT '' COMMENT '备注',

                                      INDEX `idx_is_active` (`is_active`),
                                      INDEX `idx_enroll_time` (`enroll_start`, `enroll_end`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学期表';

-- 2. 课程信息表 (A)
CREATE TABLE IF NOT EXISTS `course` (
                                        `course_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '课程ID',
                                        `course_code` VARCHAR(20) UNIQUE NOT NULL COMMENT '课程代码',
                                        `course_name` VARCHAR(100) NOT NULL COMMENT '课程名称',
                                        `credit_hours` INT DEFAULT 2 COMMENT '学分',
                                        `dept_id` BIGINT COMMENT '开课院系ID（关联sys_dept.dept_id）',
                                        `course_type` VARCHAR(20) DEFAULT '必修' COMMENT '课程类型：必修/选修',
                                        `description` TEXT COMMENT '课程描述',
                                        `create_by` VARCHAR(64) DEFAULT '' COMMENT '创建者',
                                        `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                        `update_by` VARCHAR(64) DEFAULT '' COMMENT '更新者',
                                        `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                        `remark` VARCHAR(500) DEFAULT '' COMMENT '备注',

                                        INDEX `idx_dept` (`dept_id`),
                                        INDEX `idx_course_code` (`course_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='课程信息表';

-- 3. 教学班表 (A)
CREATE TABLE IF NOT EXISTS `course_class` (
                                              `class_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '教学班ID',
                                              `course_id` INT NOT NULL COMMENT '课程ID',
                                              `teacher_id` BIGINT NOT NULL COMMENT '教师ID（关联sys_user.user_id）',
                                              `term_id` VARCHAR(20) NOT NULL COMMENT '学期ID',
                                              `class_time` VARCHAR(100) COMMENT '上课时间，如：周一1-2节，周三3-4节',
                                              `location` VARCHAR(100) COMMENT '上课地点',
                                              `capacity` INT DEFAULT 60 COMMENT '课程容量',
                                              `selected_count` INT DEFAULT 0 COMMENT '已选人数',
                                              `status` TINYINT DEFAULT 1 COMMENT '状态：1开放选课，0关闭',
                                              `create_by` VARCHAR(64) DEFAULT '' COMMENT '创建者',
                                              `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                              `update_by` VARCHAR(64) DEFAULT '' COMMENT '更新者',
                                              `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                              `remark` VARCHAR(500) DEFAULT '' COMMENT '备注',

                                              INDEX `idx_term` (`term_id`),
                                              INDEX `idx_teacher` (`teacher_id`),
                                              INDEX `idx_course` (`course_id`),
                                              INDEX `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='教学班表';

-- 4. 学分规则表 (A)
CREATE TABLE IF NOT EXISTS `credit_rule` (
                                             `rule_id` INT PRIMARY KEY AUTO_INCREMENT,
                                             `rule_name` VARCHAR(50) COMMENT '规则名称',
                                             `term_id` VARCHAR(20) COMMENT '适用学期',
                                             `max_credits` INT DEFAULT 20 COMMENT '最大学分',
                                             `min_credits` INT DEFAULT 0 COMMENT '最小学分',
                                             `is_active` TINYINT(1) DEFAULT 1 COMMENT '是否生效（1是，0否）',
                                             `create_by` VARCHAR(64) DEFAULT '' COMMENT '创建者',
                                             `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                             `update_by` VARCHAR(64) DEFAULT '' COMMENT '更新者',
                                             `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                             `remark` VARCHAR(500) DEFAULT '' COMMENT '备注',

                                             INDEX `idx_term` (`term_id`),
                                             INDEX `idx_is_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学分规则表';

-- 5. 选课记录表 (B - 核心业务表)
CREATE TABLE IF NOT EXISTS `enrollment` (
                                            `enrollment_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '选课记录ID',
                                            `student_id` BIGINT NOT NULL COMMENT '学生ID（关联sys_user.user_id）',
                                            `class_id` INT NOT NULL COMMENT '教学班ID',
                                            `term_id` VARCHAR(20) NOT NULL COMMENT '学期ID',
                                            `status` VARCHAR(20) DEFAULT 'ENROLLED' COMMENT '状态：ENROLLED已选课，DROPPED已退课',
                                            `grade` DECIMAL(5,2) COMMENT '成绩（0-100，支持小数）',
                                            `grade_status` VARCHAR(20) DEFAULT 'DRAFT' COMMENT '成绩状态：DRAFT草稿，PUBLISHED已发布',
                                            `enroll_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '选课时间',
                                            `drop_time` DATETIME COMMENT '退课时间',
                                            `create_by` VARCHAR(64) DEFAULT '' COMMENT '创建者',
                                            `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                            `update_by` VARCHAR(64) DEFAULT '' COMMENT '更新者',
                                            `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                            `remark` VARCHAR(500) DEFAULT '' COMMENT '备注',

    -- 业务约束
                                            UNIQUE KEY `uk_student_class` (`student_id`, `class_id`) COMMENT '防止重复选课',
                                            INDEX `idx_student_term` (`student_id`, `term_id`),
                                            INDEX `idx_class` (`class_id`),
                                            INDEX `idx_grade_status` (`grade_status`),
                                            INDEX `idx_status` (`status`),
                                            INDEX `idx_enroll_time` (`enroll_time`),

    -- 检查约束（MySQL 8.0+）
                                            CONSTRAINT `chk_enrollment_status` CHECK (`status` IN ('ENROLLED', 'DROPPED')),
                                            CONSTRAINT `chk_grade_status` CHECK (`grade_status` IN ('DRAFT', 'PUBLISHED')),
                                            CONSTRAINT `chk_grade_range` CHECK (`grade` IS NULL OR (`grade` >= 0 AND `grade` <= 100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='选课记录表';

-- 6. 上课时间槽表 (B - 可选)
CREATE TABLE IF NOT EXISTS `class_time_slot` (
                                                 `slot_id` BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '时间槽ID',
                                                 `class_id` INT NOT NULL COMMENT '教学班ID',
                                                 `week_day` TINYINT COMMENT '星期几（1-7，1=周一）',
                                                 `start_slot` TINYINT COMMENT '开始节次（1-12）',
                                                 `end_slot` TINYINT COMMENT '结束节次',
                                                 `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                 `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

                                                 UNIQUE KEY `uk_class_time` (`class_id`, `week_day`, `start_slot`),
                                                 INDEX `idx_class` (`class_id`),
                                                 INDEX `idx_week_day` (`week_day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='上课时间槽表';