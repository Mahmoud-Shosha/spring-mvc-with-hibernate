<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="windows-1256">
	<title>List Customers</title>
	<link type="text/css" rel="stylesheet" 
		  href="${pageContext.request.contextPath}/resources/css/style.css" />						
</head>
<body>

	<div id="wrapper">
		<div id="header">
			<h2>CRM - Customer Relationship Manager</h2>
		</div>
	</div>
	
	<div id="container">
		<div id="content">
		<input type="button" value="Add Customer"
			   onclick="window.location.href='showFormForAdd'" class="add-button" />
		<form action="search" method="GET">
			Search Customers: <input type="text" name="searchKey">  
			<input type="submit" value="Search" class="add-button">
		</form>
			<table>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>
				<c:forEach var="customer" items="${customers}">
				<tr>
					<td>${customer.fistName}</td>
					<td>${customer.lastName}</td>
					<td>${customer.email}</td>
					<td>
						<a href="${pageContext.request.contextPath}/customer/showFormForUpdate?customerId=${customer.id}">Update</a>
						 | <a href="${pageContext.request.contextPath}/customer/delete?customerId=${customer.id}"
						 	  onclick="if (!confirm('Are you sure to delete this customer ?')) return false">Delete</a>
					</td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>