<%-- 
    Document   : WebSocketChart
    Created on : 2020-05-17, 15:59:00
    Author     : kamillo104
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
    <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
    </head>
    <body>
        <meta charset="utf-8">
        <title>Strona WebSocket Chart</title>
      <nav class="navbar navbar-light bg-light static-top">
        <div class="container">
          <a class="navbar-brand"><%=request.getRemoteUser()%></a>
          <a class="btn btn-primary" href="<%=request.getContextPath()%>/list"
    c               lass="nav-link">Powrót</a>
          <a class="btn btn-primary" href="<%=request.getContextPath()%>/WebSocketJSP.jsp"
    c               lass="nav-link">WebSocket</a>
          <a class="btn btn-dark" href="logout.jsp">Wyloguj</a>
        </div>
      </nav>
                <script language="javascript" type="text/javascript">         
            var dataPointsParam=[];
            var webSocketTimer=setInterval(doSend, 500);
            var wsUri = getRootUri() + "/WebApplication4KS/chart";
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
//                doSend(textID.value);
            }
            function onMessage(evt) {
                writeToScreen("OTRZYMANO: " + evt.data);
                var dataArrayJSON = JSON.parse(evt.data);
                for(i = 0; i < dataArrayJSON.length; i++){
                    dataPointsParam[i]={label:i,y: dataArrayJSON[i]};
                }
                drawChart(dataPointsParam);
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
                var pre = document.getElementById("messageID")
                pre.value=message;
            }
            function drawChart(data){
                var chart = new CanvasJS.Chart("chartContainer", {
		title:{
			text: "Wykres CanvasJS"              
		},
		data: [              
		{
			// Change type to "doughnut", "line", "splineArea", etc.
			type: "column",
			dataPoints: data
		}
		]
	});
	chart.render();
            }
            window.onload = send_message();
            window.addEventListener("load", init, false);
        </script>
        <h1 style="text-align: center;">Strona WebSocket Wykres</h2>
        <br>
        <div style="text-align: center;">
            <form action="">
                <input id="textID" name="message" value="" type="text">
                <input class="btn btn-success" onclick="send_message()" value="Wyślij" type="button"><br>
                <input id="messageID" value="" type="text">
            </form>
        </div>

        <div style="height:300px;width: 50%" id="chartContainer"></div>

</body>
</html>
