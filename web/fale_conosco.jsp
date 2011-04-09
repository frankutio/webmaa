<%@page contentType="text/html" pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ong Amigos Fieis</title>

<link rel="icon" type="image/x-icon" href="/WebMAA/images/favicon.ico" />

<link type="text/css" rel="stylesheet" href="/WebMAA/css/geral.css" />
<link type="text/css" rel="stylesheet" href="/WebMAA/css/jquery-ui-datepicker.css" />
<link type="text/css" rel="stylesheet" href="/WebMAA/css/estilos.css" />
<link type="text/css" rel="stylesheet" href="/WebMAA/css/menu_drop.css" />


<script type="text/javascript" src="/WebMAA/js/jquery.js"></script>
<script type="text/javascript" src="/WebMAA/js/utilidades.js"></script>
<script type="text/javascript" src="/WebMAA/js/maskedinput.js"></script>
<script type="text/javascript" src="/WebMAA/js/jquery-ui-datepicker.js"></script>
<script type="text/javascript" src="/WebMAA/js/menuSuper.js"></script>
<script type="text/javascript" src="/WebMAA/js/jquery.validate.js"></script>
<script type="text/javascript" src="/WebMAA/js/formularios.js"></script>

<script>
function focoBt(id){
    if(id ==="logoff"){
		$("#"+id).attr("src","/WebMAA/images/botao/bt_logoff_light.png");
	}
    else if(id ==="enviar"){
		$("#"+id).attr("src","/WebMAA/images/botao/bt_enviar_verde_light.png");
	}
	else if(id ==="limpar"){
		$("#"+id).attr("src","/WebMAA/images/botao/bt_limpar_light.png");
	}
}

function bt(id){
		if(id ==="logoff"){
		$("#"+id).attr("src","/WebMAA/images/botao/bt_logoff.png");
	}
    else if(id ==="enviar"){
		$("#"+id).attr("src","/WebMAA/images/botao/bt_enviar_verde.png");
	}
	else if(id ==="limpar"){
		$("#"+id).attr("src","/WebMAA/images/botao/bt_limpar.png");
	}
}
</script>

</head>

<body>

<!-- Corpo da pagina -->
<div id="corpo">
<!-- div com o topo do site -->

<div id="faixaTopo">
		<div class="imgBannerLeft"><img src="/WebMAA/images/topo1.png" alt="logo" title="Logo" class="seta_link" /></div>
        <div class="imgBannerRight"></div>
</div>

<!-- div com o banner -->

<div id="faixaBanner">
	<div class="imgBannerInfLeft"><img src="/WebMAA/images/topo2.png" alt="Logo" title="Logo" class="seta_link" /></div>
    <div class="imgBannerInfRight"></div>
</div>

<!-- div Status -->

<div id="faixaStatus">
<table class="grid" style=" margin-top:-6px;">
	<tr>
    	<td align="right">
            <c:if test="${Log.login != null}">
                <img src="/WebMAA/images/botao/bt_logoff.png" alt="Sair" title="Sair" class="seta_link" id="logoff" onmouseover="focoBt('logoff');" onmouseout="bt('logoff');" onclick="window.location='logoff?operacao=sair';" />
            </c:if>
       </td>
    </tr>
</table>
</div>


<!-- Menu do site Horizontal -->

<div id="menu">
	<div class="menuDrop">
		<ul>
			<li><a href="/WebMAA/index.jsp" onfocus="limpaMenu();"><span>Inicio</span></a></li>
    		<li><a href="/WebMAA/noticias.jsp" onfocus="limpaMenu();"><span>Notícias</span></a></li>
            <li><a href="/WebMAA/denuncia.jsp" onfocus="limpaMenu();"><span>Den&uacute;ncias</span></a></li>
            <li id="adotar" class="" onmouseover="setaClass('adotar');" onmouseout="retiraClass('adotar');"><a href="#" onfocus="ativa('adotar','drop');"><span>Adotar</span></a>
    			<ul class="drop">
        			<li id="gato" class=""><a href="/WebMAA/listaAnimal?operacao=lista_gato" onfocus="ativaLight('gato');">Gato</a></li>
    				<li id="cao" class=""><a href="/WebMAA/listaAnimal?operacao=lista_cao" onfocus="ativaLight('cao');">Cachorro</a></li>
        		</ul>
    		</li>
    		<li><a href="/WebMAA/direito_animal.jsp" onfocus="limpaMenu();"><span>Direito Animal</span></a></li>
    		<li><a href="/WebMAA/cadastro.jsp" onfocus="limpaMenu();"><span>Cadastre-se</span></a></li>
            <li><a href="/WebMAA/GerAnimal?operacao=iniciar_cad" onfocus="limpaMenu();"><span>Doar</span></a></li>
            <li><a href="/WebMAA/final_feliz/index.jsp" onfocus="limpaMenu();"><span>Final Feliz</span></a></li>
