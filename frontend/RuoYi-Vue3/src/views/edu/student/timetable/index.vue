<template>
  <div class="app-container">
    <el-card>
      <template #header>
        <div class="card-header">
          <span>我的课表</span>
          <el-tag type="info">{{ currentTermName || '未设置当前学期' }}</el-tag>
        </div>
      </template>

      <el-table :data="timetableData" border style="width: 100%">
        <el-table-column label="时间" width="80" align="center" fixed>
          <template #default="{ row }">
            第{{ row.timeSlot }}节
          </template>
        </el-table-column>
        <el-table-column
          v-for="day in 7"
          :key="day"
          :label="'周' + ['一', '二', '三', '四', '五', '六', '日'][day - 1]"
          align="center"
        >
          <template #default="{ row }">
            <div
              v-if="row.courses[day]"
              class="course-cell"
              :style="{ backgroundColor: getCourseColor(row.courses[day].courseId) }"
            >
              <div class="course-name">{{ row.courses[day].courseName }}</div>
              <div class="course-time">{{ row.courses[day].time }}</div>
              <div class="course-teacher">{{ row.courses[day].teacherName }}</div>
              <div class="course-location">{{ row.courses[day].location }}</div>
            </div>
          </template>
        </el-table-column>
      </el-table>

      <div style="margin-top: 20px; display: flex; gap: 10px; flex-wrap: wrap;">
        <div v-for="course in courseList" :key="course.courseId" class="legend-item">
          <div class="color-box" :style="{ backgroundColor: getCourseColor(course.courseId) }"></div>
          <span>{{ course.courseName }}</span>
        </div>
      </div>

      <el-alert
        v-if="useMock"
        title="开发模式：使用Mock课表数据"
        type="info"
        :closable="false"
        show-icon
        style="margin-top: 20px;"
      />
    </el-card>
  </div>
</template>

<script setup>
import { ref, onMounted, computed } from 'vue'
import { getTimetable } from '@/api/edu/student/course'

const useMock = ref(false)
const slots = ref([])
const courseList = ref([])
const currentTermName = ref('')

function getCourseColor(courseId) {
  const colors = ['#409EFF', '#67C23A', '#E6A23C', '#F56C6C', '#909399']
  return colors[courseId % colors.length] || colors[0]
}

const timetableData = computed(() => {
  const data = []
  for (let i = 1; i <= 12; i++) {
    const row = { timeSlot: i, courses: {} }
    slots.value.forEach(slot => {
      if (slot.start_slot <= i && slot.end_slot >= i) {
        const courseId = slot.class_id
        const courseName = slot.course_name || slot.courseName
        const time = `${slot.start_slot}-${slot.end_slot}节`
        const location = slot.location
        const teacherName = slot.teacher_name || slot.teacherName
        const weekDay = slot.week_day
        row.courses[weekDay] = {
          courseId,
          courseName,
          time,
          location,
          teacherName
        }
      }
    })
    data.push(row)
  }
  return data
})

async function loadTimetable() {
  try {
    const res = await getTimetable()
    const data = res.data || res
    slots.value = data.slots || []
    currentTermName.value = data.termName || ''
    const map = {}
    slots.value.forEach(s => {
      const key = s.class_id || s.classId
      map[key] = s.course_name || s.courseName || `课程${key}`
    })
    courseList.value = Object.keys(map).map(id => ({ courseId: Number(id), courseName: map[id] }))
  } catch (e) {
    slots.value = []
    courseList.value = []
    currentTermName.value = ''
  }
}

onMounted(() => {
  loadTimetable()
  window.addEventListener('edu_enrollment_changed', loadTimetable)
})
</script>

<style scoped>
.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.course-cell {
  padding: 8px;
  border-radius: 4px;
  color: white;
  text-align: center;
  cursor: pointer;
  transition: all 0.3s;
}

.course-cell:hover {
  transform: scale(1.02);
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1);
}

.course-name {
  font-weight: bold;
  font-size: 14px;
  margin-bottom: 4px;
}

.course-time,
.course-location {
  font-size: 12px;
  opacity: 0.9;
}

.legend-item {
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 4px 8px;
  background: #f5f7fa;
  border-radius: 4px;
}

.color-box {
  width: 16px;
  height: 16px;
  border-radius: 3px;
}
</style>
