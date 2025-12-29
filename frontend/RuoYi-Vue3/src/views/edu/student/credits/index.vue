<template>
  <div class="app-container">
    <el-card>
      <template #header>
        <div class="card-header">
          <span>学分统计</span>
          <el-select v-model="currentTerm" placeholder="选择学期" @change="loadCreditStats" style="width: 200px">
            <el-option
              v-for="term in termOptions"
              :key="term.termId"
              :label="term.termName"
              :value="term.termId"
            />
          </el-select>
        </div>
      </template>

      <el-alert
        v-if="useMock"
        title="开发模式：使用Mock学分统计数据"
        type="info"
        :closable="false"
        show-icon
        style="margin-bottom: 20px;"
      />

      <el-row :gutter="20" style="margin-bottom: 30px;">
        <el-col :span="6">
          <el-card shadow="hover" class="stat-card">
            <div class="stat-title">已选学分</div>
            <div class="stat-value">{{ creditInfo.currentCredits || 0 }}</div>
            <div class="stat-subtitle">Current Credits</div>
          </el-card>
        </el-col>
        <el-col :span="6">
          <el-card shadow="hover" class="stat-card">
            <div class="stat-title">学分上限</div>
            <div class="stat-value">{{ creditInfo.maxCredits || 20 }}</div>
            <div class="stat-subtitle">Maximum Credits</div>
          </el-card>
        </el-col>
        <el-col :span="6">
          <el-card shadow="hover" class="stat-card">
            <div class="stat-title">剩余学分</div>
            <div class="stat-value" :style="{ color: remainingCredits <= 5 ? '#F56C6C' : '#67C23A' }">
              {{ remainingCredits }}
            </div>
            <div class="stat-subtitle">Remaining Credits</div>
          </el-card>
        </el-col>
        <el-col :span="6">
          <el-card shadow="hover" class="stat-card">
            <div class="stat-title">使用比例</div>
            <div class="stat-value" :style="{ color: percentage >= 90 ? '#F56C6C' : '#409EFF' }">
              {{ percentage.toFixed(1) }}%
            </div>
            <el-progress
              :percentage="percentage"
              :status="getProgressStatus(percentage)"
              :stroke-width="8"
              style="margin-top: 10px;"
            />
          </el-card>
        </el-col>
      </el-row>

      <el-card shadow="never" style="margin-bottom: 20px;">
        <template #header>
          <span>学分使用进度</span>
        </template>
        <div style="padding: 0 20px;">
          <el-progress
            :percentage="percentage"
            :stroke-width="20"
            :color="customColors"
            :text-inside="true"
          />
          <div class="progress-labels">
            <span>0</span>
            <span>{{ Math.floor(creditInfo.maxCredits * 0.25) }}</span>
            <span>{{ Math.floor(creditInfo.maxCredits * 0.5) }}</span>
            <span>{{ Math.floor(creditInfo.maxCredits * 0.75) }}</span>
            <span>{{ creditInfo.maxCredits }}</span>
          </div>
        </div>
      </el-card>

      <el-card shadow="never">
        <template #header>
          <span>已选课程详情</span>
        </template>
        <el-table :data="courseList" v-loading="loading">
          <el-table-column label="课程代码" prop="courseCode" width="120" align="center" />
          <el-table-column label="课程名称" prop="courseName" />
          <el-table-column label="课程类型" prop="courseType" width="100" align="center">
            <template #default="scope">
              <el-tag :type="scope.row.courseType === '必修' ? 'danger' : 'success'" size="small">
                {{ scope.row.courseType }}
              </el-tag>
            </template>
          </el-table-column>
          <el-table-column label="学分" prop="creditHours" width="80" align="center" />
          <el-table-column label="状态" width="100" align="center">
            <template #default="scope">
              <el-tag :type="scope.row.status === 'ENROLLED' ? 'success' : 'info'" size="small">
                {{ scope.row.status === 'ENROLLED' ? '在读' : '已结课' }}
              </el-tag>
            </template>
          </el-table-column>
          <el-table-column label="成绩" width="100" align="center">
            <template #default="scope">
              <el-tag v-if="scope.row.grade !== null" :type="getGradeTagType(scope.row.grade)" size="small">
                {{ scope.row.grade }}
              </el-tag>
              <span v-else>--</span>
            </template>
          </el-table-column>
        </el-table>

        <div style="margin-top: 20px; padding: 15px; background: #f8f9fa; border-radius: 4px;">
          <el-row :gutter="20">
            <el-col :span="8">
              <div class="summary-item">
                <div class="summary-label">必修课学分</div>
                <div class="summary-value">{{ requiredCredits }}</div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="summary-item">
                <div class="summary-label">选修课学分</div>
                <div class="summary-value">{{ electiveCredits }}</div>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="summary-item">
                <div class="summary-label">平均分</div>
                <div class="summary-value">{{ averageGrade.toFixed(1) }}</div>
              </div>
            </el-col>
          </el-row>
        </div>
      </el-card>

      <el-alert
        :title="statusMessage"
        :type="statusType"
        :closable="false"
        show-icon
        style="margin-top: 20px;"
      />
    </el-card>
  </div>
