<%@page contentType="text/html" pageEncoding="ISO-8859-1" %>
<%@page import="Entidade.Portal.Notificacao"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ong Amigos Fieis</title>

<link type="text/css" rel="stylesheet" href="/WebMAATeste/Painel_controle/Usuario/css/geral.css" />
<link type="text/css" rel="stylesheet" href="/WebMAATeste/Painel_controle/Usuario/css/estilos.css" />
<link type="text/css" rel="stylesheet" href="/WebMAATeste/Painel_controle/Usuario/css/menu_drop.css" />

<script type="text/javascript" src="/WebMAATeste/Painel_controle/Usuario/js/jquery.js"></script>
<script type="text/javascript" src="/WebMAATeste/Painel_controle/Usuario/js/utilidades.js"></script>
<script type="text/javascript" src="/WebMAATeste/Painel_controle/Usuario/js/maskedinput.js"></script>
<script type="text/javascript" src="/WebMAATeste/Painel_controle/Usuario/js/menuSuper.js"></script>

<script>
function focoBt(id){
		$("#"+id).attr("src","/WebMAATeste/Painel_controle/Usuario/images/botao/bt_logoff_light.png");
}

function bt(id){
		$("#"+id).attr("src","/WebMAATeste/Painel_controle/Usuario/images/botao/bt_logoff.png");
}

function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
</script>

</head>

<body>

<!-- Corpo da pagina -->
<div id="corpo">
<!-- div com o topo do site -->

<div id="faixaTopo">
		<div class="imgBannerLeft"><img src="/WebMAATeste/Painel_controle/Usuario/images/topo1.png" alt="logo" title="Logo" class="seta_link" /></div>
        <div class="imgBannerRight"></div>   	
</div>

<!-- div com o banner -->

<div id="faixaBanner">
	<div class="imgBannerInfLeft"><img src="/WebMAATeste/Painel_controle/Usuario/images/topo2.png" alt="Logo" title="Logo" class="seta_link" /></div>
    <div class="imgBannerInfRight"></div>
</div>

<!-- div Status -->

<div id="faixaStatus">
<table class="grid" style=" margin-top:-6px;">
	<tr>
    	<td align="right">
            <c:if test="${Log.login != null}">
                <img src="/WebMAATeste/images/botao/bt_logoff.png" alt="Sair" title="Sair" class="seta_link" id="logoff" onmouseover="focoBt('logoff');" onmouseout="bt('logoff');" onclick="window.location='logoff?operacao=sair';" />
            </c:if>
       </td>
    </tr>
</table>
</div>


<!-- Menu do site Horizontal -->

<div id="menu">
	<div class="menuDrop">
		<ul>
			<li><a href="/WebMAATeste/index.jsp" onfocus="limpaMenu();"><span>Inicio</span></a></li>
    		<li><a href="#" onfocus="limpaMenu();"><span>Notícias</span></a></li>
            <li><a href="#" onfocus="limpaMenu();"><span>Denúncias</span></a></li>
            <li id="adotar" class="" onmouseover="setaClass('adotar');" onmouseout="retiraClass('adotar');"><a href="#" onfocus="ativa('adotar','drop');"><span>Adotar</span></a>
    			<ul class="drop">
        			<li id="gato" class=""><a href="../../gato/listaGato.jsp" onfocus="ativaLight('gato');">Gato</a></li>
    				<li id="cao" class=""><a href="#" onfocus="ativaLight('cao');">Cachorro</a></li>
        		</ul>
    		</li>
    		<li><a href="#" onfocus="limpaMenu();"><span>Direito Animal</span></a></li>
    		<li><a href="../../cadastro.jsp" onfocus="limpaMenu();"><span>Cadastre-se</span></a></li>
            <li><a href="cad_animal.jsp" onfocus="limpaMenu();"><span>Doar</span></a></li>
            <li><a href="../../final_feliz/index.jsp" onfocus="limpaMenu();"><span>Final Feliz</span></a></li>
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
			<div class="bordaFaixaPainel_left"><span><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/ico_email.png" alt="Msg" title="" style=" float:left; text-align:left; padding-right:5px;" /> Central de Mensagens</span></div>
                <br /> 
                
          <span class="textoTitulo">  Bem vindo ao nosso Centro de Mensagens.<br />
                Atrav&eacute;s desse canal &eacute; que voc&ecirc; pode ter acesso as mensagens enviadas por algum processo, ado&ccedil;&atilde;o, doa&ccedil;&atilde;o ou notifica&ccedil;&otilde;es.
