$(function () {
    $("#phone").blur(function () {
        var reg = /^[1][3-9][0-9]{9}/;
        var isReg = reg.test($(this).val());
        if (!isReg) {
            $(this).next("span").text("*手机号格式有误，请重新输入");

        } else {
            $(this).next("span").text("");

        }
    })
})