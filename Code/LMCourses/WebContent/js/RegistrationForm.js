//Function to Show form
function form_show() {
	document.getElementById('displayRegistrationForm').style.display = "block";
}

// Function to Hide form
function form_hide() {
	document.getElementById('displayRegistrationForm').style.display = "none";
}

// Validating Empty fields
function check_empty() {
	var id = document.form.id.value;
	var name = document.form.name.value;
	var phoneNumber = document.form.phoneNumber.value;
	var email = document.form.email.value;
	// var id = document.getElementById('id');
	// var email = document.getElementById('email');
	var atpos = email.indexOf("@");
	var dotpos = email.lastIndexOf(".");
	if (id == "" || name == "" || phoneNumber == "" || email == "") {
		alert("Kindly fill all the fields.");
		return false;
	} else if (id.length != 5) {
		alert("Invalid employee id. Id should consist of 5 digits.");
		return false;
	} else if (isNaN(id) == true) {
		alert("Invalid employee id. Id should be numeric.");
		document.form.id.focus();
		return false;
	} else if (phoneNumber.length != 10) {
		alert("Invalid Phone Number. Phone Number should consist of 10 digits.");
		document.form.phoneNumber.focus();
		return false;
	} else if (isNaN(phoneNumber) == true) {
		alert("Invalid Phone Number. Phone Number should be numeric.");
		document.form.phoneNumber.focus();
		return false;
	} 
	else if (phoneNumber.charAt(0) != '9' && phoneNumber.charAt(0) != '8' && phoneNumber.charAt(0) != '7') {
		alert("Invalid Phone Number. Phone Number should start with 7 or 8 or 9.");
		document.form.phoneNumber.focus();
		return false;
	} else if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= email.length) {
		alert("Not a valid e-mail address.");
		document.form.email.focus();
		return false;
	} else {

		alert("Your have successfully registered for the session.");
		form_hide();
		return true;
	}
}