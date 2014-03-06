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

<script>
function focoBt(id){
    if(id ==="logoff"){
		$("#"+id).attr("src","/images/botao/bt_logoff_light.png");
	}
}

function bt(id){
		if(id ==="logoff"){
		$("#"+id).attr("src","/images/botao/bt_logoff.png");
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
			<div class="bordaFaixaLeft"><span>Den�ncias</span></div>
                <br />

          <!-- TELA 01 -->
          <div id="dadosInicio">
              <br />
                <hr />

                <br />
                <span style=" font-size:14px;" class="obrigatorio">Leia com Aten��o:</span>
                <br />

<div class="nota_informa" style=" width:95%;">
                	<span>e voc� conhece um bichinho que vive acorrentado, � espancado pelo dono, privado de alimento ou n�o recebe assist�ncia veterin�ria, saiba que tudo isso � crime e ele precisa da sua ajuda para ter uma vida mais digna</span>
                </div>

                <img src="/images/maus tratos.jpg" alt="Foto: Macaco sofrendo de maus-tratos" width="95" height="66" style="float:left; margin-right:5px;" />
               <p>Submeter um animal a maus-tratos � crime previsto no artigo 32 da Lei de Crimes Ambientais (Lei Federal n� 9.605) e pode acarretar em multa ou pena de tr�s meses a um ano de pris�o. Denunciar � simples e quem procura ajuda n�o fica exposto � repres�lias do agressor.
               </p>
               <br />

               <p>
               	De acordo com o artigo 3 do Decreto Federal 24.645/34 caracteriza-se por maus-tratos manter o animal trancado em lugares pequenos, anti-higi�nicos ou preso a correntes, golpear ou mutilar o animal, n�o prestar assist�ncia veterin�ria adequada ou us�-lo em shows que causem p�nico ou estresse. Envenenar e abandonar animais tamb�m s�o atos criminosos.
               </p>
               <br />
               <br />

               <span style="color:#000; font-size:12px;">O que fazer</span>

               <p>
               		O primeiro passo � reunir a maior quantidade de provas poss�vel. Fotografias, v�deos, laudo ou atestado veterin�rio, placa do carro de quem agride ou abandona e at� testemunhas. Tudo o que sirva para mostrar a situa��o do animal e ajude a identificar o agressor.
               </p>
               <br />

               <p>
               	Em seguida procure a delegacia mais pr�xima e fa�a um Boletim de Ocorr�ncia (BO). Por garantia, leve com voc� uma c�pia da Lei de Crimes Ambientais (dispon�vel no site http://www.planalto.gov.br/CCIVIL_03/leis/L9605.htm) ou tenha escrito o n�mero da lei e o que diz o artigo 32*.
               </p>
               <br />

               <p>
               	O policial que ouvir o seu relato dever� instaurar um inqu�rito ou lavrar um Termo Circunstanciado (TC). Caso ele se negue a faz�-lo estar� infringindo o C�digo Penal (artigo 319, crime de prevarica��o). Na d�vida, e porque � seu direito, pe�a para falar com o delegado.
               </p>
               <br />

               <p>
               	No Brasil os animais s�o "sujeitos de direitos", tutelados pelo Estado e representados em ju�zo pelo Minist�rio P�blico. Portanto, voc� n�o ser� autor do processo judicial que for aberto a partir da sua den�ncia. Depois de conclu�do o inqu�rito para apura��o do crime, ou elaborado o Termo Circunstanciado, o delegado o encaminhar� para abertura da a��o, na qual constar� o Estado como autor.
               </p>
               <br />

               <p>
               	Se ainda assim voc� estiver com receio de procurar uma delegacia e denunciar, busque orienta��es no f�rum mais pr�ximo da sua casa ou pe�a ajuda da associa��o de bairro da sua regi�o. Representantes da popula��o, as associa��es de bairro t�m poder de exigir atitudes das autoridades em favor da comunidade e voc� pode pedir que um dirigente ou algu�m designado te acompanhe at� a delegacia ou ao f�rum.
               </p>
              	<br />

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
                        <input type="hidden" name="dispara" value="denuncia.jsp" />

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