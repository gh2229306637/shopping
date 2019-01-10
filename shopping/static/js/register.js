$(function () {
    $("#phone").focus(function(){
		$(this).css("border","2px solid rgb(153,153,153)");
		$(this).blur(function(){
			var reg = /^[1][3-9][0-9]{9}/;
			var isReg =reg.test($(this).val());
			if(!isReg) {
                $(this).css("border", "2px solid red")
                $(this).next("p").text("手机格式有误，请重新输入");
            }else{
			    $(this).next("p").text("");
            }
		})
	})
})