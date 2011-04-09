<%-- 
    Document   : alt_functionario
    Created on : 02/10/2009, 16:53:52
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ong Amigos Fieis</title>

<link type="text/css" rel="stylesheet" href="/WebMAA/Painel_controle/ong/css/geral.css" />
<link type="text/css" rel="stylesheet" href="/WebMAA/Painel_controle/ong/css/jquery-ui-datepicker.css" />
<link type="text/css" rel="stylesheet" href="/WebMAA/Painel_controle/ong/css/estilos.css" />
<link type="text/css" rel="stylesheet" href="/WebMAA/Painel_controle/ong/css/drop_vertical.css" />
<link type="text/css" rel="stylesheet" href="/WebMAA/Painel_controle/ong/css/abas.css" />


<script type="text/javascript" src="/WebMAA/Painel_controle/ong/js/jquery.js"></script>
<script type="text/javascript" src="/WebMAA/Painel_controle/ong/js/utilidades.js"></script>
<script type="text/javascript" src="/WebMAA/Painel_controle/ong/js/maskedinput.js"></script>
<script type="text/javascript" src="/WebMAA/Painel_controle/ong/js/jquery-ui-datepicker.js"></script>
<script type="text/javascript" src="/WebMAA/Painel_controle/ong/js/menuVertical.js"></script>

<script>
function focoBt(id){
	if(id ==="limpar"){
		$("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_limpar_light.png");
	}

	if(id ==="alterar"){
		$("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_alterar_light.png");
	}
}

function bt(id){
	if(id ==="limpar"){
		$("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_limpar.png");
	}

	if(id ==="alterar"){
		$("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_alterar.png");
	}
}
</script>

</head>

<body>

<!-- Corpo da pagina -->
<div id="corpo">

<!-- div com o banner -->

<div id="faixaBanner">
	<div class="imgBannerInfLeft"><img src="/WebMAA/Painel_controle/ong/images/topo2.png" alt="Logo" title="Logo" class="seta_link" /></div>
    <div class="imgBannerInfRight"></div>
</div>

<!-- CONTEUDO -->

