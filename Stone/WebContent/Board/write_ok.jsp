<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import = "java.util.Calendar" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "com.jasper.model.*" %>

<%
	request.setCharacterEncoding("UTF-8");

	Board boardModel = new Board();
	
	boardModel.setPostType("일반(General)");
	boardModel.setSubject(request.getParameter("subject"));
	boardModel.setAuthor(request.getParameter("author"));
	
	String passwd = null;
	String passwd1 = request.getParameter("passwd1");
	String passwd2 = request.getParameter("passwd2");
	
	if ( passwd1.equals(passwd2) ){
		passwd = passwd1;
	}
	
	boardModel.setPasswd(passwd);
	boardModel.setMemo(request.getParameter("memo"));
	boardModel.setCommentCnt(0);
	boardModel.setIp("127.0.0.1");
	
	java.util.Date utilDate = new java.util.Date();
	boardModel.setRegidate(new Timestamp(System.currentTimeMillis()));
	
	//boardModel.setRegidate();
	boardModel.setCount(0);
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String driver = "jdbc:mariadb://localhost:3306/rabbit2me";
	String dbUser = "root";
	String dbPasswd = "1234";
	String query = null;
	
	try{
		
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection(driver, dbUser, dbPasswd);
		
		query = "insert into board_list values(postType, subject, memo, " + 
							   "author, passwd, commentCnt, ip, regidate, count) " +
							   "values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, boardModel.getPostType());
		pstmt.setString(2, boardModel.getSubject());
		pstmt.setString(3, boardModel.getMemo());
		pstmt.setString(4, boardModel.getAuthor());
		pstmt.setString(5, boardModel.getPasswd());
		pstmt.setInt(6, boardModel.getCommentCnt());
		pstmt.setString(7, boardModel.getIp());
		pstmt.setTimestamp(8, boardModel.getRegidate());
		pstmt.setInt(9, boardModel.getCount());
		
%>

<%=query %>
<%=boardModel.getRegidate() %>
		
<%
	pstmt.executeUpdate();
		
		
	}finally{
		
		if ( pstmt != null){
			try{
				pstmt.close();
			}catch(SQLException ex){
				
			}
		} // end of if
		
		if ( conn != null ){
			
			try{
				conn.close();
			}catch(SQLException ex){
				
			}
		} // end of if
		
		
	}
	
%>