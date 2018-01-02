function checkboxStatus(filterForm) {
	//var form = document.getElementsByName('form'); -- not needed. can access through form dirctly as in the next statement
	var inputs = document.FilterForm.getElementsByTagName('input');
	var checked = false;
	for ( var index = 0; index < inputs.length; index++) {
		if (inputs[index].type == 'checkbox' && inputs[index].name == 'session') {
			checked = inputs[index].checked;
			if (checked) {
				checked = true;
				return checked;
			}
		}
	}

	alert("Please select at least one session category.");
	return checked;

}