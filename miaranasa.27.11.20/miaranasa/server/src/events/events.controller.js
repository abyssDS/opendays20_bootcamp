let events = [
    {
        "image": "",
        "entreprise": {
            "name": "Digital Marketing Strategists",
            "image": ""
        },
        "postName": "Digital Marketing + Business",
        "postNote": "5",
        "nbVues": "2115"
    },
    {
        "image": "",
        "entreprise": {
            "name": "Alpha Job",
            "image": ""
        },
        "postName": "Digital Marketing + Business",
        "postNote": "5",
        "nbVues": "2115"
    },
    {
        "image": "",
        "entreprise": {
            "name": "Etech Madagascar",
            "image": ""
        },
        "postName": "Digital Marketing + Business",
        "postNote": "5",
        "nbVues": "2115"
    }
]

class EventController {
    getAll() {
        return events;
    }

    add(body) {
        events = [...events, body];
        return events;
    }
}

const eventController = new EventController()
module.exports = eventController