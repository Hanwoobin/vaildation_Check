<%@page import="java.sql.*"%>

<%
	Connection conn = null;
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url,"hr","hr");
	} catch(Exception e) {
		e.printStackTrace();
	}
%>