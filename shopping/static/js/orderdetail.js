$(function () {
    //选择商品件数
    var len=$(".number").length;
    $(".selectnum").text(len);

    // 小计
    for(var i=0;i<len;i++){
        var subtotal=parseInt($(".number").eq(i).text())*parseInt($(".price").eq(i).text());
        $(".subtotal").eq(i).text(subtotal);
    }
    // 商品总额
    var s=0;
    for(var i=0;i<len;i++){
        var sub=parseInt($(".subtotal").eq(i).text());
        s+=sub
    }
    $(".s1").text(s)

    //多选
    $("#quanxuan").click(function () {
        var select=$(this).is(":checked");
        console.log(select)
        $.get('/allselect/',{'select':select},function (response) {
            console.log(response);
            if(response.status==0){
                $(".danxuan").attr('checked',false);
                $(".selectnum").text(0);
                $(".s1").text(0)
            }else if(response.status==1){
                $(".danxuan").prop('checked',true);
                var len=$(".number").length;
                $(".selectnum").text(len);
                var s=0;
                for(var i=0;i<len;i++){
                    var sub=parseInt($(".subtotal").eq(i).text());
                    s+=sub
                }
                $(".s1").text(s)
            }
        })
    })

    //单选
    var long=$(".danxuan").length;
    for(var i=0;i<long;i++){
        $(".danxuan").eq(i).click(function () {
            var m=0;
            var s=0;
            for(var i=0;i<long;i++){
                var sub=parseInt($(".subtotal").eq(i).text());
                if($(".danxuan").eq(i).is(":checked")){
                    m+=1;
                   s+=sub;
                }
            }
            $(".s1").text(s);
            $(".selectnum").text(m);
            $that=$(this);
            var computersid=$that.val();
            $.get('/change/',{'computersid':computersid},function (response) {
                console.log(response)
                if(response.status==0){
                    $that.attr('checked',false);
                    $("#quanxuan").attr('checked',false);
                }else if(response.status==1){
                    $that.attr('checked',true);
                }
            })
        })
    }
    var l=$(".options").length;
    for(var i=0;i<l;i++){
        $(".options").eq(i).click(function () {
            $that=$(this);
            var computersid=$that.attr('computersid');
            var n=computersid-1
            console.log(n)
            $.get('/delgoods/',{'computersid':computersid},function (response) {
                console.log(response)
                if(response.status==1){
                    $(".onegoods").eq(n).hide();
                }
            })
        })
    }

    //付款
    $("#pay").click(function () {
        var to=$(".s1").text()
        var identifier=$(this).attr('identifier');
        $.get('/pay/',{'identifier':identifier,'to':to},function (response) {
            console.log(response)
            window.open(response.alipayurl)
        })
    })




})