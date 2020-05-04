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
var student = getStudentCard($("#name").val().trim(),
		 $('input[name="rdoGender"]:checked').val(),
		 $("#ddlYear").val());
		 $("#colStudents").append(student);

		 $("#alertSuccess").text("Saved successfully.");
		 $("#alertSuccess").show();

		// $("#formStudent")[0].reset();
		 $("#formregister").submit();
});
// UPDATE==========================================
$(document).on("click", ".btnUpdate", function(event)
{
 $("#hidPatientIdSave").val($(this).closest("tr").find('#hidPatientIdUpdate').val());
 $("#name").val($(this).closest("tr").find('td:eq(0)').text());
 $("#gender").val($(this).closest("tr").find('td:eq(1)').text());
 $("#phone").val($(this).closest("tr").find('td:eq(2)').text());
 $("#gender").val($(this).closest("tr").find('td:eq(3)').text());
 $("#email").val($(this).closest("tr").find('td:eq(3)').text());
 $("#username").val($(this).closest("tr").find('td:eq(3)').text());
 $("#password").val($(this).closest("tr").find('td:eq(3)').text());
});

//REMOVE==========================================
$(document).on("click", ".remove", function(event)
{
 $(this).closest(".student").remove();

 $("#alertSuccess").text("Removed successfully.");
 $("#alertSuccess").show();
}); 

// CLIENTMODEL=========================================================================
function validatePatientForm()
{
// NAME
if ($("#name").val().trim() == "")
 {
 return "Insert name";
 }
//GENDER
if ($('input[name="rdoGender"]:checked').length === 0)
 {
 return "Select gender.";
 }

// is numerical value
var tmpPrice = $("#phone").val().trim();
if (!$.isNumeric(tmpPrice))
 {
 return "Insert a numerical value for phone";
 }
//PHONE-------------------------------
if ($("#phone").val().trim() == "")
 {
 return "Insert phone";
 }
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

function getStudentCard(name, gender, year)
{
var title = (gender == "Male") ? "Mr." : "Ms.";

var student = "";
 student += "<div class=\"student card bg-light m-2\" style=\"max-width: 10rem; float: left;\">";
 student += "<div class=\"card-body\">";
 student += title + " " + name + ",";
 student += "<br>";
return student;
}
