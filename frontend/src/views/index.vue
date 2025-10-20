<template>
  <div class="app-container home">
    <!-- 系统欢迎横幅 -->
    <div class="welcome-banner">
      <div class="banner-content">
        <div class="banner-text">
          <h1 class="system-title">
            <i class="el-icon-medicine-box"></i>
            医疗器械管理系统
          </h1>
          <p class="system-subtitle">专业的医疗设备全生命周期管理平台</p>
        </div>
        <div class="banner-stats">
          <div class="stat-item">
            <div class="stat-number">{{ stats.totalDevices }}</div>
            <div class="stat-label">设备总数</div>
          </div>
          <div class="stat-item">
            <div class="stat-number">{{ stats.pendingApprovals }}</div>
            <div class="stat-label">待审批</div>
          </div>
          <div class="stat-item">
            <div class="stat-number">{{ stats.lowStock }}</div>
            <div class="stat-label">库存预警</div>
          </div>
        </div>
      </div>
    </div>

    <!-- 功能模块卡片 -->
    <el-row :gutter="20" class="module-cards">
      <el-col :xs="24" :sm="12" :md="8" :lg="6">
        <el-card class="module-card" @click="goToModule('/device/info')">
          <div class="card-icon">
            <i class="el-icon-box"></i>
          </div>
          <h3>设备管理</h3>
          <p>设备信息录入、查询、维护</p>
        </el-card>
      </el-col>
      
      <el-col :xs="24" :sm="12" :md="8" :lg="6">
        <el-card class="module-card" @click="goToModule('/device/apply')">
          <div class="card-icon">
            <i class="el-icon-shopping-cart-full"></i>
          </div>
          <h3>采购申请</h3>
          <p>设备采购申请、审批流程</p>
        </el-card>
      </el-col>
      
      <el-col :xs="24" :sm="12" :md="8" :lg="6">
        <el-card class="module-card" @click="goToModule('/device/requisition')">
          <div class="card-icon">
            <i class="el-icon-takeaway-box"></i>
          </div>
          <h3>领用管理</h3>
          <p>设备领用申请、归还管理</p>
        </el-card>
      </el-col>
      
      <el-col :xs="24" :sm="12" :md="8" :lg="6">
        <el-card class="module-card" @click="goToModule('/device/dashboard')">
          <div class="card-icon">
            <i class="el-icon-data-analysis"></i>
          </div>
          <h3>数据分析</h3>
          <p>设备使用统计、报表分析</p>
        </el-card>
      </el-col>
    </el-row>

    <!-- 系统信息 -->
    <el-row :gutter="20" class="info-section">
      <el-col :xs="24" :sm="24" :md="12" :lg="8">
        <el-card class="info-card">
          <template #header>
            <div class="card-header">
              <span>系统信息</span>
            </div>
          </template>
          <div class="info-content">
            <p><i class="el-icon-info"></i> 系统版本：v{{ version }}</p>
            <p><i class="el-icon-time"></i> 运行时间：{{ uptime }}</p>
            <p><i class="el-icon-user"></i> 在线用户：{{ onlineUsers }}</p>
            <p><i class="el-icon-cpu"></i> 系统状态：<el-tag type="success">正常运行</el-tag></p>
          </div>
        </el-card>
      </el-col>
      
      <el-col :xs="24" :sm="24" :md="12" :lg="8">
        <el-card class="info-card">
          <template #header>
            <div class="card-header">
              <span>快速操作</span>
            </div>
          </template>
          <div class="quick-actions">
            <el-button type="primary" icon="el-icon-plus" @click="goToModule('/device/info')">
              新增设备
            </el-button>
            <el-button type="success" icon="el-icon-shopping-cart-full" @click="goToModule('/device/apply')">
              采购申请
            </el-button>
            <el-button type="warning" icon="el-icon-takeaway-box" @click="goToModule('/device/requisition')">
              设备领用
            </el-button>
            <el-button type="info" icon="el-icon-data-analysis" @click="goToModule('/device/dashboard')">
              查看报表
            </el-button>
          </div>
        </el-card>
      </el-col>
      
      <el-col :xs="24" :sm="24" :md="12" :lg="8">
        <el-card class="info-card">
          <template #header>
            <div class="card-header">
              <span>系统公告</span>
            </div>
          </template>
          <div class="notice-content">
            <el-timeline>
              <el-timeline-item timestamp="2025-10-20" placement="top">
                <el-card>
                  <h4>系统升级通知</h4>
                  <p>医疗器械管理系统已升级至最新版本，新增数据分析功能。</p>
                </el-card>
              </el-timeline-item>
              <el-timeline-item timestamp="2025-10-15" placement="top">
                <el-card>
                  <h4>维护通知</h4>
                  <p>系统将于本周六凌晨2:00-4:00进行例行维护。</p>
                </el-card>
              </el-timeline-item>
            </el-timeline>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script setup name="Index">
