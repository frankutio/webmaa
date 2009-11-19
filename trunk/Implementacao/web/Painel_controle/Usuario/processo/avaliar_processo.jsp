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

 $(function(){

        $(".avaliar").click(function(e){
            valor = $(this).attr("value");

            $("#avaliacao").attr("value",valor);

            document.faseForm.submit();
        })
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
			<div class="bordaFaixaPainel_left"><span><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/ico_painel.png" alt="Painel" title="" style=" float:left; text-align:left; padding-right:5px;" /> Avaliar Ado&ccedil;&atilde;o - &nbsp;&nbsp; Painel de Controle</span></div>
                <br />

                <div class="nota_informa">
                    	<span>Avalie este processo logo abaixo na Fase 03.</span><br />
          </div>
          <span class="obrigatorio">(*) Campos de Preenchimento Obrigatório</span>
          <br />

          <br />

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

                    <br />

                    </div>
                    <!-- fase 01 -->

                    <!-- FASE 02 -->

                    <div id="fase02">
                      
                      
                    	<table width="80%">
							<tr>
				  				<td width="28%"><h2 class="fase">Fase 2/3</h2></td>
								<td width="72%">

                                        <span id="fase2_completa"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/aprova.png" /> &nbsp;Concluida!</span>

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
                       <br />
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

                                </div>
</div>

                    <!-- FASE 02 -->

                     <!-- Fase 03 -->
                     <br />
                      <br />
                       <div id="fase03">
                    	<table width="80%">
							<tr>
				  				<td width="28%"><h2 class="fase">Fase 3/3</h2></td>
							</tr>
						</table>

                        <div class="nota_informa">
                               		<span>Avalie o Recebimento do Animal e seu proprietario.</span>
                        </div>

                        <form name="faseForm" method="post" action="/WebMAATeste/gerProcesso" onsubmit="return false">

                            <input type="hidden" name="operacao" value="avaliar" />
                            <input type="hidden" name="codigo" value="${Processo.codigo}" />
                            <input type="hidden" name="codigoUsuario" value="${Colaborador.codigo}" />
                            <input type="hidden" name="nome" value="${Colaborador.nome}" />
                            <input type="hidden" name="avaliacao" value="" id="avaliacao" />



                            <table class="grid">
                               		<tr>
                                    	<td colspan="2"><span class="obrigatorio">Essa avaliação é muito importante para que nos posssamos saber se o processo foi como você esperava.</span></td>
                                    </tr>
                                    <tr>
                                    	<td colspan="2">&nbsp;</td>
                                    </tr>
                                    <tr>
                                    	<td width="38%" align="right"><span class="obrigatorio">*</span> Você Recebeu o seu animal? &nbsp;</td>
                                        <td width="62%" align="left">
                                        	<select name="recebe_animal" id="entrega" onchange="valida_avaliacao();">
                                            	<option value="0" selected="selected">:: Selecione ::</option>
                                                <option value="Sim">Sim</option>
                                                <option value="Nao">Não</option>
                                            </select>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                    	<td colspan="2">&nbsp;</td>
                                    </tr>
                                    <tr>
                                    	<td colspan="2">Conte para agante como foi a sua experiencia com o Ex-proprietario:</td>
                                    </tr>
                                    <tr>
                                    	<td colspan="2"><textarea rows="5" cols="60" name="descricaoavaliacao"></textarea></td>
                                    </tr>
                               </table>


                                <br />
                               <table class="grid">
                               		<tr>
                                    	<td width="8%"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/alert.png" alt="Atenção" /></td>
                                        <td width="92%"><span class="obrigatorio">Faça a avaliação do Usuario</span></td>
                                    </tr>
                               </table>

                               <br />

                               <div id="avaliacao">
                               		<p> Escolha o tipo de Avaliação</p>
                                    <br />
                               <div align="center" style="width:90%;">
                					<input type="image" src="/WebMAATeste/Painel_controle/Usuario/images/botao/bt_positiva.png" alt="Positiva" title="Positiva" disabled="disabled" value="positiva" class="avaliar" /> &nbsp;&nbsp;
                                    <input type="image" src="/WebMAATeste/Painel_controle/Usuario/images/botao/bt_negativa.png" alt="Negativa" title="Negativa" disabled="disabled" value="negativa" class="avaliar" />
                				</div>
                                </div>

                               </form>

                       </div>

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