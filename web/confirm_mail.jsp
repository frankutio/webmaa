<%@page contentType="text/html" pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ong Amigos Fieis</title>

<link rel="icon" type="image/x-icon" href="/images/favicon.ico" />

<link type="text/css" rel="stylesheet" href="/css/geral.css" />
<link type="text/css" rel="stylesheet" href="/css/jquery-ui-datepicker.css" />
<link type="text/css" rel="stylesheet" href="/css/estilos.css" />
<link type="text/css" rel="stylesheet" href="/css/menu_drop.css" />


<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/utilidades.js"></script>
<script type="text/javascript" src="/js/maskedinput.js"></script>
<script type="text/javascript" src="/js/jquery-ui-datepicker.js"></script>
<script type="text/javascript" src="/js/menuSuper.js"></script>
<script type="text/javascript" src="/js/jquery.validate.js"></script>
<script type="text/javascript" src="/js/formularios.js"></script>

<script>
function focoBt(id){
    if(id ==="logoff"){
		$("#"+id).attr("src","/images/botao/bt_logoff_light.png");
	}
    else if(id ==="enviar"){
		$("#"+id).attr("src","/images/botao/bt_enviar_verde_light.png");
	}
	else if(id ==="limpar"){
		$("#"+id).attr("src","/images/botao/bt_limpar_light.png");
	}
}

function bt(id){
		if(id ==="logoff"){
		$("#"+id).attr("src","/images/botao/bt_logoff.png");
	}
    else if(id ==="enviar"){
		$("#"+id).attr("src","/images/botao/bt_enviar_verde.png");
	}
	else if(id ==="limpar"){
		$("#"+id).attr("src","/images/botao/bt_limpar.png");
	}
}
</script>

</head>

<body>

<!-- Corpo da pagina -->
<div id="corpo">
<!-- div com o topo do site -->

<div id="faixaTopo">
		<div class="imgBannerLeft"><img src="/images/topo1.png" alt="logo" title="Logo" class="seta_link" /></div>
        <div class="imgBannerRight"></div>
</div>

<!-- div com o banner -->

<div id="faixaBanner">
	<div class="imgBannerInfLeft"><img src="/images/topo2.png" alt="Logo" title="Logo" class="seta_link" /></div>
    <div class="imgBannerInfRight"></div>
</div>

<!-- div Status -->

<div id="faixaStatus">
<table class="grid" style=" margin-top:-6px;">
	<tr>
    	<td align="right">
            <c:if test="${Log.login != null}">
                <img src="/images/botao/bt_logoff.png" alt="Sair" title="Sair" class="seta_link" id="logoff" onmouseover="focoBt('logoff');" onmouseout="bt('logoff');" onclick="window.location='logoff?operacao=sair';" />
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
			<div class="bordaFaixaLeft"><span><img src="/images/botao/ico_email.png" style=" float:left; text-align:left; padding-right:5px;"  /> &nbsp;&nbsp;&nbsp; C.D.O - Contato Direto com a Ong</span></div>
                <br />

          <!-- TELA 01 -->
          <div id="dadosInicio">

              <!-- TELA DE CONFIRMA��O -->
  <div id="conf_envio">
      <br />
      <br />
                	

                    <br />
                    <br />
              <div class="nota_informa">
               	  ${msgEmail}
              </div>
              <br />

              <div align="center" style="width:80%">
              	<img src="/images/botao/bt_ok.png" alt="Ok" title="ok" class="seta_link" id="ok" onmouseover="focoBt('ok');" onmouseout="bt('ok');" onclick="window.location='/index.jsp'" />
              </div>
          </div>
            <!-- FIM DA TELA DE CONFIRMA��O -->

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

                    <form action="/NavUsr" name="logar" method="post" class="link">

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
                        <input type="image" src="/images/botao/check.png" onmouseover="troca('buscaBotao');" onmouseout="volta('buscaBotao');" id="buscaBotao" title="Buscar"  />
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
                                <td width="29%" align="right"><img src="/images/botao/ico_email.png" alt="Mensagem" title="Mensagem" /> &nbsp;</td>
                                <td width="71%"> Nenhuma Mesagem</td>
                            </tr>
                        </c:if>
                        <c:if test="${!empty Msg}">
                            <tr>
                                <td width="29%" align="right"><img src="/images/botao/ico_email.png" alt="Mensagem" title="Mensagem" class="seta_link" /> &nbsp;</td>
                                <td width="71%"><a href="Mensagem?operacao=abrirCentro&colaborador=${Colaborador.codigo}"><span class="obrigatorio">${qtd}</span> Mensagen(s) Nova(s)</a></td>
                            </tr>
                        </c:if>
                        <tr>

                        	<td align="right"><img src="/images/botao/ico_painel.png" alt="Painel" title="Ir para o Painel de Controle" class="seta_link" /> &nbsp;</td>
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

<!-- Rodap� -->

<div id="rodape">
	sdjlarpq
</div>

</body>

</html>