<template>
  
  <div>
    <div class="header-container">
     <!-- 头部查询音乐框 -->
     
    <el-input v-model="MusicID" placeholder="ID"></el-input>
     <el-input v-model="MusicName" placeholder="音乐名称"></el-input>
      <el-input v-model="MusicianName" placeholder="音乐作者"></el-input>
      <!--<el-input v-model="MusicBackground" placeholder="音乐背景"></el-input>
      <el-input v-model="MusicData" placeholder="音乐地址"></el-input>-->
      <el-upload
      action="http://www.mocky.io/v2/5cc8019d300000980a055e76"
      :on-change="handleChange0">
      <el-button v-model="MusicBackground" size="medium" type="primary">选取图片</el-button>
      </el-upload>
    
      <el-upload
      action="http://www.mocky.io/v2/5cc8019d300000980a055e76"
      :on-change="handleChange1">
      <el-button v-model="MusicData" size="medium" type="primary">选取地址</el-button>
    </el-upload>
    <el-input v-model="Like" placeholder="收藏数"></el-input>
      <el-button type="primary" @click="addMusic">添加音乐信息</el-button>
      
      
      
    </div>
   
    <br>

    <el-input
        v-model="searchText"
        placeholder="筛选音乐信息"
        clearable
        @clear="searchMusic"
        @enter="searchMusic"
        style="width: 200px">
      </el-input>


    <!-- 数据库数据展示表格 -->
    <el-table :data="filteredMusicList" style="width: 100%">
      <el-table-column label="MusicID">
        <template v-slot="scope">{{ scope.row.MusicID }}</template>
      </el-table-column>
      <el-table-column label="MusicName">
        <template v-slot="scope">{{ scope.row.MusicName }}</template>
      </el-table-column>
      <el-table-column label="MusicianName">
        <template v-slot="scope">{{ scope.row.MusicianName }}</template>
      </el-table-column>
      <el-table-column label="MusicBackground">
        <template v-slot="scope">{{ scope.row.MusicBackground }}</template>
      </el-table-column>
      <el-table-column label="MusicData">
        <template v-slot="scope">{{ scope.row.MusicData }}</template>
      </el-table-column>
      <el-table-column label="Like">
        <template v-slot="scope">{{ scope.row.Like }}</template>
      </el-table-column>
      <el-table-column label="操作">
        <template v-slot="scope">
          <el-button type="danger" size="small" @click="deleteMusic(scope.row.MusicID)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
