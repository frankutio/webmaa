<%@page contentType="text/html" pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ong Amigos Fieis</title>

<link type="text/css" rel="stylesheet" href="/WebMAATeste/css/geral.css" />
<link type="text/css" rel="stylesheet" href="/WebMAATeste/css/jquery-ui-datepicker.css" />
<link type="text/css" rel="stylesheet" href="/WebMAATeste/css/estilos.css" />
<link type="text/css" rel="stylesheet" href="/WebMAATeste/css/menu_drop.css" />
<link type="text/css" rel="stylesheet" href="/WebMAATeste/css/abas.css" />


<script type="text/javascript" src="/WebMAATeste/js/jquery.js"></script>
<script type="text/javascript" src="/WebMAATeste/js/utilidades.js"></script>
<script type="text/javascript" src="/WebMAATeste/js/maskedinput.js"></script>
<script type="text/javascript" src="/WebMAATeste/js/jquery-ui-datepicker.js"></script>
<script type="text/javascript" src="/WebMAATeste/js/menuSuper.js"></script>
<script type="text/javascript" src="/WebMAATeste/js/valida_campos.js"></script>

<script>

function focoBt(id){
		$("#"+id).attr("src","/WebMAATeste/images/botao/bt_cadastrar_light.png");
}

function bt(id){
		$("#"+id).attr("src","/WebMAATeste/images/botao/bt_cadastrar.png");
}

</script>

</head>

<body>

<!-- Corpo da pagina -->
<div id="corpo">
<!-- div com o topo do site -->

<div id="faixaTopo">
		<div class="imgBannerLeft"><img src="/WebMAATeste/images/topo1.png" alt="logo" title="Logo" class="seta_link" /></div>
        <div class="imgBannerRight"></div>   	
</div>

<!-- div com o banner -->

<div id="faixaBanner">
	<div class="imgBannerInfLeft"><img src="/WebMAATeste/images/topo2.png" alt="Logo" title="Logo" class="seta_link" /></div>
    <div class="imgBannerInfRight"></div>
</div>

<!-- div Status -->

<div id="faixaStatus">
	
</div>


<!-- Menu do site Horizontal -->

<div id="menu">
	<div class="menuDrop">
		<ul>
			<li><a href="/WebMAATeste/index.jsp" onfocus="limpaMenu();"><span>Inicio</span></a></li>
    		<li><a href="#" onfocus="limpaMenu();"><span>Not&iacute;cias</span></a></li>
            <li><a href="#" onfocus="limpaMenu();"><span>Den&uacute;ncias</span></a></li>
            <li id="adotar" class="" onmouseover="setaClass('adotar');" onmouseout="retiraClass('adotar');"><a href="#" onfocus="ativa('adotar','drop');"><span>Adotar</span></a>
    			<ul class="drop">
        			<li id="gato" class=""><a href="/WebMAATeste/gato/listaGato.jsp" onfocus="ativaLight('gato');">Gato</a></li>
    				<li id="cao" class=""><a href="/WebMAATeste/cao/listaCao.jsp" onfocus="ativaLight('cao');">Cachorro</a></li>
        		</ul>
    		</li>
    		<li><a href="#" onfocus="limpaMenu();"><span>Direito Animal</span></a></li>
    		<li><a href="/WebMAATeste/cadastro.jsp" onfocus="limpaMenu();"><span>Cadastre-se</span></a></li>
            <li><a href="/WebMAATeste/cad_animal.jsp" onfocus="limpaMenu();"><span>Doar</span></a></li>
            <li><a href="/WebMAATeste/final_feliz/index.jsp" onfocus="limpaMenu();"><span>Final Feliz</span></a></li>
		</ul>
	</div>
</div>

<!-- CONTEUDO -->

