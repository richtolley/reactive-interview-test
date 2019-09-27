const express = require('express');
const app = express();

app.get('/', (req, res) => {
   res.send('{"value": "wrong"}');
   let responseObject = {};
   responseObject.value = "wrong";
   res.send(JSON.stringify(responseObject))
})

app.get('/thing', (req, res) => {
	let responseObject = {};
	responseObject.secret = "nope";
	res.send(JSON.stringify(responseObject))
})

const server = app.listen(8081, () => {
   const port = server.address().port;
   console.log("Example app listening at http://localhost:%s", port);
})
