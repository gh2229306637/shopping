$(function () {
    $(".jia").click(function () {
        var computersid=$(this).attr('computersid');
        console.log("加操作触发");
        data={
            'computersid':computersid
        }
        $.get('/addCart/',data,function (response) {
            console.log(response);
            if(response.status==0){
                window.open('/login',target='_self')
            }else if(response.status==1){
                $(".num").val(response.number)
            }
        })
    })

    $(".jian").click(function () {

        console.log("减操作触发");
        var computersid=$(this).attr('computersid');
        data={
            'computersid':computersid
        }

        $.get('/subCart/',data,function (response) {
            console.log(response)
            if(response.status==1){
                $(".num").val(response.number)
            }

        })
    })

})