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

// 获取所有器械档案列表（不分页，用于下拉选择）
export function getAllDeviceInfo() {
  return request({
    url: '/device/info/all',
    method: 'get'
  })
}

// 获取库存预警器械列表
export function getLowStockDevices() {
  return request({
    url: '/device/info/lowStock',
    method: 'get'
  })
}

// 获取器械总数统计
export function getTotalDevices() {
  return request({
    url: '/device/info/statistics/total',
    method: 'get'
  })
}

// 获取库存预警数量
export function getLowStockCount() {
  return request({
    url: '/device/info/statistics/lowStock',
    method: 'get'
  })
}