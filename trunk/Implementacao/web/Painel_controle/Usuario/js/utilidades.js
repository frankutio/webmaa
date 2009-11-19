/***************************************************
*				FUNÇÕES E FUNCIONAMENTO DO SITE		*
****************************************************/

/* Funçoes para inicialização */

$(document).ready(function(){	
	$(".esconde").hide();
	$(".escondeFase").hide();

/* MASCARAS */
	$(".cpf").mask("999.999.999-99");
	$(".data").mask("99/99/9999");
	$(".cep").mask("99999-999");
	$(".foneDD").mask("99 9999-9999");
	
$('a[name=popUp]').click(function (e) {
		e.preventDefault();
});	

});


function mostra(esconde,mostra){
	$(".esconde").hide();
	$("#"+esconde).hide();
	$("#"+mostra).fadeIn("slow");
}

function mostrar(div){
	$("#"+div).fadeIn();
}

function esconde(div){
	$("#"+div).fadeOut();
}

/* VALIDAÇÃO DE FORMULARIOS */

function valida_avaliacao(){
	var valor = document.faseForm.entrega.value;
	
	if(valor =="Nao"){
		$(".avaliar").attr("disabled",false);
	}
	
	else if(valor =="Sim"){
		$(".avaliar").attr("disabled",false);
	}
}

/* VALIDAÇÃO DAS FASES */

function valida(){
	if(confirm("Tem certeza que deseja Continuar? Apos a confirmação não será possivel Desistir.")){
		$("#desistir").attr("src","images/botao/bt_desistir_desabilitado.png");
		$("#desistir").attr("onmouseover","");
		$("#desistir").attr("onmouseout","");
		$("#desistir").removeClass("seta_link");
		$("#comunicacao").show();
		
		$("#entrega").attr("disabled",false);
		$("#coment").attr("disabled",false);
		$("#avaliacao_positiva").attr("disabled",false);
		$("#avaliacao_negativa").attr("disabled",false);
	}
}

function aprovaUsr(){
	$("#fase01 :radio").attr("disabled",true);
	$("#aprovar").hide();
	
	$("#fase1_completa").show();
	$("#usrReprovado").show();
	$("#usrAprovado").show();
	$("#fase02").show();
}



function aprova(){
	$("#cancelar").hide();
	$("#aprovado").show();
}

function finaliarCheck(){
	$("#btFinalizar").attr("disabled",false);
}

