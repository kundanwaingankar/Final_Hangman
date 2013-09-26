$(window).load(function(){
   // alert(window.location.pathname)

})
$(document).ready(function(){
   //alert(window.location.pathname)

})
function setAccounts(obj){
    //console.log(obj)
    $(obj).each(function(index,value){
        console.log(value)
        var k=".char"+value;
        $(k).attr('disabled',"disabled");
        $(k).addClass("btn-danger");
    })
}



