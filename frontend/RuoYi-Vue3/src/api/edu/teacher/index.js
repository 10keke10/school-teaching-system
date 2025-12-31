import request from '@/utils/request'

// 获取教师所教的所有班级
export function getMyClasses(termId) {
  return request({
    url: '/edu/teacher/classes',
    method: 'get',
    params: { termId }
  })
}

// 班级学生名单
export function getClassStudents(classId) {
  return request({
    url: `/edu/teacher/classes/${classId}/students`,
    method: 'get'
  })
}

// 班级成绩统计
export function getClassStatistics(classId) {
  return request({
    url: `/edu/teacher/classes/${classId}/statistics`,
    method: 'get'
  })
}

// 批量录入成绩
export function batchUpdateGrades(data) {
  return request({
    url: '/edu/teacher/grades/batch',
    method: 'post',
    data
  })
}

// 发布成绩
export function publishGrades(data) {
  return request({
    url: '/edu/teacher/grades/publish',
    method: 'post',
    data
  })
}
