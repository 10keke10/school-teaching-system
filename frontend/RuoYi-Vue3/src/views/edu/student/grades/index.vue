<template>
  <div class="app-container">
    <el-card>
      <template #header>
        <span>成绩查询</span>
      </template>

      <el-table :data="gradeList" v-loading="loading">
        <el-table-column label="学期" prop="termName" width="120" />
        <el-table-column label="课程名称" prop="courseName" />
        <el-table-column label="课程类型" prop="courseType" width="100" />
        <el-table-column label="学分" prop="creditHours" width="80" />
        <el-table-column label="成绩" prop="grade" width="100">
          <template #default="scope">
            <el-tag :type="getGradeTagType(scope.row.grade)">
              {{ scope.row.grade ?? '--' }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column label="状态" prop="gradeStatus" width="100">
          <template #default="scope">
            <el-tag :type="scope.row.gradeStatus === 'PUBLISHED' ? 'success' : 'info'">
              {{ scope.row.gradeStatus === 'PUBLISHED' ? '已发布' : '待发布' }}
            </el-tag>
          </template>
        </el-table-column>
      </el-table>
    </el-card>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { getStudentGrades } from '@/api/edu/student/course'

const gradeList = ref([])
const loading = ref(false)

function getGradeTagType(grade) {
  if (grade === null || grade === undefined) {
    return 'info'
  }
  if (grade >= 90) return 'success'
  if (grade >= 60) return 'warning'
  return 'danger'
}

async function loadGradeList() {
  loading.value = true
  try {
    const res = await getStudentGrades({ gradeStatus: '', termId: '' })
    const data = res.data || res
    gradeList.value = (data || []).map(item => ({
      termName: item.term_id || item.termName,
      courseName: item.course_name || item.courseName,
      courseType: item.course_type || item.courseType || '必修',
      creditHours: item.credit_hours || item.creditHours,
      grade: item.grade,
      gradeStatus: item.grade_status || item.gradeStatus
    }))
  } catch (e) {
    gradeList.value = []
  } finally {
    loading.value = false
  }
}

onMounted(loadGradeList)
window.addEventListener('edu_enrollment_changed', loadGradeList)
</script>
