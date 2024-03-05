<template>
    <el-table :data="tableData" style="width: 100%" :header-cell-style="headerStyle">
        <el-table-column prop="musicName" label="歌曲名" width="340">
        </el-table-column>
        <el-table-column prop="musicianName" label="歌手名" width="340">
        </el-table-column>
        <el-table-column label="播放" width="340">
            <template slot-scope="scope">
                <!-- 播放按钮 -->
                <el-button class="button" type="text" :icon="'el-icon-video-play'" @click="redirectToPlay(scope.row)">
                </el-button>
            </template>
        </el-table-column>
        <el-table-column label="取消收藏" width="220">
            <template slot-scope="scope">
                <el-button class="dislike" type="text" :icon="'el-icon-delete'" @click="deleteFavorite(scope.row)">
                </el-button>
            </template>
        </el-table-column>
    </el-table>
</template>

<script>
import axios from 'axios'
import { deleteLike } from '../../api/like'
export default {
    data() {
        return {
            tableData: []
        }
    },
    mounted() {
        const userId = 1; // 假设用户ID为1，你可以根据实际情况获取当前用户的ID
        axios.get(`http://localhost:8888/listening/like/${userId}`)
            .then(response => {
                const songList = response.data;
                this.tableData = songList;
                console.log(this.tableData)
            })
            .catch(error => {
                console.error(error);
            });
    },
    methods: {
        redirectToPlay(tableData) {
            console.log(tableData);
            this.showPlayPage = true;
            this.$router.push({ path: '/play', query: { tableData } });
            this.playMusic();
        },
        deleteFavorite(tableData) {
            console.log(tableData.musicName);
            deleteLike(1, tableData.musicName)
                .then(() => {
                    // Remove the deleted song from tableData array
                    const index = this.tableData.findIndex(item => item.musicName === tableData.musicName);
                    if (index !== -1) {
                        this.tableData.splice(index, 1);
                    }
                })
                .catch(error => {
                    console.error(error);
                });
        },
        headerStyle({ row, column, rowIndex, columnIndex }) {
            let cellStyle1;
            cellStyle1 = "color: #fff; background:#528f65"
            if (columnIndex >= 0 && columnIndex < 14 && rowIndex === 0) {
                return cellStyle1;
            }
        },
    }
}
</script>