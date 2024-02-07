/* ====================유효성 검사 ==================== */ 
function check() {
	
  	/* ==================== 아이디 유효성 검사 ==================== */
  	var idInput = document.signup.id.value.trim(); 
  
  	if (idInput == '') {
     	alert('아이디를 입력해 주세요.');
     	return false;
  	} else {
     	/*영어 또는 숫자만 입력 가능*/
     	var idValid = /^[A-Za-z0-9][A-Za-z0-9]*$/;
     
       	if( !idValid.test(idInput) ) {
        alert('아이디는 영어 또는 숫자만 가능합니다.');
        return false;
     	}   
 	 }
  	/* ======================================================= */
  
  	/* ==================== 비밀번호 유효성 검사 ==================== */
  	var pwInput = document.signup.pw.value.trim();
  	var pwReInput = document.signup.pwRe.value.trim();
  
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
  
  
  	if (document.signup.name.value.trim() == '') {
     	alert('이름을 입력해 주세요.');
     	return false;
  	}	
 	 
  	if (document.signup.tel.value.trim() == '') {
     	alert('전화번호를 입력해 주세요.');
     	return false;
  	}
  
  	/* ==================== 이메일 유효성 검사 ==================== */
  	var emailInput = document.signup.email.value.trim();
  
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
	
	if (document.signup.idChk.value == "N") {
		alert("아이디 중복확인을 해주세요.");
     	return false;	
	}
	
	/* ==================== 이메일 인증 여부 확인 ==================== */ 
	var inputCode = $(".mail_check_input").val();        // 입력코드    
	var emailChk = document.signup.emailChk.value;
	   
	if (emailChk == "") {
		alert("이메일을 인증해주세요.");
     	return false;	
	}

   	if(inputCode != emailChk){     
       	alert("인증번호를 다시 입력해주세요.");
     	return false;
   	} 
	/* ======================================================= */
	
  	document.signup.submit();
}


/* ==================== 아이디 중복 검사 ==================== */ 
function fn_idChk(){
   console.log("중복검사 진입");
   $.ajax({
      url : "/user/idChk",
      type : "post",
      dataType : "json",
      data : {"id" : $("#id").val()},
      
      success : function(data){
         
         if (data > 0) {
            alert("중복된 아이디입니다.");
         } else {
            $("#idChk").attr("value", "Y");
            alert("사용가능한 아이디입니다.");
         }
      }
   })
   
}
   
$(document).ready(function () {   
   
   /* 인증번호 이메일 전송 */
   $(".mail_check_button").click(function(){
      
       var email = $(".mail_input").val();        // 입력한 이메일
       var checkBox = $(".mail_check_input");        // 인증번호 입력란

       $.ajax({
           url:"/user/mailCheck?email=" + email,
           type:"GET",
           success:function(data){
			
				
				alert("인증메일이 발송되었습니다.");           		
	
               console.log("data : " + data);
               checkBox.attr("disabled",false);

				$("#emailChk").attr("value", data);
           
           }
                   
       });
   });

});

