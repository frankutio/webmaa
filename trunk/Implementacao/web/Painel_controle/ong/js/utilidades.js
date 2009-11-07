/***************************************************
*				FUNÇÕES E FUNCIONAMENTO DO SITE		*
****************************************************/

/* Funçoes para inicialização */

$(document).ready(function(){	
	$(".esconde").hide();
	$(".abaEsconde").hide();
	$(".escondeFase").hide();

/* MASCARAS */
	$(".cpf").mask("999.999.999-99");
	$(".data").mask("99/99/9999");
	$(".cep").mask("99999-999");
	$(".foneDD").mask("99 9999-9999");
	$(".valor").mask("R$: 99,99");
});


function mostra(esconde,mostra){
	$(".esconde").hide();
	$(".abaEsconde").hide();
	$(".tabsB li").removeClass("ativo");
	$("#"+esconde).hide();
	$("#"+mostra).show("faster");
}

function mostrar(div){
	$("#"+div).fadeIn();
}

function esconde(div){
	$("#"+div).fadeOut();
}

/* Validação de Campos Select dos Formulario */

function validaEscolha(){

	var valor = document.filtro.cadAnimal.value;
	
		if(valor=="1"){
			$(".esconde").hide();
			$("#canil").show();
			$("#dadosGerais").show();
		}
		else if(valor=="2"){
			$(".esconde").hide();
			$("#colab").show();
			$("#dadosGerais_usr").show();
		}

	
}

function pesquisaAnimal(){
	var valor = document.pesquisa.tipoPesquisa.value;
	
	if(valor =="1"){
		$(".esconde").hide();
		$("#resultAnimal").show();
	}
	
	else if(valor =="2"){
		$(".esconde").hide();
		$("#resultAnimal_colab").show();
	}
}


function valida_relatorio(){
	var valor = document.filtroRelatorio.exibir.value;
	
	/*Testando o valor escolhido */
	
	if(valor =="1"){
		$("input:radio").attr("disabled", false);
		$("#animal_cdp").attr("checked", false);
		$("#animal_cdp").attr("disabled", true);
	}
	
	else if(valor =="3"){
		$("#animal_ad").attr("checked", false);
		$("#animal_ad").attr("disabled", true);
		
		$("#animal_fl").attr("checked", false);
		$("#animal_fl").attr("disabled", true);
		
		$("#animal_cdp").attr("checked", false);
		$("#animal_cdp").attr("disabled", true);
	}
	
	else{
		$("#animal_ad").attr("disabled", false);
		$("#animal_fl").attr("disabled", false);
		$("#animal_cdp").attr("disabled", false);
	}
}

function pesquisaRelatorio(){
	var radio = $("input[@name='tipo']:checked").val();
	var filtro = document.filtroRelatorio.exibir.value;
	
	if((filtro == "1")&&(radio == "adotados")){
		$(".esconde").hide();
		$("#rel_canil_adotado").show();
	}
	
	else if((filtro == "1")&&(radio == "fila")){
		$(".esconde").hide();
		$("#rel_canil_fila").show();
	}
	
	else if((filtro == "2")&&(radio == "adotados")){
		$(".esconde").hide();
		$("#rel_colab_adotado").show();
	}
	
	else if((filtro == "2")&&(radio == "fila")){
		$(".esconde").hide();
		$("#rel_colab_fila").show();
	}
	
	else if((filtro == "2")&&(radio == "pendente")){
		$(".esconde").hide();
		$("#rel_colab_pendente").show();
	}
	
	else if(filtro == "3"){
		$(".esconde").hide();
		$("#rel_geral").show();
	}
	
	else {
		alert("Escolha um tipo de Relatorio.");	
	}
}

/* função para navegação em Abas */

function contAba(div,add){ 
	$(".abaEsconde").hide();
	$(".tabsB li").removeClass("ativo");
	$(".tabsB li").addClass("nulo");
	$("#"+add).addClass("ativo");
	$("#"+div).slideToggle("slow");

}

function excluir(){
	if(confirm("Deseja realmente Excluir?")){
			alert("Excluido com Sucesso");
		}
}


function aprovaUsr(){
	$("#usr").attr("disabled",true);
	$("#usrMsg").attr("disabled",true);
	$("#aprovar").hide();
	
	$("#usrReprovado").show();
	$("#usrAprovado").show();
}
