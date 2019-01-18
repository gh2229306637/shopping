$(function () {

    $(".jia").click(function () {
        console.log("加操作")
        var num1=parseInt($(".num").val())
        var num2=num1+1
        $(".num").val(num2)
    })

    $(".jian").click(function () {
        console.log("减操作")
        var num1=parseInt($(".num").val())
        if(num1>1){
            var num2=num1-1
            $(".num").val(num2)
        }
    })

    $(".addcart").click(function () {
        var num=$(".num").val();
        var computersid=$(this).attr('computersid');
        console.log("添加操作触发");
        data={
            'computersid':computersid,
            'num':num
        }
        $.get('/addCart/',data,function (response) {
            console.log(response);
            if(response.status==0){
                window.open('/login',target='_self');
            }else if(response.status==1){
                $(".num").val(response.number);

            }
        })
    })
    $(".addcart").mousedown(function () {
        $(".shuliang span").html("添加购物车成功");
    })
    $(".addcart").mouseup(function () {
        $(".shuliang span").html("");
    })
})