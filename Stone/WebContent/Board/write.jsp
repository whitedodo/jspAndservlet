<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 쓰기(Post Write)</title>
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="../Fonts/NanumGothic/fonts.css">
</head>
<body>

<h2 class="h2_write">글 쓰기(Post Write)</h2>

<!--  <form action="write_ok.jsp" method="post">-->
<form action="Write" method="post">

<table class="tg_write">
	<tr>
		<td class="header" style="width:10%;">
			유형(Type)
		</td>
		<td style="width:10%;">
			<select name="postType">
				<option value="일반(general)">일반(General)</option>
				<option value="보호(protected)">보호(Protected)</option>
			</select>
		</td>
		<td class="header" style="width:10%;">
			작성자(Author)
		</td>
		<td>
			<input type="text" name="author" class="input_write" />
		</td>
	</tr>
	
	<tr>
		<td class="header" style="width:10%;">
			비밀번호(Password)
		</td>
		<td style="width:10%;">
			<input type="password" name="passwd1" class="input_write" />
		</td>
		<td class="header" style="width:10%;">
			비밀번호 확인(Password Check)
		</td>
		<td style="width:10%;">
			<input type="password" name="passwd2" class="input_write" />
		</td>
	</tr>
	<tr>
		<td class="header" style="width:10%;">
			제목(Subject)
		</td>
		<td colspan="3">
			<input type="text" name="subject" class="input_write" />
		</td>
	</tr>
	<tr>
		<td class="header" colspan="4">
			내용
		</td>
	</tr>
	<tr>
		<td colspan="4" style="text-align:left;">
			<textarea name="memo" class="textarea_write"></textarea>
		</td>
	</tr>
</table>
<input type="submit" value="삽입" />
</form>

</body>
</html>