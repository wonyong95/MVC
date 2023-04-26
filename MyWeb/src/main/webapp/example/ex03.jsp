<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	table{
		width:90%;
		margin:auto;
		height:400px;
		border-collapse:collapse;
	}
	table td{
		text-align:center;
	}
	table th{
		background-color:gray;
		color:white;
	}
	h1{
		text-align:center;
	}
</style>    
<%-- 반복문 이용해서 구구단 전체를 테이블 형태로 출력하세요 --%>
<h1>구구단</h1>
<table border="1">

	<tr>
	<%
	for(int dan=2;dan<10;dan++){
	%>
		<th><%=dan%> 단</th>
	<% 
	}
	%>	
	</tr>

<%
	for(int i=1;i<10;i++){
%>
	<tr>
		<%
		for(int j=2;j<10;j++){
		%>
		<td>
		<%=j%>x<%=i%>= <%=j*i%>
		</td>
		<% 
		}//for----
		%>
	</tr>
<%
	}//for------
%>	
</table>    