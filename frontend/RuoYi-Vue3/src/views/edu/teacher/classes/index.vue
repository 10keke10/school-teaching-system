<template>
  <div class="app-container">
    <el-card>
      <template #header>
        <span>我的班级</span>
      </template>
      <el-table :data="classList" stripe>
        <el-table-column prop="className" label="班级名称" />
        <el-table-column prop="courseName" label="课程" />
        <el-table-column prop="studentCount" label="学生数" width="120" />
        <el-table-column prop="status" label="状态" width="120" />
        <el-table-column label="操作" width="180">
          <template #default="scope">
            <el-button type="primary" size="small" @click="handleViewStudents(scope.row)">
              查看学生
            </el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-card>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { ElMessage } from 'element-plus'

const classList = ref([
  {
    classId: 1,
    className: '计算机基础班',
    courseName: '计算机基础',
    studentCount: 32,
    status: '开放选课'
  },
  {
    classId: 2,
    className: '高等数学班',
    courseName: '高等数学',
    studentCount: 28,
    status: '已满'
  }
])

function handleViewStudents(row) {
  ElMessage.info(`班级 ${row.className} 有 ${row.studentCount} 名学生`)
}
</script>
