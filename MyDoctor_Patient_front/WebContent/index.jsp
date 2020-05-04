<%@page import="model.Patient"%>
<% 
//Save---------------------------------
if (request.getParameter("name") != null)
{

 Patient itemObj = new Patient();
 String stsMsg = "";
//Insert--------------------------
if (request.getParameter("hidPatientIdSave") != null)
 {
	
	 stsMsg = itemObj.insertDetails(request.getParameter("name"),
			 request.getParameter("gender"),
			 request.getParameter("phone"),
			 request.getParameter("NIC"),
			 request.getParameter("email"),
			 request.getParameter("username"),
			 request.getParameter("password"));
 } 
else
	//Update----------------------
 {
 stsMsg = itemObj.updateDetails(request.getParameter("hidPatientIdSave"),
		 request.getParameter("name"),
		 request.getParameter("gender"),
		 request.getParameter("phone"),
		 request.getParameter("NIC"),
		 request.getParameter("email"),
		 request.getParameter("username"),
		 request.getParameter("password"));
 }
 session.setAttribute("statusMsg", stsMsg);
}
//Delete-----------------------------
if (request.getParameter("hidPatientIdDelete") != null)
{
 Patient itemObj = new Patient();
 String stsMsg =
 itemObj.deleteDetails(request.getParameter("hidPatientIdDelete"));
 session.setAttribute("statusMsg", stsMsg);
}
%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student details</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/main.js"></script>
</head>
<body>
<div class="container">
<div class="row">
<div class="col-8">

 <h1 class="m-3">Patient details</h1>

<form id="formregister" name="formregister" method="post" action="index.jsp">

 <!-- NAME -->
 <div class="input-group input-group-sm mb-3">
<div class="input-group-prepend">
 <span class="input-group-text" id="lblName">Name: </span>
 </div>
 <input type="text" id="txtName" name="txtName" class= "form-control form-control-sm">
 </div>
 
 <!-- GENDER -->
 <div class="input-group input-group-sm mb-3">
 <div class="input-group-prepend">
 <span class="input-group-text" id="lblName">Gender: </span>
 </div>
 &nbsp;&nbsp;Male
<input type="radio" id="rdoGenderMale" name="rdoGender" value="Male">
 &nbsp;&nbsp;Female
<input type="radio" id="rdoGenderFemale" name="rdoGender" value="Female">
 </div>
 
 <!-- PHONE -->
 <div class="input-group input-group-sm mb-3">
<div class="input-group-prepend">
 <span class="input-group-text" id="lblPhone">Phone: </span>
 </div>
 <input type="text" id="txtPhone" name="txtPhone" class= "form-control form-control-sm">
 </div>

<!-- NIC -->
 <div class="input-group input-group-sm mb-3">
<div class="input-group-prepend">
 <span class="input-group-text" id="lblNIC">NIC: </span>
 </div>
 <input type="text" id="txtNIC" name="txtNIC" class= "form-control form-control-sm">
 </div>
 
 <!-- EMAIL -->
 <div class="input-group input-group-sm mb-3">
<div class="input-group-prepend">
 <span class="input-group-text" id="lblEmail">Email: </span>
 </div>
 <input type="text" id="txtEmail" name="txtEmail" class= "form-control form-control-sm">
 </div>
 
 <!-- USERNAME -->
 <div class="input-group input-group-sm mb-3">

<div class="input-group-prepend">
 <span class="input-group-text" id="lblUsername">Username: </span>
 </div>
 <input type="text" id="txtUsername" name="txtUsername" class= "form-control form-control-sm">
 </div>
 
 <!-- PASSWORD -->
 <div class="input-group input-group-sm mb-3">
	<div class="input-group-prepend">
 		<span class="input-group-text" id="lblPassword">Password: </span>
 	</div>
 		<input type="text" id="txtPassword" name="txtPassword" class= "form-control form-control-sm">
 	</div>
 
 <input id="btnSave" name="btnSave" type="button" value="Save"class="btn btn-primary">	
	<input type="hidden" id="hidPatientIdSave" name="hidPatientIdSave" value="">
</form>

<div id="alertSuccess" class= "alert alert-danger">
	<%
		out.print(session.getAttribute("statusMsg"));
	%>
</div>
	<div id="alertError" class=alert alert-danger></div>
<br>
	<%
		Patient itemObj = new Patient();
		out.println(itemObj.readDetails());
	%>
</div>
</div>

<br>

<div class="row">
<div class="col-12" id="colStudents">

</div>
</div>
</div>
</body>
</html>