/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pl.webapplication4ks.websockets;

import java.io.IOException;
import java.util.Random;
import javax.websocket.OnMessage;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

/**
 *
 * @author kamillo104
 */
@ServerEndpoint("/chart")
public class WebSocketEndPointChart {

    @OnMessage
    public String onMessage(Session session, String msg, boolean last) {
        Random rd = new Random();
        int[] dataPointsParam = new int[10];
        for (int i = 0; i < dataPointsParam.length; i++) {
         dataPointsParam[i] = rd.nextInt(101);
        }
        String dataArrayString = java.util.Arrays.toString(dataPointsParam);       
        try {
            if (session.isOpen()) {
                session.getBasicRemote().sendText(msg, last);
            }
        } catch (IOException e) {
            try {
                session.close();
            } catch (IOException e1) {
                // Ignore
            }
        }
              return dataArrayString;
    }
    
}
