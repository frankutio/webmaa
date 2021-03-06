<%@page import="Entidade.Portal.Colaborador"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ong Amigos Fieis</title>

<link type="text/css" rel="stylesheet" href="/Painel_controle/Usuario/css/geral.css" />
<link type="text/css" rel="stylesheet" href="/Painel_controle/Usuario/css/estilos.css" />
<link type="text/css" rel="stylesheet" href="/Painel_controle/Usuario/css/menu_drop.css" />

<script type="text/javascript" src="/Painel_controle/Usuario/js/jquery.js"></script>
<script type="text/javascript" src="/Painel_controle/Usuario/js/utilidades.js"></script>
<script type="text/javascript" src="/Painel_controle/Usuario/js/maskedinput.js"></script>
<script type="text/javascript" src="/Painel_controle/Usuario/js/menuSuper.js"></script>

<script>
function focoBt(id){
		if(id ==="doar"){
		$("#"+id).attr("src","/Painel_controle/Usuario/images/botao/bt_doar_light.png");
	}
	
	else if(id ==="logoff"){
		$("#"+id).attr("src","/Painel_controle/Usuario/images/botao/bt_logoff_light.png");
	}
	
	else if(id ==="alterar"){
		$("#"+id).attr("src","/Painel_controle/Usuario/images/botao/bt_alterar_light.png");
	}
	
	else if(id ==="cancelar"){
		$("#"+id).attr("src","/Painel_controle/Usuario/images/botao/bt_cancelar_light.png");
	}
}

function bt(id){
		if(id ==="doar"){
		$("#"+id).attr("src","/Painel_controle/Usuario/images/botao/bt_doar.png");
	}
	
	else if(id ==="logoff"){
		$("#"+id).attr("src","/Painel_controle/Usuario/images/botao/bt_logoff.png");
	}
	
	else if(id ==="alterar"){
		$("#"+id).attr("src","/Painel_controle/Usuario/images/botao/bt_alterar.png");
	}
	
	else if(id ==="cancelar"){
		$("#"+id).attr("src","/Painel_controle/Usuario/images/botao/bt_cancelar.png");
	}
}

$(document).ready(function(){

    preenche();
});

function preenche(){

    var sexo = "${Colaborador.sexo}";

    if(sexo == "M"){

        $("#masc").attr("checked",true);
    }
    else if(sexo == "F"){

        $("#femi").attr("checked",true);
    }
}

</script>

</head>

<body>

<!-- Corpo da pagina -->
<div id="corpo">
<!-- div com o topo do site -->

<div id="faixaTopo">
		<div class="imgBannerLeft"><img src="/Painel_controle/Usuario/images/topo1.png" alt="logo" title="Logo" class="seta_link" /></div>
        <div class="imgBannerRight"></div>   	
</div>

<!-- div com o banner -->

<div id="faixaBanner">
	<div class="imgBannerInfLeft"><img src="/Painel_controle/Usuario/images/topo2.png" alt="Logo" title="Logo" class="seta_link" /></div>
    <div class="imgBannerInfRight"></div>
</div>

<!-- div Status -->

<div id="faixaStatus">
<table class="grid" style=" margin-top:-6px;">
	<tr>
    	<td align="right">
            <c:if test="${Log.login != null}">
                <img src="/images/botao/bt_logoff.png" alt="Sair" title="Sair" class="seta_link" id="logoff" onmouseover="focoBt('logoff');" onmouseout="bt('logoff');" onclick="window.location='/logoff?operacao=sair';" />
            </c:if>
       </td>
    </tr>
</table>
</div>


<!-- Menu do site Horizontal -->

<div id="menu">
	<div class="menuDrop">
		<ul>
			<li><a href="/index.jsp" onfocus="limpaMenu();"><span>Inicio</span></a></li>
    		<li><a href="/noticias.jsp" onfocus="limpaMenu();"><span>Not�cias</span></a></li>
            <li><a href="/denuncia.jsp" onfocus="limpaMenu();"><span>Den&uacute;ncias</span></a></li>
            <li id="adotar" class="" onmouseover="setaClass('adotar');" onmouseout="retiraClass('adotar');"><a href="#" onfocus="ativa('adotar','drop');"><span>Adotar</span></a>
    			<ul class="drop">
        			<li id="gato" class=""><a href="/listaAnimal?operacao=lista_gato" onfocus="ativaLight('gato');">Gato</a></li>
    				<li id="cao" class=""><a href="/listaAnimal?operacao=lista_cao" onfocus="ativaLight('cao');">Cachorro</a></li>
        		</ul>
    		</li>            
    		<li><a href="/direito_animal.jsp" onfocus="limpaMenu();"><span>Direito Animal</span></a></li>
    		<li><a href="/cadastro.jsp" onfocus="limpaMenu();"><span>Cadastre-se</span></a></li>
            <li><a href="/GerAnimal?operacao=iniciar_cad" onfocus="limpaMenu();"><span>Doar</span></a></li>
            <li><a href="/final_feliz/index.jsp" onfocus="limpaMenu();"><span>Final Feliz</span></a></li>
            <li><a href="/fale_conosco.jsp" onfocus="limpaMenu();"><span>Fale Conosco</span></a></li>
		</ul>
	</div>
