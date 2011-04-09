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
function submeterColaborador(){

    if(document.frmcolaborador.nome.value==''){
        alert('Ops!Preencha o campo nome.');
        return false;
    }else if(document.frmcolaborador.rg.value==''){
        alert('Ops!Preencha o campo RG.');
        return false;
    }else if(document.frmcolaborador.cpf.value===''){
        alert('Ops!Preencha o campo CPF.');
        return false;
    }else if(document.frmcolaborador.Email.value==''){
        alert('Ops!Preencha o campo Email.');
        return false;
    }else if(!document.frmcolaborador.sexo.checked){
        alert('Ops!Escolha o  sexo.');
        return false;
    }else if(document.frmcolaborador.datanascimento.value==''){
        alert('Ops!Preencha o campo data nascimento.');
        return false;
    }else if(document.frmcolaborador.cep.value==''){
        alert('Ops!Preencha o campo Cep.');
        return false;
    }else if(document.frmcolaborador.endereco.value==''){
        alert('Ops!Preencha o campo Endereço.');
        return false;
    }else if(document.frmcolaborador.cidade.value==''){
        alert('Ops!Preencha o campo cidade.');
        return false;
    }else if(document.frmcolaborador.bairro.value==''){
        alert('Ops!Preencha o campo bairro.');
        return false;
    }else if(document.frmcolaborador.uf_codigo.value==''){
        alert('Ops!Preencha o campo Uf.');
        return false;
    }
    document.frmcolaborador.action ="/WebMAA/ControleColaboradorServlet?operacao=ColaboradorNovoProcessa";
     document.frmcolaborador.method ="post";
     document.frmcolaborador.submit();
     alert('Colaborador cadastrado com sucesso!');
     return true;
   
}
function submeterAnimal(){
    
    if(!document.frmanimais.especie[0].checked && !document.frmanimais.especie[1].checked ){
        alert('Ops!Escolha o tipo da especie.');
        return false;
    }else if(document.frmanimais.raca.value==''){
        alert('Ops!Escolha o tipo da raça.');
        return false;
    }else if(document.frmanimais.nome.value==''){
        alert('Ops!Digite o nome do animal.');
        return false;
    }else if(document.frmanimais.idade.value==''){
        alert('Ops!Digite a idade do animal.');
        return false;
    }else if(document.frmanimais.cor1.value==''){
        alert('Ops!Digite a cor do animal.');
        return false;
    }else if(document.frmanimais.cor2.value==''){
        document.frmanimais.cor2.value=99;
    }else if(document.frmanimais.cbopelagem.value==''){
        alert('Ops!Selecione o tipo de pelagem do animal.');
        return false;
    }else if(document.frmanimais.porte.value==''){
        alert('Ops!Selecione o porte do animal.');
        return false;
    }else if(document.frmanimais.sexo.value==''){
        alert('Ops!Selecione o sexo do animal.');
        return false;
    }else if(document.frmanimais.foto.value==''){
        alert('Ops!Selecione a foto do animal.');
        return false;
    }else if(document.frmanimais.castrado.value==''){
        alert('Ops!Informe se o animal é castrado.');
        return false;
    }else if(document.frmanimais.laudo.value==''){
        alert('Ops!Informe se o animal possui laudo.');
        return false;
    }else if(document.frmanimais.vacina.value==''){
        alert('Ops!Informe se o animal é vacinado.');
        return false;
    }else if(document.frmanimais.envio.value==''){
        alert('Ops!Escolhe a forma de envio do animal.');
        return false;
    }else if(document.frmanimais.valortaxa.value==''){
        alert('Ops!Digite o valor da taxa de manutenção.');
        return false;
    }
     
     document.frmanimais.action ="/WebMAA/ControleAnimaisServlet?operacao=AnimaisNovoProcessa";
     document.frmanimais.method ="post";
     document.frmanimais.submit()
     alert('Animal cadastrado com sucesso!');
     return true;
}
function pesquisaAnimais(){
    if(document.frmPesquisa.localAnimal.value==''){
        alert('Ops! Selecione o local de pesquisa.');
        return false;
    }else if(document.frmPesquisa.tipoAnimal.value==''){
        alert('Ops! Selecione o tipo de animal para pesquisa.');
        return false;
    }
    document.frmPesquisa.action="/WebMAA/ControleAnimaisServlet?operacao=AnimaisProcessaPesquisa" ;
     document.frmPesquisa.method ="post";
     document.frmPesquisa.submit()
     return true;
}
function relatorioAnimais(){
    if(document.filtroRelatorio.local.value==''){
        alert('Ops! Selecione o local de pesquisa.');
        return false;
    }else if(!document.filtroRelatorio.tipo[0].checked && !document.filtroRelatorio.tipo[1].checked && !document.filtroRelatorio.tipo[2].checked){
        alert('Ops! Selecione o tipo de  relatorio para pesquisa.');
        return false;
    }
    document.filtroRelatorio.action="/WebMAA/ControleAnimaisServlet?operacao=AnimaisProcessaRelatorio" ;
     document.filtroRelatorio.method ="post";
     document.filtroRelatorio.submit()
     return true;
}
function logar()
{
     if(document.login.cpf.value=='' && document.login.email.value=='')
        {
            alert('Preencha os campos!');
            return false;
        }

    if(document.login.email.value=='')
        {
            alert('Preencha o campo email!');
            return false;
        }
     if(document.login.cpf.value=='')
        {
            alert('Preencha o campo cpf!');
            return false;
        }

        if(document.login.cpf.value!='' && document.login.email.value!='')
        {
            document.login.action="/WebMAA/ControleLoginServlet?operacao=Logar";
            document.login.method="post";
            return true;
        }
         return true;
}
function submeterFuncionarioAlteracao(){


  if(document.frmeditarFuncionario.nome.value=='')
  {
      alert('Preencha o campo nome!');
            return false;

  }else if(document.frmeditarFuncionario.rg.value=='')
  {
      alert('Preencha o campo RG!');
            return false;

  }else if(document.frmeditarFuncionario.cpf.value=='')
 {
     alert('Preencha o campo cpf!');
            return false;

 }else if(document.frmeditarFuncionario.Email.value=='')
 {
     alert('Preencha o campo email!');
            return false;

 }else if(document.frmeditarFuncionario.cargo.value=='')
 {
    alert('Preencha o campo cargo!');
            return false;
 }else if(document.frmeditarFuncionario.dataadmissao.value=='')
 {
    alert('Preencha o campo data de admissão!');
            return false;
 }else if(document.frmeditarFuncionario.cep.value=='')
 {
    alert('Preencha o campo Cep!');
            return false;

 }else  if(document.frmeditarFuncionario.endereco.value==''){
    alert('Preencha o campo endereco!');
            return false;
 }else if(document.frmeditarFuncionario.cidade.value=='')
 {
    alert('Preencha o campo cidade!');
            return false;
 }else if(document.frmeditarFuncionario.uf_codigo.value=='')
 {
    alert('Preencha o campo UF!');
            return false;
 }else if(document.frmeditarFuncionario.dataNascimento.value=='')
 {
    alert('Preencha o campo Data Nascimento!');
            return false;
 }

     document.frmeditarFuncionario.action ="/WebMAA/ControleFuncionarioServlet?operacao=FuncionarioEditaProcessa";
     document.frmeditarFuncionario.method ="post";
     document.frmeditarFuncionario.submit()
     alert('Funcionario alterado com sucesso!');
     return true;

}
function submeterFuncionario(){


  if(document.frmfuncionario.nome.value=='')
  {
      alert('Preencha o campo nome!');
            return false;

  }else if(document.frmfuncionario.rg.value=='')
  {
      alert('Preencha o campo RG!');
            return false;

  }else if(document.frmfuncionario.cpf.value=='')
 {
     alert('Preencha o campo cpf!');
            return false;

 }else if(document.frmfuncionario.Email.value=='')
 {
     alert('Preencha o campo email!');
            return false;

 }else if(document.frmfuncionario.cargo.value=='')
 {
    alert('Preencha o campo cargo!');
            return false;
 }else if(document.frmfuncionario.dataadmissao.value=='')
 {
    alert('Preencha o campo data de admissão!');
            return false;
 }else if(document.frmfuncionario.cep.value=='')
 {
    alert('Preencha o campo Cep!');
            return false;

 }else  if(document.frmfuncionario.endereco.value==''){
    alert('Preencha o campo endereco!');
            return false;
 }else if(document.frmfuncionario.cidade.value=='')
 {
    alert('Preencha o campo cidade!');
            return false;
 }else if(document.frmfuncionario.uf_codigo.value=='')
 {
    alert('Preencha o campo UF!');
            return false;
 }

     document.frmfuncionario.action ="/WebMAA/ControleFuncionarioServlet?operacao=FuncionarioNovoProcessa";
     document.frmfuncionario.method ="post";
     document.frmfuncionario.submit();
     alert('Funcionario cadastrado com sucesso!');
     return true;

}
function limparFuncionario(){
    
    document.frmfuncionario.nome.value='';
    document.frmfuncionario.rg.value='';
    document.frmfuncionario.cpf.value='';
    document.frmfuncionario.Email.value='';
    document.frmfuncionario.cargo.value='';
    document.frmfuncionario.dataadmissao.value='';
    document.frmfuncionario.cep.value='';
    document.frmfuncionario.endereco.value='';
    document.frmfuncionario.cidade.value='';
    document.frmfuncionario.uf_codigo.value='';

}

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
	var valor = document.pesquisa.localAnimal.value;
	
	if(valor =="Sim"){
		$(".esconde").hide();
		$("#resultAnimal").show();
	}
	
	else if(valor =="Nao"){
		$(".esconde").hide();
		$("#resultAnimal").show();
	}
    else if(valor ==""){
		$(".esconde").hide();
		$("#resultAnimal_colab").show();
	}
}

function valida_relatorio(){
	var valor = document.filtroRelatorio.local.value;
	
	/*Testando o valor escolhido */
	
	if(valor =="Sim"){
		$("input:radio").attr("disabled", false);
		$("#animal_cdp").attr("checked", false);
		$("#animal_cdp").attr("disabled", true);
	}
	
	else if(valor =="Todos"){
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
	
	if((filtro == "Sim")&&(radio == "adotados")){
		$(".esconde").hide();
		$("#rel_canil_adotado").show();
	}
	
	else if((filtro == "Sim")&&(radio == "fila")){
		$(".esconde").hide();
		$("#rel_canil_fila").show();
	}
	
	else if((filtro == "Nao")&&(radio == "adotados")){
		$(".esconde").hide();
		$("#rel_colab_adotado").show();
	}
	
	else if((filtro == "Nao")&&(radio == "fila")){
		$(".esconde").hide();
		$("#rel_colab_fila").show();
	}
	
	else if((filtro == "Nao")&&(radio == "pendente")){
		$(".esconde").hide();
		$("#rel_colab_pendente").show();
	}
	
	else if(filtro == "Todos"){
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
