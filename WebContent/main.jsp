<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>식당요정!</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<style>
body {
	background-color: rgb(120, 212, 143);
	
	}
	.form-div {
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
	
	.day_select {
		width: 60px;
		height: 40px;
		font-size : 16px;
		border-radius: 10px;
		cursor: pointer;
		
		overflow-y: hidden;	
		
	}
	
	.day_select option {
		width: 60px;
		height: 40px;
		font-size : 16px;
		border-radius: 10px;
		cursor: pointer;	
		
		overflow-y: hidden;
	}
	
	input[type="radio"] {
		width: 20px;
		height : 20px;
		background-color: white;
		cursor: pointer;
		margin-top: 10px;
	}
	
	input[type="submit" i] {
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
<body>
	
	<div class="form-div">
		<h3>미림 9월 급식 찾기</h3>
		<form action="mainProc.jsp" method="post">	
			
			<p>9월의 급식메뉴 알아보기</p>
			<select name="m_day" class="day_select"> <% 
				for(int i =1; i<31; i++) { %>
					<option value="<%=i%>"> <%=i %> 일 </option>
				<% }%>
			</select>
			<div class="w"><input type="radio"	name="time" value="breakfast" class="ch" checked="checked">아침</div> <br/>
			<div class="w"><input type="radio"	name="time" value="lunch"class="ch">점심</div> <br/>
			<div class="w"><input type="radio"	name="time" value="dinner"class="ch">저녁	</div>	 <br/>
			<div><input type="submit" value="검색"></div>
		</form>
	</div>

</body>
</html>