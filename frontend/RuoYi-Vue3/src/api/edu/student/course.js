import request from '@/utils/request'

// 获取可选课程列表
export function listAvailableCourses(query) {
  return request({
    url: '/edu/student/courses',
    method: 'get',
    params: query
  })
}

// 学生选课
export function enrollCourse(data) {
  return request({
    url: '/edu/student/enroll',
    method: 'post',
    data: data
  })
}

// 学生退课
export function dropCourse(enrollmentId) {
  return request({
    url: `/edu/student/drop/${enrollmentId}`,
    method: 'post'
  })
}

// 学生课表
export function getTimetable() {
  return request({
    url: '/edu/student/timetable',
    method: 'get'
  })
}

// 成绩查询
export function getStudentGrades(query) {
  return request({
    url: '/edu/student/grades',
    method: 'get',
    params: query
  })
}

// 学分统计
export function getStudentCredits(studentId, termId) {
  return request({
    url: `/edu/statistics/student/${studentId}/credits`,
    method: 'get',
    params: { term_id: termId }
  })
}

// 学期列表（学生端）
export function getStudentTerms() {
  return request({
    url: '/edu/student/terms',
    method: 'get'
  })
}
