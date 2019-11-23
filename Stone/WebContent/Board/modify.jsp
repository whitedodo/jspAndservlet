<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정(Post Modify)</title>
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="../Fonts/NanumGothic/fonts.css">
</head>
<body>

<h2 class="h2_modify">글 수정(Post Modify)</h2>

<form action="modify_ok.jsp" method="post">

<table class="tg_modify">
	<tr>
		<td class="header" style="width:10%;">
			번호(Num)
		</td>
		<td style="width:10%;">
			
		</td>
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
			<input type="text" name="author" class="input_modify" />
		</td>
	</tr>
	<tr>
		<td class="header" style="width:10%;">
			비밀번호(Password)
		</td>
		<td colspan="2" style="width:10%;">
			<input type="password" name="passwd1" class="input_modify" />
		</td>
		<td class="header" style="width:10%;">
			비밀번호 확인(Password Check)
		</td>
		<td colspan="2" style="width:10%;">
			<input type="password" name="passwd2" class="input_modify" />
		</td>
	</tr>
	<tr>
		<td colspan="2" class="header" style="width:10%;">
			제목(Subject)
		</td>
		<td colspan="4">
			<input type="text" name="subject" class="input_modify" />
		</td>
	</tr>
	<tr>
		<td class="header" colspan="6">
			내용
		</td>
	</tr>
	<tr>
		<td colspan="6" style="text-align:left;">
			<textarea name="memo" class="textarea_modify"></textarea>
		</td>
	</tr>
	
</table>
</form>

</body>
</html>