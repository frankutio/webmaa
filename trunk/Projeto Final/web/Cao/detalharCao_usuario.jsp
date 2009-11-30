<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ong Amigos Fieis</title>

<link type="text/css" rel="stylesheet" href="/WebMAA/css/geral.css" />
<link type="text/css" rel="stylesheet" href="/WebMAA/css/estilos.css" />
<link type="text/css" rel="stylesheet" href="/WebMAA/css/menu_drop.css" />

<script type="text/javascript" src="/WebMAA/js/jquery.js"></script>
<script type="text/javascript" src="/WebMAA/js/utilidades.js"></script>
<script type="text/javascript" src="/WebMAA/js/maskedinput.js"></script>
<script type="text/javascript" src="/WebMAA/js/menuSuper.js"></script>

<script type="text/javascript">
<!--
function focoBt(id){

	if(id ==="adota"){
		$("#"+id).attr("src","/WebMAA/images/botao/bt_adotar_light.png");
	}
	else if(id ==="logoff"){
		$("#"+id).attr("src","/WebMAA/images/botao/bt_logoff_light.png");
	}
	else if(id ==="continuar"){
		$("#"+id).attr("src","/WebMAA/images/botao/bt_continuar_light.png");
	}
}

function bt(id){
	if(id ==="adota"){
		$("#"+id).attr("src","/WebMAA/images/botao/bt_adotar.png");
	}
	else if(id ==="logoff"){
		$("#"+id).attr("src","/WebMAA/images/botao/bt_logoff.png");
	}
	else if(id ==="continuar"){
		$("#"+id).attr("src","/WebMAA/images/botao/bt_continuar.png");
	}
}
-->
</script>

</head>

<body>

<!-- Corpo da pagina -->
<div id="corpo">
<!-- div com o topo do site -->

<div id="faixaTopo">
		<div class="imgBannerLeft"><img src="/WebMAA/images/topo1.png" alt="logo" title="Logo" class="seta_link" /></div>
        <div class="imgBannerRight" style="background:url(/WebMAA/images/topo_cao4.png) no-repeat right bottom;"></div>
</div>

<!-- div com o banner -->

