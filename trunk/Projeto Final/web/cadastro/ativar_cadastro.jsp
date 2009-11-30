<%@page contentType="text/html" pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ong Amigos Fieis</title>

<link type="text/css" rel="stylesheet" href="/WebMAA/css/geral.css" />
<link type="text/css" rel="stylesheet" href="/WebMAA/css/jquery-ui-datepicker.css" />
<link type="text/css" rel="stylesheet" href="/WebMAA/css/estilos.css" />
<link type="text/css" rel="stylesheet" href="/WebMAA/css/menu_drop.css" />
<link type="text/css" rel="stylesheet" href="/WebMAA/css/abas.css" />


<script type="text/javascript" src="/WebMAA/js/jquery.js"></script>
<script type="text/javascript" src="/WebMAA/js/utilidades.js"></script>
<script type="text/javascript" src="/WebMAA/js/maskedinput.js"></script>
<script type="text/javascript" src="/WebMAA/js/jquery-ui-datepicker.js"></script>
<script type="text/javascript" src="/WebMAA/js/menuSuper.js"></script>

<script>
function focoBt(id){
		$("#"+id).attr("src","/WebMAA/images/botao/check_active.png");
}

function bt(id){
		$("#"+id).attr("src","/WebMAA/images/botao/check.png");
}

function foco(id){
		$("#"+id).attr("src","/WebMAA/images/botao/bt_ok_light.png");
}

function normal(id){
		$("#"+id).attr("src","/WebMAA/images/botao/bt_ok.png");
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
    		<li><a href="/WebMAA/noticias.jsp" onfocus="limpaMenu();"><span>Not&iacute;cias</span></a></li>
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

	<span class="imgTopo_sem_coluna"></span>
	<div class="imgBase_sem_coluna">
	
	<!-- CONTEUDO AQUI -->
		<div id="cont">
				<div style="text-align:center;"><h2>Ativa&ccedil;&atilde;o</h2></div>
				<br />
			
			<div class="nota_informa">
				<span>Ativação Necessaria para o Desbloqueio de sua conta.
				</span>
			</div>		
			<br />
			<div style="width:40%; margin-left:250px;">

            <c:if test="${Ativado == false}">
			<form action="/WebMAA/Ativacao" method="post">
               <input type="hidden" name="operacao" value="ativar_cad" />

                
			<table class="grid">
				<tr>
					<td align="center" class="grid_titulo" colspan="3">Ativa&ccedil;&atilde;o de Conta</td>
				</tr>
				<tr>
					<td width="28%" align="right">Protocolo: &nbsp;</td>
				  <td width="72%"><input type="text" name="protocolo" value="${Protocolo}" size="15"  /></td>
				</tr>
                <tr>
                	<td align="right">CPF: &nbsp;</td>
                    <td><input type="text" class="cpf" name="cpf" size="15" /></td>
                </tr>
                <tr>
                	<td align="center" colspan="2">
                    <input type="image" src="/WebMAA/images/botao/check.png" alt="OK" title="Confirmar" id="pt" onmouseover="focoBt('pt');" onmouseout="bt('pt');" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <span class="obrigatorio">${MsgErro}</span>
                    </td>
                </tr>
			</table>
			</form>
			</div>
			
			<br />
			<br />
			
			Confirme o número de Protocolo, caso não seja este o número que lhe foi enviado, digite no campo indicado.
		</c:if>
        <c:if test="${Ativado == true}">
            <span style="color:#090; font-size:15px;"> 
                <img src="/WebMAA/images/botao/conta_ok.png" style="float:left; margin-right:5px;" />
                Parab&eacute;ns, Sua Conta foi Ativada com Sucesso!
            </span>
                <br>
                <br>
                <br>
                <br>
               <div align="center">
                <img src="/WebMAA/images/botao/bt_ok.png" onclick="window.location='/WebMAA/index.jsp';" class="seta_link" id="ok" onmouseover="foco('ok')" onmouseout="normal('ok')" alt="OK" title="ok"/>
               </div>
                       
        </c:if>
        </div>
	 <!-- FIM DO TEXTO -->	
		
	</div>
	<span class="imgFim_sem_coluna"></span>
</div>

</div>
<!-- Fim do corpo -->

<!-- RodapÃ© -->

<div id="rodape">
	sdjlarpq
</div>

</body>

</html>