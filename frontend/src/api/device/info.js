import request from '@/utils/request'

// 查询器械档案列表
export function listInfo(query) {
  return request({
    url: '/device/info/list',
    method: 'get',
    params: query
  })
}

// 查询器械档案详细
export function getInfo(deviceId) {
  return request({
    url: '/device/info/' + deviceId,
    method: 'get'
  })
}

// 新增器械档案
export function addInfo(data) {
  return request({
    url: '/device/info',
    method: 'post',
    data: data
  })
}

// 修改器械档案
export function updateInfo(data) {
  return request({
    url: '/device/info',
    method: 'put',
    data: data
  })
}

// 删除器械档案
export function delInfo(deviceId) {
  return request({
    url: '/device/info/' + deviceId,
    method: 'delete'
  })
}
