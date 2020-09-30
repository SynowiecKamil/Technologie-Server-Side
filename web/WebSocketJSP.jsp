<%-- 
    Document   : WebSocketJSP
    Created on : 2020-05-17, 14:47:39
    Author     : kamillo104
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
    </head>
    <body>
        <meta charset="utf-8">
        <title>Strona WebSocket</title>
    <nav class="navbar navbar-light bg-light static-top">
        <div class="container">
          <a class="navbar-brand"><%=request.getRemoteUser()%></a>
          <a class="btn btn-primary" href="<%=request.getContextPath()%>/list"
    c               lass="nav-link">Powrót</a>
          <a class="btn btn-primary" href="<%=request.getContextPath()%>/WebSocketChart.jsp"
    c               lass="nav-link">WebSocketChart</a>
          <a class="btn btn-dark" href="logout.jsp">Wyloguj</a>
        </div>
      </nav>
                <script language="javascript" type="text/javascript">
            
//            var wsUri = "ws://localhost:8080/WebApplication4KS/message";
            var wsUri = getRootUri() + "/WebApplication4KS/message";
            function getRootUri(){
                var wsUri = (location.protocol === "http:" ? "ws://":"wss://"); 
                return wsUri + (document.location.hostname === "" ? "localhost" :
                        document.location.hostname)+ ":" + 
                        (document.location.port === "" ? "8080" :
                        document.location.port);                
            }
            function init() {
                output = document.getElementById("output");
            }
            function send_message() {
                websocket = new WebSocket(wsUri);
                websocket.onopen = function(evt) {
                    onOpen(evt)
                };
                websocket.onmessage = function(evt) {
                    onMessage(evt)
                };
                websocket.onerror = function(evt) {
                    onError(evt)
                };
            }
            function onOpen(evt) {
                writeToScreen("POŁĄCZONO");
                doSend(textID.value);
            }
            function onMessage(evt) {
                writeToScreen("OTRZYMANO: " + evt.data);
            }
            function onError(evt) {
                writeToScreen('BŁĄD: ' + evt.data);
            }
            function doSend(message) {
                writeToScreen("WYSŁANO: " + message);
                websocket.send(message);
                //websocket.close();
            }
            function writeToScreen(message) {
                var pre = document.createElement("p");
                pre.style.wordWrap = "break-word";
                pre.innerHTML = message;
                output.appendChild(pre);

            }
            window.addEventListener("load", init, false);
        </script>
        <h1 style="text-align: center;">Strona WebSocket</h2>
        <br>
        <div style="text-align: center;">
            <form action="">
                <input id="textID" name="message" value="" type="text">
                <input class="btn btn-success" onclick="send_message()" value="Wyślij" type="button">
            </form>
        </div>
        <div id="output"></div>
</body>
</html>