export default {
  data() {
    return {
      filePath: '',
      searchText: "",     // 搜索音乐的关键词
      dialogVisible: false,
      MusicID: '',
      MusicName: '',
      MusicianName: '',
      MusicBackground: '',
      MusicData: '',
      Like: '',
      musicList: [        // 从数据库中获取的音乐列表数据
        {
          MusicID: 1,
          MusicName: "逆战",
          MusicianName: "张杰",
          MusicBackground: "/img/singerPic/1586090939016Josh Ritter.jpg",
          MusicData: "/song/a_hisa - night.mp3",
          Like: 45
        },
        {
          MusicID: 2,
          MusicName: "泡沫",
          MusicianName: "邓紫棋",
          MusicBackground: "/img/singerPic/dengziqi.jpg",
          MusicData: "/song/G.E.M.邓紫棋-泡沫.mp3",
          Like: 34
        },
        {
          MusicID: 3,
          MusicName: "夜空中最亮的星",
          MusicianName: "邓紫棋",
          MusicBackground: "/img/singerPic/dengziqi.jpg",
          MusicData: "/song/G.E.M.邓紫棋-夜空中最亮的星.mp3",
          Like: 88
        },
        {
          MusicID: 4,
          MusicName: "七里香",
          MusicianName: "周杰伦",
          MusicBackground: "/img/singerPic/zhoujielun.jpg",
          MusicData: "/song/周杰伦-七里香.mp3",
          Like: 6
        },
        {
          MusicID: 5,
          MusicName: "晴天",
          MusicianName: "周杰伦",
          MusicBackground: "/img/singerPic/zhoujielun.jpg",
          MusicData: "/song/周杰伦-晴天.mp3",
          Like: 26
        },
        {
          MusicID: 6,
          MusicName: "告白气球",
          MusicianName: "周杰伦",
          MusicBackground: "/img/singerPic/zhoujielun.jpg",
          MusicData: "/song/周杰伦-告白气球.mp3",
          Like: 34
        },
        {
          MusicID: 7,
          MusicName: "如果我们不曾相遇",
          MusicianName: "五月天",
          MusicBackground: "/img/singerPic/1586076633782五月天.jpg",
          MusicData: "/song/五月天-如果我们不曾相遇.mp3",
          Like: 91
        },
        {
          MusicID: 8,
          MusicName: "倔强",
          MusicianName: "五月天",
          MusicBackground: "/img/singerPic/1586076633782五月天.jpg",
          MusicData: "/song/五月天-倔强.mp3",
          Like: 42
        },{
          MusicID: 9,
          MusicName: "倩女幽魂",
          MusicianName: "张国荣",
          MusicBackground: "/img/singerPic/zhangguorong.jpg",
          MusicData: "/song/张国荣-倩女幽魂.m4a",
          Like: 94
        },{
          MusicID: 10,
          MusicName: "最冷一天",
          MusicianName: "张国荣",
          MusicBackground: "/img/singerPic/zhangguorong.jpg",
          MusicData: "/song/张国荣-最冷一天.mp3",
          Like: 34
        },{
          MusicID: 11,
          MusicName: "他不懂",
          MusicianName: "张杰",
          MusicBackground: "/img/singerPic/zhangjie.jpg",
          MusicData: "/song/张杰-他不懂.mp3",
          Like: 16
        },{
          MusicID: 12,
          MusicName: "剑心",
          MusicianName: "张杰",
          MusicBackground: "/img/singerPic/zhangjie.jpg",
          MusicData: "/song/张杰-剑心.mp3",
          Like: 51
        },{
          MusicID: 13,
          MusicName: "一吻之间",
          MusicianName: "张碧晨",
          MusicBackground: "/img/singerPic/zhangbichen.jpg",
          MusicData: "/song/张碧晨-一吻之间.mp3",
          Like: 43
        },{
          MusicID: 14,
          MusicName: "平凡之路",
          MusicianName: "朴树",
          MusicBackground: "/img/singerPic/pushu.jpg",
          MusicData: "/song/朴树-平凡之路.mp3",
          Like: 56
        },{
          MusicID: 15,
          MusicName: "泡沫",
          MusicianName: "邓紫棋",
          MusicBackground: "/img/singerPic/dengziqi.jpg",
          MusicData: "/song/G.E.M.邓紫棋-泡沫.mp3",
          Like: 34
        },{
          MusicID: 16,
          MusicName: "Shadow (그림자)",
          MusicianName: "梁耀燮",
          MusicBackground: "/img/singerPic/liangyaoxie.jpg",
          MusicData: "/song/梁耀燮-Shadow (그림자).mp3",
          Like: 95
        },{
          MusicID: 17,
          MusicName: "你就不要想起我",
          MusicianName: "田馥甄",
          MusicBackground: "/img/singerPic/tianfuzhen.jpg",
          MusicData: "/song/田馥甄-你就不要想起我.mp3",
          Like: 34
        },{
          MusicID: 18,
          MusicName: "一千年以后",
          MusicianName: "林俊杰",
          MusicBackground: "/img/singerPic/1646507266498IMG_4801.jpg",
          MusicData: "/song/林俊杰-一千年以后.mp3",
          Like: 100
        },{
          MusicID: 19,
          MusicName: "关键词",
          MusicianName: "林俊杰",
          MusicBackground: "/img/singerPic/1646507266498IMG_4801.jpg",
          MusicData: "/song/林俊杰-关键词.mp3",
          Like: 89
        },{
          MusicID: 20,
          MusicName: "学不会",
          MusicianName: "林俊杰",
          MusicBackground: "/img/singerPic/1646507266498IMG_4801.jpg",
          MusicData: "/song/林俊杰-学不会.mp3",
          Like: 42
        },{
          MusicID: 21,
          MusicName: "期待爱",
          MusicianName: "林俊杰",
          MusicBackground: "/img/singerPic/1646507266498IMG_4801.jpg",
          MusicData: "/song/林俊杰-期待爱.mp3",
          Like: 45
        },{
          MusicID: 22,
          MusicName: "江南",
          MusicianName: "林俊杰",
          MusicBackground: "/img/singerPic/1646507266498IMG_4801.jpg",
          MusicData: "/song/林俊杰-江南.mp3",
          Like: 100
        },{
          MusicID: 23,
          MusicName: "醉赤壁",
          MusicianName: "林俊杰",
          MusicBackground: "/img/singerPic/1646507266498IMG_4801.jpg",
          MusicData: "/song/林俊杰-醉赤壁.mp3",
          Like: 64
        },{
          MusicID: 24,
          MusicName: "无问",
          MusicianName: "毛不易",
          MusicBackground: "/img/singerPic/maobuyi.jpg",
          MusicData: "/song/毛不易-无问.mp3",
          Like: 60
        },{
          MusicID: 25,
          MusicName: "那时的我们",
          MusicianName: "毛不易",
          MusicBackground: "/img/singerPic/maobuyi.jpg",
          MusicData: "/song/毛不易-那时的我们.mp3",
          Like: 70
        },{
          MusicID: 26,
          MusicName: "不要说话",
          MusicianName: "陈奕迅",
          MusicBackground: "/img/singerPic/chenyixun.jpg",
          MusicData: "/song/陈奕迅-不要说话.mp3",
          Like: 80
        },{
          MusicID: 27,
          MusicName: "红玫瑰",
          MusicianName: "陈奕迅",
          MusicBackground: "/img/singerPic/chenyixun.jpg",
          MusicData: "/song/陈奕迅-红玫瑰.mp3",
          Like: 34
        },
        {
          MusicID: 28,
          MusicName: "陪你度过漫长岁月",
          MusicianName: "陈奕迅",
          MusicBackground: "/img/singerPic/chenyixun.jpg",
          MusicData: "/song/陈奕迅-陪你度过漫长岁月.mp3",
          Like: 51
        },
        {
          MusicID: 29,
          MusicName: "Change of Time",
          MusicianName: "Josh Ritter",
          MusicBackground: "/img/singerPic/1586090939016Josh Ritter.jpg",
          MusicData: "/song/Josh Ritter - Change of Time.mp3",
          Like: 85
        },
        {
          MusicID: 30,
          MusicName: "Darlin",
          MusicianName: "Josh Ritter",
          MusicBackground: "/img/singerPic/1586090939016Josh Ritter.jpg",
          MusicData: "/song/Josh Ritter - Darlin.mp3",
          Like: 56
        },
        {
          MusicID: 31,
          MusicName: "I Am Piano",
          MusicianName: "Peter Broderick",
          MusicBackground: "/img/singerPic/1586081310686Peter Broderick.jpeg",
          MusicData: "/song/Peter Broderick - I Am Piano.mp3",
          Like: 9
        },
        {
          MusicID: 32,
          MusicName: "The Children",
          MusicianName: "Ramin Djawadi",
          MusicBackground: "/img/singerPic/1586078732611Ramin Djawadi.jpg",
          MusicData: "/song/Ramin Djawadi-The Children.mp3",
          Like: 7
        },
        {
          MusicID: 33,
          MusicName: "Let It Go",
          MusicianName: "The Piano Guys",
          MusicBackground: "/img/singerPic/1586089570101the piano guys.jpg",
          MusicData: "/song/The Piano Guys-Let It Go.mp3",
          Like: 72
        },
        {
          MusicID: 34,
          MusicName: "Stupid",
          MusicianName: "Tone Damli Aaberge",
          MusicBackground: "/img/singerPic/1586091104616Tone Damli Aaberge.jpg",
          MusicData: "/song/Tone Damli Aaberge - Stupid.mp3",
          Like: 33
        },
        {
          MusicID: 35,
          MusicName: "Soundtrack",
          MusicianName: "Various Artists",
          MusicBackground: "/img/singerPic/dengziqi.jpg",
          MusicData: "/song/Soundtrack-Zoosters Breakout.mp3",
          Like: 48
        },
        // 其他音乐数据...
      ],
      newMusic: {
        MusicID: "",
        MusicName: "",
        MusicianName: "",
        MusicBackground: "",
        MusicData: "",
        Like: ""
      },
   
      isAddMusicFormVisible: false    // 控制添加音乐表单的显示与隐藏
    };
  },
  computed: {
    filteredMusicList() {
      // 根据搜索关键词过滤音乐列表
      return this.musicList.filter(music => {
  const searchTextLower = this.searchText.toLowerCase();
  const musicIdLower = music.MusicID.toString().toLowerCase();
  const musicianNameLower = music.MusicianName.toLowerCase();

  return (
    musicIdLower.includes(searchTextLower) ||
    musicianNameLower.includes(searchTextLower) ||
    music.MusicName.toLowerCase().includes(searchTextLower)
  );
});
    }
  },
  methods: {
    handleChange0(file) {
      this.MusicBackground = "/img/singerPic/ " + file.raw.name;
    },
    handleChange1(file) {
      this.MusicData = "/img/singerPic/ " + file.raw.name;
    },
    showFormDialog() {
      this.dialogVisible = true;
    },
    openDialog() {
      this.dialogVisible = true;
    },
    handleClose(){
      this.dialogVisible=false;
    },
    searchMusic() {
      console.log("搜索音乐:", this.searchText);
    },
    showAddMusicForm() {
      this.isAddMusicFormVisible = true;
    },
    resetAddMusicForm() {
      this.$refs.addMusicForm.resetFields();
      this.isAddMusicFormVisible = false;
    },
    validateAddMusicForm() {
      return new Promise(resolve => {
        this.$refs.addMusicForm.validate(valid => {
          resolve(valid);
        });
      });
    },
    addMusic() {
      // 添加音乐到数据库，并根据返回结果进行相应处理
      this.musicList.push({
        MusicID: this.MusicID,
        MusicName: this.MusicName,
        MusicianName: this.MusicianName,
        MusicBackground: this.MusicBackground,
        MusicData: this.MusicData,
        Like: this.Like,
      });
      this.MusicID = '';
      this.MusicName = '';
      this.MusicianName = '';
      this.MusicBackground = '';
      this.MusicData = '';
      this.Like = '';
      alert('添加音乐成功！！');
      //this.$refs.upload.clearFiles();

      

     
    },
    
    deleteMusic(musicId) {
  // 删除音乐逻辑，弹出确认对话框进行确认
  if (confirm('确定要删除该音乐吗？')) {
    // 在musicList数组中移除要删除的音乐
    const index = this.musicList.findIndex(music => music.MusicID === musicId);
    if (index !== -1) {
      this.musicList.splice(index, 1);
      alert('音乐删除成功！！');
      // 发送请求到服务器删除对应音乐
      // ...
    }
  }
},
  }
  
};
</script>

<style>
.header-container {
  display: flex;
  align-items: center;
  margin-bottom: 20px;
}

.el-input {
  margin-right: 10px;
}
.header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}
</style>