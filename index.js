var express = require('express');
var app = express();
var bodyParser = require('body-parser');

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(express.static('src'));

app.get('/',(req,res)=>{
    res.sendFile(__dirname+'/src/index.html');
})



app.listen(3000);