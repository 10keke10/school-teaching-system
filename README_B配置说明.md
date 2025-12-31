# B负责功能配置说明

## 📋 配置步骤

### 1. 执行SQL脚本初始化角色、菜单、账号

```bash
# 在MySQL中执行
mysql -u root -p ry-vue < sql/b_init_roles_users_menus.sql
```

或者直接在MySQL客户端执行：
```sql
USE ry-vue;
SOURCE sql/b_init_roles_users_menus.sql;
```

### 2. 验证配置

执行以下SQL查询验证配置是否成功：

```sql
-- 查看角色
SELECT role_id, role_name, role_key, status FROM sys_role WHERE role_id IN (3, 4);

-- 查看菜单
SELECT menu_id, menu_name, parent_id, path, perms FROM sys_menu WHERE menu_id BETWEEN 2000 AND 2204 ORDER BY menu_id;

-- 查看学生账号
SELECT user_id, user_name, nick_name, status FROM sys_user WHERE user_id BETWEEN 2001 AND 2010;

-- 查看教师账号
SELECT user_id, user_name, nick_name, status FROM sys_user WHERE user_id BETWEEN 1001 AND 1008;

-- 查看用户角色关联
SELECT ur.user_id, u.user_name, r.role_name 
FROM sys_user_role ur 
JOIN sys_user u ON ur.user_id = u.user_id 
JOIN sys_role r ON ur.role_id = r.role_id 
WHERE ur.user_id BETWEEN 1001 AND 2010 
ORDER BY ur.user_id;
```

## 🔐 测试账号

### 学生账号（10个）
- **账号**：`student2001` ~ `student2010`
- **密码**：`123456`
- **角色**：学生
- **权限**：只能看到学生功能模块（可选课程、我的课表、成绩查询、学分统计）

### 教师账号（8个）
- **账号**：`teacher1001` ~ `teacher1008`
- **密码**：`123456`
- **角色**：教师
- **权限**：只能看到教师功能模块（我的班级、成绩管理）

### 账号对应关系

#### 学生账号与enrollment表的student_id对应：
- `student2001` (user_id=2001) → enrollment.student_id=2001
- `student2002` (user_id=2002) → enrollment.student_id=2002
- ... 以此类推

#### 教师账号与course_class表的teacher_id对应：
- `teacher1001` (user_id=1001) → course_class.teacher_id=1001
- `teacher1002` (user_id=1002) → course_class.teacher_id=1002
- ... 以此类推

## 🎯 功能验证清单

### 学生功能验证

1. **选课/退课**
   - ✅ 登录学生账号（如student2001）
   - ✅ 进入"可选课程"页面
   - ✅ 选择课程，点击"选课"按钮
   - ✅ 选课后，在"我的课表"中应该能看到该课程
   - ✅ 可以点击"退课"按钮退课

2. **我的课表**
   - ✅ 登录学生账号
   - ✅ 进入"我的课表"页面
   - ✅ 应该只显示该学生已选的课程
   - ✅ 选课/退课后，课表应该实时更新

3. **成绩查询**
   - ✅ 登录学生账号
   - ✅ 进入"成绩查询"页面
   - ✅ 应该只显示该学生的成绩
   - ✅ 教师发布成绩后，学生应该能看到已发布的成绩

4. **学分统计**
   - ✅ 登录学生账号
   - ✅ 进入"学分统计"页面
   - ✅ 应该显示该学生的学分使用情况（调用存储过程）

### 教师功能验证

1. **我的班级**
   - ✅ 登录教师账号（如teacher1001）
   - ✅ 进入"我的班级"页面
   - ✅ 应该只显示该教师所教的班级
   - ✅ 可以查看每个班级的学生数量

2. **成绩管理**
   - ✅ 登录教师账号
   - ✅ 进入"成绩管理"页面
   - ✅ 选择班级后，应该只显示该班级的学生
   - ✅ 可以录入成绩（输入数字）
   - ✅ 可以点击"保存成绩"保存草稿
   - ✅ 可以点击"发布成绩"发布成绩
   - ✅ 发布后，学生应该能在"成绩查询"中看到成绩

## 🔒 权限验证

### 学生权限
- ✅ 学生登录后，**只能看到**学生功能模块
- ✅ 学生**不能看到**教师功能模块
- ✅ 学生选课/退课/查询时，**只能操作自己的数据**

### 教师权限
- ✅ 教师登录后，**只能看到**教师功能模块
- ✅ 教师**不能看到**学生功能模块
- ✅ 教师只能查看和操作**自己班级**的数据
- ✅ 教师不能操作其他教师的班级

## 🐛 常见问题

### 1. 菜单不显示
- 检查用户是否分配了正确的角色
- 检查角色是否分配了菜单权限
- 清除浏览器缓存，重新登录

### 2. 数据不显示
- 检查后端接口是否正确使用`SecurityUtils.getUserId()`获取当前登录用户ID
- 检查数据库中的user_id是否与enrollment.student_id或course_class.teacher_id对应

### 3. 权限错误
- 检查后端接口的`@PreAuthorize`注解是否正确
- 检查前端路由的`roles`配置是否正确

## 📝 注意事项

1. **数据前缀规则**：
   - B负责的表（enrollment, class_time_slot）不需要前缀
   - A负责的表（term, course, course_class, credit_rule）使用`a_`或`b_`前缀区分

2. **用户ID对应关系**：
   - `sys_user.user_id` = `enrollment.student_id`（学生）
   - `sys_user.user_id` = `course_class.teacher_id`（教师）

3. **密码**：
   - 所有测试账号密码统一为：`123456`
   - 密码已使用BCrypt加密存储

4. **角色键值**：
   - 学生角色：`role_key = 'student'`
   - 教师角色：`role_key = 'teacher'`

## ✅ 配置完成标志

执行SQL脚本后，应该看到以下输出：
```
=== 角色创建完成 ===
=== 菜单创建完成 ===
=== 学生账号创建完成 ===
=== 教师账号创建完成 ===
=== 用户角色关联完成 ===
=== 角色菜单关联完成 ===
=== 配置完成！可以使用以下账号登录测试 ===
```

配置完成后，重启后端服务，使用测试账号登录即可验证功能。

