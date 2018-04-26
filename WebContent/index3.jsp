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

<h2>KPOP 아이돌 펜사이트에 오신 것을 환영합니다.</h2>

<table border = 1>

<%
	Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection(
		"jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", "db201312108", "201312108");

String gnoStr=request.getParameter("gno");
if(gnoStr!=null&&gnoStr.length()>0){
	//gno에 해당하는 그룹의 like_cnt를 1 증가
	PreparedStatement st= conn.prepareStatement("update igrp set like_cnt = like_cnt+1 where gno=?");
	st.setInt(1,Integer.parseInt(gnoStr));
	
	st.executeUpdate();
	//executeQuery가 아닌 update를 하는 이유 - update하면 int값을 return해주기때문에 몇개가 변경되었는지 알 수 있다.
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