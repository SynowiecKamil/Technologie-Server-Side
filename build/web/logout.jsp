<%-- 
    Document   : logout
    Created on : 2020-06-14, 12:31:32
    Author     : kamillo104
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
    </head>
    <body>
              <!-- Navigation -->
      <nav class="navbar navbar-light bg-light static-top">
        <div class="container">
          <a class="navbar-brand"></a>
          <a class="btn btn-primary" href="${pageContext.request.contextPath}/userservlet"
    c               lass="nav-link">Zaloguj</a>

        </div>
      </nav>
        <h3 class="text-center">
                <%@ page session="true"%>
                Użytkownik '<%=request.getRemoteUser()%>' został wylogowany.
                <% session.invalidate(); %>
        </h3>
    </body>
</html>
