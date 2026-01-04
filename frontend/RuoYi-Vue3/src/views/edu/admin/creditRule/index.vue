<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="规则名称" prop="ruleName">
        <el-input
          v-model="queryParams.ruleName"
          placeholder="请输入规则名称"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="学期ID" prop="termId">
        <el-input
          v-model="queryParams.termId"
          placeholder="请输入学期ID"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否生效" prop="isActive">
        <el-select v-model="queryParams.isActive" placeholder="请选择状态" clearable>
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
          v-hasPermi="['edu:admin:creditRule:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['edu:admin:creditRule:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['edu:admin:creditRule:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['edu:admin:creditRule:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="creditRuleList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="规则ID" align="center" prop="ruleId" />
      <el-table-column label="规则名称" align="center" prop="ruleName" />
      <el-table-column label="适用学期" align="center" prop="termId" />
      <el-table-column label="最大学分" align="center" prop="maxCredits" />
      <el-table-column label="最小学分" align="center" prop="minCredits" />
      <el-table-column label="是否生效" align="center" prop="isActive">
        <template #default="scope">
          <el-tag v-if="scope.row.isActive === 1" type="success">是</el-tag>
          <el-tag v-else type="info">否</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['edu:admin:creditRule:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['edu:admin:creditRule:remove']">删除</el-button>
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

    <!-- 添加或修改学分规则对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="creditRuleRef" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="规则名称" prop="ruleName">
          <el-input v-model="form.ruleName" placeholder="请输入规则名称" />
        </el-form-item>
        <el-form-item label="适用学期" prop="termId">
          <el-input v-model="form.termId" placeholder="请输入学期ID" />
        </el-form-item>
        <el-form-item label="最大学分" prop="maxCredits">
          <el-input-number v-model="form.maxCredits" :min="0" :max="50" label="最大学分"></el-input-number>
        </el-form-item>
        <el-form-item label="最小学分" prop="minCredits">
          <el-input-number v-model="form.minCredits" :min="0" :max="50" label="最小学分"></el-input-number>
        </el-form-item>
        <el-form-item label="是否生效" prop="isActive">
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

<script setup name="CreditRule">
import { listCreditRule, getCreditRule, delCreditRule, addCreditRule, updateCreditRule } from "@/api/edu/admin/creditRule";

const { proxy } = getCurrentInstance();

const creditRuleList = ref([]);
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
    ruleName: null,
    termId: null,
    isActive: null
  },
  rules: {
    ruleName: [
      { required: true, message: "规则名称不能为空", trigger: "blur" }
    ],
    termId: [
      { required: true, message: "适用学期不能为空", trigger: "blur" }
    ],
    maxCredits: [
      { required: true, message: "最大学分不能为空", trigger: "blur" }
    ]
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询学分规则列表 */
function getList() {
  loading.value = true;
  listCreditRule(queryParams.value).then(response => {
    creditRuleList.value = response.rows;
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
    ruleId: null,
    ruleName: null,
    termId: null,
    maxCredits: 20,
    minCredits: 0,
    isActive: 1,
    remark: null
  };
  proxy.resetForm("creditRuleRef");
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
  ids.value = selection.map(item => item.ruleId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加学分规则";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const ruleId = row.ruleId || ids.value
  getCreditRule(ruleId).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改学分规则";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["creditRuleRef"].validate(valid => {
    if (valid) {
      if (form.value.ruleId != null) {
        updateCreditRule(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addCreditRule(form.value).then(response => {
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
  const ruleIds = row.ruleId || ids.value;
  proxy.$modal.confirm('是否确认删除学分规则编号为"' + ruleIds + '"的数据项？').then(function() {
    return delCreditRule(ruleIds);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('edu/admin/creditRule/export', {
    ...queryParams.value
  }, `creditRule_${new Date().getTime()}.xlsx`)
}

getList();
</script>
