<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.Enumeration" %>
<%@ page import = "java.util.Map" %>
<%
	request.setCharacterEncoding("EUC-KR"); //UTF-8로 설정을 해야함(POST방식일때만). GET으로 들어왔을때 표준화된 방법이 존재하지않는다(꺼내올수없다).
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>요청 파라미터 출력</title>
</head>
<body>
<b> request.getParamter() 메서드 사용</b> <br>
name 파라미터 = <%= request.getParameter("name") %> <br>
address 파라미터 = <%= request.getParameter("address") %> <br>
<p>
<b> request.getParameterValues() 메서드 사용 </b><br>

<%

	String[] values = request.getParameterValues("pet");
	if(values!=null) {
		for(int i=0; i<values.length; i++) {
			%>
			<%= values[i] %>
<% 
		}
	}
%>
</p>
<p>
<b> request.getParameterNames() 메서드 사용 </b><br>
<% 
	Enumeration paramEnum = request.getParameterNames();
	while(paramEnum.hasMoreElements()) {
		String name =(String)paramEnum.nextElement();
%>
	<%= name %>
	<% 
	}
%>
</p>
<p>
<b>request.getParameterMap() 메서드 사용</b> <br>
<% 
	Map parameterMap = request.getParameterMap(); //키 : string 값 : string배열
	String[] nameParam = (String[])parameterMap.get("name");
	if(nameParam != null) {
%>
	name = <%= nameParam[0] %>
<%
	}
%>
</p>
</body>
</html>