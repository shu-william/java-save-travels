<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/main.css"/>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<title>Save Travels</title>
</head>
<body class="container">
	<h1 class="my-4 mx-3 text-center">Save Travels</h1>
	<table class="table col-md-6 mx-auto">
		<thead>
			<tr>
				<th scope="col">Expense</th>
				<th scope="col">Vendor</th>
				<th scope="col">Amount</th>
				<th scope="col">Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="expense" items="${expenses}">
			<tr>
				<td><a href="/expenses/show/${expense.id}"><c:out value="${expense.name}"></c:out></a></td>
				<td><c:out value="${expense.vendor}"></c:out></td>
				<td><c:out value="${expense.amount}"></c:out></td>
				<td><a href="/expenses/edit/${expense.id}">edit</a><a href="/expenses/delete/${expense.id}" class="mx-3">delete</a>
			</tr>
			</c:forEach>
		</tbody>	
	</table>
	<h2 class="my-4 mx-3 text-center">Add an expense:</h2>
	<form:form action="/expenses/create" method="POST" modelAttribute="expense" class="col-md-6 mx-auto">
		<div class="form-group">
			<form:label path="name">Expense Name:</form:label>
			<form:errors class="text-danger" path="name"/>
			<form:input class="form-control" path="name"/>
		</div>
		<div class="form-group">
			<form:label path="vendor">Vendor:</form:label>
			<form:errors class="text-danger" path="vendor"/>
			<form:input class="form-control" path="vendor"/>
		</div>
		<div class="form-group">
			<form:label path="amount">Amount:</form:label>
			<form:errors class="text-danger" path="amount"/>
			<form:input class="form-control" path="amount" type="number" min="0" step=".01"/>
		</div>
		<div class="form-group">
			<form:label path="description">Description:</form:label>
			<form:errors class="text-danger" path="description"/>
			<form:textarea class="form-control" path="description"/>
		</div>
		<input type="submit" class="btn btn-primary my-3" value="Submit"/>
	</form:form>
</body>
</html>