<%-- 
    Document   : login
    Created on : 2020-05-10, 16:01:40
    Author     : kamillo104
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<style type="text/css">
	.login-form {
		width: 340px;
    	margin: 50px auto;
	}
    .login-form form {
    	margin-bottom: 15px;
        background: #f7f7f7;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
    }
    .login-form h2 {
        margin: 0 0 15px;
    }
    .form-control, .btn {
        min-height: 38px;
        border-radius: 2px;
    }
    .btn {        
        font-size: 15px;
        font-weight: bold;
    }
</style>
    </head>
    <body>
             <% if (request.isUserInRole("users")) { %>
             <a href = "/user-list.jsp"></a>
             <% } %>
        <div class="login-form">   
                <form method="post" action="j_security_check" >
                    <h2 class="text-center">Logowanie</h2> 
                    <div class="form-group">
                    <p align="center">Użytkownik
                    <input type="text" class="form-control" name="j_username" value="user1" required="required"></p>
                    </div>
                    <div class="form-group">
                    <p align="center">Hasło
                    <input type="password" class="form-control" name="j_password" value="password" size="20">
                    </p>
                    </div>
                    <div class="form-group">
                    <p align="center">
                    <button type="submit" class="btn btn-primary btn-block">Zaloguj</button></p>
                    </p>
                    </div>
                </form>
        </div>
    </body>
</html>
