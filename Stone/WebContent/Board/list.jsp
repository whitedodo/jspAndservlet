<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="../Fonts/NanumGothic/fonts.css">
</head>
<body>
<h2 class="h2_list">게시판 목록</h2>
<table class="tg_list">
	<tr class="header">
		<td style="width:10%;">
			번호(Num)
		</td>
		<td style="width:10%;">
			유형(Type)
		</td>
		<td>
			제목(Subject)
		</td>
		<td style="width:10%;">
			작성자(Author)
		</td>
		<td style="width:10%;">
			댓글(Comment)
		</td>
		<td style="width:10%;">
			조회수(Count)
		</td>
		<td style="width:10%">
			등록일자(Regidate)
		</td>
	</tr>
	<%

		Connection conn = null;
		Statement stmt = null;
	
		String driver = "jdbc:mariadb://localhost:3306/rabbit2me";
		String dbUser = "root";
		String dbPasswd = "1234";
		
		ResultSet rs = null;
		
		try{
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(driver, dbUser, dbPasswd);
			
			if (conn == null){
				throw new Exception("데이터베이스에 연결할 수 없습니다.<br>");
			}
			
			String query = "select * from board_list";
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
		
			while(rs.next()){
	%>
	<tr>
		<td>
			<%= rs.getString("id") %>
		</td>
		<td>
			<%= rs.getString("postType") %>
		</td>
		<td>
			<%= rs.getString("subject") %>
		</td>
		<td>
			<%= rs.getString("author") %>
		</td>
		<td>
			<%= rs.getInt("commentCnt") %>
		</td>
		<td>
			<%= rs.getInt("count") %>
		</td>
		<td>
			<%= rs.getDate("regidate") %>
		</td>
	</tr>
	<%
			} // end of while
				
			
				
		}
		catch(SQLException ex){
			
		}
		finally{
			
			try{
			
				if ( rs!= null ){
					rs.close();
				}
				
				if ( stmt != null ){
					stmt.close();
				}
				
				if ( conn != null ){
					conn.close();
				}
				
			}
			catch(SQLException ex){ }
			
		} // end of try to finally
	
	%>
	
</table>

<!-- 페이징 영역(Paging Area -->


</body>
</html>