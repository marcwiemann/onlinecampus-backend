const express = require('express')
const cors = require('cors')
const cookieParser = require('cookie-parser');
const app = express()
const port = 3003
var studierender = require('./routes/studierender');

app.use(express.urlencoded({
  extended: true
}));
app.use(express.json());
app.use(cookieParser());
app.use(cors());
app.get('/', (req, res)=>{
    res.send("Hier bist du leider falsch!");
});
app.use("/studierender", studierender);
app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})

const name =" Neu hier steht was";