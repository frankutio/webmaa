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

<script type="text/javascript" src="/WebMAATeste/Painel_controle/Usuario/js/jquery.js"></script>
<script type="text/javascript" src="/WebMAATeste/Painel_controle/Usuario/js/utilidades.js"></script>
<script type="text/javascript" src="/WebMAATeste/Painel_controle/Usuario/js/maskedinput.js"></script>
<script type="text/javascript" src="/WebMAATeste/Painel_controle/Usuario/js/menuSuper.js"></script>

<script>

$(function() {
	$(".botaoExibir").mouseover(function() {
		$(this).attr("src", "/WebMAATeste/Painel_controle/Usuario/images/botao/bt_exibir_light.png");
	});

	$(".botaoExibir").mouseout(function() {
		$(this).attr("src", "/WebMAATeste/Painel_controle/Usuario/images/botao/bt_exibir.png");
	});

});

function focoBt(id){
	if(id ==="doar"){
		$("#"+id).attr("src","/WebMAATeste/Painel_controle/Usuario/images/botao/bt_doar_light.png");
	}

	else if(id ==="logoff"){
		$("#"+id).attr("src","/WebMAATeste/Painel_controle/Usuario/images/botao/bt_logoff_light.png");
	}

	else if(id ==="cancelar"){
		$("#"+id).attr("src","/WebMAATeste/Painel_controle/Usuario/images/botao/bt_desistir_light.png");
	}


}

function bt(id){
	if(id ==="doar"){
		$("#"+id).attr("src","/WebMAATeste/Painel_controle/Usuario/images/botao/bt_doar.png");
	}

	else if(id ==="logoff"){
		$("#"+id).attr("src","/WebMAATeste/Painel_controle/Usuario/images/botao/bt_logoff.png");
	}
	else if(id ==="cancelar"){
		$("#"+id).attr("src","/WebMAATeste/Painel_controle/Usuario/images/botao/bt_desistir.png");
	}


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
			<div class="bordaFaixaPainel_left"><span><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/ico_painel.png" alt="Painel" title="" style=" float:left; text-align:left; padding-right:5px;" /> Avaliar Ado��es &nbsp;&nbsp; - &nbsp;&nbsp; Painel de Controle</span></div>
                <br />

            <c:if test="${Animais == null}">
                <div class="nota_informa">
                    <span>Voc� n�o processos para avaliar at� o momento.</span>
                </div>
            </c:if>
            <c:if test="${Animais != null}">
                <p>
                	Para avaliar um processo, clique no bot�o correspondente ao animal que voc� gostaria de "Avaliar".

                </p>

                <br />
                <div class="nota_destaque">Lista de Animais com Avalia��o pendente.</div>
                <br />

                <table class="grid" style="width:80%;">
                	<tr>
                    	<td width="13%" align="center" class="grid_titulo">Foto</td>
                    	<td width="32%" align="center" class="grid_titulo">Nome</td>
                        <td width="10%" align="center" class="grid_titulo">Tipo</td>
                        <td width="17%" align="center" class="grid_titulo">Ra�a</td>
                        <td width="12%" align="center" class="grid_titulo">Sexo</td>
                        <td width="16%" align="center" class="grid_titulo">Detalhar</td>
                    </tr>
                    <c:forEach items="${Animais}" var="Animal">
                        <tr class="td_escura">
                            <td align="center"><img src="/WebMAATeste/${Animal.especie}/images/miniaturas/${Animal.endFoto}" alt="${Animal.nome}" title="${Animal.nome}" width="69" height="59" /></td>
                            <td align="center">${Animal.nome}</td>
                            <td align="center">${Animal.especie}</td>
                            <c:forEach items="${lstRaca}" var="lstRaca">
                                <c:if test="${Animal.codigoRaca == lstRaca.codigo}">
                                    <td align="center">${lstRaca.descricao}</td>
                                </c:if>
                            </c:forEach>
                            <td align="center">${Animal.sexo}</td>
                            <td align="center"><a href="/WebMAATeste/gerProcesso?operacao=detalhar_avaliacao&cod_animal=${Animal.codigo}"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/bt_exibir.png" align="Exibir" title="Exibir" class="seta_link botaoExibir" /></a></td>
                        </tr>
                   </c:forEach>
                </table>

                </c:if>

            <!-- CONTEUDO DO PAINEL -->
            <div id="cont_painel">
              <div class="clear"></div>

			 <br />
             <hr style="color:#F8F8F8;" />
             <br />

			 <div align="right">
			 	<a href="/WebMAATeste/PainelControle?operacao=exibirPainel&colaborador=${Colaborador.codigo}"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link" /></a>
			 </div>
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
                        	<td width="29%" align="right"><a href="cad_edit.html"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/editar.png" alt="Alterar Cadastro" title="Alterar Cadastro" class="seta_link" /></a> &nbsp;</td>
                            <td width="71%"><a href="/WebMAATeste/NavUsr?operacao=alterar_cad">Alterar Cadastro</a></td>
                        </tr>

                        <tr>
                        	<td align="right"><a href="index.html"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/ico_painel.png" alt="painel de Controle" title="Painel de Controle" class="seta_link" /></a> &nbsp;</td>
                            <td><a href="/WebMAATeste/PainelControle?operacao=exibirPainel&colaborador=${Colaborador.codigo}">Painel de Controle</a></td>
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