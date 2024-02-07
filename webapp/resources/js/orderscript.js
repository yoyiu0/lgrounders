$(document).ready(function() {
    $('.positionBtn').attr("disabled",true);
    $(".assignSeat_input").attr("readonly",true);
	$(".orderBtn").attr("disabled",true);
	
	//disabled된값 가져오기 위한 배열 선언
	let seatArray = [];
	
	$(".locationBtn").click(function(){
		
		
		
		//disabled된값 가져오기
		$("input[name='seatChk']:checked").each(function(){
			if($(this).is(':disabled')){
				var temp = $(this).val();
				seatArray.push(temp);
			}
		});//end each
	});
	
    $("select[name='people']").change(function(){
        //select 에서 선택 된 인원수
        let people = $("select[name='people'] option:selected").val();
		console.log(people);
        if( people != null && people != ''){
            $(".positionBtn").attr("disabled",false);
            $("input[name='people']").attr("value", people);

			$(".positionText").text("선택 전");
            $("input[name='seat1']").attr("value","");
            $("input[name='ai1']").attr("value","");
            $("input[name='seat2']").attr("value","");
            $("input[name='ai2']").attr("value","");
            $("input[name='seat3']").attr("value","");
            $("input[name='ai3']").attr("value","");
            $("label").removeClass("active");

        }
    });


	
		
		
    //앞 중간 뒤 버튼 중 하나 클릭했을 때
    $(".positionBtn").click(function(){
        //누른 버튼의 value값 가져옴(F,M,B)
        let positionVal = $(this).val();
        $("input[name='position']").attr("value", positionVal);

		if(positionVal == "F"){
        	$(".positionText").text("앞 (F)");
        }else if(positionVal == "M"){
        	$(".positionText").text("중간 (M)");
        }else if(positionVal == "B"){
        	$(".positionText").text("뒤 (B)");
        }

		
		
		//예매하기버튼 활성화
		$(".orderBtn").attr("disabled",false);


		$("input[name='seat1']").attr("value","");
            $("input[name='ai1']").attr("value","");
            $("input[name='seat2']").attr("value","");
            $("input[name='ai2']").attr("value","");
            $("input[name='seat3']").attr("value","");
            $("input[name='ai3']").attr("value","");
            $("label").removeClass("active");
		
		
		
		
		
		
        
        var num = $("input[name='people']").val();
        var array = [];
		
        //중복을 제거한 랜덤 숫자 생성
		array = ranNumArray_fn(num,$("input[name='position']").val(),seatArray);

        for(var i=1; i<num+1; i++){
            for(var j=0; j<i; j++){
                $("input[name='seat"+i+"']").attr("value", array[j]);
            }
        }

        //아래꺼를 for문이용해서 위에 코드로 변경한거
        /*if(num == 1){
            $("input[name='seat1']").attr("value", array[0]);
        }else if(num == 2){
            $("input[name='seat1']").attr("value", array[0]);
            $("input[name='seat2']").attr("value", array[1]);
        }else if(num == 3){
            $("input[name='seat1']").attr("value", array[0]);
            $("input[name='seat2']").attr("value", array[1]);
            $("input[name='seat3']").attr("value", array[2]);
        }*/

        //고객에게 보이는 좌석이름
        const location = $("input[name='location']").val();
        const position = $("input[name='position']").val();
        const seat1 = $("input[name='seat1']").val();
        const seat2 = $("input[name='seat2']").val();
        const seat3 = $("input[name='seat3']").val();

        //인원 수에 따라 좌석 선택되게
        if(num ==1){
            $("input[name='seat2']").attr("value","");
            $("input[name='ai2']").attr("value","");
            $("input[name='seat3']").attr("value","");
            $("input[name='ai3']").attr("value","");

            $("input[name='ai1']").attr("value",location+position+seat1);
            //seat1,2,3의 val()값으로 체크박스 체크시킴
            $("input[name=seatChk][value="+seat1+"]").prop("checked",true);

            //체크 된 좌석 label에 active클래스 추가
            $("label[for="+seat1+"]").addClass("active");

            
        }else if(num == 2){
            $("input[name='ai1']").attr("value",location+position+seat1);
            $("input[name='ai2']").attr("value",location+position+seat2);
            $("input[name=seatChk][value="+seat1+"]").prop("checked",true);
            $("input[name=seatChk][value="+seat2+"]").prop("checked",true);

            $("label[for="+seat1+"]").addClass("active");
            $("label[for="+seat2+"]").addClass("active");

            $("input[name='seat3']").attr("value","");
            $("input[name='ai3']").attr("value","");
        }else if(num == 3){
            $("input[name='ai1']").attr("value",location+position+seat1);
            $("input[name='ai2']").attr("value",location+position+seat2);
            $("input[name='ai3']").attr("value",location+position+seat3);
            $("input[name=seatChk][value="+seat1+"]").prop("checked",true);
            $("input[name=seatChk][value="+seat2+"]").prop("checked",true);
            $("input[name=seatChk][value="+seat3+"]").prop("checked",true);

            $("label[for="+seat1+"]").addClass("active");
            $("label[for="+seat2+"]").addClass("active");
            $("label[for="+seat3+"]").addClass("active");
            
        }

        
        
    }); //포지션버튼클릭 끝


    //체크박스가 바뀔 때 실행되는 함수
    $('input[name=seatChk]').change(function() {
		//체크 된 갯수
        let count = $("input:checkbox[name=seatChk]:checked").length;
        var num = $("input[name='people']").val();
        //변경된 체크박스의 value값
        var checkValue=$(this).val();
        //input배정좌석 에서 맨 뒤 번호만 자른거
        var seat1 = $("input[name='ai1']").val().substr(2,4);
        var seat2 = $("input[name='ai2']").val().substr(2,4);
        var seat3 = $("input[name='ai3']").val().substr(2,4);


		
		
		
		if(num == "" || num == null){
			alert("인원 수를 선택해주세요");
			$("input[name='seatChk'").prop("checked",false);
		//체크 된 갯수보다 인원수가 작으면 alert창 출력
		}else if(count > num){
            $("label[for="+checkValue+"]").removeClass("active");
            $(this).prop("checked",false);
            alert(num+"개까지만 선택할 수 있습니다.");
        }else{
				
	
	
            //$("input[name=seatChk][value="+checkValue+"]").prop("checked",true);
            //for값이 this.val()값인 라벨에 active 클래스 추가
            if($("label[for="+checkValue+"]").hasClass("active") == true){
                $("label[for="+checkValue+"]").removeClass("active");

                /*
                for(var i=1; i<4; i++){
                    if(checkValue == seat+i){
                        $("input[name='seat"+i+"']").attr("value","");
                        $("input[name='ai"+i+"']").attr("value","");
                    }
                }*/
				$("input[name='position']").attr("value","");
                if(checkValue == seat1){
                    $("input[name='seat1']").attr("value","");
                    $("input[name='ai1']").attr("value","");
                }else if(checkValue == seat2){
                    $("input[name='seat2']").attr("value","");
                    $("input[name='ai2']").attr("value","");
                }else if(checkValue == seat3){
                    $("input[name='seat3']").attr("value","");
                    $("input[name='ai3']").attr("value","");
                }


            }else{
                $("label[for="+checkValue+"]").addClass("active");

				//직접 선택했을 때도 오른쪽 글씨 바뀌게하기
				//input name=position에 값 넣기
				if(checkValue < 5){
					$(".positionText").text("앞 (F)");
					$("input[name='position']").attr("value","F");
				}else if(checkValue < 21){
					$(".positionText").text("중간 (M)");
					$("input[name='position']").attr("value","M");
				}else if(checkValue < 27){
					$(".positionText").text("뒤 (B)");
					$("input[name='position']").attr("value","B");
				}

                //빈칸에 checkValue(좌석위치)들어가게
                for(var i=1; i<num+1; i++){
                    if($("input[name='seat"+i+"']").val() == ''){
                        $("input[name='seat"+i+"']").attr("value",checkValue);
                        const location = $("input[name='location']").val();
                        const position = $("input[name='position']").val();
                        let seatNum = $("input[name='seat"+i+"']").val();
                        
                        $("input[name='ai"+i+"']").attr("value",location+position+seatNum);
                        break;
                    }
                
                }//end for

                //$('.positionBtn').attr("disabled",true);
                //$("select[name='people'").attr("disabled",true);
                //$('input[name=seatChk]').attr("disabled",true);

            }//end else
        }
    }); //체크박스 함수 끗

});



