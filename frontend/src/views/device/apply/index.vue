<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="申请单号" prop="applyCode">
        <el-input
          v-model="queryParams.applyCode"
          placeholder="请输入申请单号"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="申请科室ID" prop="deptId">
        <el-input
          v-model="queryParams.deptId"
          placeholder="请输入申请科室ID"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="关联器械ID" prop="deviceId">
        <el-input
          v-model="queryParams.deviceId"
          placeholder="请输入关联器械ID"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="需求到货日期" style="width: 308px">
        <el-date-picker
          v-model="daterangeRequiredDate"
          value-format="YYYY-MM-DD"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item label="审批状态" prop="applyStatus">
        <el-select v-model="queryParams.applyStatus" placeholder="请选择审批状态" clearable>
          <el-option
            v-for="dict in sys_apply_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="审批人" prop="approverBy">
        <el-input
          v-model="queryParams.approverBy"
          placeholder="请输入审批人"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="审批时间" style="width: 308px">
        <el-date-picker
          v-model="daterangeApproveTime"
          value-format="YYYY-MM-DD"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item label="入库状态" prop="procureStatus">
        <el-select v-model="queryParams.procureStatus" placeholder="请选择入库状态" clearable>
          <el-option
            v-for="dict in sys_procure_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="创建者" prop="createBy">
        <el-input
          v-model="queryParams.createBy"
          placeholder="请输入创建者"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="创建时间" style="width: 308px">
        <el-date-picker
          v-model="daterangeCreateTime"
          value-format="YYYY-MM-DD"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="Plus"
          @click="handleAdd"
          v-hasPermi="['device:apply:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['device:apply:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['device:apply:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['device:apply:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="applyList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="申请单ID" align="center" prop="applyId" />
      <el-table-column label="申请单号" align="center" prop="applyCode" />
      <el-table-column label="申请科室ID" align="center" prop="deptId" />
      <el-table-column label="器械名称" align="center" prop="deviceName" />
      <el-table-column label="申请采购数量" align="center" prop="requiredQuantity" />
      <el-table-column label="需求到货日期" align="center" prop="requiredDate" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.requiredDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="审批状态" align="center" prop="applyStatus">
        <template #default="scope">
          <dict-tag :options="sys_apply_status" :value="scope.row.applyStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="审批人" align="center" prop="approverBy" />
      <el-table-column label="审批时间" align="center" prop="approveTime" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.approveTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="入库状态" align="center" prop="procureStatus">
        <template #default="scope">
          <dict-tag :options="sys_procure_status" :value="scope.row.procureStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="创建者" align="center" prop="createBy" />
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="更新者" align="center" prop="updateBy" />
      <el-table-column label="更新时间" align="center" prop="updateTime" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.updateTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
<!--      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">-->
<!--        <template #default="scope">-->
<!--          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['device:apply:edit']">修改</el-button>-->
<!--          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['device:apply:remove']">删除</el-button>-->
<!--        </template>-->
<!--      </el-table-column>-->

      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <div v-if="scope.row.applyStatus == '0'">
            <el-button
                size="mini"
                type="text"
                icon="Check"
                @click="handleApprove(scope.row)"
                v-hasPermi="['device:apply:approve']"
            >批准</el-button>
            <el-button
                size="mini"
                type="text"
                icon="Close"
                @click="handleReject(scope.row)"
                v-hasPermi="['device:apply:approve']"
            >驳回</el-button>
          </div>

          <el-button
              size="mini"
              type="text"
              icon="Edit"
              @click="handleUpdate(scope.row)"
              v-hasPermi="['device:apply:edit']"
          >修改</el-button>
          <el-button
              size="mini"
              type="text"
              icon="Delete"
              @click="handleDelete(scope.row)"
              v-hasPermi="['device:apply:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改采购申请对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="applyRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="申请科室" prop="deptId">
          <el-select v-model="form.deptId" placeholder="请选择申请科室" filterable style="width: 100%;">
            <el-option
              v-for="dept in deptOptions"
              :key="dept.deptId"
              :label="dept.deptName"
              :value="dept.deptId"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="申请器械" prop="deviceId">
          <el-select v-model="form.deviceId" placeholder="请选择器械" filterable style="width: 100%;">
            <el-option
                v-for="item in deviceInfoOptions"
                :key="item.deviceId"
                :label="item.deviceName"
                :value="item.deviceId"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="申请采购数量" prop="requiredQuantity">
          <el-input v-model="form.requiredQuantity" placeholder="请输入申请采购数量" />
        </el-form-item>
        <el-form-item label="需求到货日期" prop="requiredDate">
          <el-date-picker clearable
            v-model="form.requiredDate"
            type="date"
            value-format="YYYY-MM-DD"
            placeholder="请选择需求到货日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="Apply">
// import { listApply, getApply, delApply, addApply, updateApply } from "@/api/device/apply"
import { listApply, getApply, delApply, addApply, updateApply, approvePurchaseApply } from "@/api/device/apply";
import { listInfo, getAllDeviceInfo } from "@/api/device/info";
import { listDept } from "@/api/system/dept";

const { proxy } = getCurrentInstance()
const { sys_apply_status, sys_procure_status } = proxy.useDict('sys_apply_status', 'sys_procure_status')

