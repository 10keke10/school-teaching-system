<template>
  <div class="app-container">
    <el-card>
      <template #header>
        <div class="card-header">
          <div class="header-left">
            <span>成绩管理</span>
          </div>
          <div class="header-center">
            <span v-if="isPublished && displayAverage !== null">班级平均成绩：{{ displayAverage }}</span>
          </div>
          <div class="header-right">
            <el-select v-model="currentClassId" placeholder="选择班级" @change="loadGrades" style="width: 300px" clearable>
              <el-option
                v-for="cls in classOptions"
                :key="cls.classId"
                :label="`${cls.courseName} - ${cls.termName}`"
                :value="cls.classId"
              />
            </el-select>
          </div>
        </div>
      </template>
      <el-table :data="gradeList" stripe v-loading="loading">
        <el-table-column prop="enrollmentId" label="选课ID" align="center" min-width="120" />
        <el-table-column prop="studentId" label="学号" align="center" min-width="160" />
        <el-table-column prop="studentName" label="学生姓名" align="center" min-width="180" />
        <el-table-column prop="grade" label="成绩" align="center" min-width="220">
          <template #default="scope">
            <el-input-number 
              v-model="scope.row.grade" 
              :min="0" 
              :max="100" 
              :precision="1"
              size="small" 
              style="width: 120px"
            />
          </template>
        </el-table-column>
        <el-table-column prop="gradeStatus" label="状态" align="center" min-width="140">
          <template #default="scope">
            <el-tag :type="scope.row.gradeStatus === 'PUBLISHED' ? 'success' : 'info'">
              {{ scope.row.gradeStatus === 'PUBLISHED' ? '已发布' : '草稿' }}
            </el-tag>
          </template>
        </el-table-column>
      </el-table>
      <div class="actions" style="margin-top: 12px; text-align: right;">
        <el-button type="success" @click="handlePublish" :disabled="!currentClassId">发布成绩</el-button>
      </div>
    </el-card>
  </div>
</template>

<script setup>
import { ref, onMounted, computed } from 'vue'
import { ElMessage } from 'element-plus'
import { getMyClasses, getClassStudents, batchUpdateGrades, publishGrades } from '@/api/edu/teacher'

const loading = ref(false)
const gradeList = ref([])
const currentClassId = ref(null)
const classOptions = ref([])
const isPublished = computed(() => gradeList.value.length > 0 && gradeList.value.every(item => item.gradeStatus === 'PUBLISHED'))
const computedAverage = computed(() => {
  if (!isPublished.value) return null
  const grades = gradeList.value.map(g => Number(g.grade)).filter(v => !isNaN(v))
  if (grades.length === 0) return null
  const sum = grades.reduce((a, b) => a + b, 0)
  return Number((sum / grades.length).toFixed(2))
})
const displayAverage = computed(() => computedAverage.value)

async function loadClasses() {
  try {
    const res = await getMyClasses('')
    const data = res.data || res
    classOptions.value = (data || []).map(item => ({
      classId: item.class_id || item.classId,
      courseName: item.course_name || item.courseName,
      termName: item.term_name || item.termName
    }))
    if (classOptions.value.length > 0 && !currentClassId.value) {
      currentClassId.value = classOptions.value[0].classId
      loadGrades()
    }
  } catch (e) {
    ElMessage.error('获取班级列表失败')
  }
}

async function loadGrades() {
  if (!currentClassId.value) {
    gradeList.value = []
    return
  }
  loading.value = true
  try {
    const res = await getClassStudents(currentClassId.value)
    const rows = res.rows || res.data?.rows || []
    gradeList.value = rows.map(item => ({
      enrollmentId: item.enrollmentId || item.enrollment_id,
      studentId: item.studentId || item.student_id,
      studentName: item.studentName || `学生${item.studentId || item.student_id}`,
      grade: item.grade,
    gradeStatus: item.gradeStatus || item.grade_status || 'DRAFT'
  }))
  } catch (e) {
    ElMessage.error('获取学生成绩失败')
    gradeList.value = []
  } finally {
    loading.value = false
  }
}

async function handleSave() {
  if (!currentClassId.value) {
    ElMessage.warning('请先选择班级')
    return
  }
  try {
    await batchUpdateGrades(
      gradeList.value.map(item => ({
        enrollmentId: item.enrollmentId,
        grade: item.grade,
        gradeStatus: item.gradeStatus
      }))
    )
    ElMessage.success('成绩保存成功')
  } catch (e) {
    ElMessage.error('成绩保存失败')
  }
}

async function handlePublish() {
  if (!currentClassId.value) {
    ElMessage.warning('请先选择班级')
    return
  }
  try {
    // 先批量保存成绩
    await batchUpdateGrades(
      gradeList.value.map(item => ({
        enrollmentId: item.enrollmentId,
        grade: item.grade,
        gradeStatus: item.gradeStatus
      }))
    )
    await publishGrades({ classId: currentClassId.value })
    gradeList.value.forEach(item => {
      item.gradeStatus = 'PUBLISHED'
    })
    ElMessage.success('成绩发布成功')
  } catch (e) {
    ElMessage.error('成绩发布失败')
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
.header-left {
  flex: 0 0 auto;
}
.header-center {
  flex: 1 1 auto;
  text-align: center;
  font-weight: 500;
}
.header-right {
  flex: 0 0 auto;
}
</style>
