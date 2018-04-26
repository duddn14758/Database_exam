<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Kpop 팬사이트</title>
</head>
<body>

<h2>발표곡</h2>

<table border = 1>
<tr><td>곡명</td><td>년도</td></tr>

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

<h2>소속 정보</h2>

<table border =1>

<tr><td>이름</td><td>성별</td><td>출생년도</td></tr>

<%
st= conn.prepareStatement("select *from idol where ");

gnoStr=request.getParameter("gno");

gno = Integer.parseInt(gnoStr);

rs=st.executeQuery();

while(rs.next()){
	%><tr> <td> <%= rs.getString("name") %> </td>
	<td> <%= rs.getString("gender").equals("M") ? "남":"여" %> </td> 
	<td> <%= rs.getInt("year") %> </td> </tr>	
	
	<%	
}

conn.close();
%>
</table>

</body>
</html>