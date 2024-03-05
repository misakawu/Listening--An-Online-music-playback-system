<template>
    <div class="table-container">
        <el-table :data="tableData" style="width: 100%; background: transparent; border-color: transparent;"
            :header-cell-style="headerStyle">
            <el-table-column prop="music" label="歌曲名" width="180">
            </el-table-column>
            <el-table-column prop="name" label="歌手名" width="180">
            </el-table-column>
            <el-table-column label="播放" width="180">
                <template slot-scope="scope">
                    <el-button class="button" type="text" :icon="'el-icon-video-play'"
                        @click="redirectToPlay(scope.row.musicURL)">
                    </el-button>
                </template>
            </el-table-column>
            <el-table-column label="收藏" width="180">
                <template slot-scope="scope">
                    <el-button class="favorite" type="text" :icon="isFavorite ? 'el-icon-star-on' : 'el-icon-star-off'"
                        @click="toggleFavorite"></el-button>
                </template>
            </el-table-column>
        </el-table>
    </div>
</template>

<script>
export default {
    data() {
        return {
            tableData: [{
                music: '笼',
                name: '张碧晨',
            }, {
                music: '听悲伤的情歌',
                name: '苏星婕',
            }, {
                music: '闪光的童话',
                name: '刘雨昕',
            }, {
                music: '野',
                name: '赞多',
            }, {
                music: '崇拜',
                name: '薛之谦',
            }, {
                music: '原生纯萃',
                name: '檀健次',
            }, {
                music: '春泥',
                name: 'en',
            }, {
                music: '悲伤的爱情',
                name: '任夏',
            }, {
                music: '不是告别',
                name: '伯远',
            }, {
                music: '轻轻',
                name: '张靓颖',
            },
            ]
        }
    },
    methods: {
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
    left: 32%;
}
</style>