//function 시작!=============================================================================


//랜덤 숫자를 받아서 배열에 저장 후 배열을 리턴하는 함수
function ranNumArray_fn(num,position,seatArray){
	let array=[];
	let ranSeat;
	let ranSeat2;
    let ranSeat3;

		
	if(position == "F"){
	//앞(F)좌석은 1~4번 좌석
	//Math.random() * 3 는 0~3의 랜덤 수를 가져옴, 시작 숫자를 0이 아닌 1번으로 하고싶어서 +1한거임
	    ranSeat = Math.floor(Math.random() * 3+1);
	}else if(position == "M"){
		ranSeat = Math.floor(Math.random()* 15+5);
	}else if(position == "B"){
		ranSeat = Math.floor(Math.random() * 5+21);
	}
	
	if(num == 2){
    	ranSeat2 = ranSeat + 1;
    }else if(num ==3){
        ranSeat2 = ranSeat + 1;
        ranSeat3 = ranSeat2 + 1;
    }
	
	//console.log("ranSeat : "+ranSeat);
	//console.log("ranSeat2 : "+ranSeat2);
	//console.log("ranSeat3 : "+ranSeat3);
	//console.log(typeof ranSeat3);
	//console.log(typeof seatArray[0]);

	
	
	
	if(!seatArray.includes(String(ranSeat))){
		array.push(ranSeat);
		
		if(!seatArray.includes(String(ranSeat2))){
			array.push(ranSeat2);
		}else{
			ranSeat2 = ranSeat - 1;
			if(ranSeat2 != null && !seatArray.includes(String(ranSeat2)) && ranSeat2 != 0){
				array.push(ranSeat2);
			}
			
		}
		
		if(!seatArray.includes(String(ranSeat3))){
			array.push(ranSeat3);
		}else{
			ranSeat3 = ranSeat2 - 1;
			if(ranSeat3 != null && !seatArray.includes(String(ranSeat3)) && ranSeat3 != 0){
				array.push(ranSeat3);
			}
		}
		
    }else{
		ranNumArray_fn(num,position,seatArray)
	}
	//console.log("==================================");
	//console.log(array);

	return array;

	
	
}
