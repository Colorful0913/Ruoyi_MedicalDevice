<template>
  <div class="app-container">
    <el-row :gutter="20">
      <!-- 统计卡片 -->
      <el-col :span="6">
        <el-card class="box-card">
          <div class="card-header">
            <span>器械总数</span>
            <el-icon class="card-icon"><Box /></el-icon>
          </div>
          <div class="card-content">
            <div class="card-number">{{ statistics.totalDevices }}</div>
            <div class="card-desc">种器械</div>
          </div>
        </el-card>
      </el-col>

      <el-col :span="6">
        <el-card class="box-card">
          <div class="card-header">
            <span>库存预警</span>
            <el-icon class="card-icon warning"><Warning /></el-icon>
          </div>
          <div class="card-content">
            <div class="card-number warning">{{ statistics.lowStockDevices }}</div>
            <div class="card-desc">个器械库存不足</div>
          </div>
        </el-card>
      </el-col>

      <el-col :span="6">
        <el-card class="box-card">
          <div class="card-header">
            <span>待审核申请</span>
            <el-icon class="card-icon info"><Clock /></el-icon>
          </div>
          <div class="card-content">
            <div class="card-number info">{{ statistics.pendingRequisitions }}</div>
            <div class="card-desc">个领用申请</div>
          </div>
        </el-card>
      </el-col>

      <el-col :span="6">
        <el-card class="box-card">
          <div class="card-header">
            <span>本月出库</span>
            <el-icon class="card-icon success"><TrendCharts /></el-icon>
          </div>
          <div class="card-content">
            <div class="card-number success">{{ statistics.monthlyOutbound }}</div>
            <div class="card-desc">次出库操作</div>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <el-row :gutter="20" style="margin-top: 20px;">
      <!-- 库存预警列表 -->
      <el-col :span="12">
        <el-card>
          <template #header>
            <div class="card-header">
              <span>库存预警</span>
              <el-button type="text" @click="refreshLowStock">刷新</el-button>
            </div>
          </template>
          <el-table :data="lowStockList" style="width: 100%" max-height="300">
            <el-table-column prop="deviceName" label="器械名称" />
            <el-table-column prop="deviceCode" label="器械编码" />
            <el-table-column prop="totalStock" label="当前库存" />
            <el-table-column prop="minStock" label="最低库存" />
            <el-table-column label="状态">
              <template #default="scope">
                <el-tag type="danger" size="small">库存不足</el-tag>
              </template>
            </el-table-column>
          </el-table>
        </el-card>
      </el-col>

      <!-- 最近申请 -->
      <el-col :span="12">
        <el-card>
          <template #header>
            <div class="card-header">
              <span>最近申请</span>
              <el-button type="text" @click="refreshRecentRequisitions">刷新</el-button>
            </div>
          </template>
          <el-table :data="recentRequisitions" style="width: 100%" max-height="300">
            <el-table-column prop="requisitionCode" label="申请单号" />
            <el-table-column prop="deviceName" label="器械名称" />
            <el-table-column prop="requisitionQuantity" label="申请数量" />
            <el-table-column prop="requisitionStatus" label="状态">
              <template #default="scope">
                <el-tag :type="getStatusType(scope.row.requisitionStatus)" size="small">
                  {{ getStatusText(scope.row.requisitionStatus) }}
                </el-tag>
              </template>
            </el-table-column>
            <el-table-column prop="createTime" label="申请时间" />
          </el-table>
        </el-card>
      </el-col>
    </el-row>

    <!-- 新增统计行 -->
    <el-row :gutter="20" style="margin-top: 20px;">
      <!-- 采购申请统计 -->
      <el-col :span="8">
        <el-card>
          <template #header>
            <div class="card-header">
              <span>采购申请统计</span>
              <el-button type="text" @click="refreshPurchaseStats">刷新</el-button>
            </div>
          </template>
          <div class="stats-content">
            <div class="stat-item">
              <span class="stat-label">待审批:</span>
              <span class="stat-value pending">{{ purchaseStats.pending }}</span>
            </div>
            <div class="stat-item">
              <span class="stat-label">已通过:</span>
              <span class="stat-value approved">{{ purchaseStats.approved }}</span>
            </div>
            <div class="stat-item">
              <span class="stat-label">已驳回:</span>
              <span class="stat-value rejected">{{ purchaseStats.rejected }}</span>
            </div>
          </div>
        </el-card>
      </el-col>

      <!-- 科室申请排行 -->
      <el-col :span="8">
        <el-card>
          <template #header>
            <div class="card-header">
              <span>科室申请排行</span>
              <el-button type="text" @click="refreshDeptRanking">刷新</el-button>
            </div>
          </template>
          <el-table :data="deptRanking" style="width: 100%" max-height="200">
            <el-table-column prop="deptName" label="科室名称" />
            <el-table-column prop="applyCount" label="申请次数" />
            <el-table-column prop="totalQuantity" label="申请总量" />
          </el-table>
        </el-card>
      </el-col>

      <!-- 器械使用排行 -->
      <el-col :span="8">
        <el-card>
          <template #header>
            <div class="card-header">
              <span>器械使用排行</span>
              <el-button type="text" @click="refreshDeviceRanking">刷新</el-button>
            </div>
          </template>
          <el-table :data="deviceRanking" style="width: 100%" max-height="200">
            <el-table-column prop="deviceName" label="器械名称" />
            <el-table-column prop="useCount" label="使用次数" />
            <el-table-column prop="totalQuantity" label="使用总量" />
          </el-table>
        </el-card>
      </el-col>
    </el-row>

    <!-- 图表分析 -->
    <el-row :gutter="20" style="margin-top: 20px;">
      <!-- 月度申请趋势 -->
      <el-col :span="12">
        <el-card>
          <template #header>
            <div class="card-header">
              <span>月度申请趋势</span>
              <el-button type="text" @click="refreshTrendChart">刷新</el-button>
            </div>
          </template>
          <div class="chart-container">
            <div class="chart-placeholder">
              <p>图表功能开发中...</p>
              <p>将显示最近6个月的申请趋势</p>
            </div>
          </div>
        </el-card>
      </el-col>

      <!-- 器械分类统计 -->
      <el-col :span="12">
        <el-card>
          <template #header>
            <div class="card-header">
              <span>器械分类统计</span>
              <el-button type="text" @click="refreshCategoryStats">刷新</el-button>
            </div>
          </template>
          <div class="category-stats">
            <div class="category-item" v-for="item in categoryStats" :key="item.category">
              <div class="category-name">{{ item.category }}</div>
              <div class="category-progress">
                <el-progress
                  :percentage="item.percentage"
                  :color="item.color"
                  :show-text="false"
                />
                <span class="category-count">{{ item.count }}个</span>
              </div>
            </div>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script setup name="Dashboard">
