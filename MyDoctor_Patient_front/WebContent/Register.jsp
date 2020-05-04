<%@page import="model.Patient"%>
<% 
//Save---------------------------------
if (request.getParameter("name") != null)
{

 Patient itemObj = new Patient();
 String stsMsg = "";
//Insert--------------------------
if (request.getParameter("hidPatientIdSave") == "")
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
 stsMsg = itemObj.updateDetails(request.getParameter("hidPatientIDSave"),
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
<title>Insert title here</title>
</head>
<body>
<form id="formregister" name="formregister" method="post" action="Register.jsp">
	name:
	<input id="name" name="name" type="text"class="form-control form-control-sm"><br> 
	gender:
		<input id="gender" name="gender" type="text" class="form-control form-control-sm"><br> 
	phone:
		<input id="phone" name="phone" type="text"class="form-control form-control-sm"><br>
	NIC:
		<input id="NIC" name="NIC" type="text"class="form-control form-control-sm"><br><br>
	email:
		<input id="email" name="email" type="text"class="form-control form-control-sm"><br><br>
	username:
		<input id="username" name="username" type="text"class="form-control form-control-sm"><br><br>
	password:
		<input id="password" name="password" type="text"class="form-control form-control-sm"><br>

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
</body>
</html>