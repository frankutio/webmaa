/***************************************************
*				FUNÇÕES E FUNCIONAMENTO DO SITE		*
****************************************************/

/* Funçoes para inicialização */

$(document).ready(function(){	
	$(".esconde").hide();
	$(".abaEsconde").hide();
	$("#inicio").show();

/* MASCARAS */
	$(".cpf").mask("999.999.999-99");
	$(".data").mask("99/99/9999");
	$(".cep").mask("99999-999");
	$(".foneDD").mask("99 9999-9999");

    $('a[name=neutro]').click(function(e) {
		e.preventDefault();
    });
	
	Tempo();
	
	pt();

});

function Tempo() {
        var data = new Date();
		var dia = data.getDate();
        var mes = data.getMonth();
        var ano = "2009";    // Firefox apresenta bug ainda, mas basta substituir 'data.getYear();' pelo ano corrente
		
		        
        m = new Array();
        m[0] = "01";
        m[1] = "02";
        m[2] = "03";
        m[3] = "04";
        m[4] = "05";
        m[5] = "06";
        m[6] = "07";
        m[7] = "08";
        m[8] = "09";
        m[9] = "10";
        m[10] = "11";
        m[11] = "12";

        
		var dataF = dia + "/" + m[mes] + "/" + ano;
		
		$(".dataCad").attr("value",dataF);
        $("#data").attr("value",dataF);

        //setTimeout("Tempo()", "1000");
 }
 
function pt(){

$(".pt").attr("value","526615265363tx");

}
	  
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

/* Validando o terno de Aceite */

function verificaTermo(){
	
var campo = $("input[@name='termoAceito']:checked").val();

	if(campo =="Sim"){
		$("#continuar").attr("disabled",false);
	}
	else {
		$("#continuar").attr("disabled",true);
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

function insertLogin(){
	var email = document.cadastro.email.value;	
	
	var vlrFinal = email;
	
	$(".txtLog").attr("value", vlrFinal);
}


function validaVacina_usr(){
	
	var valor = document.cadastro.vacina.value;
	
	if(valor == "Sim"){
		$("#doses_usr").show();
	}
}



