<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Kpop �һ���Ʈ</title>
</head>
<body>

<h2>KPOP ���̵� �����Ʈ�� ���� ���� ȯ���մϴ�.</h2>

<table>

<%
	Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection(
		"jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", "db201312108", "201312108");
PreparedStatement st= conn.prepareStatement("select * from igrp");

ResultSet rs=st.executeQuery();

while(rs.next()){
	%><tr> <td> <%= rs.getInt("gno") %> </td>
	<td> <a href="ginfo.jsp?gno=<%=rs.getInt("gno")%>"><%=rs.getString("gname") %></a> </td>
	<td> <%= rs.getString("company") %> </td>
	<td> <%= rs.getInt("like_cnt") %> </td> </tr>	
	
	<%	
}



rs.close();
st.close();
conn.close();




%>

</table>

</body>
</html>