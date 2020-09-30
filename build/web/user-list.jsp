<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>WebApplication4KS</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
  <!-- Navigation -->
  <nav class="navbar navbar-light bg-light static-top">
    <div class="container">
      <a class="navbar-brand"><%=request.getRemoteUser()%></a>
      <a class="btn btn-primary" href="<%=request.getContextPath()%>/WebSocketJSP.jsp"
c               lass="nav-link">WebSocket</a>
      <a class="btn btn-primary" href="<%=request.getContextPath()%>/WebSocketChart.jsp"
c               lass="nav-link">WebSocketChart</a>
      <a class="btn btn-dark" href="logout.jsp">Wyloguj</a>
    </div>
  </nav>
 <br>

	<div class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
			<h3 class="text-center">Lista pracowników</h3>
			<hr>
			<div class="container text-left">

				<a href="<%=request.getContextPath()%>/new" class="btn btn-primary">Dodaj pracownika</a>
			</div>
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Imie</th>
						<th>Email</th>
						<th>Kraj</th>
					</tr>
				</thead>
				<tbody>
					<!--   for (Todo todo: todos) {  -->
					<c:forEach var="user" items="${listUser}">

						<tr>
							<td><c:out value="${user.id}" /></td>
							<td><c:out value="${user.name}" /></td>
							<td><c:out value="${user.email}" /></td>
							<td><c:out value="${user.country}" /></td>
							<td><a class="btn btn-primary" href="edit?id=<c:out value='${user.id}' />">Edytuj</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								class="btn btn-primary" href="delete?id=<c:out value='${user.id}' />">Usuń</a></td>
						</tr>
					</c:forEach>
					<!-- } -->
				</tbody>

			</table>
                    <h3 class="text-center">
                        <img src="${pageContext.request.contextPath}/graphicservlet" width="500" height="300"/>
                    </h3>
		</div>
	</div>
  <!-- Footer -->
  <footer class="footer bg-light">
    <div class="container">
        <h5>Autor projektu: Kamil Synowiec </h5>
        <%
         Date date = new Date();
         out.print( "<h5> Akualna data: " +date.toString()+"</h5>");
         %>  
  </div>
  </footer>
</body>
</html>
