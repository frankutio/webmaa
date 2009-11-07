function ativa(li,ul){
	var classe = document.getElementById(li).className;
	
if(classe == "ativo"){
	$(".ativo").removeClass("ativo");
	$("ul").css("visibility","");
  	$("#"+li).removeClass("ativo");
  	$("."+ul).css("visibility","");
}

else if(classe == ""){
	$(".ativo").removeClass("ativo");
	$("ul").css("visibility","");
	$("#"+li).addClass("ativo");
	$("."+ul).css("visibility","visible");
}
	
}

function setaClass(li){
	var classe = document.getElementById(li).className;
	$(".ativo").removeClass("ativo");
	$("ul").css("visibility","");
	$("#"+li).addClass("ativo");	
}

function retiraClass(li){
	var classe = document.getElementById(li).className;
	$("#"+li).removeClass("ativo");
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
		$("#"+id).attr("src","images/botao/check_active.png");
}

function volta(id){
		$("#"+id).attr("src","images/botao/check.png");
}