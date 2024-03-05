const express = require('express');
const app = express();
const musicRouter = require('/musicRouter');

app.use(express.json());
app.use('/api', musicRouter); // 将接口挂载到/api路径下

app.listen(3000, () => {
    console.log('Server is running on port 3000');
});