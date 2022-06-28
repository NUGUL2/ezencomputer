<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script> <!-- jquery 사용 -->
	<script>
		$(function() {
			$("#checkId").click(function() {
				let member_id = $("#member_id").val();
				
				$.ajax({ /* ajax */
					type:'post',	
					url:"/spring/checkId.do",
					data:{"member_id":member_id},
					success:function(data){
						if(data=="N") {
							result="사용 가능한 아이디입니다.";
							$("#result_checkId").html(result).css("color","green"); /* 버튼 색 지정 */
							$("#member_pw").trigger("focus");
						}else{
							result="이미 사용 중인 아이디입니다.";
							$("#result_checkId").html(result).css("color","red");
							$("#member_id").val("").trigger("focus");
						}
					},
					error:function(error){alert(error);}
				});				
			});
		});
	
	
	
	</script>
</head>

<body>

<h3>회원정보를 입력해주세요</h3>

<form name="joinForm" action="/spring/joinProcess.do" method="post">
	<input type="email" name="member_id" id="member_id" value="" maxlength="80" placeholder="아이디(이메일)" />
	<input type="button" id="checkId" value="중복검사"><br>
	<div style="height: 20px"><span id="result_checkId" style="font-size: 20"></span></div> <!-- 중복검사결과를 보여주는 텍스트 -->
	
	<input type="password" name="member_pw" id="member_pw" value="" maxlength="20" placeholder="비밀번호"><p/>            
	<input type="text" name="member_name" maxlength="40" value="" placeholder="이름"><p/>
	<input type="tel" name="member_phone"  value="" autocomplete="off" placeholder="휴대폰 번호"><p/>
	<input type="submit" value="가입하기">
	<input type="reset"  value="취소하기">
</form> 

</body></html>        