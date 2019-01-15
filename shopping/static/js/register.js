$(function () {
    var s1=false;
    var s2=false;

    $("#phone").blur(function () {
        var reg = /^[1][3-9][0-9]{9}/;
        var isReg = reg.test($(this).val());
        if (!isReg) {
            $(this).next("span").text("*手机号格式有误，请重新输入");
            s1=false;
            $.get('/checkphone/',{'phone':$(this).val()},function (response) {
               console.log(response)
            })
        } else {
            $(this).next("span").text("");
            s1=true
        }
    })



    $("#passwd").blur(function () {
        var reg = /^\w{6}/;
        var isreg = reg.test($(this).val());
        if (!isreg) {
            $(this).next("span").text("*密码格式错误,请使用数字，字母和下划线");
            s2=false
        } else {
            $(this).next("span").text("");
            s2=true
        }
    })


    $("#subbtn").click(function () {
        if(s1 && s2){
            $("#register").submit()
        }else{
            $(".prompt").html("信息填写有误！")
        }
    })

})