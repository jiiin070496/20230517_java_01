<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>
<body>
	<h2>관광지날씨</h2>
	관광지명 : 
	<select id = "location">
		<option value=52>서울홍대</option>
		<option value=55>서울명동</option>
		<option value=58>서울한강</option>
	</select>
	<button id="btn1">관광지날씨</button>
	<br><br>
	<table id="result1" border="1">
		<thead>
			<tr>
				<th>관광지역</th>
				<th>관광지명</th>
				<th>기온</th>
				<th>습도</th>
				<th>강수확률</th>
			</tr>
		</thead>
		<tbody></tbody>
	</table>
	<script>
		$(function){
			$("#btn1").click(function(){
				$.ajax({
					url:"weather.do",
					data:{location:$("#location").val()},
					sucess:function(data){
						const itemArr = data.response.body.items.item;
						let value = "";
						for(let i in itemArr){
							let item = itemArr[i];
							value += "<tr>"
								+ "<td>" + item.spotAreaName + "</td>"
								+ "<td>" + item.spotName + "</td>"
								+ "<td>" + item.th3 + "</td>"
								+ "<td>" + item.rhm + "</td>"
								+ "<td>" .十item.pop + "</td>"
								+ "</tr>";
						}
					}
				})
			})
		}
	</script>
</body>
</html>