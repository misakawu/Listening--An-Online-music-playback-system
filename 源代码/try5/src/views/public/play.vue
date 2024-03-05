<template>
  <div class="play-page">
    <div class="image-container">
      <img :src="pictureData" />
    </div>
    <img class="play1" src="../../assets/play1.jpg">
    <div class="footer">
      <audio ref="audioPlayer" controls></audio>
    </div>
  </div>
</template>

<script>
import { ElFooter } from 'element-ui';
export default {
  name: 'PlayPage',
  components: {
    ElFooter
  },
  data() {
    return {
      audio: null,
      pictureData: '',
      audioProgress: 0,
    }
  },
  mounted() {
    const musicBackground = this.$route.query.tableData.musicBackground;
    const musicData = this.$route.query.tableData.musicData;
    this.audio = this.$refs.audioPlayer;
    console.log(musicData);
    console.log(`../../assets${musicData}`);
    console.log(musicBackground);
    console.log(`../../assets${musicBackground}`);
    this.audio.src = require(`../../assets${musicData}`);
    this.pictureData = require(`../../assets${musicBackground}`);
    console.log(this.pictureData);
    this.audio.addEventListener('timeupdate', this.updateAudioProgress);
    this.audio.addEventListener('canplay', this.updateAudioProgress);
  },
  methods: {

  }
}
</script>

<style scoped>
.play-page {
  padding: 20px;
}

.image-container {
  display: flex;
  align-items: center;
  justify-content: center;
  margin-top: 20px;
  position: fixed;
  top: 52%;
  left: 55%;
  transform: translate(-50%, -50%);
  width: 400px;
  height: 400px;
}

.image-container img {
  border-radius: 50%;
  border: 15px solid #79bdb2;
  width: 400px;
  height: 400px;
}

.play1 {
  display: flex;
  align-items: center;
  justify-content: center;
  margin-top: 20px;
  position: fixed;
  top: 36%;
  left: 78%;
  transform: translate(-50%, -50%);
  width: 1500px;
  height: 700px;
}

.footer {
  background-image: url("../../assets/footer2.jpg");
  background-size: cover;
  background-position: center;
  height: 80px;
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
}

.footer audio {
  width: 800px;
  height: 60px;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-top: 20px;
  position: fixed;
  top: 92%;
  left: 55%;
  transform: translate(-50%, -50%);
  background-color: transparent;
}
</style>
