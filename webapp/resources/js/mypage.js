/* ====================유효성 검사 ==================== */ 
function check() {
		
      	/* ==================== 아이디 유효성 검사 ==================== */
      	/*var idInput = document.mypage.id.value.trim(); 
      
      	if (idInput == '') {
         	alert('아이디를 입력해 주세요.');
         	return false;
      	} else {
         	영어 또는 숫자만 입력 가능
         	var idValid = /^[A-Za-z0-9][A-Za-z0-9]*$/;
         
           	if( !idValid.test(idInput) ) {
            	alert('아이디는 영어 또는 숫자만 가능합니다.');
            	return false;
         	}   
      	}*/
      	/* ======================================================= */
		
		/* ==================== 비밀번호 유효성 검사 ==================== */
		var pwInput = document.mypage.pw.value.trim();
		var pwReInput = document.mypage.pwRe.value.trim();
		
		/*최소 8자 + 최소 한개의 영문자 + 최소 한개의 숫자 + 최소 한개의 특수 문자*/
		var pwValid = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
		
		if (pwInput == '') {
			alert('비밀번호를 입력해 주세요.');
			return false;
		}
		
		if( !pwValid.test(pwInput) ) {
		    alert("비밀번호는 8자리 이상, 영어, 숫자, 특수문자를 포함하여 입력해주세요.");
		    return false;
		}
		
		if (pwReInput == '') {
			alert('비밀번호 확인을 입력해 주세요.');
			return false;
		}
		
		if (pwInput !== pwReInput) {
			alert('비밀번호가 일치하지 않습니다.');
			return false;
		}
		/* ======================================================= */
		
		
		if (document.mypage.name.value.trim() == '') {
			alert('이름을 입력해 주세요.');
			return false;
		}
		
		if (document.mypage.tel.value.trim() == '') {
			alert('전화번호를 입력해 주세요.');
			return false;
		}
		
		/* ==================== 이메일 유효성 검사 ==================== */
		var emailInput = document.mypage.email.value.trim();
		
		if (emailInput == '') {
			alert('이메일을 입력해 주세요.');
			return false;
		}
		
		var emailValid = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
		
		if (emailValid.test(emailInput) == false) {
			alert("유효하지 않은 이메일 주소입니다.");
			return false;
		}
		/* ======================================================= */
		
		document.mypage.submit();
}
