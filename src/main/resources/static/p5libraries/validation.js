function validateForm() {

    if (document.userForm.firstName.value == "") {
        document.getElementById('error').innerHTML = "this field is strongly required";
        return false;
     }
     else
        return true;
    }