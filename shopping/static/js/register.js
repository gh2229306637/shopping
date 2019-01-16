$(function () {
    var s1=false;
    var s2=false;

    $("#phone").blur(function () {
        var reg = /^[1][3-9][0-9]{9}/;
        var isReg = reg.test($(this).val());
        var $that=$(this);
        if (!isReg) {
            $(this).next().text("*手机号格式有误，请重新输入");
            $that.next().next().html("");
            s1=false;
        } else {
            $(this).next().text("");
            s1=true;

            $.get('/checkphone/',{'phone':$(this).val()},function (response) {
                // console.log(response)
                if(response.status==0){
                    $that.next().html(response.info);
                }else{
                   $that.next().next().html(response.info);
                }
            })
        }
    })



    $("#passwd").blur(function () {
        var reg = /^\w{6}/;
        var isreg = reg.test($(this).val());
        if (!isreg) {
            $(this).next("span").text("*密码格式错误,请使用数字，字母和下划线");
            s2=false;
        } else {
            $(this).next("span").text("");
            s2=true;
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