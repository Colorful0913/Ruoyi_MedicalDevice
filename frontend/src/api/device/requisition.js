import request from '@/utils/request'

// 查询科室领用申请单列表
export function listRequisition(query) {
  return request({
    url: '/device/requisition/list',
    method: 'get',
    params: query
  })
}

// 查询科室领用申请单详细
export function getRequisition(requisitionId) {
  return request({
    url: '/device/requisition/' + requisitionId,
    method: 'get'
  })
}

// 新增科室领用申请单
export function addRequisition(data) {
  return request({
    url: '/device/requisition',
    method: 'post',
    data: data
  })
}

// 修改科室领用申请单
export function updateRequisition(data) {
  return request({
    url: '/device/requisition',
    method: 'put',
    data: data
  })
}

// 删除科室领用申请单
export function delRequisition(requisitionId) {
  return request({
    url: '/device/requisition/' + requisitionId,
    method: 'delete'
  })
}

// 【新增】批准并出库领用申请
export function approveRequisition(requisitionId) {
    return request({
        url: '/device/requisition/approve/' + requisitionId,
        method: 'put'
    })
}

// 【新增】驳回领用申请
export function rejectRequisition(data) {
    return request({
        url: '/device/requisition/reject',
        method: 'put',
        data: data
    })
}

// 获取待审核申请数量
export function getPendingCount() {
  return request({
    url: '/device/requisition/statistics/pending',
    method: 'get'
  })
}

// 获取本月出库数量
export function getMonthlyOutboundCount() {
  return request({
    url: '/device/requisition/statistics/monthlyOutbound',
    method: 'get'
  })
}
