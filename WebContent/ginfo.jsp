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

<h2>��ǥ��</h2>

<table border = 1>
<tr><td>���</td><td>�⵵</td></tr>

<%
	Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection(
		"jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", "db201312108", "201312108");
PreparedStatement st= conn.prepareStatement("select year, title from song where gno	= ?");

String gnoStr=request.getParameter("gno");

int gno = Integer.parseInt(gnoStr);



ResultSet rs=st.executeQuery();

while(rs.next()){
	%><tr> <td> <%= rs.getString("title") %> </td>
	<td> <%= rs.getInt("year") %> </td> </tr>	
	
	<%	
}

rs.close();
st.close();

%>

</table>

<h2>�Ҽ� ����</h2>

<table border =1>

<tr><td>�̸�</td><td>����</td><td>����⵵</td></tr>

<%
st= conn.prepareStatement("select *from idol where ");

gnoStr=request.getParameter("gno");

gno = Integer.parseInt(gnoStr);

rs=st.executeQuery();

while(rs.next()){
	%><tr> <td> <%= rs.getString("name") %> </td>
	<td> <%= rs.getString("gender").equals("M") ? "��":"��" %> </td> 
	<td> <%= rs.getInt("year") %> </td> </tr>	
	
	<%	
}

conn.close();
%>
</table>

</body>
</html>