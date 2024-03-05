<template>
    <div class="table-container">
        <el-table :data="tableData" style="width: 100%; background: transparent; border-color: transparent;"
            :header-cell-style="headerStyle">
            <el-table-column prop="music" label="歌曲名" width="180">
            </el-table-column>
            <el-table-column prop="name" label="歌手名" width="210">
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
                music: 'Self Love',
                name: 'Metro Boomin',
            }, {
                music: 'On Of The Girls',
                name: 'The Weeknd',
            }, {
                music: 'Barbie World',
                name: 'Nicki Minaj',
            }, {
                music: 'See You Again',
                name: 'The Chainsmokers',
            }, {
                music: 'BABYDOLL',
                name: 'Ari Abdul',
            }, {
                music: 'Symphony',
                name: 'Imagine Dragons',
            }, {
                music: 'Annihilate',
                name: 'Metro Boomin',
            }, {
                music: 'Am I Dreaming',
                name: 'Metro Boomin',
            }, {
                music: 'Calling',
                name: 'Metro Boomin',
            }, {
                music: 'World Class Sinnner',
                name: 'Lily-Rose Depp',
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
    left: 31%;
}
</style>