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

<table border = 1>

<%
	Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection(
		"jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", "db201312108", "201312108");

String gnoStr=request.getParameter("gno");
if(gnoStr!=null&&gnoStr.length()>0){
	//gno�� �ش��ϴ� �׷��� like_cnt�� 1 ����
	PreparedStatement st= conn.prepareStatement("update igrp set like_cnt = like_cnt+1 where gno=?");
	st.setInt(1,Integer.parseInt(gnoStr));
	
	st.executeUpdate();
	//executeQuery�� �ƴ� update�� �ϴ� ���� - update�ϸ� int���� return���ֱ⶧���� ��� ����Ǿ����� �� �� �ִ�.
}

PreparedStatement st= conn.prepareStatement("select * from igrp");

ResultSet rs=st.executeQuery();

while(rs.next()){
	%><tr> <td> <%= rs.getInt("gno") %> </td>
	<td> <%=rs.getString("gname") %> </td>
	<td> <%= rs.getString("company") %> </td>
	<td> <a href="index3.jsp?gno=<%=rs.getInt("gno")%>"><%= rs.getInt("like_cnt") %> </a></td> </tr>	
	
	<%	
}



rs.close();
st.close();
conn.close();




%>

</table>

</body>
</html>