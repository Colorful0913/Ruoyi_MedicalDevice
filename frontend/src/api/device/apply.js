import request from '@/utils/request'

// 查询采购申请列表
export function listApply(query) {
  return request({
    url: '/device/apply/list',
    method: 'get',
    params: query
  })
}

// 查询采购申请详细
export function getApply(applyId) {
  return request({
    url: '/device/apply/' + applyId,
    method: 'get'
  })
}

// 新增采购申请
export function addApply(data) {
  return request({
    url: '/device/apply',
    method: 'post',
    data: data
  })
}

// 修改采购申请
export function updateApply(data) {
  return request({
    url: '/device/apply',
    method: 'put',
    data: data
  })
}

// 删除采购申请
export function delApply(applyId) {
  return request({
    url: '/device/apply/' + applyId,
    method: 'delete'
  })
}
