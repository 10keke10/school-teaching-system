<template>
  <div class="app-container">
    <el-card>
      <template #header>
        <span>成绩管理</span>
      </template>
      <el-table :data="gradeList" stripe>
        <el-table-column prop="studentId" label="学号" width="120" />
        <el-table-column prop="studentName" label="学生" />
        <el-table-column prop="courseName" label="课程" />
        <el-table-column prop="grade" label="成绩" width="140">
          <template #default="scope">
            <el-input-number v-model="scope.row.grade" :min="0" :max="100" size="small" />
          </template>
        </el-table-column>
        <el-table-column prop="gradeStatus" label="状态" width="160">
          <template #default="scope">
            <el-tag :type="scope.row.gradeStatus === 'PUBLISHED' ? 'success' : 'info'">
              {{ scope.row.gradeStatus === 'PUBLISHED' ? '已发布' : '草稿' }}
            </el-tag>
          </template>
        </el-table-column>
      </el-table>
      <div class="actions" style="margin-top: 12px; text-align: right;">
        <el-button type="primary" @click="handlePublish">发布成绩</el-button>
      </div>
    </el-card>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { ElMessage } from 'element-plus'

const gradeList = ref([
  {
    studentId: 'S2001',
    studentName: '张三',
    courseName: '计算机基础',
    grade: 95,
    gradeStatus: 'PUBLISHED'
  },
  {
    studentId: 'S2002',
    studentName: '李四',
    courseName: '计算机基础',
    grade: 87,
    gradeStatus: 'DRAFT'
  }
])

function handlePublish() {
  gradeList.value.forEach(item => {
    item.gradeStatus = 'PUBLISHED'
  })
  ElMessage.success('成绩发布成功（开发模式）')
}
</script>
