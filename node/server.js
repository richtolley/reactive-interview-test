const express = require('express');
const crypto = require('crypto-js');
const fs = require('fs')
const app = express();
const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => {
   res.send('Reactive Test Backend');
})

let usernameValid = (name) => {
	return name.length > 2 && name.length <= 20
}

let passwordValid = (password) => {
	return password.length > 4 && password.length < 30
}

app.post('/register', (req, res) => {

	console.log(req);
	let username = req.headers.username
	let password = req.headers.password

	if(usernameValid(username) && passwordValid(password)) {
		let responseObject = {}
		responseObject.authorization = crypto.SHA256(username + password).toString()

		let db = {}
		db[responseObject.authorization] = true

		fs.writeFile("db.json", JSON.stringify(db), (error) => {
			if(error) {
				res.status(500).send("Internal Server Error" + error);
			} else {
				res.send(responseObject);
			}
		})

	} else {
		res.status(400).send("Invalid name or password");
	}
})

app.post('/newsletter', (req, res) => {
	let token = req.headers.authorization

	fs.readFile("db.json", (error, file) => {
		if(error) {
			res.status(500).send("Invalid token db")
		} else {
			let db = JSON.parse(file)
			if(db[token] === true) {
				let responseObject = {}
				responseObject.message = "Happy days, you are subscribed";
				res.send(responseObject)
			} else {
				res.status(400).send("Invalid token");
			}
		}
	})
})

const server = app.listen(PORT, () => {
   const port = server.address().port;
   console.log("Example app listening at http://localhost:%s", port);
})
