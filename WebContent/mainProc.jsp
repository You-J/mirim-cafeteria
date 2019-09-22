<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>식당요정!</title>

<style >
	body {
	background-color: rgb(120, 212, 143);
	
	}
	.m_result {
			width : 400px;
            height : 400px;
            border : 1px solid rgb(231, 214, 197);
            background-color : rgb(231, 214, 197);
            border-radius: 30px;
            text-align: center;
            position: absolute;
            top : 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            box-shadow: 8px 8px rgb(206, 191, 175);
	}
	
	.meal {
		margin: 10%;
		height:50px;
		border: 10%;
		font-size: 20px;
		line-height:35px; 		
	
	}
	input[type="button"] {
		width: 100px;
		height: 40px;
		border: 1px solid pink;
		background-color : pink;
		border-radius: 10px;
		font-size: 16px;
		box-shadow: 3px 3px rgb(214, 163, 172) inset;
		cursor: pointer;
		position: absolute;
		bottom: 10px;
		left: 50%;
        transform: translate(-50%,-50%);
	}
	
</style>
</head>
<body>
<%

	request.setCharacterEncoding("utf-8");
	String s_days = request.getParameter("m_day");
	int m_day = Integer.parseInt(s_days);
	String time = (String)request.getParameter("time");
	String[] arr ;
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
		try{
			String url = "jdbc:mysql://localhost:number/user_name";
			String user = "user_name";
			String pass = "password";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url,user,pass);
			
			String sql = "select * from mealsch";
			pstmt =  conn.prepareCall(sql);
			rs = pstmt.executeQuery();
			
			String test_time = "";
			String meal_time = "";
			
			while(rs.next()) {
				
				if(m_day == rs.getInt("m_day")){
					if(time.equals("breakfast")) { 
						test_time = rs.getString("breakfast");
						meal_time="아침";
					}
					else if(time.equals("lunch")){
						test_time = rs.getString("lunch");
						meal_time="점심";
					}
					else if(time.equals("dinner")){
						test_time = rs.getString("dinner");
						meal_time="저녁";
					}
					
					
				}
				else if(13== m_day || 12== m_day) {
					test_time ="추석 연휴입니다.";
				}
				else if(m_day%7 ==1 || m_day%7 ==0 ) {
					test_time="삐! 즐거운 주말입니당!";
				}

				
			}//while
			%>
			
			<div class="m_result">
			<h3>9월 <%=m_day %>일, <%=meal_time %> 메뉴는?</h3>
				
				<div class="meal"><%
					arr = test_time.split("\\n");
					for(int i = 0; i < arr.length; i++) { %>
						
						<%= arr[i] %> <br>
					<%	
					}
				%></div>
				<input type="button" onclick="location.href='main.jsp'" value="뒤로가기">
			</div> 			
			
			<%
		}
		catch(Exception e) {
			out.println("레코드 추가 실패");
			e.printStackTrace();
		}
		finally {
			if(pstmt != null) {	try{	pstmt.close();	}catch(Exception e) { }	}
			if(conn != null) {  try{	conn.close();	}catch(Exception e) { }	}// if
			if(conn != null) { try { conn.close(); } catch(Exception e) {} }
		}
	
	%>

</body>
</html>