<div id="conteudo">

	<span class="imgTopo_sem_coluna"></span>
	<div class="imgBase_sem_coluna">
	
	<!-- CONTEUDO AQUI -->
		<div id="cont">
				<div style="text-align:center;"><img src="/WebMAATeste/images/imgTexto/cadastro.png" alt="Cadastro" title="Cadastro"  /></div>
		<div class="tabsB">
					<ul>
						<li class="ativo" id="cadInicio"><a href="#" name="neutro" onclick="contAba('inicio','cadInicio');"><span>Dados Pessoais</span></a></li>
      					<li class="" id="cadL"><a href="#" name="neutro" onclick="contAba('cadLogradouro','cadL');"><span>Logradouro</span></a></li>
					</ul>
		</div>
		
		<!-- CONTEUDO DAS ABAS -->
		<div id="cont_aba">
        	<br />
			<span class="obrigatorio">* Campos de Preenchimento Obrigatório</span>
			<br />
			<br />
            
        <form action="NavUsr" method="post" name="cadastrar" id="cadastroColab" onsubmit="return validaCampoColab(this);">
        
			<div id="inicio" class="abaEsconde">	
			
			<input type="hidden" name="termo" value="${descricaoTermo}" />
            <input type="hidden" name="operacao" value="cadastro" />
            <input type="hidden" value="" class="dataCad" name="dataCad" />
            <input type="hidden" value="" class="pt" name="protocolo" />
            
				<table class="grid">
					<tr>
                        <td width="13%" align="right"><span class="obrigatorio">*</span> <label for="nome">Nome:</label> &nbsp;</td>
                      <td colspan="3"><label><input type="text" name="nome" size="50" value="${Colaborador.nome}" id="nome" /> </label></td>
					</tr>
					<tr>
						<td width="13%" align="right"><span class="obrigatorio">*</span> RG: &nbsp;</td>
				      <td width="17%"><input type="text" name="rg" size="10" maxlength="9" value="${Colaborador.rg}" /></td>
						<td width="9%" align="right"><span class="obrigatorio">*</span> CPF: &nbsp;</td>
					  <td width="61%"><input type="text" name="cpf" class="cpf" size="15" value="${Colaborador.cpf}" /> &nbsp; ${msgErroCpf}</td>
					</tr>
					<tr>
						<td width="13%" align="right"><span class="obrigatorio">*</span> Email (Login): &nbsp;</td>
				      <td width="17%"><input type="text" name="email" size="20" onkeyup="insertLogin();" value="${Colaborador.email}"/></td>
						<td width="9%" align="right"><span class="obrigatorio">*</span> Sexo: &nbsp;</td>
					  <td width="61%"><label>Masculino &nbsp; <input type="radio" name="sexo" value="M" id="masc" /></label> &nbsp;&nbsp; <label>Feminino &nbsp; <input type="radio" name="sexo" value="F" id="femi" /></label></td>
					</tr>
                    <c:if test="${msgErroEmail != null || msgErroEmail != ''}">
                       <tr>
                           <td colspan="4">${msgErroEmail}</td>
                       </tr>
                    </c:if>
					<tr>
						<td width="13%" align="right"><span class="obrigatorio">*</span> Data de&nbsp; Nascimento: &nbsp;</td>
                      <td colspan="3"><input type="text" name="idade" size="10" class="data" value="${Colaborador.dataNascimentoString}" /> &nbsp;<span id="idadeErro"></span></td>
					</tr>
                    <tr>
						<td width="13%" align="right">Telefone: &nbsp;</td>
				      <td colspan="3"><input type="text" name="fone" size="15" class="foneDD" value="${Colaborador.telefone}" /></td>
					</tr>
                    <tr>
						<td width="13%" align="right">Celular: &nbsp;</td>
				      <td colspan="3"><input type="text" name="cel" size="15" class="foneDD" value="${Colaborador.celular}" /></td>
					</tr>
				</table>
                <br />
                
                <div align="center">
                	<img src="/WebMAATeste/images/botao/bt_proximo.png" alt="Proximo" title="Proximo" class="seta_link" onclick="contAba('cadLogradouro','cadL');" />
                </div>
			<br>
                <span style="color:red;">
                    ${msgErro}
                </span>
			</div>
            
            <!-- DADOS DE SEGURANÃ‡A -->
            <div id="cadSeguro" class="abaEsconde">
            
            <table class="grid">
					<tr>
						<td width="19%" align="right">Login: &nbsp;</td>
				      <td colspan="3"><input type="text" name="login" size="50" value="" disabled="disabled" class="txtLog" /></td>
					</tr>
					<tr>
						<td width="19%" align="right"><span class="obrigatorio">*</span> Senha: &nbsp;</td>
				      <td width="81%"><input type="password" name="senha" size="10" maxlength="8" /> (Max 8 Min 3 caracteres)</td>						
					</tr>
					<tr>
						<td width="19%" align="right"><span class="obrigatorio">*</span> Confirme a Senha: &nbsp;</td>
				      <td width="81%"><input type="password" name="senhaConf" size="10" maxlength="8" /></td>						
					</tr>
				</table>
                <br />
                
                <div align="center">
                	<img src="/WebMAATeste/images/botao/bt_ant.png" alt="Voltar" title="Anterior" class="seta_link" onclick="contAba('inicio','cadInicio');" />&nbsp;&nbsp;
                	<img src="/WebMAATeste/images/botao/bt_proximo.png" alt="Proximo" title="Proximo" class="seta_link" onclick="contAba('cadLogradouro','cadL');" />
                </div>
                
              </div>              
              <!-- DADOS DE SEGURANÃ‡A -->
              
              <!-- DADOS DE ENDEREÃ‡O -->
            <div id="cadLogradouro" class="abaEsconde">
            
            <table class="grid">
					<tr>
						<td width="13%" align="right"><span class="obrigatorio">*</span> CEP: &nbsp;</td>
				      <td colspan="3"><input type="text" name="cep" size="10" class="cep" value="${Colaborador.cep}" /></td>
					</tr>
					<tr>
						<td width="13%" align="right"><span class="obrigatorio">*</span> Endereço: &nbsp;</td>
				      <td colspan="3"><input type="text" name="end" size="50" value="${Colaborador.endereco}" /></td>
					</tr>
					<tr>
						<td width="13%" align="right">Complemento: &nbsp;</td>
				        <td><input type="text" name="complemento" size="10" value="${Colaborador.complemento}" /></td>
						<td width="13%" align="right">Número: &nbsp;</td>
				        <td><input type="text" name="numero" size="5" id="numero" value="${Colaborador.numero}" /> &nbsp;</td>
					</tr>
					<tr>
						<td width="13%" align="right"><span class="obrigatorio">*</span> Cidade: &nbsp;</td>
				      <td width="17%"><input type="text" name="cidade" size="20" value="${Colaborador.cidade}" /></td>
						<td width="9%" align="right"><span class="obrigatorio">*</span> Bairro: &nbsp;</td>
					  <td width="61%"><input type="text" name="bairro" size="10" value="${Colaborador.bairro}" /></td>
					</tr>
					<tr>
						<td width="13%" align="right"><span class="obrigatorio">*</span> UF: &nbsp;</td>
				      <td width="17%" colspan="3">
					  	<select name="uf">
                                  <option value=""></option>
                                      <c:forEach items="${lstUF}" var="lstUF">
                                      <option value="${lstUF.codigo}"> ${lstUF.UF}</option>
                                   </c:forEach>
                          </select> &nbsp; <span id="ufErro"></span>
					  </td>
					</tr>
				</table>
				<br />
				<br />
				
				<div style="width:90%; text-align:center;">
                	<img src="/WebMAATeste/images/botao/bt_ant.png" alt="Voltar" title="Anterior" class="seta_link" onclick="contAba('inicio','cadInicio');" />&nbsp;&nbsp;
					<input type="image" src="/WebMAATeste/images/botao/bt_cadastrar.png" alt="ok" title="Finalizar Cadastro" id="cadastro" onmouseover="focoBt('cadastro');" onmouseout="bt('cadastro');" />
				</div>
                
              </div>              
              <!-- DADOS DE ENDEREÃ‡O -->
              
             </form>
            
		</div>	
       <!-- CONTEUDO DAS ABAS -->
					
		</div>
	 <!-- FIM DO TEXTO -->	
		
	</div>
	<span class="imgFim_sem_coluna"></span>
</div>

</div>
<!-- Fim do corpo -->

<!-- RodapÃ© -->

<div id="rodape">
	sdjlarpq
</div>

</body>

</html>