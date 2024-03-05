const express = require('express');
const router = express.Router();
const musicMapper = require('../main/Mapper/MusicMapper');

// 根据音乐ID查询音乐
router.get('/music/:id', (req, res) => {
    const id = req.params.id;
    const music = musicMapper.selectbyid(id);
    res.json(music);
});

// 根据音乐名称查询音乐
router.get('/music/name/:name', (req, res) => {
    const name = req.params.name;
    const music = musicMapper.selectbyname(name);
    res.json(music);
});

// 根据音乐家名称查询音乐
router.get('/music/musician/:name', (req, res) => {
    const name = req.params.name;
    const music = musicMapper.selectbymusician(name);
    res.json(music);
});

// 查询所有音乐
router.get('/music', (req, res) => {
    const musicList = musicMapper.selectall();
    res.json(musicList);
});

// 模糊搜索音乐
router.get('/music/search', (req, res) => {
    const key = req.query.key;
    const musicList = musicMapper.fuzzysearch(key);
    res.json(musicList);
});

// 插入音乐
router.post('/music', (req, res) => {
    const music = req.body;
    const result = musicMapper.insertmusic(music);
    res.json(result);
});

// 根据音乐ID删除音乐
router.delete('/music/:id', (req, res) => {
    const id = req.params.id;
    const result = musicMapper.delectbyid(id);
    res.json(result);
});

// 更新音乐的喜欢数
router.put('/music/:id', (req, res) => {
    const id = req.params.id;
    const like = req.body.like;
    const result = musicMapper.updatelikebyid(id, like);
    res.json(result);
});

module.exports = router;
