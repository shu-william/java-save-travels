<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/main.css"/>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<title>Edit Expense</title>
</head>
<body class="text-center">
	<div class="d-flex justify-content-end mx-4 my-3">
		<a href="/expenses">Go back</a>
	</div>
	<h1>Edit Expense</h1>
	<form:form action="/expenses/edit/${expense.id}" method="post" modelAttribute="expense" class="col-md-6 mx-auto">
		<input type="hidden" name="_method" value="put">
		<div class="form-group">
			<form:label path="name">Expense Name:</form:label>
			<form:errors class="text-danger" path="name"/>
			<form:input class="form-control" path="name" value="${expense.name}"/>
		</div>
		<div class="form-group">
			<form:label path="vendor">Vendor:</form:label>
			<form:errors class="text-danger" path="vendor"/>
			<form:input class="form-control" path="vendor" value="${expense.vendor}"/>
		</div>
		<div class="form-group">
			<form:label path="amount">Amount:</form:label>
			<form:errors class="text-danger" path="amount"/>
			<form:input class="form-control" path="amount" type="number" min="0" step=".01" value="${expense.amount}"/>
		</div>
		<div class="form-group">
			<form:label path="description">Description:</form:label>
			<form:errors class="text-danger" path="description"/>
			<form:textarea class="form-control" path="description" value="${expense.description}"/>
		</div>
		<input type="submit" class="btn btn-primary my-3" value="Submit"/>
	</form:form>
</body>
</html>