$(document).ready(function()
{
if ($("#alertSuccess").text().trim() == "")
 {
 $("#alertSuccess").hide();
 }
 $("#alertError").hide();
});
// SAVE ============================================
$(document).on("click", "#btnSave", function(event)
{
// Clear alerts---------------------
 $("#alertSuccess").text("");
 $("#alertSuccess").hide();
 $("#alertError").text("");
 $("#alertError").hide();
// Form validation-------------------
var status = validatePatientForm();
//IF NOT VALID
if (status != true)
 {
 $("#alertError").text(status);
 $("#alertError").show();
 return;
 }
// If valid------------------------
var type = ($("#hidPatientIdSave").val() == "") ? "POST" : "PUT";
$.ajax(
		{
		 url : "PatientAPI",
		 type : type,
		 data : $("#formPatient").serialize(),
		 dataType : "text",
		 complete : function(response, status)
		 {
		 onItemSaveComplete(response.responseText, status);
		 }
		});
});

function onItemSaveComplete(response, status)
{
	if(status = "success")
		{
	var resultSet = JSON.parse(response);
	if (resultSet.status.trim() == "success")
	{
	 $("#alertSuccess").text("Successfully saved.");
	 $("#alertSuccess").show();
	$("#divItemsGrid").html(resultSet.data);
	} else if (resultSet.status.trim() == "error")
	{
	 $("#alertError").text(resultSet.data);
	 $("#alertError").show();
	}
	
	else if (status == "error")
	{
	 $("#alertError").text("Error while saving.");
	 $("#alertError").show();
	} else
	{
	 $("#alertError").text("Unknown error while saving..");
	 $("#alertError").show();
	}
	$("#hidPatientIdSave").val("");
	$("#formPatient")[0].reset();
		}
}

// UPDATE==========================================
$(document).on("click", ".btnUpdate", function(event)
{
 $("#hidPatientIdSave").val($(this).closest("tr").find('#hidPatientIdUpdate').val());
 $("#name").val($(this).closest("tr").find('td:eq(0)').text());
 $("#gender").val($(this).closest("tr").find('td:eq(1)').text());
 $("#phone").val($(this).closest("tr").find('td:eq(2)').text());
 $("#NIC").val($(this).closest("tr").find('td:eq(3)').text());
 $("#email").val($(this).closest("tr").find('td:eq(3)').text());
 $("#username").val($(this).closest("tr").find('td:eq(3)').text());
 $("#password").val($(this).closest("tr").find('td:eq(3)').text());
});

//REMOVE==========================================

$(document).on("click", ".btnRemove", function(event)
		{
		 $.ajax(
		 {
		 url : "PatientAPI",
		 type : "DELETE",
		 data : "patientId=" + $(this).data("patientid"),
		 dataType : "text",
		 complete : function(response, status)
		 {
		 onItemDeleteComplete(response.responseText, status);
		 }
		 });
		});
		 
		
		function onItemDeleteComplete(response, status)
		{
		if (status == "success")
		 {
		 var resultSet = JSON.parse(response);
		 if (resultSet.status.trim() == "success")
		 {
		 $("#alertSuccess").text("Successfully deleted.");
		 $("#alertSuccess").show();
		 $("#divItemsGrid").html(resultSet.data);
		 } else if (resultSet.status.trim() == "error")
		 {
		 $("#alertError").text(resultSet.data);
		 $("#alertError").show();
		 }
		 } else if (status == "error")
		 {
		 $("#alertError").text("Error while deleting.");
		 $("#alertError").show();
		 } else
		 {
		 $("#alertError").text("Unknown error while deleting..");
		 $("#alertError").show();
		 }
		}

// CLIENTMODEL=========================================================================
function validatePatientForm()
{
// NAME
if ($("#name").val().trim() == "")
 {
 return "Insert name";
 }
//GENDER
if ($("#gender").val().trim() == "")
 {
 return "Insert name";
 }
////GENDER
//if ($('input[name="rdoGender"]:checked').length === 0)
//{
// return "Select gender.";
//}

// is numerical value
var tmpPrice = $("#phone").val().trim();
if (!$.isNumeric(tmpPrice))
 {
 return "Insert a numerical value for phone";
 }
////PHONE-------------------------------
//if ($("#phone").val().trim() == "")
// {
// return "Insert phone";
// }
// NIC------------------------
if ($("#NIC").val().trim() == "")
 {
 return "Insert NIC.";
 }
//EMAIl------------------------
if ($("#email").val().trim() == "")
 {
 return "Insert email.";
 }
//USERNAME------------------------
if ($("#username").val().trim() == "")
 {
 return "Insert username.";
 }
//PASSWORD------------------------
if ($("#password").val().trim() == "")
 {
 return "Insert password.";
 }
return true;
}

//function getStudentCard(name, gender, year)
//{
//var title = (gender == "Male") ? "Mr." : "Ms.";
//
//var student = "";
// student += "<div class=\"student card bg-light m-2\" style=\"max-width: 10rem; float: left;\">";
// student += "<div class=\"card-body\">";
// student += title + " " + name + ",";
// student += "<br>";
//return student;
//}
