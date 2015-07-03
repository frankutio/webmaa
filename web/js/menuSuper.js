function ativa(li,ul){
	var classe = document.getElementById(li).className;
	
if(classe == "current"){
	$(".current").removeClass("current");
	$("ul").css("visibility","");
  	$("#"+li).removeClass("current");
  	$("."+ul).css("visibility","");
}

else if(classe == ""){
	$(".current").removeClass("current");
	$("ul").css("visibility","");
	$("#"+li).addClass("current");
	$("."+ul).css("visibility","visible");
}
	
}

function setaClass(li){
	var classe = document.getElementById(li).className;
	$(".current").removeClass("current");
	$("ul").css("visibility","");
	$("#"+li).addClass("current");	
}

function retiraClass(li){
	var classe = document.getElementById(li).className;
	$("#"+li).removeClass("current");
}

function ativaLight(li){
	
	$("li").removeClass("dropLight");
	$("#"+li).addClass("dropLight");
}

function limpaMenu(){
	$("li").removeClass();
	$("ul").css("visibility","");
}

function troca(id){
		$("#"+id).attr("src","/images/botao/check_active.png");
}

function volta(id){
		$("#"+id).attr("src","/images/botao/check.png");
}