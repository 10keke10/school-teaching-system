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