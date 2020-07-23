<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.Vector" %>
<%@ page import = "kr.ac.green.Article" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>list.jsp</title>
</head>
<form id = "hiddenForm" action = "readArticle.jsp">
	<input type ="hidden" name = "num" />
</form>
<script>
	function select(num) {
		var myForm =document.getElementById("hiddenForm");
		// var myForm = document.forms["hiddenForm"];
		// var myForm = document.hiddenForm; //문서에서 hiddenform을 찾아라
		myForm.num.value = num;
		myForm.submit();
		// location.href = "readArticle.jsp?num=" + num;
		
	}
</script>
<body>
<%	
	String msg = "어서오세요";
	Object o = session.getAttribute("msg");
	if(o != null) {
		msg = o.toString();
	}
	session.removeAttribute("msg");
%>
<div> message : <%= msg %></div>
<a href = "write.jsp"> 글등록 </a>

<hr>
<table>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>글쓴이</th>
		<th>작성일</th>
	</tr>
	<%
		Vector<Article> list = (Vector<Article>)application.getAttribute("list");
	
		if(list == null || list.size() == 0) {
	%>
	<tr>
		<th colspan ="4"> 등록된 글이 없습니다. </th>
	</tr>
	<% 
		} else {
			for(int i=list.size()-1; i>=0; i--) {
				Article temp = list.get(i);
	%>
	<tr onclick = "select(<%= temp.getNum() %>)">
		<td><%= temp.getNum() %></td>
		<td><%= temp.getTitle() %></td>
		<td><%= temp.getWriter() %></td>
		<td><%= temp.getDateString() %></td>
	</tr>
	<%
			}
		}
	%>
</table>
</body>
</html>