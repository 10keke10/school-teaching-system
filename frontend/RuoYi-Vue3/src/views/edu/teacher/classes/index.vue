<template>
  <div class="app-container">
    <el-card>
      <template #header>
        <div class="card-header">
          <span>我的班级</span>
          <el-select v-model="currentTerm" placeholder="选择学期" @change="loadClasses" style="width: 200px" clearable>
            <el-option
              v-for="term in termOptions"
              :key="term.termId"
              :label="term.termName"
              :value="term.termId"
            />
          </el-select>
        </div>
      </template>
      <el-table :data="classList" stripe v-loading="loading">
        <el-table-column prop="classId" label="班级ID" width="100" />
        <el-table-column prop="courseName" label="课程名称" />
        <el-table-column prop="courseCode" label="课程代码" width="120" />
        <el-table-column prop="termName" label="学期" width="150" />
        <el-table-column prop="classTime" label="上课时间" width="180" />
        <el-table-column prop="location" label="上课地点" width="150" />
        <el-table-column label="容量/已选" width="120">
          <template #default="scope">
            <el-tag :type="scope.row.selectedCount >= scope.row.capacity ? 'danger' : 'success'">
              {{ scope.row.selectedCount }}/{{ scope.row.capacity }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="studentCount" label="学生数" width="100" />
        <el-table-column label="状态" width="100">
          <template #default="scope">
            <el-tag :type="scope.row.status === 1 ? 'success' : 'info'">
              {{ scope.row.status === 1 ? '开放选课' : '已关闭' }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="200" fixed="right">
          <template #default="scope">
            <el-button type="primary" size="small" @click="handleViewStudents(scope.row)">
              查看学生
            </el-button>
            <el-button type="info" size="small" @click="handleViewStatistics(scope.row)">
              统计
            </el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-card>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { ElMessage } from 'element-plus'
import { getMyClasses, getClassStudents, getClassStatistics } from '@/api/edu/teacher'

const loading = ref(false)
const classList = ref([])
const currentTerm = ref('')
const termOptions = ref([
  { termId: 'b_2024_fall', termName: 'B测试秋季学期' },
  { termId: 'b_2024_spring', termName: 'B测试春季学期' },
  { termId: 'b_2024_summer', termName: 'B测试夏季学期' }
])

async function loadClasses() {
  loading.value = true
  try {
    const res = await getMyClasses(currentTerm.value)
    const data = res.data || res
    classList.value = (data || []).map(item => ({
      classId: item.class_id || item.classId,
      courseId: item.course_id || item.courseId,
      courseName: item.course_name || item.courseName,
      courseCode: item.course_code || item.courseCode,
      termId: item.term_id || item.termId,
      termName: item.term_name || item.termName,
      classTime: item.class_time || item.classTime,
      location: item.location,
      capacity: item.capacity,
      selectedCount: item.selected_count || item.selectedCount || 0,
      studentCount: item.student_count || item.studentCount || 0,
      status: item.status
    }))
  } catch (e) {
    ElMessage.error('获取班级列表失败')
    classList.value = []
  } finally {
    loading.value = false
  }
}

async function handleViewStudents(row) {
  try {
    const res = await getClassStudents(row.classId)
    const data = res.rows || res.data?.rows || []
    ElMessage.success(`班级 ${row.courseName} 共有 ${data.length} 名学生`)
    // 这里可以打开一个对话框显示学生列表，或者跳转到成绩管理页面
  } catch (e) {
    ElMessage.error('获取学生列表失败')
  }
}

async function handleViewStatistics(row) {
  try {
    const res = await getClassStatistics(row.classId)
    const stats = res.data || res
    ElMessage.success(`班级 ${row.courseName} 平均分：${stats.averageGrade || 0}`)
    // 这里可以打开一个对话框显示详细统计信息
  } catch (e) {
    ElMessage.error('获取统计信息失败')
  }
}

onMounted(() => {
  loadClasses()
})
</script>

<style scoped>
.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
</style>
