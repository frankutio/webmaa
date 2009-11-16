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


<script>
function exibeModal1(e) {
    e.preventDefault();

    var id = "#divModal";

    var maskHeight = $(document).height();
    var maskWidth = $(document).width();

    $('#mask').css({'width':maskWidth,'height':maskHeight});

    $('#mask').fadeIn(1000);
    $('#mask').fadeTo("slow",0.8);

    //Get the window height and width
    var winH = $(window).height();
    var winW = $(window).width();

    $(id).css('top',  '285px');
    $(id).css('left', winW/2-$(id).width()/2);

    $(id).fadeIn(2000);

}

$(function() {
    $(".linkDetalhar").click(function(e) {
        $.get('/WebMAATeste/gerProcesso', {
            operacao: "recupera_modal",
            codigoProcesso: $(this).attr("id")}, function(resposta) {
                $("#dinamico").html(resposta);
            }, "html");
        exibeModal1(e);
    });

    $('.window .close').click(function (e) {
		e.preventDefault();
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
                        <c:if test="${Processos.faseProcesso != 1}">
                            <span id="fase1_completa"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/aprova.png" /> &nbsp;Concluida!</span>
                        </c:if>
                   </td>

				</tr>
			</table>
            
            <br />       
            <div class="nota_destaque">Dados do Enteressado</div>
            <br />
            
            <p>
            	${Colaborador.nome}, abaixo segue os dados do enteressado na ado&ccedil;&atilde;o.<br />
                <br />
                <br />
                Analise bem o pedido e caso seja de sua vontade, aprove ou regeite este peocesso.

                <br />
                <br />
                <span class="obrigatorio">
                    Caso voc&ecirc; recuse este processo, o usuario receber&aacute; uma notifica&ccedil;&atilde;o informando a sua decis&atilde;o.<br />
                Voc&ecirc; tamb&eacute;m poder&aacute; mandar uma Mensagem personalizada caso assim desseje.</span>
                <br>
                    
            </p>    
            <br />
   	    <table class="grid" style="width:100%;">
                    	<tr>
                            <td width="8%" align="center" class="grid_titulo">Cod</td>
                            <td width="38%" align="center" class="grid_titulo">Nome</td>
                            <td width="13%" align="center" class="grid_titulo">Sexo</td>
                            <td width="17%" align="center" class="grid_titulo">Mensagem</td>
                            <td width="14%" align="center" class="grid_titulo">Detalhar</td>
                        </tr>                        
                            <tr>
                              <td align="center">${ColabProcesso.codigo}</td>
                                <td align="center">${ColabProcesso.nome}</td>
                                <td align="center">
                                    <c:if test="${ColabProcesso.sexo == 'M'}">
                                        Masculino
                                    </c:if>
                                    <c:if test="${ColabProcesso.sexo == 'F'}">
                                        Feminino
                                    </c:if>
                                </td>
                                <td align="center">
                                    <c:if test="${empty Processos.mensagem}">
                                        0
                                    </c:if>
                                    <c:if test="${!empty Processos.mensagem}">
                                        <span class="obrigatorio">1</span>
                                    </c:if>
                                </td>
                                <td align="center"><a href="#divModal" class="linkDetalhar" id="${Processos.codigo}" ><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/zoom.png" alt="Detalhar" title="Detalhar" class="seta_link" /></a></td>
                            </tr>
                    </table>

                    <c:if test="${Processos.faseProcesso == 1}">
                    <div align="center" style="width:95%;">
                    	<a href="/WebMAATeste/gerProcesso?operacao=confirma_processo&codigo=${Processos.codigo}&fase=2&codAnimal=${Animal.codigo}&codigoColab=${ColabProcesso.codigo}"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/bt_aprovar.png" class="seta_link aprovar" alt="Aprovar" title="Aprovar" /></a> &nbsp;&nbsp;
                        <a href="#confirm_Reprovacao" name="modal"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/bt_reprovar.png" alt="Reprovar" title="Reprovar" class="seta_link reprovar" /></a>
                    </div>
                    </c:if>

                    <br />
                    
                    
                    </div>
                    <!-- fase 01 -->
                    
                    <!-- FASE 02 -->
                    <c:if test="${(Processos.faseProcesso == 2)||(Processos.faseProcesso == 3)}">
                    <div id="fase02">
                    	<table width="80%">
							<tr>
				  				<td width="28%"><h2 class="fase">Fase 2/3</h2></td>
								<td width="72%">
                                    <c:if test="${Processos.faseProcesso == 4}">
                                        <span id="fase2_completa" class="escondeFase"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/aprova.png" /> &nbsp;Concluida!</span>
                                    </c:if>
                               </td>
							</tr>
						</table>
                        
                        <br />
                        
                        Informamos ao usuario ${ColabProcesso.nome} a sua aprova&ccedil;&atilde;o em rela&ccedil;&atilde;o a essa ado&ccedil;&atilde;o.<br />
                        Assim que o usuario der continuidade ao processo, voc&ecirc; ser&aacute; notificado e poder&aacute; finalizar a sua ado&ccedil;&atilde;o.
                        <br />
                        <br />
                        <br />

                        <c:if test="${Processos.faseProcesso == 2}">
                            <div class="nota_informa" style="width:98%;">
                                <span>Aguarde at&eacute; que o usuario de uma resposta. </span>
                            </div>
                        </c:if>
                        
                        <div class="nota_destaque" style="width:98%;">Dados do Usuario</div>
                        <br />
                        
                        
                        <table class="grid" style="width:98%;">
						<tr>
							<td class="grid_titulo" align="center">Cod</td>
							<td class="grid_titulo" align="center">Nome</td>
							<td class="grid_titulo" align="center">Endere&ccedil;o</td>
							<td class="grid_titulo" align="center">CEP</td>
							<td class="grid_titulo" align="center">UF</td>
							<td class="grid_titulo" align="center">Email</td>
							<td class="grid_titulo" align="center">Fone</td>
						</tr>
						<tr class="td_escura">
							<td align="center">${ColabProcesso.codigo}</td>
							<td align="center">${ColabProcesso.nome}</td>
							<td align="center">${ColabProcesso.endereco}</td>
							<td align="center">${ColabProcesso.cep}</td>
							<td align="center">
                                <c:forEach items="${lstUF}" var="uf">
                                      <c:if test="${uf.codigo == ColabProcesso.uf}">
                                           ${uf.UF}
                                      </c:if>
                                </c:forEach>
                            </td>
							<td align="center">${ColabProcesso.email}</td>
							<td align="center">${ColabProcesso.telefone}</td>
						</tr>
					</table>
                    
                    <c:if test="${Processos.faseProcesso == 2}">
                        <div align="right" style="width:95%;">
                            <a href="#confirm_Reprovacao" name="modal"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/bt_cancelar_vermelho.png" class="seta_link cancelar" alt="Cancelar" title="Cancelar esta Adoção" /></a>
                        </div>
                    </c:if>
                    <br />

                    <c:if test="${Processos.faseProcesso == 3}">
                    <div id="aprovado">
                    
                    	<span style="color:#060; font-size:14px;"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/aprova.png" /> &nbsp; Parabéns ${Colaborador.nome}, O processo de adoção foi aceito pelo usuario.</span>
                        <br />
                        <br />
                        
                        Agora podemos dar continuidade...
                        <br />
                        
                        <div class="nota_informa" style="width:98%;">
                        	<span class="obrigatorio">Atenção: Entre em contato com o interessado atravez de um dos dados fornecidos acima e negocie a entrega do seu animal.</span>
                        </div>
                        
                        Após a entrega do animal você deve retornar a esta pagina e finalizar este procedimento.
                        <br />
                        <br />

                        <form method="post" action="">
                            <input type="hidden" name="oprecao" value="finalizarProcesso" />
                            <input type="hidden" name="codigoProcesso" value="${Processos.codigo}" />

                        <table class="grid">
                        	<tr>
                            	<td width="72%"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/alert.png" /> &nbsp; Afirmo que ja entreguei o animal ao Enteressado:</td>
                                <td width="28%" valign="bottom"><input type="checkbox" onclick="finaliarCheck();" name="confirmacao" /></td>
                          </tr>
                        </table>
                         <div align="center" style="width:95%;">
                    		<input type="image" src="/WebMAATeste/Painel_controle/Usuario/images/botao/bt_finalizar.png" alt="Finalizar" title="Finalizar Adoção" disabled="disabled" name="final" value="ok" class="btFinalizar" />
                    	</div>
                       </form>
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

<div id="boxes">
                    <!-- Janela Modal com caixa de diálogo -->

					<div id="divModal" class="window" >
  						
                        <div class="cont_modal">

                            <div class="bordaFaixaLeft" style="width:95%; margin-left:2%;">
                            	<span>Detalhes do Usuário</span>
                            </div>

                            <br />

                            <div id="dinamico">


                            </div>



                               <div align="right">

                                    	<img src="/WebMAATeste/Painel_controle/Usuario/images/botao/fechar.png" alt="Fechar" title="Fechar a Janela" class="seta_link close" />
                                </div>
                        </div>
					</div>
					<!-- Fim Janela Modal com caixa de diálogo -->
                                        
                     <!-- Janela Modal com caixa de diálogo (CONFRM DE REPROVAÇÃO)-->

					<div id="confirm_Reprovacao" class="window"  >
  						<div class="cont_modal">

                            <div class="bordaFaixaLeft" style="width:95%; margin-left:2%;">
                            	<span>Reprovação</span>
                            </div>
                            <br />

                            <!-- DETALHES DA MENSAGEM -->

                                <div id="conteudoDetalhe">
                           	  <div class="nota_informa" style="width:98%;">
                                    	<span>Será enviada uma mensagem com a sua decisão ao usuario ${ColabProcesso.nome}.</span>
                                    </div>

                                    <p>
                                    	<span class="obrigatorio">Após a exclusão desse processo, não será mais possivel voltar atras.</span>
                                        <br />

                                       <br />
                                    </p>

                                   Gostaria de explicar a sua decisao? então a descreva abaixo:
                                    <br />
                                    <br />
                                    <form method="post" action="/WebMAATeste/gerProcesso">
                                        <input type="hidden" name="operacao" value="cancela_processo_dono">
                                        <input type="hidden" name="codigo" value="${Processos.codigo}">
                                        <input type="hidden" name="codAnimal" value="${Animal.codigo}">
                                        <input type="hidden" name="codigoColab" value="${ColabProcesso.codigo}">
                                        <input type="hidden" name="codigoDono" value="${Colaborador.codigo}">

                                    <table class="grid" width="100%">
                                    	<tr>
                                        	<td width="19%" align="right" valign="top">Justificativa: &nbsp;</td>
                                            <td width="81%"><textarea name="justificativa" cols="50" rows="3"></textarea></td>
                                      </tr>

                                        <tr>
                                        	<td>&nbsp;</td>
                                            <td>A justificativa não é Obrigatória.</td>
                                        </tr>
                                    </table>
                                    <br />
                                    <br />

                                    <div align="center">

                                    	<input type="image" src="images/botao/bt_ok.png" alt="Ok" title="OK" class="seta_link ok"  /> &nbsp;&nbsp;
                                        <img src="/WebMAATeste/Painel_controle/Usuario/images/botao/bt_cancelar.png" alt="Cancelar" title="Cancelar" class="seta_link close" />
                                    </div>
                                    </form>
                                    <br />

                                </div>
                            <!-- DETALHES DA MENSAGEM -->
                        </div>

					</div>
					<!-- Fim Janela Modal com caixa de diálogo (CONFRM DE APROVAÇÃO ) -->


                    <div id="mask"></div>
 </div>

</body>

</html>