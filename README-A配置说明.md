# A - 交付文档 (Admin & Platform)

## 1. 任务完成情况总结
我是成员A，负责**系统管理员角色**及**数据库平台层**的构建。目前已完成以下核心工作：

### 1.1 数据库构建 (Database Platform Layer)
- **基础表设计**：
  - `term` (学期表)：支持学期开课/退课时间控制。
  - `course_class` (教学班表)：核心开课表，支持容量设置、排课。
  - `credit_rule` (学分规则表)：定义每学期的学分上限。
  - `course` (课程表)：基础课程库。
- **业务逻辑实现 (SQL)**：
  - **触发器 (Triggers)**：
    - `trg_check_capacity_insert`: 选课时自动检查班级容量，满员拦截。
    - `trg_update_selected_count_*`: 选课/退课时自动维护 `course_class.selected_count`。
  - **存储过程 (Stored Procedures)**：
    - `sp_calc_student_credits`: 计算学生某学期已选学分（供B调用）。
    - `sp_check_enrollment_eligible`: 选课前置检查（学分上限+时间冲突）。

### 1.2 后端功能 (Backend - RuoYi)
- **学期管理** (`/edu/admin/term`)：增删改查，数据隔离前缀 `a_`。
- **教学班管理** (`/edu/admin/courseClass`)：
  - 开课、设置容量、排课（时间/地点）。
  - **数据隔离**：所有数据默认带有 `a_` 前缀，确保与B的数据不冲突。
  - **可视化**：保留了ECharts统计图表功能。
- **学分规则管理** (`/edu/admin/creditRule`)：配置学分限制。

### 1.3 前端功能 (Frontend - Vue3)
- 完成了对应的管理页面，修复了权限指令 (`v-hasPermi`)，解决了 403 问题。
- 统一了 API 路径为 `/edu/admin/...`。

---

## 2. 交付给成员B的接口与资源

### 2.1 数据库资源 (B需要使用)
B同学在开发 `enrollment` (选课) 模块时，需要依赖以下资源：

1.  **表结构依赖**：
    - `course_class`: 选课的目标表，B需要读取 `class_id`, `capacity`, `status`。
    - `term`: 获取选课时间窗口 `enroll_start`, `enroll_end`。
    - `credit_rule`: 获取 `max_credits`。

2.  **存储过程接口 (Stored Procedures)**：
    - **计算学分**：`CALL sp_calc_student_credits(student_id, term_id, @out_credits)`
    - **选课检查**：`CALL sp_check_enrollment_eligible(student_id, class_id, @out_eligible, @out_msg)`
      - B在实现选课接口时，**必须**调用此过程进行校验。

3.  **触发器保护**：
    - B只需要向 `enrollment` 表插入数据，`trg_update_selected_count` 会自动更新班级人数。

### 2.2 权限标识
如果B需要控制前端按钮权限，请遵循以下规范：
- 教学班相关：`edu:admin:courseClass:{list, add, edit, remove, export}`
- 学期相关：`edu:admin:term:{...}`

---

## 3. 成员B - 快速开始指南 (Setup Instructions)

### 步骤 1：拉取代码
从 GitHub 拉取最新分支代码。

### 步骤 2：初始化数据库
请**严格按照以下顺序**运行 SQL 脚本（位于 `sql/` 目录下）：

1.  `edu_tables_final.sql` (创建表结构)
2.  `edu_procedures.sql` (创建存储过程)
3.  `edu_triggers.sql` (创建触发器 - **重要**)
4.  `edu_menu_config.sql` (RuoYi 菜单与权限配置)

### 步骤 3：后端配置
1.  打开 `backend/RuoYi-Vue/ruoyi-admin/src/main/resources/application-druid.yml`。
2.  修改数据库连接信息（url, username, password）为你本地的 MySQL 配置。

### 步骤 4：启动项目
- **Backend**: 在 `backend/RuoYi-Vue` 目录下运行 `mvn spring-boot:run -pl ruoyi-admin`。
- **Frontend**: 在 `frontend/RuoYi-Vue3` 目录下运行 `npm run dev`。

---

## 4. 注意事项
1.  **数据隔离**：A创建的数据（学期、班级）ID均以 `a_` 开头。B在测试时，请使用 `a_` 开头的 ID 进行关联，或者B自己创建的数据建议使用 `b_` 前缀，避免冲突。
2.  **NPE 修复**：教学班管理的 MyBatis 查询已修复 NPE 问题，请勿随意修改 Mapper XML 中的 `parameterType` 和 `resultMap` 映射。
