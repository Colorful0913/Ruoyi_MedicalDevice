import request from '@/utils/request'

// 查询库存批次列表
export function listBatch(query) {
  return request({
    url: '/device/batch/list',
    method: 'get',
    params: query
  })
}

// 查询库存批次详细
export function getBatch(batchId) {
  return request({
    url: '/device/batch/' + batchId,
    method: 'get'
  })
}

// 新增库存批次
export function addBatch(data) {
  return request({
    url: '/device/batch',
    method: 'post',
    data: data
  })
}

// 修改库存批次
export function updateBatch(data) {
  return request({
    url: '/device/batch',
    method: 'put',
    data: data
  })
}

// 删除库存批次
export function delBatch(batchId) {
  return request({
    url: '/device/batch/' + batchId,
    method: 'delete'
  })
}
