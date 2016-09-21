const express = require('express')
const fs = require('fs')

const app = express()

console.log('Starting legacy app.')
console.log('Establishing mainframe link...')
setTimeout(console.log.bind(console,'Mainframe link establisehd!'), 1500)
setTimeout(console.log.bind(console,'Started legacy app. Listening on port: 3000'), 2000)

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