</div>

<!-- CONTEUDO -->

<div id="conteudo">

	<span class="imgTopo_geral"></span>
	<div class="imgBase_geral">
	
	<!-- CONTEUDO AQUI -->
		<div id="contIndex">
        	<!-- Colunas -->
<div id="colunaLeft_geral">
			<div class="bordaFaixaPainel_left"><span><img src="/Painel_controle/Usuario/images/botao/ico_painel.png" alt="Painel" title="" style=" float:left; text-align:left; padding-right:5px;" /> Bem Vindo fulano@gmail.com - &nbsp;&nbsp; Painel de Controle</span></div>
                <br /><!-- FOTO DO USUARIO -->            
            <div id="foto">
                <img src="/Painel_controle/Usuario/foto/${Colaborador.endFoto}" />
            </div>
            <!-- FOTO -->
            
            <!-- DADOS DO USUARIO -->            
            <div id="dadosUsuario">
            <span class="obrigatorio">* Campos de Preenchimento Obrigat�rio</span>
            <br />
            <form name="editaDados" action="/NavUsr" method="post">
            
            	<input type="hidden" name="cod" value="${Colaborador.codigo}" />
                <input type="hidden" name="operacao" value="ColaboradorEditaProcessa" />
                
            	<fieldset>
                	<legend> Dados Pessoais </legend>
                    <br />
                   
                		<table class="grid">
                			<tr>
                    			<td width="22%" align="right"><span class="obrigatorio">*</span> Nome: &nbsp;</td>
                              	<td colspan="3"><input type="text" name="nome" value="${Colaborador.nome}" size="30" /></td>
                   		  </tr>
                          <tr>
                    			<td width="22%" align="right"><span class="obrigatorio">*</span> RG: &nbsp;</td>
                              	<td width="22%"><input type="text" name="rg" value="${Colaborador.rg}" size="10" /></td>
                                <td width="14%" align="right">CPF: &nbsp;</td>
                            <td width="42%"><input type="text" name="cpf" value="${Colaborador.cpf}" readonly="yes" size="20" /></td>
                   		  </tr>
                          <tr>
                    			<td width="22%" align="right"><span class="obrigatorio">*</span> Email: &nbsp;</td>
                              	<td colspan="3"><input type="text" name="email" value="${Colaborador.email}" size="40" /></td>
                   		  </tr>
                          <tr>
                    			<td width="22%" align="right"><span class="obrigatorio">*</span> Sexo: &nbsp;</td>
                              	<td colspan="3"><label>Masculino <input type="radio" name="sexo" value="M" id="masc" /></label> &nbsp; &nbsp;
                                	<label>Feminino <input type="radio" name="sexo" value="F" id="femi" /></label></td>
                   		  </tr>
                          <tr>
                    			<td width="22%" align="right"><span class="obrigatorio">*</span> Data de Nascimento: &nbsp;</td>
                              	<td colspan="3"><input type="text" name="idade" value="${Colaborador.dataNascimentoString}" size="15" /></td>
                   		  </tr>
                          <tr>
                    			<td width="22%" align="right">Telefone: &nbsp;</td>
                              	<td><input type="text" name="fone" value="${Colaborador.telefone}" size="15" class="foneDD" /></td>
                                <td width="14%" align="right">Celular: &nbsp;</td>
                              	<td colspan="3"><input type="text" name="cel" value="${Colaborador.celular}" size="15" class="foneDD" /></td>
                   		  </tr>
               			</table>
               	</fieldset>
                <br />
                <fieldset>
                	<legend>Endere�o</legend>
                    <br />
                    
                    <table class="grid">
                			<tr>
                    			<td width="22%" align="right"><span class="obrigatorio">*</span> CEP: &nbsp;</td>
                              	<td colspan="3"><input type="text" name="cep" value="${Colaborador.cep}" size="15" /></td>
                   		  </tr>
                          <tr>
                    			<td width="22%" align="right"><span class="obrigatorio">*</span> Endere�o: &nbsp;</td>
                              	<td colspan="3"><input type="text" name="end" value="${Colaborador.endereco}" size="50" /></td>
                          </tr>
                          <tr>
                                <td width="22%" align="right">Complemento: &nbsp;</td>
                            	<td width="36%"><input type="text" name="complemento" value="${Colaborador.complemento}" size="20" /></td>
                                <td width="15%" align="right">Numero: &nbsp;</td>
                            	<td width="27%"><input type="text" name="numero" value="${Colaborador.numero}" size="5"  /></td>
                   		  </tr>
                          <tr>
                    			<td width="22%" align="right"><span class="obrigatorio">*</span> Cidade: &nbsp;</td>
                              	<td><input type="text" name="cidade" value="${Colaborador.cidade}" size="20" /></td>
                                <td align="right">Bairro: &nbsp;</td>
                            	<td><input type="text" name="bairro" value="${Colaborador.bairro}" size="15" /></td>
                   		  </tr>
                          <tr>
                    			<td width="22%" align="right"><span class="obrigatorio">*</span> UF: &nbsp;</td>
                              	<td colspan="3">
                                	<select name="uf">
                                         <option></option>
                                             <c:forEach items="${lstUF}" var="lstUF">
                                                <option value="${lstUF.codigo}"
                                              <c:if  test="${Colaborador.uf == lstUF.codigo}">
                                                  selected ="${lstUF.UF}"
                                               </c:if>   > ${lstUF.UF}</option>
                                              </c:forEach>

                                     </select>
                                </td>	
                   		  </tr>
               			</table>
                        <br />
                        <%
                        if(request.getAttribute("ErroAlt") != null){
                            out.print("<span style='color:#F00'>" +
                              request.getAttribute("ErroAlt") +
                              "</span> <br />");
                        }
                        %>
                     </fieldset>
                     <br />
                     
       <div align="center">
                     	<input type="image" src="/Painel_controle/Usuario/images/botao/bt_alterar.png" alt="Alterar" title="Alterar" id="alterar" onmouseover="focoBt('alterar');" onmouseout="bt('alterar');" />&nbsp; &nbsp;
                        <a href="/PainelControle?operacao=exibirPainel&colaborador=${Colaborador.codigo}"><img src="/Painel_controle/Usuario/images/botao/bt_cancelar.png" alt="Cancelar" title="Cancelar" class="seta_link" id="cancelar" onmouseover="focoBt('cancelar');" onmouseout="bt('cancelar');" /></a></div>
                </form>
          </div>            
            <!-- DADOS DO USUARIO -->
            
            <div class="clear"></div>
            
            <!-- CONTEUDO DO PAINEL -->
            <div id="cont_painel">
            	<div class="bloco_left">
                	                    
                 
              	<br />
                
                
                </div>
                
                <div class="bloco_centro">
                	&nbsp;
                </div>
              
             <div class="clear"></div>
            </div>
            <!-- CONTEUDO DO PAINEL -->
                           
          <br />                
          <br />          
		  </div>
            
			<div id="colunaRight">
            
            <!-- LOGIN -->
            	<div class="login" style="font-size:10px;">
					<div class="bordaFaixaLeft"><span>Gerenciar</span></div>
                	<br />
              <table class="grid">
                        <tr>
                        	<td width="29%" align="right"><a href="/Painel_controle/Usuario/cad_edit.html"><img src="/Painel_controle/Usuario/images/botao/editar.png" alt="Alterar Cadastro" title="Alterar Cadastro" class="seta_link" /></a> &nbsp;</td>
                            <td width="71%"><a href="/NavUsr?operacao=alterar_cad">Alterar Cadastro</a></td>
                        </tr>
                        <tr>
                        	<td align="right"><a href="index.html"><img src="/Painel_controle/Usuario/images/botao/ico_painel.png" alt="painel de Controle" title="Painel de Controle" class="seta_link" /></a> &nbsp;</td>
                            <td><a href="/PainelControle?operacao=exibirPainel&colaborador=${Colaborador.codigo}">Painel de Controle</a></td>
                        </tr>
                    </table>
                    
              </div>
             <!-- LOGIN -->
             <br />
             
             
              	
                       
			</div>
		<!-- Fim das colunas -->
		<div class="clear"></div>
					
		</div>
	 <!-- FIM DO TEXTO -->	
		
	</div>
	<span class="imgFim_geral"></span>
</div>

</div>
<!-- Fim do corpo -->

<!-- Rodapé -->

<div id="rodape">
	sdjlarpq
</div>

</body>

</html>