import { ref, onMounted } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter()
const version = ref('1.0.0')

// 统计数据
const stats = ref({
  totalDevices: 156,
  pendingApprovals: 8,
  lowStock: 12
})

// 系统信息
const uptime = ref('15天 8小时 32分钟')
const onlineUsers = ref(24)

// 跳转到模块
function goToModule(path) {
  router.push(path)
}

// 获取统计数据
function getStats() {
  // 这里可以调用API获取真实数据
  // 暂时使用模拟数据
}

onMounted(() => {
  getStats()
})
</script>

<style scoped lang="scss">
.home {
  .welcome-banner {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    padding: 40px 20px;
    margin: -20px -20px 30px -20px;
    border-radius: 8px;
    
    .banner-content {
      display: flex;
      justify-content: space-between;
      align-items: center;
      max-width: 1200px;
      margin: 0 auto;
      
      .banner-text {
        .system-title {
          font-size: 2.5rem;
          font-weight: 300;
          margin: 0 0 10px 0;
          display: flex;
          align-items: center;
          gap: 15px;
          
          i {
            font-size: 3rem;
            color: #ffd700;
          }
        }
        
        .system-subtitle {
          font-size: 1.2rem;
          opacity: 0.9;
          margin: 0;
        }
      }
      
      .banner-stats {
        display: flex;
        gap: 30px;
        
        .stat-item {
          text-align: center;
          
          .stat-number {
            font-size: 2.5rem;
            font-weight: bold;
            color: #ffd700;
            margin-bottom: 5px;
          }
          
          .stat-label {
            font-size: 0.9rem;
            opacity: 0.8;
          }
        }
      }
    }
  }
  
  .module-cards {
    margin-bottom: 30px;
    
    .module-card {
      cursor: pointer;
      transition: all 0.3s ease;
      border: 1px solid #e4e7ed;
      border-radius: 8px;
      text-align: center;
      padding: 30px 20px;
      height: 200px;
      display: flex;
      flex-direction: column;
      justify-content: center;
      
      &:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        border-color: #409eff;
      }
      
      .card-icon {
        margin-bottom: 20px;
        
        i {
          font-size: 3rem;
          color: #409eff;
        }
      }
      
      h3 {
        margin: 0 0 10px 0;
        font-size: 1.3rem;
        color: #303133;
      }
      
      p {
        margin: 0;
        color: #606266;
        font-size: 0.9rem;
      }
    }
  }
  
  .info-section {
    .info-card {
      height: 100%;
      
      .card-header {
        font-weight: 600;
        color: #303133;
      }
      
      .info-content {
        p {
          margin: 15px 0;
          display: flex;
          align-items: center;
          gap: 10px;
          
          i {
            color: #409eff;
            font-size: 1.1rem;
          }
        }
      }
      
      .quick-actions {
        display: flex;
        flex-direction: column;
        gap: 10px;
        
        .el-button {
          width: 100%;
          justify-content: flex-start;
        }
      }
      
      .notice-content {
        .el-timeline {
          padding-left: 0;
          
          .el-timeline-item {
            .el-card {
              margin: 0;
              
              h4 {
                margin: 0 0 10px 0;
                color: #303133;
                font-size: 1rem;
              }
              
              p {
                margin: 0;
                color: #606266;
                font-size: 0.9rem;
              }
            }
          }
        }
      }
    }
  }
  
  // 响应式设计
  @media (max-width: 768px) {
    .welcome-banner {
      .banner-content {
        flex-direction: column;
        text-align: center;
        gap: 20px;
        
        .banner-stats {
          justify-content: center;
        }
      }
    }
    
    .module-cards {
      .module-card {
        height: auto;
        padding: 20px;
      }
    }
  }
}
</style>