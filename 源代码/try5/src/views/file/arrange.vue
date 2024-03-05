<template>
    <el-table :data="tableData" style="width: 100%" class="custom-table" :header-cell-style="headerStyle"
        :row-class-name="tableRowClassName">
        <el-table-column prop="musicName" label="歌曲名" width="300">
        </el-table-column>
        <el-table-column prop="musicianName" label="歌手名" width="250">
        </el-table-column>
        <el-table-column prop="like" label="收藏数" width="250">
        </el-table-column>
        <el-table-column label="播放" width="250">
            <template slot-scope="scope">
                <!-- 播放按钮 -->
                <el-button class="button" type="text" :icon="'el-icon-video-play'" @click="redirectToPlay(scope.row)">
                </el-button>
            </template>
        </el-table-column>
        <el-table-column label="收藏" width="180">
            <template slot-scope="scope">
                <!-- 收藏按钮 -->
                <el-button class="favorite" type="text" :icon="'el-icon-star-off'"
                    @click="toggleFavorite(scope.row)"></el-button>
            </template>
        </el-table-column>
    </el-table>
</template>

<script>
import axios from 'axios';
import { insertLike } from '../../api/like'
import { checkifin } from '../../api/like'
export default {
    data() {
        return {
            tableData: [],  // 存储后端返回的歌曲列表数据
        }
    },
    mounted() {
        axios.get(`http://localhost:8888/listening/list`)
            .then(response => {
                // 根据收藏数从高到低进行排序
                const sortedSongs = response.data.sort((a, b) => b.like - a.like);

                // 将排序后的歌曲列表赋值给 tableData
                this.tableData = sortedSongs;
                console.log(this.tableData);
            })
            .catch(error => {
                console.error(error)
            })
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

        tableRowClassName({ row, rowIndex }) {
            if (rowIndex == 0) {
                return 'warning-row';
            } else {
                return {
                    color: '#fff',
                    background: '#528f65'
                };
            }
        },
    }
}
</script>
<style scoped>
.custom-table tr:hover>td {
    background-color: #63aa7a;
}
</style>