<template>
    <div class="tags">
        <el-tag v-for="(item, index) in tagdata" :key="item.name" :closable="item.name != 'index'"
            :effect="$route.name === item.name ? 'dark' : 'plain'" @close="handleClose(item, index)"
            @click="handleClick(item, index)">
            {{ item.lable }}
        </el-tag>
    </div>
</template>
<script>
export default {
  data () {
    return {
      /* tagdata中的数据格式
                       tagdata: [{"menuid": 1,"path": "/index","name": "index","lable": "首页","icon": "el-icon-house","children": [] }]
                       */
    }
  },
  computed: {
    tagdata () {
      return this.$store.state.taglist
    }
  },
  methods: {
    // 删除标签
    handleClose (tag, index) {
      // 删除集合中的标签数据
      this.$store.commit('closeTag', tag)
      const length = this.tagdata.length
      if (tag.name !== this.$route.name) {
        return
      }
      if (length === 1) {
        this.$router.push({ path: '/index' })
      } else if (index === length) {
        // 如果这两个值相等，就表明当前我们点击的是最后一个tag标签，则事件触发后跳转到左侧的标签
        this.$router.push({ name: this.tagdata[index - 1].name })
      } else {
        // 如果不相等，即只有一种可能性，即当前事件触发的索引不是最后一个，且只会是中间的，那么就跳转到右侧正序的标签
        this.$router.push({ name: this.tagdata[index].name })
      }
    },
    // 标签点击
    handleClick (tag, index) {
      if (index == 0) {
        this.$router.push({ path: '/index' })
        return
      }
      this.$router.push({ name: tag.name })
    }
  }
}
</script>
<style scoped>
.tags {
    width: 100%;
    height: 30px;
    background-color: rgb(213, 244, 225);
}

.tags span {
    height: 30px;
    font-size: 13px;
    line-height: 27px;
    cursor: pointer;
}
</style>
