<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="领用单号" prop="requisitionCode">
        <el-input
          v-model="queryParams.requisitionCode"
          placeholder="请输入领用单号"
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
      <el-form-item label="申请器材ID" prop="deviceId">
        <el-input
          v-model="queryParams.deviceId"
          placeholder="请输入申请器材ID"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="领用状态" prop="requisitionStatus">
        <el-select v-model="queryParams.requisitionStatus" placeholder="请选择领用状态" clearable>
          <el-option
            v-for="dict in sys_requisition_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="处理人" prop="handlerBy">
        <el-input
          v-model="queryParams.handlerBy"
          placeholder="请输入处理人"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="处理时间" style="width: 308px">
        <el-date-picker
          v-model="daterangeHandleTime"
          value-format="YYYY-MM-DD"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item label="创建者" prop="createBy">
        <el-input
          v-model="queryParams.createBy"
          placeholder="请输入创建者"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="创建时间" prop="createTime">
        <el-date-picker clearable
          v-model="queryParams.createTime"
          type="date"
          value-format="YYYY-MM-DD"
          placeholder="请选择创建时间">
        </el-date-picker>
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
          v-hasPermi="['device:requisition:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['device:requisition:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['device:requisition:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['device:requisition:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="requisitionList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="领用申请ID" align="center" prop="requisitionId" />
      <el-table-column label="领用单号" align="center" prop="requisitionCode" />
      <el-table-column label="申请科室ID" align="center" prop="deptId" />
      <el-table-column label="申请器材ID" align="center" prop="deviceId" />
      <el-table-column label="申请领用数量" align="center" prop="requisitionQuantity" />
      <el-table-column label="领用状态" align="center" prop="requisitionStatus">
        <template #default="scope">
          <dict-tag :options="sys_requisition_status" :value="scope.row.requisitionStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="处理人" align="center" prop="handlerBy" />
      <el-table-column label="处理时间" align="center" prop="handleTime" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.handleTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="创建者" align="center" prop="createBy" />
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['device:requisition:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['device:requisition:remove']">删除</el-button>
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

    <!-- 添加或修改科室领用申请单对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="requisitionRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="申请科室ID" prop="deptId">
          <el-input v-model="form.deptId" placeholder="请输入申请科室ID" />
        </el-form-item>
        <el-form-item label="申请器材ID" prop="deviceId">
          <el-input v-model="form.deviceId" placeholder="请输入申请器材ID" />
        </el-form-item>
        <el-form-item label="申请领用数量" prop="requisitionQuantity">
          <el-input v-model="form.requisitionQuantity" placeholder="请输入申请领用数量" />
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

<script setup name="Requisition">
import { listRequisition, getRequisition, delRequisition, addRequisition, updateRequisition } from "@/api/device/requisition"

const { proxy } = getCurrentInstance()
const { sys_requisition_status } = proxy.useDict('sys_requisition_status')

const requisitionList = ref([])
const open = ref(false)
const loading = ref(true)
const showSearch = ref(true)
const ids = ref([])
const single = ref(true)
const multiple = ref(true)
const total = ref(0)
const title = ref("")
const daterangeHandleTime = ref([])

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    requisitionCode: null,
    deptId: null,
    deviceId: null,
    requisitionStatus: null,
    handlerBy: null,
    handleTime: null,
    createBy: null,
    createTime: null,
  },
  rules: {
    deptId: [
      { required: true, message: "申请科室ID不能为空", trigger: "blur" }
    ],
    deviceId: [
      { required: true, message: "申请器材ID不能为空", trigger: "blur" }
    ],
    requisitionQuantity: [
      { required: true, message: "申请领用数量不能为空", trigger: "blur" }
    ],
  }
})

const { queryParams, form, rules } = toRefs(data)

/** 查询科室领用申请单列表 */
function getList() {
  loading.value = true
  queryParams.value.params = {}
  if (null != daterangeHandleTime && '' != daterangeHandleTime) {
    queryParams.value.params["beginHandleTime"] = daterangeHandleTime.value[0]
    queryParams.value.params["endHandleTime"] = daterangeHandleTime.value[1]
  }
  listRequisition(queryParams.value).then(response => {
    requisitionList.value = response.rows
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
    requisitionId: null,
    requisitionCode: null,
    deptId: null,
    deviceId: null,
    requisitionQuantity: null,
    requisitionStatus: null,
    handlerBy: null,
    handleTime: null,
    remark: null,
    createBy: null,
    createTime: null,
    updateBy: null,
    updateTime: null
  }
  proxy.resetForm("requisitionRef")
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1
  getList()
}

/** 重置按钮操作 */
function resetQuery() {
  daterangeHandleTime.value = []
  proxy.resetForm("queryRef")
  handleQuery()
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.requisitionId)
  single.value = selection.length != 1
  multiple.value = !selection.length
}

/** 新增按钮操作 */
function handleAdd() {
  reset()
  open.value = true
  title.value = "添加科室领用申请单"
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset()
  const _requisitionId = row.requisitionId || ids.value
  getRequisition(_requisitionId).then(response => {
    form.value = response.data
    open.value = true
    title.value = "修改科室领用申请单"
  })
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["requisitionRef"].validate(valid => {
    if (valid) {
      if (form.value.requisitionId != null) {
        updateRequisition(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功")
          open.value = false
          getList()
        })
      } else {
        addRequisition(form.value).then(response => {
          proxy.$modal.msgSuccess("新增成功")
          open.value = false
          getList()
        })
      }
    }
  })
}

/** 删除按钮操作 */
function handleDelete(row) {
  const _requisitionIds = row.requisitionId || ids.value
  proxy.$modal.confirm('是否确认删除科室领用申请单编号为"' + _requisitionIds + '"的数据项？').then(function() {
    return delRequisition(_requisitionIds)
  }).then(() => {
    getList()
    proxy.$modal.msgSuccess("删除成功")
  }).catch(() => {})
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('device/requisition/export', {
    ...queryParams.value
  }, `requisition_${new Date().getTime()}.xlsx`)
}

getList()
</script>
