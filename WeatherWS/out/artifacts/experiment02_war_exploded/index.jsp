<%@ page import="java.util.List" %>
<%@ page import="example.Weather.cn.*" %>
<%@ page import="java.nio.charset.StandardCharsets" %><%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: weee--%>
<%--  Date: 2022/10/22--%>
<%--  Time: 21:25--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--  <head>--%>
<%--    <title>$Title$</title>--%>
<%--  </head>--%>
<%--  <body>--%>
<%--  ${E}元，个人所得税为：${END}}--%>
<%--  </body>--%>
<%--</html>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
  <title>WeatherWs-天气预报系统</title>
</head>
<body>
<form method="post">
  城市：<input type="text" name="city"><br>
  <input type="submit" name="submit" value="查询天气"><br>
</form>

<%
  List<String> list=null;
  if (request.getParameter("submit")!=null){
    String city1=request.getParameter("city");
    byte[] bytes=city1.getBytes(StandardCharsets.ISO_8859_1);
    city1=new String(bytes, StandardCharsets.UTF_8);
    System.out.println(city1);
    WeatherWS weatherService = new WeatherWS();
    WeatherWSSoap weatherWebServiceSoap = weatherService.getWeatherWSSoap();
    List<String> citys = weatherWebServiceSoap.getSupportCityString("311101").getString();
    int cityCode = 0;
    for (int i = 0; i < citys.size(); i++) {
      String city = citys.get(i);
      if (city.startsWith(city1)) {
        cityCode =i;
        break;
      }
    }
    StringBuilder stringBuilder=new StringBuilder(citys.get(cityCode));
    stringBuilder.delete(0,3);
    ArrayOfString weather = weatherWebServiceSoap.getWeather(stringBuilder.toString(),"");
    list = weather.getString();
  }
%>
<p>
  天气为:<br>
  <pre><%= list%></pre>
</p>
</body>
</html>
