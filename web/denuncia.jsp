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
    		<li><a href="/noticias.jsp" onfocus="limpaMenu();"><span>Notícias</span></a></li>
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
			<div class="bordaFaixaLeft"><span>Denúncias</span></div>
                <br />

          <!-- TELA 01 -->
          <div id="dadosInicio">
              <br />
                <hr />

                <br />
                <span style=" font-size:14px;" class="obrigatorio">Leia com Atenção:</span>
                <br />

<div class="nota_informa" style=" width:95%;">
                	<span>e você conhece um bichinho que vive acorrentado, é espancado pelo dono, privado de alimento ou não recebe assistência veterinária, saiba que tudo isso é crime e ele precisa da sua ajuda para ter uma vida mais digna</span>
                </div>

                <img src="/images/maus tratos.jpg" alt="Foto: Macaco sofrendo de maus-tratos" width="95" height="66" style="float:left; margin-right:5px;" />
               <p>Submeter um animal a maus-tratos é crime previsto no artigo 32 da Lei de Crimes Ambientais (Lei Federal nº 9.605) e pode acarretar em multa ou pena de três meses a um ano de prisão. Denunciar é simples e quem procura ajuda não fica exposto à represálias do agressor.
               </p>
               <br />

               <p>
               	De acordo com o artigo 3 do Decreto Federal 24.645/34 caracteriza-se por maus-tratos manter o animal trancado em lugares pequenos, anti-higiênicos ou preso a correntes, golpear ou mutilar o animal, não prestar assistência veterinária adequada ou usá-lo em shows que causem pânico ou estresse. Envenenar e abandonar animais também são atos criminosos.
               </p>
               <br />
               <br />

               <span style="color:#000; font-size:12px;">O que fazer</span>

               <p>
               		O primeiro passo é reunir a maior quantidade de provas possível. Fotografias, vídeos, laudo ou atestado veterinário, placa do carro de quem agride ou abandona e até testemunhas. Tudo o que sirva para mostrar a situação do animal e ajude a identificar o agressor.
               </p>
               <br />

               <p>
               	Em seguida procure a delegacia mais próxima e faça um Boletim de Ocorrência (BO). Por garantia, leve com você uma cópia da Lei de Crimes Ambientais (disponível no site http://www.planalto.gov.br/CCIVIL_03/leis/L9605.htm) ou tenha escrito o número da lei e o que diz o artigo 32*.
               </p>
               <br />

               <p>
               	O policial que ouvir o seu relato deverá instaurar um inquérito ou lavrar um Termo Circunstanciado (TC). Caso ele se negue a fazê-lo estará infringindo o Código Penal (artigo 319, crime de prevaricação). Na dúvida, e porque é seu direito, peça para falar com o delegado.
               </p>
               <br />

               <p>
               	No Brasil os animais são "sujeitos de direitos", tutelados pelo Estado e representados em juízo pelo Ministério Público. Portanto, você não será autor do processo judicial que for aberto a partir da sua denúncia. Depois de concluído o inquérito para apuração do crime, ou elaborado o Termo Circunstanciado, o delegado o encaminhará para abertura da ação, na qual constará o Estado como autor.
               </p>
               <br />

               <p>
               	Se ainda assim você estiver com receio de procurar uma delegacia e denunciar, busque orientações no fórum mais próximo da sua casa ou peça ajuda da associação de bairro da sua região. Representantes da população, as associações de bairro têm poder de exigir atitudes das autoridades em favor da comunidade e você pode pedir que um dirigente ou alguém designado te acompanhe até a delegacia ou ao fórum.
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

<!-- Rodapé -->

<div id="rodape">
	sdjlarpq
</div>

</body>

</html>