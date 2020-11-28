const express = require('express')
const bodyParser = require('body-parser')
const app = express()
const port = process.env.PORT || 4000
const userController = require('./src/users/users.controller')
const eventController = require('./src/events/events.controller')

// MIDDLEWARES
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extends: true }))
app.use(express.static('public'));

app.get('/activities', (req, res) => {
    setTimeout(() => {
        res.send(
            eventController.getAll()
        )
    }, 2500);
})

app.post('/activities', (req, res) => {
    setTimeout(() => {
        res.send(
            eventController.add(req.body)
        )
    }, 2500);
})

app.post("/login", (req, res) => {
    setTimeout(() => {
        res.send(userController.login(req.body))
    }, 2500);
})

app.post("/register", (req, res) => {
    setTimeout(() => {
        res.send(userController.register(req.body))
    }, 2500);
})

app.listen(port, (req, res) => {
    console.log(`Server running on port ${port}`)
})