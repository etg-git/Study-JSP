<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import= "java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>application 기본 객체 사용하여 자원읽기</title>
</head>
<body>
	<%
		String resourcePath = "/message/notice.txt";
	%>
	
	자원의 실제경로 : <br>
	<%= application.getRealPath(resourcePath) %>
	<br>
-------------<br>
	<%= resourcePath  %> 의 내용 <br>
-------------<br>
	<%
		char[] buff = new char[128];
		int len = -1;
		
		InputStreamReader isr = null;
		try {
			isr = new InputStreamReader(application.getResourceAsStream(resourcePath), "euc_kr");
			
			while((len = isr.read(buff)) != -1) {
				out.print(new String(buff, 0, len));
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				isr.close();
			} catch(Exception e){
				
			}
		}
	%>	
</body>
</html>