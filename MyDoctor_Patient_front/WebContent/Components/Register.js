$(document).ready(function() {
	if ($("#alertSuccess").text().trim() == "") {
		$("#alertSuccess").hide();
	}
	$("#alertError").hide();
});
// SAVE ============================================
$(document).on("click", "#btnSave", function(event) {
	// Clear alerts---------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();
	// Form validation-------------------
	var status = validatePatientForm();
	// IF NOT VALID
	if (status != true) {
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	}
	// If valid------------------------
	var type = ($("#hidPatientIdSave").val() == "") ? "POST" : "PUT";
	$.ajax({
		url : "PatientAPI",
		type : type,
		data : $("#formPatient").serialize(),
		dataType : "text",
		complete : function(response, status) {
			onItemSaveComplete(response.responseText, status);
		}
	});
});

function onItemSaveComplete(response, status) {
	if (status = "success") {
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();
			$("#divItemsGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}

		else if (status == "error") {
			$("#alertError").text("Error while saving.");
			$("#alertError").show();
		} else {
			$("#alertError").text("Unknown error while saving..");
			$("#alertError").show();
		}
		$("#hidPatientIdSave").val("");
		$("#formPatient")[0].reset();
	}
}

// UPDATE==========================================
$(document).on(
		"click",
		".btnUpdate",
		function(event) {
			$("#hidPatientIdSave").val(
					$(this).closest("tr").find('#hidPatientIdUpdate').val());
			$("#name").val($(this).closest("tr").find('td:eq(0)').text());
			$("#gender").val($(this).closest("tr").find('td:eq(1)').text());
			$("#phone").val($(this).closest("tr").find('td:eq(2)').text());
			$("#NIC").val($(this).closest("tr").find('td:eq(3)').text());
			$("#email").val($(this).closest("tr").find('td:eq(4)').text());
			$("#username").val($(this).closest("tr").find('td:eq(5)').text());
			$("#password").val($(this).closest("tr").find('td:eq(6)').text());
		});

// REMOVE==========================================

$(document).on("click", ".btnRemove", function(event) {
	$.ajax({
		url : "PatientAPI",
		type : "DELETE",
		data : "patientId=" + $(this).data("patientid"),
		dataType : "text",
		complete : function(response, status) {
			onItemDeleteComplete(response.responseText, status);
		}
	});
});

function onItemDeleteComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully deleted.");
			$("#alertSuccess").show();
			$("#divItemsGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		$("#alertError").text("Error while deleting.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while deleting..");
		$("#alertError").show();
	}
}

// CLIENTMODEL=========================================================================

function validatePatientForm() {
	// NAME
	if ($("#name").val().trim() == "") {
		return "Insert name !";
	}
	// Gender
	if ($("#gender").val().trim() == "0") {
		return "Select gender !";
	}

	// //GENDER
	// if ($('input[name="rdoGender"]:checked').length === 0) {
	// return "Select gender!";
	// }

	// is numerical value
	var tmpPrice = $("#phone").val().trim();
	if (!$.isNumeric(tmpPrice)) {
		return "Insert a numerical value for phone !";
	}
	// CONTACT NO
	if ($("#phone").val().trim() == "") {
		return "Insert Contact number !";
	}

	var contactNochar = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;
	var contact = $("#phone").val().trim();
	if (contactNochar.test(contact) == false) {
		return "Should enter valid Contact No !";
	}
	console.log(contactNochar.test(contact));

	// NIC------------------------
	if ($("#NIC").val().trim() == "") {
		return "Insert NIC !";
	}
	
	var NICchar = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;
	var NIC = $("#NIC").val().trim();
	if (NICchar.test(NIC) == false) {
		return "Should enter valid NIC !";
	}
	console.log(contactNochar.test(contact));
	// EMAIl------------------------
	if ($("#email").val().trim() == "") {
		return "Insert email !";
	}

	// valid email characters
	var emailchar = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	var email = $("#email").val().trim();
	if (emailchar.test(email) == false) {
		return "Should enter valid Email Address !";
	}
	console.log(emailchar.test(email));

	// USERNAME------------------------
	if ($("#username").val().trim() == "") {
		return "Insert username !";
	}

	// //User validation
	// var usernamechar =/^[a-zA-Z0-9]+$/;
	// var username = $("#username").val().trim();
	// if (usernamechar.test(username) == false) {
	// return "Should enter valid Username with Capital letters A-Z & Numbers
	// 0-9";
	// }
	// console.log(usernamechar.test(username));
	
	// PASSWORD------------------------
	if ($("#password").val().trim() == "") {
		return "Insert password !";
	}

	// //Password validation
	// var passwordchar
	// =/^(?=.[0-9])(?=.[a-z])(?=.[A-Z])(?=.[@#$%^&+=])(?=\S+$).{8,}$/;
	// var password = $("#password").val().trim();
	// if (passwordchar.test(password) == false) {
	// return "Should enter valid password !";
	// }
	// console.log(passwordchar.test(password));
	return true;

}
