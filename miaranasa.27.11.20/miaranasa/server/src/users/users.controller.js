let users = []

class UserController {
    login(body) {
        const { email, password } = body;
        const index = users.findIndex((user) => user.email === email);

        if (index < 0) {
            return ({ "message": "L'utilisateur n'existe pas." })
        } else {
            if (users[index].password === password) {
                return ({ "message": "Bienvenue!" })
            }
            return ({ "message": "Le mot de passe ne correspond pas." })
        }
    }

    register (body) {
        users = [...users, body]
        return users
    }
}

const userController = new UserController();
module.exports = userController;