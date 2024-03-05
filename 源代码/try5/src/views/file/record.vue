<template>
    <el-table :data="tableData" style="width: 100%">
        <el-table-column prop="musicName" label="歌曲名" width="180">
        </el-table-column>
        <el-table-column prop="musicianName" label="歌手名" width="180">
        </el-table-column>
        <el-table-column prop="time" label="播放时间" width="180">
        </el-table-column>
    </el-table>
</template>

<script>
export default {
    data() {
        return {

        }
    }
}
</script>