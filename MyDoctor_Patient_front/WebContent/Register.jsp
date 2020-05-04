<%@page import="model.Patient"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<meta charset="ISO-8859-1">
<title>Student details</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/Register.js"></script>
</head>
<body>
<div class="container">
<div class="row">
<div class="col-8">

 <h1 class="m-3">Patient details</h1>

<form id="formPatient" name="formPatient" method="post" action="index.jsp">


 <!-- NAME -->
 <div class="input-group input-group-sm mb-3">
<div class="input-group-prepend">
 <span class="input-group-text" id="lblName">Name: </span>
 </div>
 <input type="text" id="name" name="name" class= "form-control form-control-sm">
 </div>
 
 <!-- GENDER 
 <div class="input-group input-group-sm mb-3">
 <div class="input-group-prepend">
 <span class="input-group-text" id="lblName">Gender: </span>
 </div>
 &nbsp;&nbsp;Male
<input type="radio" id="rdoGenderMale" name="rdoGender" value="Male">
 &nbsp;&nbsp;Female
<input type="radio" id="rdoGenderFemale" name="rdoGender" value="Female">
 </div> -->
 
  <!-- GENDER -->
 <div class="input-group input-group-sm mb-3">
<div class="input-group-prepend">
 <span class="input-group-text" id="lblName">Gender: </span>
 </div>
 <input type="text" id="gender" name="gender" class= "form-control form-control-sm">
 </div>
 <!-- PHONE -->
 <div class="input-group input-group-sm mb-3">
<div class="input-group-prepend">
 <span class="input-group-text" id="lblPhone">Phone: </span>
 </div>
 <input type="text" id="phone" name="phone" class= "form-control form-control-sm">
 </div>

<!-- NIC -->
 <div class="input-group input-group-sm mb-3">
<div class="input-group-prepend">
 <span class="input-group-text" id="lblNIC">NIC: </span>
 </div>
 <input type="text" id="NIC" name="NIC" class= "form-control form-control-sm">
 </div>
 
 <!-- EMAIL -->
 <div class="input-group input-group-sm mb-3">
<div class="input-group-prepend">
 <span class="input-group-text" id="lblEmail">Email: </span>
 </div>
 <input type="text" id="email" name="email" class= "form-control form-control-sm">
 </div>
 
 <!-- USERNAME -->
 <div class="input-group input-group-sm mb-3">

<div class="input-group-prepend">
 <span class="input-group-text" id="lblUsername">Username: </span>
 </div>
 <input type="text" id="username" name="username" class= "form-control form-control-sm">
 </div>
 
 <!-- PASSWORD -->
 <div class="input-group input-group-sm mb-3">
	<div class="input-group-prepend">
 		<span class="input-group-text" id="lblPassword">Password: </span>
 	</div>
 		<input type="text" id="password" name="password" class= "form-control form-control-sm">
 	</div>
 
 <input id="btnSave" name="btnSave" type="button" value="Save"class="btn btn-primary">	
	<input type="hidden" id="hidPatientIdSave" name="hidPatientIdSave" value="">
</form>

<div id="alertSuccess" class="alert alert-success"></div>
<div id="alertError" class="alert alert-danger"></div>
<br>
<div id="divItemsGrid">
 <%
 Patient itemObj = new Patient();
 out.print(itemObj.readDetails());
 %>
</div>

</div>
 </div>
</div>

</body>
</html>
>