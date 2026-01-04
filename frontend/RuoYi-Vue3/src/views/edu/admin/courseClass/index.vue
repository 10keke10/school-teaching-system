<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="学期" prop="termId">
        <el-input
          v-model="queryParams.termId"
          placeholder="请输入学期ID (如 a_202401)"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择状态" clearable>
          <el-option label="开放" :value="1" />
          <el-option label="关闭" :value="0" />
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
          v-hasPermi="['edu:admin:courseClass:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['edu:admin:courseClass:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['edu:admin:courseClass:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['edu:admin:courseClass:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="courseClassList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="班级ID" align="center" prop="classId" />
      <el-table-column label="课程ID" align="center" prop="courseId" />
      <el-table-column label="学期ID" align="center" prop="termId" />
      <el-table-column label="教师ID" align="center" prop="teacherId" />
      <el-table-column label="上课时间" align="center" prop="classTime" />
      <el-table-column label="地点" align="center" prop="location" />
      <el-table-column label="容量" align="center" prop="capacity" />
      <el-table-column label="已选" align="center" prop="selectedCount" />
      <el-table-column label="状态" align="center" prop="status">
        <template #default="scope">
          <el-tag v-if="scope.row.status === 1" type="success">开放</el-tag>
          <el-tag v-else type="info">关闭</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['edu:admin:courseClass:edit']">修改</el-button>
          <el-button link type="primary" icon="DataLine" @click="handleStats(scope.row)" v-hasPermi="['edu:admin:courseClass:query']">统计</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['edu:admin:courseClass:remove']">删除</el-button>
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

    <!-- 添加或修改教学班对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="courseClassRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="课程ID" prop="courseId">
          <el-input v-model="form.courseId" placeholder="请输入课程ID" />
        </el-form-item>
        <el-form-item label="教师ID" prop="teacherId">
          <el-input v-model="form.teacherId" placeholder="请输入教师ID" />
        </el-form-item>
        <el-form-item label="学期ID" prop="termId">
          <el-input v-model="form.termId" placeholder="请输入学期ID (如 a_202401)" />
        </el-form-item>
        <el-form-item label="上课时间" prop="classTime">
          <el-input v-model="form.classTime" placeholder="请输入上课时间" />
        </el-form-item>
        <el-form-item label="上课地点" prop="location">
          <el-input v-model="form.location" placeholder="请输入上课地点" />
        </el-form-item>
        <el-form-item label="课程容量" prop="capacity">
          <el-input-number v-model="form.capacity" :min="1" placeholder="请输入课程容量" />
        </el-form-item>
        <el-form-item label="状态" prop="status">
          <el-radio-group v-model="form.status">
            <el-radio :label="1">开放</el-radio>
            <el-radio :label="0">关闭</el-radio>
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

    <!-- 统计对话框 -->
    <el-dialog title="班级统计" v-model="statsOpen" width="800px" append-to-body>
      <div v-loading="statsLoading">
        <el-row :gutter="20">
          <el-col :span="10">
            <el-descriptions :column="1" border>
              <el-descriptions-item label="班级ID">{{ statsData.classId }}</el-descriptions-item>
              <el-descriptions-item label="课程ID">{{ statsData.courseId }}</el-descriptions-item>
              <el-descriptions-item label="教师ID">{{ statsData.teacherId }}</el-descriptions-item>
              <el-descriptions-item label="容量">{{ statsData.capacity }}</el-descriptions-item>
              <el-descriptions-item label="已选">{{ statsData.selectedCount }}</el-descriptions-item>
              <el-descriptions-item label="选课率">
                {{ statsData.capacity > 0 ? ((statsData.selectedCount / statsData.capacity) * 100).toFixed(1) + '%' : '0%' }}
              </el-descriptions-item>
            </el-descriptions>
          </el-col>
          <el-col :span="14">
             <!-- 图表容器 -->
             <div ref="statsChartRef" style="height: 300px;"></div>
          </el-col>
        </el-row>
      </div>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="statsOpen = false">关 闭</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="CourseClass">
import { listCourseClass, getCourseClass, delCourseClass, addCourseClass, updateCourseClass } from "@/api/edu/admin/courseClass";
import * as echarts from 'echarts';
import { nextTick, ref } from "vue";

const { proxy } = getCurrentInstance();

const courseClassList = ref([]);
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
    status: null,
  },
  rules: {
    courseId: [
      { required: true, message: "课程ID不能为空", trigger: "blur" }
    ],
    teacherId: [
      { required: true, message: "教师ID不能为空", trigger: "blur" }
    ],
    termId: [
      { required: true, message: "学期ID不能为空", trigger: "blur" }
    ],
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询教学班列表 */
function getList() {
  loading.value = true;
  listCourseClass(queryParams.value).then(response => {
    courseClassList.value = response.rows;
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
    classId: null,
    courseId: null,
    teacherId: null,
    termId: null,
    classTime: null,
    location: null,
    capacity: 60,
    selectedCount: null,
    status: 1,
    createBy: null,
    createTime: null,
    updateBy: null,
    updateTime: null,
    remark: null
  };
  proxy.resetForm("courseClassRef");
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
  ids.value = selection.map(item => item.classId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  title.value = "添加教学班";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _classId = row.classId || ids.value
  getCourseClass(_classId).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改教学班";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["courseClassRef"].validate(valid => {
    if (valid) {
      if (form.value.classId != null) {
        updateCourseClass(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addCourseClass(form.value).then(response => {
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
  const _classIds = row.classId || ids.value;
  proxy.$modal.confirm('是否确认删除教学班编号为"' + _classIds + '"的数据项？').then(function() {
    return delCourseClass(_classIds);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => {});
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('edu/admin/class/export', {
    ...queryParams.value
  }, `courseClass_${new Date().getTime()}.xlsx`)
}

// 统计相关
const statsOpen = ref(false);
const statsLoading = ref(false);
const statsData = ref({});
const statsChartRef = ref(null);
let chartInstance = null;

function handleStats(row) {
  statsOpen.value = true;
  statsLoading.value = true;
  statsData.value = {}; // Reset
  
  // 模拟获取数据，实际应该调用API
  getCourseClass(row.classId).then(response => {
      statsData.value = response.data;
      statsLoading.value = false;
      
      // 延迟渲染图表
      nextTick(() => {
          initChart();
      });
  });
}

function initChart() {
    if (chartInstance) {
        chartInstance.dispose();
    }
    const dom = statsChartRef.value;
    if (!dom) return;
    
    chartInstance = echarts.init(dom);
    const selected = statsData.value.selectedCount || 0;
    const capacity = statsData.value.capacity || 60;
    const remaining = Math.max(0, capacity - selected);
    
    const option = {
        title: {
            text: '选课概况',
            left: 'center'
        },
        tooltip: {
            trigger: 'item'
        },
        legend: {
            orient: 'vertical',
            left: 'left'
        },
        series: [
            {
                name: '人数',
                type: 'pie',
                radius: '50%',
                data: [
                    { value: selected, name: '已选' },
                    { value: remaining, name: '剩余' }
                ],
                emphasis: {
                    itemStyle: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };
    chartInstance.setOption(option);
}

getList();
</script>
