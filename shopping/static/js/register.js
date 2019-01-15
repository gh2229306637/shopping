$(function(){
    $("#phone").focus(function(){
		$(this).css("border","2px solid gray");
		$(this).blur(function(){
			var reg = /^[1][3-9][0-9]{9}/;
			var isReg =reg.test($(this).val());
			if(!isReg){
                $(this).css("border", "2px solid red");
                $(this).next("span").text("*手机号格式有误，请重新输入");
                $("#submit").click(function(event){
                	event.preventDefault();
                	alert('信息填写有误，请重新注册');
					window.location.reload();
                })
            }else{
			    $(this).next("span").text("");
            }
		})
	})
	$("#passwd").focus(function(){
		$(this).css("border","2px solid gray");
		$(this).blur(function(){
			var pd=$(this).val()
			if(pd==''){
				$(this).css("border","2px solid red");
				$(this).next("span").text("*密码不能为空");
				$("#submit").click(function(event){
                	event.preventDefault();
                	alert('信息填写有误，请重新注册');
					window.location.reload();
                })
			}else{
				var reg = /^[a-zA-Z]/;
				var isreg = reg.test($(this).val());
				if(!isreg){
					$(this).css("border","2px solid red");
					$(this).next("span").text("*密码必须以字母开头");
					$("#submit").click(function(event){
                	event.preventDefault();
					alert('信息填写有误，请重新注册');
					window.location.reload();
                	})
				}else{
					$(this).next("span").text("");
				}
			}
        })
    })

})