import { ref, onMounted } from 'vue'
import { getLowStockDevices, getTotalDevices, getLowStockCount } from '@/api/device/info'
import { listRequisition, getPendingCount, getMonthlyOutboundCount } from '@/api/device/requisition'
import { listApply } from '@/api/device/apply'

const statistics = ref({
  totalDevices: 0,
  lowStockDevices: 0,
  pendingRequisitions: 0,
  monthlyOutbound: 0
})

const lowStockList = ref([])
const recentRequisitions = ref([])

// 新增统计数据
const purchaseStats = ref({
  pending: 0,
  approved: 0,
  rejected: 0
})

const deptRanking = ref([])
const deviceRanking = ref([])
const categoryStats = ref([])

// 获取统计数据
function getStatistics() {
  // 获取器械总数
  getTotalDevices().then(response => {
    statistics.value.totalDevices = response.data || 0
  }).catch(error => {
    console.error('获取器械总数失败:', error)
  })

  // 获取库存预警数量
  getLowStockCount().then(response => {
    statistics.value.lowStockDevices = response.data || 0
  }).catch(error => {
    console.error('获取库存预警数量失败:', error)
  })

  // 获取待审核申请数量
  getPendingCount().then(response => {
    statistics.value.pendingRequisitions = response.data || 0
  }).catch(error => {
    console.error('获取待审核申请数量失败:', error)
  })

  // 获取本月出库数量
  getMonthlyOutboundCount().then(response => {
    statistics.value.monthlyOutbound = response.data || 0
  }).catch(error => {
    console.error('获取本月出库数量失败:', error)
  })
}

// 获取库存预警数据
function getLowStockData() {
  getLowStockDevices().then(response => {
    lowStockList.value = response.data || []
  }).catch(error => {
    console.error('获取库存预警数据失败:', error)
  })
}

// 获取最近申请数据
function getRecentRequisitions() {
  listRequisition({ pageNum: 1, pageSize: 10 }).then(response => {
    recentRequisitions.value = response.rows || []
  }).catch(error => {
    console.error('获取最近申请数据失败:', error)
  })
}

// 刷新库存预警
function refreshLowStock() {
  getLowStockData()
}

// 刷新最近申请
function refreshRecentRequisitions() {
  getRecentRequisitions()
}

// 获取状态类型
function getStatusType(status) {
  const statusMap = {
    '0': 'warning',
    '1': 'success',
    '2': 'danger'
  }
  return statusMap[status] || 'info'
}

// 获取状态文本
function getStatusText(status) {
  const statusMap = {
    '0': '待审核',
    '1': '已出库',
    '2': '已驳回'
  }
  return statusMap[status] || '未知'
}

