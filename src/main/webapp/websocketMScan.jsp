<%@ page import="org.apache.tomcat.websocket.server.WsServerContainer" %>
<%@ page import="javax.websocket.server.ServerContainer" %>
<%@ page import="java.lang.reflect.Field" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="javax.websocket.server.ServerEndpointConfig" %><%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 通过 request 的 context 获取 ServerContainer
    WsServerContainer wsServerContainer = (WsServerContainer) request.getServletContext().getAttribute(ServerContainer.class.getName());

    // 利用反射获取 WsServerContainer 类中的私有变量 configExactMatchMap
    Class<?> obj = Class.forName("org.apache.tomcat.websocket.server.WsServerContainer");
    Field field = obj.getDeclaredField("configExactMatchMap");
    field.setAccessible(true);
    Map<String, Object> configExactMatchMap = (Map<String, Object>) field.get(wsServerContainer);

    // 遍历configExactMatchMap, 打印所有注册的 websocket 服务
    Set<String> keyset = configExactMatchMap.keySet();
    Iterator<String> iterator = keyset.iterator();
    while (iterator.hasNext()){
        String key = iterator.next();
        Object object = wsServerContainer.findMapping(key);
        Class<?> wsMappingResultObj = Class.forName("org.apache.tomcat.websocket.server.WsMappingResult");
        Field configField = wsMappingResultObj.getDeclaredField("config");
        configField.setAccessible(true);
        ServerEndpointConfig config1 = (ServerEndpointConfig)configField.get(object);
        Class<?> clazz = config1.getEndpointClass();

        // 打印 ws 服务 url， 对应的 class
        out.println(String.format("websocket name：%s,  websocket class: %s", key, clazz.getName()));
    }

    // 如果参数带name， 删除该服务，名字为name参数值
    if(request.getParameter("name")!= null){
        configExactMatchMap.remove(request.getParameter("name"));
        out.println(String.format("delete ws service: %s", request.getParameter("name")));
    }
%>