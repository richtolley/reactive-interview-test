## Reactive Interview Test

* WIP skeleton for a MVVM reactive interview test

API

To run the backend you will need node installed - to start it just run `npm start` from the `node` directory.
The test uses a simple API with 2 endpoints as follows:

POST /register

Headers

username : String
password : String

Returns a JSON containing the authorization token in the case of success, or an error otherwise

POST /newsletter

Headers 
Authorization: String

Returns a JSON containing a message in the case of success, or an error otherwise

* Task 

1. Validation

* Validate that the user's name is correct
a) Username must be longer than 2 chars
b) Username must be shorter than 20 chars

* Validate that the user's password is correct. Rules are as follows
a) Password must be longer than 4 chars
b) Password must be less than or equal to 20 chars
c) Password must contain at least one number

2.
* Validate that both name and password are valid, and enable/disable the submit button accordingly

3.
* Submit the request to the backend using the sign-in endpoint when the user clicks on the submit button

4.
* If the registration succeeed and if the 'subscribe' toggle switch is on, subscribe the user to the newsletter
* using the /newsletter endpoint

5. 
* If all the above succeeded, redirect the user to the SignedInViewController screen.

 
