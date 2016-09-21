const express = require('express')
const fs = require('fs')

const app = express()

app.get('/', (req, res) => {
    setTimeout(
        ()=>res.send(fs.readFileSync('./pages/index.html', {encoding: 'UTF-8'})),
        2500
    )
})
app.get('/duck', (req, res) => {
    setTimeout(
        ()=>res.send(fs.readFileSync('./pages/product.html', {encoding: 'UTF-8'})),
        2500
    )
})
app.use(express.static('pages'));

app.listen(3000)
