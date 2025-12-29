// 教务相关路由模块
export default {
  path: '/edu',
  component: () => import('@/layout'),
  hidden: false,
  redirect: 'noRedirect',
  alwaysShow: true,
  meta: { title: '教务管理', icon: 'education' },
  children: [
    // ==================== 学生模块 ====================
    {
      path: 'student/course',
      component: () => import('@/views/edu/student/course/index'),
      name: 'StudentCourse',
      meta: { title: '可选课程', icon: 'course', roles: ['admin', 'student'] }
    },
    {
      path: 'student/timetable',
      component: () => import('@/views/edu/student/timetable/index'),
      name: 'StudentTimetable',
      meta: { title: '我的课表', icon: 'timetable', roles: ['admin', 'student'] }
    },
    {
      path: 'student/grades',
      component: () => import('@/views/edu/student/grades/index'),
      name: 'StudentGrades',
      meta: { title: '成绩查询', icon: 'score', roles: ['admin', 'student'] }
    },
    {
      path: 'student/credits',
      component: () => import('@/views/edu/student/credits/index'),
      name: 'StudentCredits',
      meta: { title: '学分统计', icon: 'chart', roles: ['admin', 'student'] }
    },
    // ==================== 教师模块 ====================
    {
      path: 'teacher/classes',
      component: () => import('@/views/edu/teacher/classes/index'),
      name: 'TeacherClasses',
      meta: { title: '我的班级', icon: 'class', roles: ['admin', 'teacher'] }
    },
    {
      path: 'teacher/grades',
      component: () => import('@/views/edu/teacher/grades/index'),
      name: 'TeacherGrades',
      meta: { title: '成绩管理', icon: 'edit', roles: ['admin', 'teacher'] }
    }
  ]
}
