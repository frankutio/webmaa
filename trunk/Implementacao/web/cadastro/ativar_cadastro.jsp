<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Ong Amigos Fieis</title>

<link type="text/css" rel="stylesheet" href="/WebMAATeste/css/geral.css" />
<link type="text/css" rel="stylesheet" href="/WebMAATeste/css/jquery-ui-datepicker.css" />
<link type="text/css" rel="stylesheet" href="/WebMAATeste/css/estilos.css" />
<link type="text/css" rel="stylesheet" href="/WebMAATeste/css/menu_drop.css" />
<link type="text/css" rel="stylesheet" href="/WebMAATeste/css/abas.css" />


<script type="text/javascript" src="/WebMAATeste/js/jquery.js"></script>
<script type="text/javascript" src="/WebMAATeste/js/utilidades.js"></script>
<script type="text/javascript" src="/WebMAATeste/js/maskedinput.js"></script>
<script type="text/javascript" src="/WebMAATeste/js/jquery-ui-datepicker.js"></script>
<script type="text/javascript" src="/WebMAATeste/js/menuSuper.js"></script>

<script>
function focoBt(id){
		$("#"+id).attr("src","/WebMAATeste/images/botao/check_active.png");
}

function bt(id){
		$("#"+id).attr("src","/WebMAATeste/images/botao/check.png");
}

function foco(id){
		$("#"+id).attr("src","/WebMAATeste/images/botao/bt_ok_light.png");
}

function normal(id){
		$("#"+id).attr("src","/WebMAATeste/images/botao/bt_ok.png");
}
</script>

</head>

<body>

<!-- Corpo da pagina -->
<div id="corpo">
<!-- div com o topo do site -->

<div id="faixaTopo">
		<div class="imgBannerLeft"><img src="/WebMAATeste/images/topo1.png" alt="logo" title="Logo" class="seta_link" /></div>
        <div class="imgBannerRight"></div>   	
</div>

<!-- div com o banner -->

<div id="faixaBanner">
	<div class="imgBannerInfLeft"><img src="/WebMAATeste/images/topo2.png" alt="Logo" title="Logo" class="seta_link" /></div>
    <div class="imgBannerInfRight"></div>
</div>

<!-- div Status -->

<div id="faixaStatus">
	
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
        			<li id="gato" class=""><a href="/WebMAATeste/gato/listaGato.jsp" onfocus="ativaLight('gato');">Gato</a></li>
    				<li id="cao" class=""><a href="/WebMAATeste/cao/listaCao.jsp" onfocus="ativaLight('cao');">Cachorro</a></li>
        		</ul>
    		</li>
    		<li><a href="#" onfocus="limpaMenu();"><span>Direito Animal</span></a></li>
    		<li><a href="/WebMAATeste/cadastro.jsp" onfocus="limpaMenu();"><span>Cadastre-se</span></a></li>
            <li><a href="/WebMAATeste/cadastro/cad_animal.jsp" onfocus="limpaMenu();"><span>Doar</span></a></li>
            <li><a href="/WebMAATeste/final_feliz/index.jsp" onfocus="limpaMenu();"><span>Final Feliz</span></a></li>
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
				<span>AtivaÃ§Ã£o Necessaria para o Desbloqueio de sua conta.
				</span>
			</div>		
			<br />
			<div style="width:40%; margin-left:250px;">

            <c:if test="${Ativado == false}">
			<form action="/WebMAATeste/Ativacao" method="post">
               <input type="hidden" name="operacao" value="ativar_cad" />

                
			<table class="grid">
				<tr>
					<td align="center" class="grid_titulo" colspan="3">Ativação de Conta</td>
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
                    <input type="image" src="/WebMAATeste/images/botao/check.png" alt="OK" title="Confirmar" id="pt" onmouseover="focoBt('pt');" onmouseout="bt('pt');" />
                    </td>
                </tr>
			</table>
			</form>
			</div>
			
			<br />
			<br />
			
			Confirme o NÃºmero de Protocolo, caso nÃ£o seja este o nÃºmero que lhe foi enviado, digite no campo indicado.
		</c:if>
        <c:if test="${Ativado == true}">
            <span style="color:#090; font-size:15px;"> 
                <img src="/WebMAATeste/images/botao/conta_ok.png" style="float:left; margin-right:5px;" />
                Parabéns, Sua Conta foi Ativada com Sucesso!
            </span>
                <br>
                <br>
                <br>
                <br>
               <div align="center">
                <img src="/WebMAATeste/images/botao/bt_ok.png" onclick="window.location='/WebMAATeste/index.jsp';" class="seta_link" id="ok" onmouseover="foco('ok')" onmouseout="normal('ok')" alt="OK" title="ok"/>
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