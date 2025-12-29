<template>
  <div class="app-container">
    <!-- 检索区 -->
    <el-form :model="queryParams" ref="queryRef" :inline="true" label-width="68px">
      <el-form-item label="学期" prop="termId">
        <el-select v-model="queryParams.termId" placeholder="请选择学期" clearable>
          <el-option
            v-for="item in termOptions"
            :key="item.termId"
            :label="item.termName"
            :value="item.termId"
          />
        </el-select>
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

    <!-- 工具栏 -->
    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="Refresh" @click="handleRefresh">刷新</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <!-- 课程表 -->
    <el-table v-loading="loading" :data="courseList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="课程代码" align="center" prop="courseCode" width="120" />
      <el-table-column label="课程名称" align="center" prop="courseName" />
      <el-table-column label="上课时间" align="center" prop="classTime" width="150" />
      <el-table-column label="上课地点" align="center" prop="location" width="120" />
      <el-table-column label="教师" align="center" prop="teacherName" width="100" />
      <el-table-column label="学分" align="center" prop="creditHours" width="80" />
      <el-table-column label="容量/已选" align="center" width="120">
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
  termId: undefined,
  courseName: ''
})

const loading = ref(true)
const total = ref(0)
const courseList = ref([])
const showSearch = ref(true)
const useMock = ref(true) // 开发阶段使用Mock

// 学期选项（开发阶段Mock）
const termOptions = ref([
  { termId: '2024-2025-1', termName: '2024-2025秋季学期' },
  { termId: '2024-2025-2', termName: '2024-2025冬季学期' }
])

/** 查询课程列表 */
function getList() {
  loading.value = true

  if (useMock.value) {
    courseList.value = getMockCourseList()
    total.value = courseList.value.length
    loading.value = false
    return
  }

  listAvailableCourses(queryParams)
    .then(response => {
      courseList.value = response.rows
      total.value = response.total
    })
    .catch(() => {
      courseList.value = getMockCourseList()
      total.value = courseList.value.length
    })
    .finally(() => {
      loading.value = false
    })
}

/** Mock数据 */
function getMockCourseList() {
  return [
    {
      classId: 1,
      courseCode: 'CS101',
      courseName: '计算机基础',
      classTime: '周一 1-2节',
      location: '教学楼A201',
      teacherName: '张老师',
      creditHours: 3,
      capacity: 60,
      selectedCount: 30,
      enrolled: false,
      termId: '2024-2025-1'
    },
    {
      classId: 2,
      courseCode: 'MATH201',
      courseName: '高等数学',
      classTime: '周二 3-4节',
      location: '教学楼B301',
      teacherName: '李老师',
      creditHours: 4,
      capacity: 50,
      selectedCount: 50,
      enrolled: false,
      termId: '2024-2025-1'
    },
    {
      classId: 3,
      courseCode: 'ENG301',
      courseName: '大学英语',
      classTime: '周三 5-6节',
      location: '教学楼C101',
      teacherName: '王老师',
      creditHours: 2,
      capacity: 40,
      selectedCount: 20,
      enrolled: true,
      termId: '2024-2025-1',
      enrollmentId: 1
    }
  ]
}

/** 搜索 */
function handleQuery() {
  queryParams.pageNum = 1
  getList()
}

/** 重置 */
function resetQuery() {
  queryParams.termId = undefined
  queryParams.courseName = ''
  handleQuery()
}

/** 刷新 */
function handleRefresh() {
  getList()
}

/** 多选变更 */
function handleSelectionChange() {
  // 目前无需处理
}

/** 选课 */
function handleEnroll(row) {
  const classId = row.classId

  if (useMock.value) {
    row.enrolled = true
    row.selectedCount += 1
    ElMessage.success(`模拟选课成功：${row.courseName}`)
    return
  }

  enrollCourse({ classId })
    .then(response => {
      ElMessage.success(response.msg || '选课成功')
      getList()
    })
    .catch(error => {
      ElMessage.error(error.msg || '选课失败')
    })
}

/** 退课 */
function handleDrop(row) {
  const enrollmentId = row.enrollmentId || 1 // Mock数据

  if (useMock.value) {
    row.enrolled = false
    row.selectedCount = Math.max(0, row.selectedCount - 1)
    ElMessage.success(`模拟退课成功：${row.courseName}`)
    return
  }

  dropCourse(enrollmentId)
    .then(response => {
      ElMessage.success(response.msg || '退课成功')
      getList()
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
