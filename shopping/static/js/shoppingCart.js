$(function () {
    // var number=parseInt($(".number").first().text());
    // console.log(number+1)
    // var number1=$(".number").eq(0).text();
    // console.log(number1)
    var len=$(".number").length;
    for(var i=0;i<len;i++){
        var subtotal=parseInt($(".number").eq(i).text())*parseInt($(".price").eq(i).text());
        $(".subtotal").eq(i).text(subtotal);
    }

    $(".selectnum").text(len)
    var s=0;
    for(var i=0;i<len;i++){
        var sub=parseInt($(".subtotal").eq(i).text());
        s+=sub
    }
    $("#s1").text(s)
})