<div id="faixaBanner">
	<div class="imgBannerInfLeft"><img src="/WebMAA/images/topo2.png" alt="Logo" title="Logo" class="seta_link" /></div>
    <div class="imgBannerInfRight" style="background:url(/WebMAA/images/topo_cao3.png) no-repeat right;"></div>
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
			<div class="bordaFaixaLeft"><span>Detalhes do Animal</span></div>
                <br />

          <!-- TELA 01 -->
          <div id="dadosInicio">
              <!-- DETALHES DO ANIMAL -->
              <table class="grid">
                	<tr>
                    	<td width="8%"><img src="/WebMAA/Cao/images/miniaturas/ico_cao.png" alt="cao" title="cao" /></td>
                        <td width="92%" colspan="2"><font style=" font-size:20px; color:#000;">${DetalharAnimal.nome}</font></td>
                    </tr>
            </table>
                <div class="descricao">

                  <img src="/WebMAA/${DetalharAnimal.especie}/images/miniaturas/${DetalharAnimal.endFoto}" alt="${DetalharAnimal.nome}" title="${DetalharAnimal.nome}" style="width:218px; height:207px;" />
                  <table class="grid descricaoFoto">
              <tr>
                    	<td width="47%" align="right">N. de Identifica&ccedil;&atilde;o: &nbsp;</td>
                        <td width="53%"><span style="color:#000;">${DetalharAnimal.codigo}</span></td>
                    </tr>
                    <tr>
                    	<td width="47%" align="right">Ra&ccedil;a: &nbsp;</td>
                        <td width="53%"><span style="color:#000;">
                            <c:forEach items="${lstRaca}" var="lstRaca">
                                <c:if test="${DetalharAnimal.codigoRaca == lstRaca.codigo}">
                                    ${lstRaca.descricao}
                                </c:if>
                            </c:forEach>
                        </span></td>
                    </tr>
                    <tr>
                    	<td width="47%" align="right">Idade Aproximada: &nbsp;</td>
                        <td width="53%"><span style="color:#000;">${DetalharAnimal.idade}</span></td>
                    </tr>
                    <tr>
                    	<td width="47%" align="right">Cor Predominante: &nbsp;</td>
                        <td width="53%"><span style="color:#000;">
                            <c:forEach items="${lstCor}" var="lstCor">
                                <c:if test="${DetalharAnimal.cor1 == lstCor.codigo}">
                                    ${lstCor.cor}
                                </c:if>
                            </c:forEach>
                        </span></td>
                    </tr>
                    <tr>
                    	<td width="47%" align="right">2ª Cor: &nbsp;</td>
                        <td width="53%"><span style="color:#000;">
                             <c:forEach items="${lstCor}" var="lstCor">
                                <c:if test="${DetalharAnimal.cor2 == lstCor.codigo}">
                                    ${lstCor.cor}
                                </c:if>
                            </c:forEach>
                        </span></td>
                    </tr>
                    <tr>
                    	<td width="47%" align="right">Pelagem: &nbsp;</td>
                        <td width="53%"><span style="color:#000;">
                            <c:forEach items="${lstPelagem}" var="lstPelagem">
                                <c:if test="${DetalharAnimal.codigoPelagem == lstPelagem.codigo}">
                                    ${lstPelagem.pelagem}
                                </c:if>
                            </c:forEach>
                        </span></td>
                    </tr>
                    <tr>
                    	<td width="47%" align="right" valign="top">Sexo: &nbsp;</td>
                        <td width="53%" valign="top"><span style="color:#000;">${DetalharAnimal.sexo}</span></td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <c:if test="${DetalharAnimal.vlrTaxa != 0.0}">
                        <tr>
                            <td width="41%" align="right" valign="top">Valor da Taxa: &nbsp;</td>
                            <td width="59%" valign="top"><span style="color:#000;">R$ ${DetalharAnimal.vlrTaxa}</span></td>
                        </tr>
                    </c:if>
                    <tr>
                    	<td width="41%" align="right" valign="top">Forma de Envio: &nbsp;</td>
                        <td width="59%" valign="top"><span style="color:#000;">
                            <c:forEach items="${lstEnvio}" var="lstEnvio">
                                      <c:if  test="${DetalharAnimal.codigoFormaEnvio == lstEnvio.codigo}">
                                          ${lstEnvio.envio}
                                      </c:if>
                            </c:forEach>
                        </span></td>
                    </tr>
                </table>
                <br />
                <br />

      </div>
      <div align="center">
                    <a href="GerAnimal?operacao=abreConfirmaAdocao&codigo=${DetalharAnimal.codigo}"><img src="/WebMAA/images/botao/bt_adotar.png" alt="Adotar" title="Adotar este Animal" class="seta_link" id="adota" onmouseover="focoBt('adota');" onmouseout="bt('adota');" /></a>
                </div>

               <!-- FIM DOS DETALHES -->

                <div class="clear"></div>

                <!-- COMENTARIO DO USUARIO -->

                <div id="comentario">
                <br />
              <span class="obrigatorio">Descri&ccedil;&atilde;o/Coment&aacute;rio do Propriet&aacute;rio:</span><br /><br />
                	${DetalharAnimal.descricao}
                </div>
                <br />

               <div style="width:90%;" align="right">
               		<img src="/WebMAA/images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link" onclick="window.location='/WebMAA/listaAnimal?operacao=lista_cao';" />
               </div>
                <!-- FIM DO COMENTARIO -->
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
                        <input type="hidden" name="dispara" value="listaAnimal?operacao=detalhar_cao&codigo=${DetalharAnimal.codigo}" />

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

<!-- RodapÃ© -->

<div id="rodape">
	sdjlarpq
</div>

</body>

</html>