<%-- 
    Document   : employee-form
    Created on : 2020-04-26, 16:44:52
    Author     : kamillo104
--%>

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
      <a class="btn btn-primary" href="<%=request.getContextPath()%>/list"
c               lass="nav-link">Powrót</a>
      <a class="btn btn-primary" href="<%=request.getContextPath()%>/WebSocketJSP.jsp"
c               lass="nav-link">WebSocket</a>
      <a class="btn btn-primary" href="<%=request.getContextPath()%>/WebSocketChart.jsp"
c               lass="nav-link">WebSocketChart</a>
      <a class="btn btn-dark" href="logout.jsp">Wyloguj</a>
    </div>
  </nav>
	<br>
	<div class="container col-md-5">
		<div>
			<div>
				<c:if test="${user != null}">
					<form action="update" method="post">
				</c:if>
				<c:if test="${user == null}">
					<form action="insert" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test="${user != null}">
            			Edytuj Pracownika
            		</c:if>
						<c:if test="${user == null}">
            			Dodaj Pracownika
            		</c:if>
					</h2>
				</caption>

				<c:if test="${user != null}">
					<input type="hidden" name="id" value="<c:out value='${user.id}' />" />
				</c:if>

				<fieldset class="form-group">
					<label>Imie</label> <input type="text"
						value="<c:out value='${user.name}' />" class="form-control"
						name="name" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Email</label> <input type="text"
						value="<c:out value='${user.email}' />" class="form-control"
						name="email" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Kraj</label> <input type="text"
						value="<c:out value='${user.country}' />" class="form-control"
						name="country" required="required">
				</fieldset>

				<button type="submit" class="btn btn-success">Zapisz</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
