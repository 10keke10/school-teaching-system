import request from '@/utils/request'

// 查询教学班列表
export function listCourseClass(query) {
  return request({
    url: '/edu/admin/courseClass/list',
    method: 'get',
    params: query
  })
}

// 查询教学班详细
export function getCourseClass(classId) {
  return request({
    url: '/edu/admin/courseClass/' + classId,
    method: 'get'
  })
}

// 新增教学班
export function addCourseClass(data) {
  return request({
    url: '/edu/admin/courseClass',
    method: 'post',
    data: data
  })
}

// 修改教学班
export function updateCourseClass(data) {
  return request({
    url: '/edu/admin/courseClass',
    method: 'put',
    data: data
  })
}

// 删除教学班
export function delCourseClass(classId) {
  return request({
    url: '/edu/admin/courseClass/' + classId,
    method: 'delete'
  })
}