<li><a href="/WebMAA/fale_conosco.jsp" onfocus="limpaMenu();"><span>Fale Conosco</span></a></li>
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
			<div class="bordaFaixaLeft"><span><img src="/WebMAA/images/botao/ico_email.png" style=" float:left; text-align:left; padding-right:5px;"  /> &nbsp;&nbsp;&nbsp; C.D.O - Contato Direto com a Ong</span></div>
                <br />

          <!-- TELA 01 -->
          <div id="dadosInicio">

              <form name="FormContato" method="post" id="FormContato" action="Email">
                  <input type="hidden" name="operacao" value="contato" />
              	<p>
                	Use o formulário abaixo para entrar em contato.<br />
                     Não se esqueça de preencher os campos obrigatórios que estão indicados pelo ( <span class="obrigatorio">*</span> ).
                </p>
                <br />
                <hr />

                <br />

                <table class="grid">
                	<tr>
                    	<td width="16%" align="right"><span class="obrigatorio">*</span> Nome: &nbsp;</td>
                        <td width="84%"><label><input type="text" name="nome" value="" size="30" maxlength="50" /> &nbsp;</label></td>
                   </tr>
                   <tr>
                    	<td width="16%" align="right"><span class="obrigatorio">*</span> E-mail: &nbsp;</td>
                        <td width="84%"><label><input type="text" name="email" value="" size="30" maxlength="45" /> &nbsp;</label></td>
                   </tr>
                   <tr>
                    	<td width="16%" align="right">Telefone: &nbsp;</td>
                        <td width="84%"><input type="text" name="telefone" value="" size="10" class="foneDD" /> &nbsp; (Com DDD)</td>
                   </tr>
                   <tr>
                    	<td width="16%" align="right">Assunto: &nbsp;</td>
                        <td width="84%">
                        	<select name="assunto">
                                <option value="Link Quebrado">Link Quebrado</option>
                                <option value="Sugestão">Sugestão</option>
                                <option value="Reclamação">Reclamação</option>
                                <option value="Elogio">Elogio</option>
                                <option value="Denúncia de Colaborador">Denúncia de Colaborador</option>
                                <option selected value="Outros">Outros</option>
                            </select>
                        </td>
                   </tr>
                </table>
                <br />
                <table class="grid">
                	<tr>
                    	<td><span class="obrigatorio">*</span> Descreva a Mensagem</td>
                    </tr>
                    <tr>
                    	<td><label><textarea name="mensagem" rows="5" cols="50"></textarea> &nbsp;</label></td>
                    </tr>
                </table>
              	<br />

                <div align="center" style="width:80%;">
                	<img src="/WebMAA/images/botao/bt_limpar.png" alt="Limpar" title="Limpar" class="seta_link" id="limpar" onmouseover="focoBt('limpar');" onmouseout="bt('limpar');" onclick="document.FormContato.reset();" />&nbsp;&nbsp;
                    <input type="image" src="/WebMAA/images/botao/bt_enviar_verde.png" alt="Enviar" title="Enviar" id="enviar" onmouseover="focoBt('enviar');" onmouseout="bt('enviar');" />
                </div>
              </form>

          </div>
            <!-- FIM DA TELA 01 -->
         		 <br />
          		<br />
	  	  </div>

			<div id="colunaRight">

             <c:if test="${Log.login == null}">
                <!-- LOGIN -->
            	<div class="login">
					<div class="bordaFaixaLeft"><span>Login</span></div>
                	<br />

                    <form action="/WebMAA/NavUsr" name="logar" method="post" class="link">

                    	<input type="hidden" name="operacao" value="login" />
                        <input type="hidden" name="dispara" value="fale_conosco.jsp" />

                    	<table class="grid" width="100%">
                        	<tr>
                            	<td>E-mail <br />
                                	<input type="text" name="login" size="15"  /></td>
                            </tr>
                            <tr>
                            	<td>CPF <br />
                                	<input type="text" name="cpf" size="17" class="cpf" /></td>
                            </tr>
                        </table>
                        <br />
                        <div align="center">
                        <input type="image" src="/WebMAA/images/botao/check.png" onmouseover="troca('buscaBotao');" onmouseout="volta('buscaBotao');" id="buscaBotao" title="Buscar"  />
                        </div>
                        <br />
                        <span class="obrigatorio">
                            <%
                            if(request.getAttribute("MsgErro") != null) {
                              out.print(request.getAttribute("MsgErro"));
                            }
                            %>
                        </span>
                        <br />

                    </form>
                </div>
             <!-- LOGIN -->
            </c:if>
            <c:if test="${Log.login != null}">
                <!-- LOGIN -->

            	<div class="login" style="font-size:10px;">
					<div class="bordaFaixaLeft"><span>Login</span></div>
                	<br />
              <table class="grid">
                    	<tr>
                            <td align="center" colspan="2">${Colaborador.email}</td>
                        </tr>
                        <tr>

                            <td align="center" colspan="2">&nbsp;</td>
                        </tr>
                        <c:if test="${empty Msg}">
                            <tr>
                                <td width="29%" align="right"><img src="/WebMAA/images/botao/ico_email.png" alt="Mensagem" title="Mensagem" /> &nbsp;</td>
                                <td width="71%"> Nenhuma Mesagem</td>
                            </tr>
                        </c:if>
                        <c:if test="${!empty Msg}">
                            <tr>
                                <td width="29%" align="right"><img src="/WebMAA/images/botao/ico_email.png" alt="Mensagem" title="Mensagem" class="seta_link" /> &nbsp;</td>
                                <td width="71%"><a href="Mensagem?operacao=abrirCentro&colaborador=${Colaborador.codigo}"><span class="obrigatorio">${qtd}</span> Mensagen(s) Nova(s)</a></td>
                            </tr>
                        </c:if>
                        <tr>

                        	<td align="right"><img src="/WebMAA/images/botao/ico_painel.png" alt="Painel" title="Ir para o Painel de Controle" class="seta_link" /> &nbsp;</td>
                            <td><a href="PainelControle?operacao=exibirPainel&colaborador=${Colaborador.codigo}">Meu Painel de Controle</a></td>
                        </tr>
                    </table>

              </div>
             <!-- LOGIN -->

            </c:if>

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