<div id="conteudo">

	<div id="topo_painel">
        <%@include file="topo.jsp" %>
    </div>
	<div class="imgBase_sem_coluna">

	<!-- CONTEUDO AQUI -->
		<div id="cont">
			<div class="menuLeft">
            	<br />
                <br />

                <!-- menu -->
                <div id="menu3">
					<%@include file="menu.jsp" %>
                </div>

            </div>

            <div class="conteudo_painel">

            <div class="lista">
    			<div class="nota_destaque">Cadastro de FuncionÃ¡rios</div>
                <br />
                <span class="obrigatorio">* Campos de Preenchimento Obrigatório</span>
                <br />

                <fieldset>
                	<legend>Dados Pessoais</legend>
            	<table class="grid">
                	<tr>
                    	<td align="right">Cod:&nbsp; </td>
                      <td colspan="3"><input type="text" size="5" value="001" disabled="disabled" /></td>
                  </tr>
                    <tr>
                    	<td align="right">Data de Cadastro:&nbsp; </td>
                      <td colspan="3"><input type="text" size="10" value="17092009" disabled="disabled" class="data" /></td>
                  </tr>
                	<tr>
                    	<td width="26%" align="right"><span class="obrigatorio">*</span> Nome: &nbsp;</td>
                      	<td colspan="3"><input type="text" name="nome" size="30" value="Fulano de Tal" /></td>
                  	</tr>
                    <tr>
                    	<td align="right"><span class="obrigatorio">*</span> RG: &nbsp;</td>
                      	<td width="20%"><input type="text" name="rg" size="10" value="2.250001" /></td>
                        <td width="15%" align="right"><span class="obrigatorio">*</span> CPF: &nbsp;</td>
                      	<td width="39%"><input type="text" name="cpf" size="10" class="cpf" value="00000000000" /></td>
                  	</tr>
                    <tr>
                    	<td align="right">Data de Nascimento: &nbsp;</td>
                      	<td colspan="3"><input type="text" name="dataNascimento" size="8" class="data" value="30011984" /></td>
                  	</tr>
                    <tr>
                    	<td align="right"><span class="obrigatorio">*</span> Email: &nbsp;</td>
                      	<td colspan="3"><input type="text" name="email" size="30" value="fulano@email.com" /></td>
                  	</tr>
                     <tr>
                    	<td align="right">Telefone: &nbsp;</td>
                      	<td colspan="3"><input type="text" name="fone" size="10" class="foneDD" value="6199999999" /></td>
                  	</tr>
                    <tr>
                    	<td align="right"><span class="obrigatorio">*</span> Cargo: &nbsp;</td>
                      	<td>
                        	<select>
                            	<option selected="selected">SecretÃ¡rio</option>
                                <option>Base de Dados</option>
                            </select>
                        </td>
                        <td align="right"><span class="obrigatorio">*</span> Data de Admissão: &nbsp;</td>
                      	<td><input type="text" name="dataAdm" size="8" class="data" value="10062009" disabled="disabled" /></td>
                  	</tr>
                </table>
                </fieldset>

                <fieldset>
                	<legend>Endereço</legend>
                <table class="grid">
                	<tr>
                    	<td width="30%" align="right"><span class="obrigatorio">*</span> CEP: &nbsp;</td>
                      	<td colspan="5"><input type="text" name="cep" size="10" class="cep" value="70000000" /></td>
                  	</tr>
                    <tr>
                    	<td align="right"><span class="obrigatorio">*</span> Endereço: &nbsp;</td>
                      	<td colspan="5"><input type="text" name="end" size="30" value="Vila SÃ£o JosÃ©" /></td>
                  	</tr>
                    <tr>
                    	<td align="right">Complemento: &nbsp;</td>
                      	<td colspan="5"><input type="text" name="complemento" size="30" value="Rua 321 casa 03" /></td>
                  	</tr>
                    <tr>
                    	<td align="right"><span class="obrigatorio">*</span> Cidade: &nbsp;</td>
                      	<td width="20%"><input type="text" name="cidade" size="15" value="Taguatinga"  /></td>
                        <td width="13%" align="right">Bairro: &nbsp;</td>
                      	<td width="37%"><input type="text" name="bairro" size="10" value="Norte"  /></td>
                  	</tr>
                     <tr>
                    	<td align="right"><span class="obrigatorio">*</span> UF: &nbsp;</td>
                      	<td colspan="3">
                        	<select>
                            	<option>DF</option>
                            	<option>Base de Dados</option>
                            </select>
                        </td>
                  	</tr>
                </table>
                </fieldset>

                <br />
                <br />

                <div align="right" style="width:90%;">
                	<a href="/WebMAA/Painel_controle/ong/painel.jsp"><img src="/WebMAA/Painel_controle/ong/images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link" /></a>&nbsp;&nbsp;
                    <img src="/WebMAA/Painel_controle/ong/images/botao/bt_limpar.png" alt="Limpar" title="Limpar" class="seta_link" id="limpar" onmouseover="focoBt('limpar');" onmouseout="bt('limpar');"  onclick="limparFuncionario();" />&nbsp;&nbsp;
                    <img src="/WebMAA/Painel_controle/ong/images/botao/bt_alterar.png" alt="Alterar" title="Alterar" class="seta_link" id="alterar" onmouseover="focoBt('alterar');" onmouseout="bt('alterar');" />
                </div>

               </div>

         </div>

           <div class="clear">
           </div>

		</div>
	 <!-- FIM DO CONTEUDO -->

	</div>
	<span class="imgFim_sem_coluna"></span>
</div>

</div>
<!-- Fim do corpo -->

<!-- RodapÃ© -->

<div id="rodape">
	Versão do Sistema &nbsp;&nbsp; 1.0
</div>

</body>

</html>
