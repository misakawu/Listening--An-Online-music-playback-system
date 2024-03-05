<template>
    <div class="table-container">
        <el-table :data="tableData" style="width: 100%" class="custom-table" :header-cell-style="headerStyle">
            <el-table-column prop="musicName" label="歌曲名" width="180">
            </el-table-column>
            <el-table-column prop="musicianName" label="歌手名" width="180">
            </el-table-column>
            <el-table-column label="播放" width="180">
                <template slot-scope="scope">
                    <!-- 播放按钮 -->
                    <el-button class="button" type="text" :icon="'el-icon-video-play'" @click="redirectToPlay(scope.row)">
                    </el-button>
                </template>
            </el-table-column>
            <el-table-column label="收藏" width="180">
                <template slot-scope="scope">
                    <!-- 收藏按钮 -->
                    <el-button class="favorite" type="text"
                        :icon="scope.row.isFavorite ? 'el-icon-star-on' : 'el-icon-star-off'"
                        @click="toggleFavorite(scope.row)"></el-button>
                </template>
            </el-table-column>
        </el-table>
    </div>
</template>

<script>
import axios from 'axios';
import { insertLike } from '../../api/like'
import { checkifin } from '../../api/like'
export default {
    data() {
        return {
            tableData: [],  // 存储后端返回的歌曲列表数据
            isFavorite: true,
        }
    },
    mounted() {
        axios.get('http://localhost:8888/listening/random')
            .then(response => {
                this.tableData = response.data;
                console.log(this.tableData);
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

        toggleFavorite(tableData) {
            console.log(checkifin(1, tableData.musicName))
            checkifin(1, tableData.musicName)
                .then((response) => {
                    if (response == 0) {
                        console.log(tableData.musicName);
                        console.log(tableData.musicID);
                        insertLike(1, tableData.musicID)
                            .then(() => {
                                this.$notify({
                                    title: '收藏成功',
                                    message: '可前往我的收藏页面查看',
                                    type: 'success',
                                    duration: 1500
                                });
                            })
                            .catch(error => {
                                console.error(error);
                            });
                    } else {
                        this.$notify({
                            title: '该歌曲已被收藏',
                            message: '可前往我的收藏页面查看',
                            type: 'warning',
                            duration: 1500
                        });
                    }
                })
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
<style scoped>
.table-container {
    display: flex;
    justify-content: center;
    position: absolute;
    left: 31%;
}
</style>