<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="学期ID" prop="termId">
        <el-input
          v-model="queryParams.termId"
          placeholder="请输入学期ID"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="学期名称" prop="termName">
        <el-input
          v-model="queryParams.termName"
          placeholder="请输入学期名称"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否当前" prop="isActive">
        <el-select v-model="queryParams.isActive" placeholder="请选择是否当前学期" clearable>
          <el-option label="是" :value="1" />
          <el-option label="否" :value="0" />
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
          v-hasPermi="['edu:admin:term:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['edu:admin:term:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['edu:admin:term:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['edu:admin:term:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="termList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="学期ID" align="center" prop="termId" />
      <el-table-column label="学期名称" align="center" prop="termName" />
      <el-table-column label="选课开始时间" align="center" prop="enrollStart" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.enrollStart) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="选课结束时间" align="center" prop="enrollEnd" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.enrollEnd) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="退课截止时间" align="center" prop="dropDeadline" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.dropDeadline) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="是否当前" align="center" prop="isActive">
        <template #default="scope">
          <el-tag v-if="scope.row.isActive === 1" type="success">是</el-tag>
          <el-tag v-else type="info">否</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['edu:admin:term:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['edu:admin:term:remove']">删除</el-button>
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

    <!-- 添加或修改学期对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="termRef" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="学期ID" prop="termId">
          <el-input v-model="form.termId" placeholder="请输入学期ID（建议格式：2024-2025-1）" :disabled="form.termId && title === '修改学期'" />
        </el-form-item>
        <el-form-item label="学期名称" prop="termName">
          <el-input v-model="form.termName" placeholder="请输入学期名称" />
        </el-form-item>
        <el-form-item label="选课开始" prop="enrollStart">
          <el-date-picker clearable
            v-model="form.enrollStart"
            type="datetime"
            value-format="YYYY-MM-DD HH:mm:ss"
            placeholder="请选择选课开始时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="选课结束" prop="enrollEnd">
          <el-date-picker clearable
            v-model="form.enrollEnd"
            type="datetime"
            value-format="YYYY-MM-DD HH:mm:ss"
            placeholder="请选择选课结束时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="退课截止" prop="dropDeadline">
          <el-date-picker clearable
            v-model="form.dropDeadline"
            type="datetime"
            value-format="YYYY-MM-DD HH:mm:ss"
            placeholder="请选择退课截止时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="是否当前" prop="isActive">
          <el-radio-group v-model="form.isActive">
            <el-radio :label="1">是</el-radio>
            <el-radio :label="0">否</el-radio>
          </el-radio-group>
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

<script setup name="Term">
import { listTerm, getTerm, delTerm, addTerm, updateTerm } from "@/api/edu/admin/term";

const { proxy } = getCurrentInstance();

const termList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    termId: null,
    termName: null,
    isActive: null
  },
  rules: {
    termId: [
      { required: true, message: "学期ID不能为空", trigger: "blur" }
    ],
    termName: [
      { required: true, message: "学期名称不能为空", trigger: "blur" }
    ],
    enrollStart: [
      { required: true, message: "选课开始时间不能为空", trigger: "blur" }
    ],
    enrollEnd: [
      { required: true, message: "选课结束时间不能为空", trigger: "blur" }
    ]
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询学期列表 */
function getList() {
  loading.value = true;
  listTerm(queryParams.value).then(response => {
    termList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
}

/** 取消按钮 */
function cancel() {
  open.value = false;
  reset();
}

/** 表单重置 */
function reset() {
  form.value = {
    termId: null,
    termName: null,
    enrollStart: null,
    enrollEnd: null,
    dropDeadline: null,
    isActive: 0,
    remark: null
  };
  proxy.resetForm("termRef");
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}

/** 重置按钮操作 */
function resetQuery() {
  proxy.resetForm("queryRef");
  handleQuery();
}

/** 多选框选中数据 */
function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.termId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加学期";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const termId = row.termId || ids.value
  getTerm(termId).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改学期";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["termRef"].validate(valid => {
    if (valid) {
      if (title.value === "修改学期") { // 这里的判断逻辑需要根据实际情况调整，通常用form.id是否存在来判断，但这里termId是主键且由用户输入
        updateTerm(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addTerm(form.value).then(response => {
          proxy.$modal.msgSuccess("新增成功");
          open.value = false;
          getList();
        });
      }
    }
  });
}

/** 删除按钮操作 */
function handleDelete(row) {
  const termIds = row.termId || ids.value;
  proxy.$modal.confirm('是否确认删除学期编号为"' + termIds + '"的数据项？').then(function() {
    return delTerm(termIds);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('edu/admin/term/export', {
    ...queryParams.value
  }, `term_${new Date().getTime()}.xlsx`)
}

getList();
</script>
