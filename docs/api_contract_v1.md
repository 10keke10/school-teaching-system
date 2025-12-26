# API路径前缀：/edu
# 数据返回格式：AjaxResult（RuoYi标准）

## A提供的接口（管理员/平台层）
GET    /edu/admin/terms               # 学期列表

POST   /edu/admin/term                # 新增学期

GET    /edu/admin/classes?term_id=xxx # 教学班列表

GET    /edu/admin/class/{id}/stats    # 班级统计（调用B的接口）

## B提供的接口（业务层）
POST   /edu/student/enroll            # 选课（核心业务）

POST   /edu/student/drop/{id}         # 退课

GET    /edu/student/timetable         # 课表（带冲突检测）

GET    /edu/teacher/classes/{id}/students # 班级学生名单

POST   /edu/teacher/grades/batch      # 批量录入成绩

POST   /edu/teacher/grades/publish    # 发布成绩

GET    /edu/statistics/student/{id}/credits # 学分统计（调用存储过程）