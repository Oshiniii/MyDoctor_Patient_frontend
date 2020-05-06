<%@page import="model.Patient"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/Register.js"></script>
</head>
<body>
	<div class="container" style="position: static">


		<h1 class="m-3">
			<center>Patient Details</center>
		</h1>

		<form id="formPatient" name="formPatient" method="post"
			action="Register.jsp" style="width: 520px;'">

			<center>

				<!-- NAME -->

				<div class="input-group input-group-sm mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="lblName">Name: </span>
					</div>
					<input type="text" id="name" name="name" class="form-control">
				</div>

				<!-- GENDER -->

				<div class="input-group input-group-sm mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="lblName">Gender: </span>
					</div>
					<select id="gender" name="gender" class="form-control">
						<option selected value="0">--Select gender--</option>
						<option value="Male">Male</option>
						<option value="Female">Female</option>

					</select>
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

				<!-- GENDER 
 <div class="input-group input-group-sm mb-3">
<div class="input-group-prepend">
 <span class="input-group-text" id="lblName">Gender: </span>
 </div>
 <input type="text" id="gender" name="gender" class= "form-control form-control-sm">
 </div> -->

				<!-- PHONE -->

				<div class="input-group input-group-sm mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="lblPhone">Phone: </span>
					</div>
					<input type="text" id="phone" name="phone" class="form-control">
				</div>

				<!-- NIC -->

				<div class="input-group input-group-sm mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="lblNIC">NIC: </span>
					</div>
					<input type="text" id="NIC" name="NIC" class="form-control">
				</div>

				<!-- EMAIL -->

				<div class="input-group input-group-sm mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="lblEmail">Email:&nbsp;&nbsp;&nbsp;&nbsp;</span>
					</div>
					<input type="email" id="email" name="email" class="form-control">
				</div>

				<!-- USERNAME -->

				<div class="input-group input-group-sm mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="lblUsername">Username:</span>
					</div>
					<input type="text" id="username" name="username"
						class="form-control">
				</div>

				<!-- PASSWORD -->
				<div class="input-group input-group-sm mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="lblPassword">Password:</span>
					</div>
					<input type="password" id="password" name="password"
						class="form-control">
				</div>

				<input id="btnSave" name="btnSave" type="button" value="Save"
					class="btn btn-outline-primary btn-sm btn-block"> <input
					type="hidden" id="hidPatientIdSave" name="hidPatientIdSave"
					value="">

			</center>
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


		<div class="row">
			<div class="col-12" id="colStudents"></div>
		</div>

	</div>

</body>
</html>
