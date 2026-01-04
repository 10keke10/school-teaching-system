import request from '@/utils/request'

// 查询学期列表
export function listTerm(query) {
  return request({
    url: '/edu/admin/term/list',
    method: 'get',
    params: query
  })
}

// 查询学期详细
export function getTerm(termId) {
  return request({
    url: '/edu/admin/term/' + termId,
    method: 'get'
  })
}

// 新增学期
export function addTerm(data) {
  return request({
    url: '/edu/admin/term',
    method: 'post',
    data: data
  })
}

// 修改学期
export function updateTerm(data) {
  return request({
    url: '/edu/admin/term',
    method: 'put',
    data: data
  })
}

// 删除学期
export function delTerm(termId) {
  return request({
    url: '/edu/admin/term/' + termId,
    method: 'delete'
  })
}
