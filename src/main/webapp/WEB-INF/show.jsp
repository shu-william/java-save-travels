<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/main.css"/>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<title>${expense.name}</title>
</head>
<body class="text-center">
	<div class="d-flex justify-content-end mx-4 my-3">
		<a href="/expenses">Go back</a>
	</div>
	<h1>Expense Details</h1>
	<p>Expense Name: <c:out value="${expense.name}"></c:out></p>
	<p>Expense Description: <c:out value="${expense.description}"></c:out></p>
	<p>Vendor: <c:out value="${expense.vendor}"></c:out></p>
	<p>Amount Spent: <c:out value="${expense.amount}"></c:out></p>
</body>
</html>