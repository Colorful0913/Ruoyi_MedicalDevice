<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="关联器械ID" prop="deviceId">
        <el-input
          v-model="queryParams.deviceId"
          placeholder="请输入关联器械ID"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="批次号/序列号" prop="batchNum">
        <el-input
          v-model="queryParams.batchNum"
          placeholder="请输入批次号/序列号"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="供应商名称" prop="supplier">
        <el-input
          v-model="queryParams.supplier"
          placeholder="请输入供应商名称"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="入库日期" style="width: 308px">
        <el-date-picker
          v-model="daterangeInboundTime"
          value-format="YYYY-MM-DD"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item label="过期日期/有效期" style="width: 308px">
        <el-date-picker
          v-model="daterangeExpiryDate"
          value-format="YYYY-MM-DD"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item label="批次状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择批次状态" clearable>
          <el-option
            v-for="dict in sys_batch_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
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
          v-hasPermi="['device:batch:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['device:batch:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['device:batch:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['device:batch:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="batchList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="批次ID" align="center" prop="batchId" />
      <el-table-column label="器械名称" align="center" prop="deviceName" />
      <el-table-column label="批次号/序列号" align="center" prop="batchNum" />
      <el-table-column label="供应商名称" align="center" prop="supplier" />
      <el-table-column label="入库日期" align="center" prop="inboundTime" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.inboundTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="过期日期/有效期" align="center" prop="expiryDate" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.expiryDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="初始入库数量" align="center" prop="inboundQuantity" />
      <el-table-column label="当前库存数量" align="center" prop="currentQuantity" />
      <el-table-column label="批次状态" align="center" prop="status">
        <template #default="scope">
          <dict-tag :options="sys_batch_status" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['device:batch:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['device:batch:remove']">删除</el-button>
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

    <!-- 添加或修改库存批次对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="batchRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="关联器械ID" prop="deviceId">
          <el-input v-model="form.deviceId" placeholder="请输入关联器械ID" />
        </el-form-item>
        <el-form-item label="供应商名称" prop="supplier">
          <el-input v-model="form.supplier" placeholder="请输入供应商名称" />
        </el-form-item>
        <el-form-item label="入库日期" prop="inboundTime">
          <el-date-picker clearable
            v-model="form.inboundTime"
            type="date"
            value-format="YYYY-MM-DD"
            placeholder="请选择入库日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="过期日期/有效期" prop="expiryDate">
          <el-date-picker clearable
            v-model="form.expiryDate"
            type="date"
            value-format="YYYY-MM-DD"
            placeholder="请选择过期日期/有效期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="初始入库数量" prop="inboundQuantity">
          <el-input v-model="form.inboundQuantity" placeholder="请输入初始入库数量" />
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

<script setup name="Batch">
import { listBatch, getBatch, delBatch, addBatch, updateBatch } from "@/api/device/batch"

const { proxy } = getCurrentInstance()
const { sys_batch_status } = proxy.useDict('sys_batch_status')

const batchList = ref([])
const open = ref(false)
const loading = ref(true)
const showSearch = ref(true)
const ids = ref([])
const single = ref(true)
const multiple = ref(true)
const total = ref(0)
const title = ref("")
const daterangeInboundTime = ref([])
const daterangeExpiryDate = ref([])

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    deviceId: null,
    batchNum: null,
    supplier: null,
    inboundTime: null,
    expiryDate: null,
    status: null,
  },
  rules: {
    deviceId: [
      { required: true, message: "关联器械ID不能为空", trigger: "blur" }
    ],
    supplier: [
      { required: true, message: "供应商名称不能为空", trigger: "blur" }
    ],
    inboundTime: [
      { required: true, message: "入库日期不能为空", trigger: "blur" }
    ],
    expiryDate: [
      { required: true, message: "过期日期/有效期不能为空", trigger: "blur" }
    ],
    inboundQuantity: [
      { required: true, message: "初始入库数量不能为空", trigger: "blur" }
    ],
    currentQuantity: [
      { required: true, message: "当前库存数量不能为空", trigger: "blur" }
    ],
  }
})

const { queryParams, form, rules } = toRefs(data)

/** 查询库存批次列表 */
function getList() {
  loading.value = true
  queryParams.value.params = {}
  if (null != daterangeInboundTime && '' != daterangeInboundTime) {
    queryParams.value.params["beginInboundTime"] = daterangeInboundTime.value[0]
    queryParams.value.params["endInboundTime"] = daterangeInboundTime.value[1]
  }
  if (null != daterangeExpiryDate && '' != daterangeExpiryDate) {
    queryParams.value.params["beginExpiryDate"] = daterangeExpiryDate.value[0]
    queryParams.value.params["endExpiryDate"] = daterangeExpiryDate.value[1]
  }
  listBatch(queryParams.value).then(response => {
    batchList.value = response.rows
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
    batchId: null,
    deviceId: null,
    batchNum: null,
    supplier: null,
    inboundTime: null,
    expiryDate: null,
    inboundQuantity: null,
    currentQuantity: null,
    status: null,
    remark: null,
    createBy: null,
    createTime: null,
    updateBy: null,
    updateTime: null
  }
  proxy.resetForm("batchRef")
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1
  getList()
}

/** 重置按钮操作 */
function resetQuery() {
  daterangeInboundTime.value = []
  daterangeExpiryDate.value = []
  proxy.resetForm("queryRef")
  handleQuery()
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.batchId)
  single.value = selection.length != 1
  multiple.value = !selection.length
}

/** 新增按钮操作 */
function handleAdd() {
  reset()
  open.value = true
  title.value = "添加库存批次"
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset()
  const _batchId = row.batchId || ids.value
  getBatch(_batchId).then(response => {
    form.value = response.data
    open.value = true
    title.value = "修改库存批次"
  })
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["batchRef"].validate(valid => {
    if (valid) {
      if (form.value.batchId != null) {
        updateBatch(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功")
          open.value = false
          getList()
        })
      } else {
        addBatch(form.value).then(response => {
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
  const _batchIds = row.batchId || ids.value
  proxy.$modal.confirm('是否确认删除库存批次编号为"' + _batchIds + '"的数据项？').then(function() {
    return delBatch(_batchIds)
  }).then(() => {
    getList()
    proxy.$modal.msgSuccess("删除成功")
  }).catch(() => {})
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('device/batch/export', {
    ...queryParams.value
  }, `batch_${new Date().getTime()}.xlsx`)
}

getList()
</script>