</span>

				<br />
				<br />
                <br />
				<br />
                
                <span class="obrigatorio">Para ler as mensagens, clique no envelope ou no assunto.</span>
                <br />
                <br /> 
                
                Ol&aacute; ${Colaborador.nome}, Voc&ecirc; tem <span class="obrigatorio">${qtd}</span> Mensagem(s) Nova(s)
                                     <br />                                   
                    					<table class="grid" style=" width:98%;">
                                        	<tr>
                                            	<td width="6%" align="center" class="grid_titulo">De</td>
                                                <td width="63%" align="center" class="grid_titulo">Assunto</td>
                                                <td width="15%" align="center" class="grid_titulo">Data</td>
                                                <td width="6%" align="center" class="grid_titulo">Ler</td>
                                                <td width="10%" align="center" class="grid_titulo">Excluir</td>
                                          </tr>
                                          <c:forEach items="${Msg}" var="Not">
                                              <tr class="td_escura">
                                            	<td align="center">
                                                    <c:if test="${Not.remetenteNotificacao == 'Sim'}">
                                                        <img src="/WebMAATeste/Painel_controle/Usuario/images/botao/ico_painel2.png" />
                                                    </c:if>
                                                     <c:if test="${Not.remetenteNotificacao == 'Nao'}">
                                                        <img src="/WebMAATeste/Painel_controle/Usuario/images/botao/ico_ong.png" />
                                                    </c:if>
                                                </td>
                                                <td align="center"><a href="#" name="popUp" onclick="MM_openBrWindow('Mensagem?operacao=lerMsg&codigoMsg=${Not.codigo}','','status=yes,scrollbars=yes,width=600,height=400')">${Not.assunto}</a></td>
                                                <td align="center">${Not.dataCadastroString}</td>
                                                <td align="center"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/ler_email.png" alt="Ler Email" title="Ler Email" class="seta_link" onclick="MM_openBrWindow('Mensagem?operacao=lerMsg&codigoMsg=${Not.codigo}','','status=yes,scrollbars=yes,width=600,height=400')" /></td>
                                                <td align="center"><a href="Mensagem?operacao=apagaMsg&codigoMsg=${Not.codigo}&colaborador=${Not.codigoColaborador}&dispara=centro"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/ico_delete.png" alt="Excluir" title="Excluir" class="seta_link" /></a></td>
                                             </tr>
                                          </c:forEach>                                          
                                        </table>
                                     <br />
                                        
                                         Legenda:
                                     
                               <table style=" width:98%;">
                                     	<tr>
                                        	<td width="5%" align="center"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/ico_painel2.png" /></td>
                                            <td width="34%">Msg Enviada pelo Sistema</td>
                                            <td width="5%" align="center"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/ico_ong.png" /></td>
                                            <td width="56%">Msg Enviada pela Ong</td>
                                        </tr>
                                        <tr>
                                        	<td width="5%" align="center"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/ler_email.png" /></td>
                                            <td width="34%">Mensagem</td>
                                            <td width="5%" align="center">&nbsp;</td>
                                            <td width="56%">&nbsp;</td>
                                        </tr>
                                     </table>
                                     
<br />
                                    <br />
                                    <br />
                                    <div align="center">
                                    	<img src="/WebMAATeste/Painel_controle/Usuario/images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link" onclick="history.back();" />
                                    </div>
                                       
		  </div>
            
			<div id="colunaRight">
            
            <c:if test="${Log.login == null}">
                <!-- LOGIN -->
            	<div class="login">
					<div class="bordaFaixaLeft"><span>Login</span></div>
                	<br />

                    <form action="/WebMAATeste/NavUsr" name="logar" method="post" class="link">

                    	<input type="hidden" name="operacao" value="login" />
                        <input type="hidden" name="dispara" value="listaAnimal?operacao=detalhar_gato&codigo=${DetalharAnimal.codigo}" />

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
                        <input type="image" src="/WebMAATeste/images/botao/check.png" onmouseover="troca('buscaBotao');" onmouseout="volta('buscaBotao');" id="buscaBotao" title="Buscar"  />
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
                                <td width="29%" align="right"><img src="/WebMAATeste/images/botao/ico_email.png" alt="Mensagem" title="Mensagem" /> &nbsp;</td>
                                <td width="71%"> Nenhuma Mesagem</td>
                            </tr>
                        </c:if>
                        <c:if test="${!empty Msg}">
                            <tr>
                                <td width="29%" align="right"><img src="/WebMAATeste/images/botao/ico_email.png" alt="Mensagem" title="Mensagem" class="seta_link" /> &nbsp;</td>
                                <td width="71%"><a href="Mensagem?operacao=abrirCentro&colaborador=${Colaborador.codigo}"><span class="obrigatorio">${qtd}</span> Mensagen(s) Nova(s)</a></td>
                            </tr>
                        </c:if>
                        <tr>

                        	<td align="right"><img src="/WebMAATeste/images/botao/ico_painel.png" alt="Painel" title="Ir para o Painel de Controle" class="seta_link" /> &nbsp;</td>
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