// 获取采购申请统计
function getPurchaseStats() {
  listApply({ pageNum: 1, pageSize: 1000 }).then(response => {
    const data = response.rows || []
    purchaseStats.value.pending = data.filter(item => item.applyStatus === '0').length
    purchaseStats.value.approved = data.filter(item => item.applyStatus === '1').length
    purchaseStats.value.rejected = data.filter(item => item.applyStatus === '2').length
  }).catch(error => {
    console.error('获取采购申请统计失败:', error)
  })
}

// 获取科室申请排行
function getDeptRanking() {
  // 模拟数据，实际应该从后端获取
  deptRanking.value = [
    { deptName: '内科', applyCount: 15, totalQuantity: 120 },
    { deptName: '外科', applyCount: 12, totalQuantity: 95 },
    { deptName: '妇产科', applyCount: 8, totalQuantity: 65 },
    { deptName: '儿科', applyCount: 6, totalQuantity: 45 },
    { deptName: '急诊科', applyCount: 10, totalQuantity: 80 }
  ]
}

// 获取器械使用排行
function getDeviceRanking() {
  // 模拟数据，实际应该从后端获取
  deviceRanking.value = [
    { deviceName: '血压计', useCount: 25, totalQuantity: 150 },
    { deviceName: '体温计', useCount: 20, totalQuantity: 120 },
    { deviceName: '听诊器', useCount: 18, totalQuantity: 95 },
    { deviceName: '血糖仪', useCount: 15, totalQuantity: 80 },
    { deviceName: '心电图机', useCount: 12, totalQuantity: 60 }
  ]
}

// 获取器械分类统计
function getCategoryStats() {
  // 模拟数据，实际应该从后端获取
  categoryStats.value = [
    { category: '诊断器械', count: 45, percentage: 35, color: '#409EFF' },
    { category: '治疗器械', count: 38, percentage: 30, color: '#67C23A' },
    { category: '手术器械', count: 28, percentage: 22, color: '#E6A23C' },
    { category: '护理器械', count: 17, percentage: 13, color: '#F56C6C' }
  ]
}

// 刷新方法
function refreshPurchaseStats() {
  getPurchaseStats()
}

function refreshDeptRanking() {
  getDeptRanking()
}

function refreshDeviceRanking() {
  getDeviceRanking()
}

function refreshTrendChart() {
  console.log('刷新趋势图表')
}

function refreshCategoryStats() {
  getCategoryStats()
}

onMounted(() => {
  getStatistics()
  getLowStockData()
  getRecentRequisitions()
  getPurchaseStats()
  getDeptRanking()
  getDeviceRanking()
  getCategoryStats()
})
</script>

<style scoped>
.app-container {
  background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
  min-height: 100vh;
  padding: 20px;
}

.box-card {
  border-radius: 12px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease;
  background: white;

  &:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
  }
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  padding: 15px 20px;
  margin: -20px -20px 20px -20px;
  border-radius: 12px 12px 0 0;
  font-weight: 600;
}

.card-icon {
  font-size: 24px;
  color: #409EFF;
}

.card-icon.warning {
  color: #E6A23C;
}

.card-icon.info {
  color: #909399;
}

.card-icon.success {
  color: #67C23A;
}

.card-content {
  text-align: center;
  padding: 20px 0;
}

.card-number {
  font-size: 32px;
  font-weight: bold;
  color: #303133;
  margin-bottom: 8px;
}

.card-number.warning {
  color: #E6A23C;
}

.card-number.info {
  color: #909399;
}

.card-number.success {
  color: #67C23A;
}

.card-desc {
  font-size: 14px;
  color: #909399;
}

/* 新增样式 */
.stats-content {
  padding: 10px 0;
}

.stat-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 8px 0;
  border-bottom: 1px solid #f0f0f0;
}

.stat-item:last-child {
  border-bottom: none;
}

.stat-label {
  font-size: 14px;
  color: #606266;
}

.stat-value {
  font-size: 16px;
  font-weight: bold;
}

.stat-value.pending {
  color: #E6A23C;
}

.stat-value.approved {
  color: #67C23A;
}

.stat-value.rejected {
  color: #F56C6C;
}

.chart-container {
  height: 200px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.chart-placeholder {
  text-align: center;
  color: #909399;
}

.chart-placeholder p {
  margin: 5px 0;
}

.category-stats {
  padding: 10px 0;
}

.category-item {
  margin-bottom: 15px;
}

.category-name {
  font-size: 14px;
  color: #606266;
  margin-bottom: 5px;
}

.category-progress {
  display: flex;
  align-items: center;
  gap: 10px;
}

.category-count {
  font-size: 12px;
  color: #909399;
  min-width: 40px;
}
</style>