const applyList = ref([])
const open = ref(false)
const loading = ref(true)
const showSearch = ref(true)
const ids = ref([])
const single = ref(true)
const multiple = ref(true)
const total = ref(0)
const title = ref("")
const daterangeRequiredDate = ref([])
const daterangeApproveTime = ref([])
const daterangeCreateTime = ref([])

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    applyCode: null,
    deptId: null,
    deviceId: null,
    requiredDate: null,
    applyStatus: null,
    approverBy: null,
    approveTime: null,
    procureStatus: null,
    createBy: null,
    createTime: null,
  },
  rules: {
    deptId: [
      { required: true, message: "申请科室ID不能为空", trigger: "blur" }
    ],
    deviceId: [
      { required: true, message: "关联器械ID不能为空", trigger: "blur" }
    ],
    requiredQuantity: [
      { required: true, message: "申请采购数量不能为空", trigger: "blur" }
    ],
    applyStatus: [
      { required: true, message: "审批状态不能为空", trigger: "change" }
    ],
  }
})

const { queryParams, form, rules } = toRefs(data)

// 器材选项列表
const deviceInfoOptions = ref([])
// 科室选项列表
const deptOptions = ref([])

/** 查询采购申请列表 */
function getList() {
  loading.value = true
  queryParams.value.params = {}
  if (null != daterangeRequiredDate && '' != daterangeRequiredDate) {
    queryParams.value.params["beginRequiredDate"] = daterangeRequiredDate.value[0]
    queryParams.value.params["endRequiredDate"] = daterangeRequiredDate.value[1]
  }
  if (null != daterangeApproveTime && '' != daterangeApproveTime) {
    queryParams.value.params["beginApproveTime"] = daterangeApproveTime.value[0]
    queryParams.value.params["endApproveTime"] = daterangeApproveTime.value[1]
  }
  if (null != daterangeCreateTime && '' != daterangeCreateTime) {
    queryParams.value.params["beginCreateTime"] = daterangeCreateTime.value[0]
    queryParams.value.params["endCreateTime"] = daterangeCreateTime.value[1]
  }
  listApply(queryParams.value).then(response => {
    applyList.value = response.rows
    total.value = response.total
    loading.value = false
  })
}

// 取消按钮
function cancel() {
  open.value = false
  reset()
}

// 表单重置
function reset() {
  form.value = {
    applyId: null,
    applyCode: null,
    deptId: null,
    deviceId: null,
    requiredQuantity: null,
    requiredDate: null,
    applyStatus: null,
    approverBy: null,
    approveTime: null,
    procureStatus: null,
    remark: null,
    createBy: null,
    createTime: null,
    updateBy: null,
    updateTime: null
  }
  proxy.resetForm("applyRef")
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1
  getList()
}

/** 重置按钮操作 */
function resetQuery() {
  daterangeRequiredDate.value = []
  daterangeApproveTime.value = []
  daterangeCreateTime.value = []
  proxy.resetForm("queryRef")
  handleQuery()
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.applyId)
  single.value = selection.length != 1
  multiple.value = !selection.length
}

/** 新增按钮操作 */
function handleAdd() {
  reset()
  open.value = true
  title.value = "添加采购申请"
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset()
  const _applyId = row.applyId || ids.value
  getApply(_applyId).then(response => {
    form.value = response.data
    open.value = true
    title.value = "修改采购申请"
  })
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["applyRef"].validate(valid => {
    if (valid) {
      if (form.value.applyId != null) {
        updateApply(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功")
          open.value = false
          getList()
        })
      } else {
        addApply(form.value).then(response => {
          proxy.$modal.msgSuccess("新增成功")
          open.value = false
          getList()
        })
      }
    }
  })
}

/** 批准按钮操作 */
function handleApprove(row) {
  const applyData = { applyId: row.applyId, applyStatus: '1' }; // 1 代表已通过
  proxy.$modal.confirm('确认批准单号为"' + row.applyCode + '"的采购申请吗？').then(function() {
    return approvePurchaseApply(applyData);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("审批成功");
  }).catch(() => {});
}

/** 驳回按钮操作 */
function handleReject(row) {
  const applyData = { applyId: row.applyId, applyStatus: '2' }; // 2 代表已驳回
  proxy.$modal.confirm('确认驳回单号为"' + row.applyCode + '"的采购申请吗？').then(function() {
    return approvePurchaseApply(applyData);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("操作成功");
  }).catch(() => {});
}

/** 删除按钮操作 */
function handleDelete(row) {
  const _applyIds = row.applyId || ids.value
  proxy.$modal.confirm('是否确认删除采购申请编号为"' + _applyIds + '"的数据项？').then(function() {
    return delApply(_applyIds)
  }).then(() => {
    getList()
    proxy.$modal.msgSuccess("删除成功")
  }).catch(() => {})
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('device/apply/export', {
    ...queryParams.value
  }, `apply_${new Date().getTime()}.xlsx`)
}

// 获取器材选项
function getDeviceOptions() {
  getAllDeviceInfo().then(response => {
    deviceInfoOptions.value = response.data || []
  }).catch(error => {
    console.error('获取器材选项失败:', error)
  })
}

// 获取科室选项
function getDeptOptions() {
  listDept().then(response => {
    deptOptions.value = response.data || []
  }).catch(error => {
    console.error('获取科室选项失败:', error)
  })
}

getList()
getDeviceOptions()
getDeptOptions()



</script>