</template>

<script setup name="StudentCredits">
import { ref, reactive, computed, onMounted } from 'vue'
import { ElMessage } from 'element-plus'

const loading = ref(false)
const useMock = ref(true)
const currentTerm = ref('2024-2025-1')

const termOptions = ref([
  { termId: '2024-2025-1', termName: '2024-2025秋季学期' },
  { termId: '2024-2025-2', termName: '2024-2025冬季学期' }
])

const creditInfo = reactive({
  studentId: null,
  termId: '',
  currentCredits: 0,
  maxCredits: 20
})

const courseList = ref([
  {
    courseId: 1,
    courseCode: 'CS101',
    courseName: '计算机基础',
    courseType: '必修',
    creditHours: 3,
    status: 'ENROLLED',
    grade: 85.5
  },
  {
    courseId: 2,
    courseCode: 'MATH201',
    courseName: '高等数学',
    courseType: '必修',
    creditHours: 4,
    status: 'ENROLLED',
    grade: 92
  },
  {
    courseId: 3,
    courseCode: 'ENG301',
    courseName: '大学英语',
    courseType: '选修',
    creditHours: 2,
    status: 'ENROLLED',
    grade: null
  },
  {
    courseId: 4,
    courseCode: 'PHY101',
    courseName: '大学物理',
    courseType: '选修',
    creditHours: 3,
    status: 'COMPLETED',
    grade: 78.5
  }
])

const percentage = computed(() => {
  return creditInfo.currentCredits ? (creditInfo.currentCredits / creditInfo.maxCredits) * 100 : 0
})

const remainingCredits = computed(() => Math.max(0, creditInfo.maxCredits - creditInfo.currentCredits))

const requiredCredits = computed(() => {
  return courseList.value
    .filter(course => course.courseType === '必修' && course.status === 'ENROLLED')
    .reduce((sum, course) => sum + course.creditHours, 0)
})

const electiveCredits = computed(() => {
  return courseList.value
    .filter(course => course.courseType === '选修' && course.status === 'ENROLLED')
    .reduce((sum, course) => sum + course.creditHours, 0)
})

const averageGrade = computed(() => {
  const gradedCourses = courseList.value.filter(course => course.grade !== null && course.grade !== undefined)
  if (gradedCourses.length === 0) return 0
  const total = gradedCourses.reduce((sum, course) => sum + course.grade, 0)
  return total / gradedCourses.length
})

const statusMessage = computed(() => {
  if (percentage.value >= 100) {
    return '学分已满，无法继续选课'
  } else if (percentage.value >= 90) {
    return '学分接近上限，请谨慎选课'
  } else if (percentage.value >= 70) {
    return '学分使用正常，可继续选课'
  }
  return '学分充足，可自由选课'
})

const statusType = computed(() => {
  if (percentage.value >= 100) return 'error'
  if (percentage.value >= 90) return 'warning'
  if (percentage.value >= 70) return 'info'
  return 'success'
})

const customColors = [
  { color: '#67C23A', percentage: 70 },
  { color: '#E6A23C', percentage: 90 },
  { color: '#F56C6C', percentage: 100 }
]

function loadCreditStats() {
  loading.value = true

  if (useMock.value) {
    const totalCredits = courseList.value
      .filter(course => course.status === 'ENROLLED')
      .reduce((sum, course) => sum + course.creditHours, 0)

    creditInfo.termId = currentTerm.value
    creditInfo.currentCredits = totalCredits
    creditInfo.maxCredits = 20
    creditInfo.status = totalCredits >= 20 ? '已满' : '可选'

    loading.value = false
    ElMessage.success('学分统计加载完成（开发模式）')
    return
  }

  // 集成阶段可在此调用真实接口
  loading.value = false
}

function getProgressStatus(val) {
  if (val >= 100) return 'exception'
  if (val >= 90) return 'warning'
  return 'success'
}

function getGradeTagType(grade) {
  if (grade >= 90) return 'success'
  if (grade >= 80) return 'warning'
  if (grade >= 60) return 'info'
  return 'danger'
}

onMounted(() => {
  loadCreditStats()
})
</script>

<style scoped>
.app-container {
  padding: 20px;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.stat-card {
  text-align: center;
  height: 120px;
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.stat-title {
  font-size: 14px;
  color: #909399;
  margin-bottom: 8px;
}

.stat-value {
  font-size: 32px;
  font-weight: bold;
  color: #303133;
  margin-bottom: 4px;
}

.stat-subtitle {
  font-size: 12px;
  color: #c0c4cc;
}

.progress-labels {
  display: flex;
  justify-content: space-between;
  margin-top: 8px;
  color: #909399;
  font-size: 12px;
}

.summary-item {
  text-align: center;
  padding: 10px;
}

.summary-label {
  font-size: 14px;
  color: #606266;
  margin-bottom: 8px;
}

.summary-value {
  font-size: 24px;
  font-weight: bold;
  color: #409eff;
}

@media (max-width: 768px) {
  .stat-card {
    height: 100px;
  }

  .stat-value {
    font-size: 24px;
  }
}
</style>
