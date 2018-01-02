//Function to Show form
function loginForm_show() {
	document.getElementById('displayLoginForm').style.display = "block";
}

// Function to Hide form
function loginForm_hide() {
	document.getElementById('displayLoginForm').style.display = "none";
}

// Validating Empty fields
function check_empty_login() {
	var username = document.form1.username.value;
	var password = document.form1.password.value;

	if (username == "" || password == "") {
		alert("Kindly fill all the fields.");
		return false;
	}

	return true;

}