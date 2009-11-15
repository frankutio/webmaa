<%@page contentType="text/html" pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ong Amigos Fieis</title>

<link type="text/css" rel="stylesheet" href="/WebMAATeste/Painel_controle/Usuario/css/geral.css" />
<link type="text/css" rel="stylesheet" href="/WebMAATeste/Painel_controle/Usuario/css/estilos.css" />
<link type="text/css" rel="stylesheet" href="/WebMAATeste/Painel_controle/Usuario/css/menu_drop.css" />

<script type="text/javascript" src="/WebMAATeste/Painel_controle/Usuario/js/jquery.min.js"></script>

<script type="text/javascript" src="/WebMAATeste/Painel_controle/Usuario/js/jquery.js"></script>
<script type="text/javascript" src="/WebMAATeste/Painel_controle/Usuario/js/utilidades.js"></script>
<script type="text/javascript" src="/WebMAATeste/Painel_controle/Usuario/js/maskedinput.js"></script>
<script type="text/javascript" src="/WebMAATeste/Painel_controle/Usuario/js/menuSuper.js"></script>

<script type="text/javascript" src="/WebMAATeste/Painel_controle/Usuario/js/modal.js"></script>
<link type="text/css" rel="stylesheet" href="/WebMAATeste/Painel_controle/Usuario/css/estilo_modal.css" />


<script>

