<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<title>내정보</title>
</head>

<body>

<h3>내정보</h3>

<table border="1" style="border-collapse: collapse;">
	<tr>
		<td>아이디</td>
		<!-- JSP페이지에서는 controller에서 생성된 Model객체를 EL을 이용해 사용 -->
		<td>${memberVo.member_id}</td>
	</tr>

	<tr>
		<td>비밀번호</td>
		<td>${memberVo.member_pw}</td>
	</tr>

	<tr>
		<td>이름</td>
		<td>${memberVo.member_name}</td>
	</tr>

	<tr>
		<td>폰번호</td>
		<td>${memberVo.member_phone}</td>
	</tr>
</table><p/>
<a href="/spring/updateMember.do">정보수정</a>&nbsp;&nbsp;
<a href="/spring/deleteMember.do">회원탈퇴</a>

</body>
</html>        