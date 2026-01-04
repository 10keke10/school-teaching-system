<template>
  <div class="app-container">
    <!-- 检索区 -->
    <el-form :model="queryParams" ref="queryRef" :inline="true" label-width="68px">
      <el-form-item label="学期">
        <el-tag type="info">{{ currentTermName || '未设置当前学期' }}</el-tag>
      </el-form-item>
      <el-form-item label="课程名称" prop="courseName">
        <el-input
          v-model="queryParams.courseName"
          placeholder="请输入课程名称"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <!-- 工具栏已移除 -->

    <!-- 课程表 -->
    <el-table v-loading="loading" :data="courseList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="课程代码" align="center" prop="courseCode" width="120" />
      <el-table-column label="课程名称" align="center" prop="courseName" />
      <el-table-column label="上课时间" align="center" prop="classTime" width="150" />
      <el-table-column label="上课地点" align="center" prop="location" width="120" />
      <el-table-column label="教师" align="center" prop="teacherName" width="100" />
      <el-table-column label="学期" align="center" prop="termName" width="150" />
      <el-table-column label="学分" align="center" prop="creditHours" width="80" />
      <el-table-column label="已选/容量" align="center" width="120">
        <template #default="scope">
          <el-tag :type="scope.row.selectedCount >= scope.row.capacity ? 'danger' : 'success'">
            {{ scope.row.selectedCount }}/{{ scope.row.capacity }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="选课状态" align="center" width="100">
        <template #default="scope">
          <el-tag v-if="scope.row.enrolled" type="success">已选</el-tag>
          <el-tag v-else-if="scope.row.selectedCount >= scope.row.capacity" type="danger">已满</el-tag>
          <el-tag v-else type="warning">可选</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" width="150" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button
            v-if="!scope.row.enrolled && scope.row.selectedCount < scope.row.capacity"
            type="primary"
            link
            icon="CirclePlus"
            @click="handleEnroll(scope.row)"
          >
            选课
          </el-button>
          <el-button
            v-else-if="scope.row.enrolled"
            type="danger"
            link
            icon="Delete"
            @click="handleDrop(scope.row)"
          >
            退课
          </el-button>
          <span v-else>--</span>
        </template>
      </el-table-column>
    </el-table>

    <!-- 分页 -->
    <pagination
      v-show="total > 0"
      :total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 开发模式提示 -->
    <el-alert
      v-if="useMock"
      title="开发模式：使用Mock数据，所有操作均为模拟"
      type="info"
      :closable="false"
      show-icon
      style="margin-top: 20px;"
    />
  </div>
</template>

<script setup name="StudentCourse">
import { ref, reactive, onMounted } from 'vue'
import { ElMessage } from 'element-plus'
import { listAvailableCourses, enrollCourse, dropCourse } from '@/api/edu/student/course'

// 查询参数
const queryParams = reactive({
  pageNum: 1,
  pageSize: 10,
  courseName: ''
})

const loading = ref(true)
const total = ref(0)
const courseList = ref([])
const useMock = ref(false)
const currentTermName = ref('')

/** 查询课程列表 */
function getList() {
  loading.value = true
  listAvailableCourses(queryParams)
    .then(res => {
      const data = res.data || res
      courseList.value = (data.rows || []).map(item => {
        return {
          classId: item.class_id || item.classId,
          courseCode: item.course_code || item.courseCode,
          courseName: item.course_name || item.courseName,
          classTime: item.class_time || item.classTime,
          location: item.location,
          teacherName: item.teacher_name || item.teacherName,
          termName: item.term_name || item.termName,
          creditHours: item.credit_hours || item.creditHours,
          capacity: item.capacity,
          selectedCount: item.selected_count || item.selectedCount || 0,
          enrolled: !!item.enrollment_id || item.enrollment_status === 'ENROLLED' || item.enrolled,
          enrollmentId: item.enrollment_id || item.enrollmentId
        }
      })
      total.value = data.total || courseList.value.length
      currentTermName.value = data.termName || ''
    })
    .catch(() => {
      courseList.value = []
      total.value = 0
      currentTermName.value = ''
    })
    .finally(() => {
      loading.value = false
    })
}

/** Mock数据 */
/** 搜索 */
function handleQuery() {
  queryParams.pageNum = 1
  getList()
}

/** 重置 */
function resetQuery() {
  queryParams.courseName = ''
  handleQuery()
}

/** 刷新 */
function handleRefresh() {}

/** 多选变更 */
function handleSelectionChange() {
  // 目前无需处理
}

/** 选课 */
function handleEnroll(row) {
  const classId = row.classId
  enrollCourse({ classId })
    .then(response => {
      ElMessage.success(response.msg || '选课成功')
      getList()
      window.dispatchEvent(new CustomEvent('edu_enrollment_changed'))
    })
    .catch(error => {
      ElMessage.error(error.msg || '选课失败')
      getList()
    })
}

/** 退课 */
function handleDrop(row) {
  const enrollmentId = row.enrollmentId
  if (!enrollmentId) {
    ElMessage.error('缺少选课记录ID，无法退课')
    return
  }
  dropCourse(enrollmentId)
    .then(response => {
      ElMessage.success(response.msg || '退课成功')
      getList()
      window.dispatchEvent(new CustomEvent('edu_enrollment_changed'))
    })
    .catch(error => {
      ElMessage.error(error.msg || '退课失败')
    })
}

onMounted(() => {
  getList()
})
</script>

<style scoped>
.app-container {
  padding: 20px;
}
</style>