$(function() {
	$(".logoff").mouseover(function() {
		$(this).attr("src", "/WebMAATeste/Painel_controle/Usuario/images/botao/bt_logoff_light.png");
	});

	$(".logoff").mouseout(function() {
		$(this).attr("src", "/WebMAATeste/Painel_controle/Usuario/images/botao/bt_logoff.png");
	});

	$(".aprovar").mouseover(function() {
		$(this).attr("src", "/WebMAATeste/Painel_controle/Usuario/images/botao/bt_aprovar_light.png");
	});

	$(".aprovar").mouseout(function() {
		$(this).attr("src", "/WebMAATeste/Painel_controle/Usuario/images/botao/bt_aprovar.png");
	});

	$(".ok").mouseover(function() {
		$(this).attr("src", "/WebMAATeste/Painel_controle/Usuario/images/botao/bt_ok_light.png");
	});

	$(".ok").mouseout(function() {
		$(this).attr("src", "/WebMAATeste/Painel_controle/Usuario/images/botao/bt_ok.png");
	});

	$(".cancelar").mouseover(function() {
		$(this).attr("src", "/WebMAATeste/Painel_controle/Usuario/images/botao/bt_cancelar_light.png");
	});

	$(".cancelar").mouseout(function() {
		$(this).attr("src", "/WebMAATeste/Painel_controle/Usuario/images/botao/bt_cancelar.png");
	});

	$(".reprovar").mouseover(function() {
		$(this).attr("src", "/WebMAATeste/Painel_controle/Usuario/images/botao/bt_reprovar_light.png");
	});

	$(".reprovar").mouseout(function() {
		$(this).attr("src", "/WebMAATeste/Painel_controle/Usuario/images/botao/bt_reprovar.png");
	});

});



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
                <img src="/WebMAATeste/images/botao/bt_logoff.png" alt="Sair" title="Sair" class="seta_link logoff" onclick="window.location='logoff?operacao=sair';" />
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
    		<li><a href="#" onfocus="limpaMenu();"><span>Not&iacute;cias</span></a></li>
            <li><a href="#" onfocus="limpaMenu();"><span>Den&uacute;ncias</span></a></li>
            <li id="adotar" class="" onmouseover="setaClass('adotar');" onmouseout="retiraClass('adotar');"><a href="#" onfocus="ativa('adotar','drop');"><span>Adotar</span></a>
    			<ul class="drop">
        			<li id="gato" class=""><a href="/WebMAATeste/listaAnimal?operacao=lista_gato" onfocus="ativaLight('gato');">Gato</a></li>
    				<li id="cao" class=""><a href="/WebMAATeste/listaAnimal?operacao=lista_cao" onfocus="ativaLight('cao');">Cachorro</a></li>
        		</ul>
    		</li>
    		<li><a href="#" onfocus="limpaMenu();"><span>Direito Animal</span></a></li>
    		<li><a href="/WebMAATeste/cadastro.jsp" onfocus="limpaMenu();"><span>Cadastre-se</span></a></li>
            <li><a href="/WebMAATeste/GerAnimal?operacao=iniciar_cad" onfocus="limpaMenu();"><span>Doar</span></a></li>
            <li><a href="/WebMAATeste/final_feliz/index.jsp" onfocus="limpaMenu();"><span>Final Feliz</span></a></li>
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
			<div class="bordaFaixaPainel_left"><span><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/ico_painel.png" alt="Painel" title="" style=" float:left; text-align:left; padding-right:5px;" /> Acompanhar Ado&ccedil;&atilde;o - &nbsp;&nbsp; Painel de Controle</span></div>
                <br />

                <div class="nota_informa">
                    	<span>Bem Vindo a  p&aacute;gina de acompanhamento de ado&ccedil;&atilde;o.</span><br />
          </div>
            <!-- FOTO DO USUARIO -->
            <div id="foto">
           	  <img src="/WebMAATeste/${Animal.especie}/images/miniaturas/${Animal.endFoto}" />
            </div>
            <!-- FOTO -->

            <!-- DADOS DO USUARIO -->
            <div id="dadosUsuario">

            <!-- fase 01 -->

            <div id="fase01" class="usrInput">

            <table width="80%">
				<tr>
				  <td width="28%"><h2 class="fase">Fase 1/3</h2></td>
					<td width="72%">
                        <c:if test="${Processo.faseProcesso != 1}">
                            <span id="fase1_completa"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/aprova.png" /> &nbsp;Concluida!</span>
                        </c:if>
                   </td>

				</tr>
			</table>

            <br />
            <table class="grid" style="width:95%;">
                    	<tr>
                            <td width="15%" align="center" class="grid_titulo">Cod</td>
                            <td width="27%" align="center" class="grid_titulo">Nome</td>
                            <td width="15%" align="center" class="grid_titulo">Raça</td>
                            <td width="14%" align="center" class="grid_titulo">Tipo</td>
                            <td width="11%" align="center" class="grid_titulo">Sexo</td>
                            <td width="11%" align="center" class="grid_titulo">Status</td>
                        </tr>
                        <tr class="td_escura">
                          <td align="center">${Animal.codigo}</td>
                            <td align="center">${Animal.nome}</td>
                            <td align="center">
                                <c:forEach items="${lstRaca}" var="raca">
                                    <c:if test="${raca.codigo == Animal.codigoRaca}">
                                        ${raca.descricao}
                                    </c:if>
                                </c:forEach>
                            </td>
                            <td align="center">${Animal.especie}</td>
                            <td align="center">${Animal.sexo}</td>
                            <td align="center">
                                <c:if test="${Processo.faseProcesso == 1}">
                                    <font style="color:#F00;">Pendente</font>
                                </c:if>
                                <c:if test="${Processo.faseProcesso != 1}">
                                    <font style="color: #009900;">Aprovado</font>
                                </c:if>
                            </td>
                        </tr>
                    </table>
                    <c:if test="${Processo.faseProcesso == 1}">
                        <div align="right" style="width:95%;">
                            <img src="/WebMAATeste/Painel_controle/Usuario/images/botao/bt_desistir.png" class="seta_link cancelar" />
                        </div>
                    </c:if>

                    <br />
                    <c:if test="${Processo.faseProcesso == 1}">
                        <div class="nota_informa" style="width:90%;">
                            <span>Animal aguardando aprovação por parte do proprietario. Você ainda pode desistir da adoção clicando no botao acima.</span>
                        </div>
                    </c:if>


                    </div>
                    <!-- fase 01 -->

                    <!-- FASE 02 -->
                    <c:if test="${(Processo.faseProcesso == 2)||(Processo.faseProcesso == 3)}">
                    <div id="fase02">
                    	<table width="80%">
							<tr>
				  				<td width="28%"><h2 class="fase">Fase 2/3</h2></td>
								<td width="72%">
                                    <c:if test="${Processos.faseProcesso == 4}">
                                        <span id="fase2_completa"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/aprova.png" /> &nbsp;Concluida!</span>
                                    </c:if>
                               </td>
							</tr>
						</table>

                        <br />

                        Adoção não é brincadeira, é coisa a ser levado a serio. <br />
						<br />


						Caso decida continuar com a adoção deve ficar ciente que apos a sua confirmação não poderá mais desistir da mesma, o sistema lhe informará os dados para contato com o dono do animal para que assim você possa contacta-lo para finalizar a adoção.
						<br />
						<br />

						Leia abaixo as responsabilidades que você deve ter a adotar um animal.
						<br />
						<br />
						<span style="overflow:auto; width:90%; height:100px; display:block; border-top:#CCC solid 1px; border-bottom:#CCC solid 1px; border-left:#CCC solid 1px; color:#000000;">
                            Etiam eget felis vitae ligula scelerisque pretium. Nam facilisis felis sed enim interdum ac varius magna tristique. Cum sociis natoque penatibus et magnis dis parturient montes,
                            nascetur ridiculus mus. Praesent vehicula rhoncus justo at ornare. Duis ac est sit amet diam hendrerit gravida ac ac tortor. Mauris sit amet mi arcu. Duis semper aliquam eros,
                            molestie malesuada sapien vestibulum et. Etiam magna lectus, sodales et lobortis eu, dignissim non nunc. Sed in velit metus, vitae tempor quam. Curabitur placerat pulvinar dapibus.
                            Nulla feugiat nunc sed mi porttitor porttitor sollicitudin massa posuere. Vestibulum pharetra risus vitae mauris hendrerit accumsan. Nullam vehicula, libero ut adipiscing tincidunt,
                            purus ipsum egestas nisl, et tincidunt turpis ipsum ut elit. Vivamus auctor nulla lorem.
                        </span>
                        <br />

                        <c:if test="${Processo.faseProcesso == 2}">
                                O que Pretendes Fazer?
                                     <div align="right" style="width:95%;">
                                         <a href="/WebMAATeste/gerProcesso?operacao=confirma_processo_adocao&codigo=${Processo.codigo}&fase=3&codAnimal=${Animal.codigo}"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/bt_continuar.png" alt="Continuar" title="Continuar" class="seta_link continua" /></a>&nbsp;&nbsp;
                                         <img src="/WebMAATeste/Painel_controle/Usuario/images/botao/bt_desistir_desabilitado.png" alt="cancelar adoção" title="Cancelar Adoção" class="seta_link desistir" />
                                     </div>
                         </c:if>
                       <br />

                       <c:if test="${Processo.faseProcesso == 3}">
                            <div id="comunicacao">
                                Dados para Negociação<br />
                                <table class="grid" style="width:100%;">
                                    <tr>
                                        <td class="grid_titulo" align="center">Cod</td>
                                        <td class="grid_titulo" align="center">Nome</td>
                                        <td class="grid_titulo" align="center">Endereço</td>
                                        <td class="grid_titulo" align="center">CEP</td>
                                        <td class="grid_titulo" align="center">UF</td>
                                        <td class="grid_titulo" align="center">Email</td>
                                        <td class="grid_titulo" align="center">Fone</td>
                                    </tr>
                                    <tr class="td_escura">
                                        <td align="center">${Dono.codigo}</td>
                                        <td align="center">${Dono.nome}</td>
                                        <td align="center">${Dono.endereco}</td>
                                        <td align="center">${Dono.cep}</td>
                                        <td align="center">
                                            <c:forEach items="${lstUF}" var="uf">
                                                <c:if test="${uf.codigo == Dono.uf}">
                                                    ${uf.UF}
                                                </c:if>
                                            </c:forEach>
                                        </td>
                                        <td align="center">${Dono.email}</td>
                                        <td align="center">${Dono.telefone}</td>
                                    </tr>
                                </table>
                                <br />
                                <table class="grid">
                                    <tr class="td_escura">
                                        <td><strong>Animal com certificado Veterianário?</strong></td>
                                    </tr>
                                    <tr>
                                        <td>${Animal.laudoVeterinario}</td>
                                    </tr>
                                    <tr class="td_escura">
                                        <td><strong>Animal Vacinado? </strong></td>
                                    </tr>
                                    <tr>
                                        <td>${Animal.vacinado}</td>
                                    </tr>
                                    <tr class="td_escura">
                                        <td><strong>Forma de Envio:</strong></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <c:forEach items="${FormaEnvio}" var="formaEnvio">
                                                <c:if test="${formaEnvio.codigo == Animal.codigoFormaEnvio}">
                                                    ${formaEnvio.envio}
                                                </c:if>
                                            </c:forEach>
                                        </td>
                                    </tr>
                                </table>
                                <div class="nota_informa">
                                    <span>Entre em contato com o Proprietario e negocie a adoção. Após  a entrega do animal será necessario que você o avalie na Fase 03.<br />
                                    Qualquer problema durante a negociação entre com contato com a nossa Ong informando o codigo do usuario.</span>
                                </div>

                                </div>
                    </c:if>
</div>
                    </c:if>
                    <!-- FASE 02 -->

                    
          </div>
            <!-- DADOS DO USUARIO -->

            <div class="clear"></div>



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
                        	<td width="29%" align="right"><a href="/WebMAATeste/Painel_controle/Usuario/cad_edit.html"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/editar.png" alt="Alterar Cadastro" title="Alterar Cadastro" class="seta_link" /></a> &nbsp;</td>
                            <td width="71%"><a href="/WebMAATeste/NavUsr?operacao=alterar_cad">Alterar Cadastro</a></td>
                        </tr>
                        <tr>
                        	<td align="right"><a href="index.html"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/ico_painel.png" alt="painel de Controle" title="Painel de Controle" class="seta_link" /></a> &nbsp;</td>
                            <td><a href="/WebMAATeste/PainelControle?operacao=exibirPainel&colaborador=${Colaborador.codigo}">Painel de Controle</a></td>
                        </tr>
                    </table>

              </div>
             <!-- LOGIN -->


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