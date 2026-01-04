import request from '@/utils/request'

// 查询学分规则列表
export function listCreditRule(query) {
  return request({
    url: '/edu/admin/creditRule/list',
    method: 'get',
    params: query
  })
}

// 查询学分规则详细
export function getCreditRule(ruleId) {
  return request({
    url: '/edu/admin/creditRule/' + ruleId,
    method: 'get'
  })
}

// 新增学分规则
export function addCreditRule(data) {
  return request({
    url: '/edu/admin/creditRule',
    method: 'post',
    data: data
  })
}

// 修改学分规则
export function updateCreditRule(data) {
  return request({
    url: '/edu/admin/creditRule',
    method: 'put',
    data: data
  })
}

// 删除学分规则
export function delCreditRule(ruleId) {
  return request({
    url: '/edu/admin/creditRule/' + ruleId,
    method: 'delete'
  })
}
