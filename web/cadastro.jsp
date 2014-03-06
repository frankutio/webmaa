<%@page contentType="text/html" pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ong Amigos Fieis</title>

<link type="text/css" rel="stylesheet" href="/css/geral.css" />
<link type="text/css" rel="stylesheet" href="/css/jquery-ui-datepicker.css" />
<link type="text/css" rel="stylesheet" href="/css/estilos.css" />
<link type="text/css" rel="stylesheet" href="/css/menu_drop.css" />


<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/utilidades.js"></script>
<script type="text/javascript" src="/js/maskedinput.js"></script>
<script type="text/javascript" src="/js/jquery-ui-datepicker.js"></script>
<script type="text/javascript" src="/js/menuSuper.js"></script>
<script type="text/javascript" src="/js/jquery.validate.js"></script>

<script>
function focoBt(id){
		$("#"+id).attr("src","/images/botao/bt_continuar_light.png");
}

function bt(id){
		$("#"+id).attr("src","/images/botao/bt_continuar.png");
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
                <img src="/images/botao/bt_logoff.png" alt="Sair" title="Sair" class="seta_link" id="logoff" onmouseover="focoBt('logoff');" onmouseout="bt('logoff');" onclick="window.location='/logoff?operacao=sair';" />
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

	<span class="imgTopo_sem_coluna"></span>
	<div class="imgBase_sem_coluna">
	
	<!-- CONTEUDO AQUI -->
		<div id="cont">
        	<div style="text-align:center;"><img src="/images/imgTexto/cadastro.png" alt="Cadastro" title="Cadastro"  /></div>
            <br />
            
            <div class="nota_destaque_Alert">
            	<img src="/images/botao/atencao.png" alt="Atencao" title="AtenÃ§Ã£o"  /> &nbsp;&nbsp;
            	Para dar continuidade ao cadastramento é necessario ter lido e aceitado o termo de Responsabilidade abaixo.</div>

            

            <br>
                <span class="obrigatorio">&nbsp;</span>
            <br>
          
            <br />
            
            Leia e Aceite o termo abaixo para continurar com o Cadastro            
            <span style="overflow:auto; width:50%; height:100px; display:block; border-top:#CCC solid 1px; border-bottom:#CCC solid 1px; border-left:#CCC solid 1px;">
            	<p>1. Aceitação dos Termos</p>
                <br /><br />
                 <p>1.1 Para usar os Serviços, o usuário deverá primeiro concordar com os Termos. Não é permitido o uso dos Serviços por parte do usuário se ele não aceitar os Termos.</p>
                   <br /><br />
                <p>1.2 O usuário pode aceitar os Termos:</p>
                <br /><br />
                <p>(A) clicando para aceitar ou concordar com os Termos, no caso de essa opção ser disponibilizada pela ONG na interface do usuário para qualquer Serviço; ou<br /><br /><br /><br />

                    (B) usando efetivamente os Serviços. Nesse caso, o usuário compreende e aceita que a ONG considerará o seu uso dos Serviços uma aceitação dos Termos a partir desse momento.<br />
                </p>
                <br /><br />
                <p>1.3 O usuário não poderá usar os Serviços nem aceitar os Termos se: 
                <br /><br />(a) não tiver idade legal para celebrar um acordo com efeito jurídico com a ONG; ou
                <br /><br />(b) for uma pessoa com restrições quanto ao recebimento de serviços impostas pelas leis do Brasil ou de outros países, incluindo o país onde o usuário é residente ou a partir do qual usa os Serviços.</p>
                <br /><br />
                <p>1.4 Antes de continuar, o usuário deverá imprimir ou guardar uma cópia local dos Termos Universais em seus registros.</p>
            </span>   
            <br />
            <br />
			<form id="termoAceite" action="NavUsr" method="post">
            <input type="hidden" name="operacao" value="termoValido" />
            
			<table class="grid">
				<tr>
				  <td width="29%" align="right"><label for="aceitar">Li e concordo com os termos de uso &nbsp;</label></td>
				  <td width="71%"><input type="checkbox" id="aceitar" name="termoAceito" value="Sim" onclick="verificaTermo();" /></td>
				</tr>
			</table>
			            
            <div style="width:50%; text-align:right;">
            	<input type="image" src="/images/botao/bt_continuar.png" alt="ok" title="Continuar" id="continuar" onmouseover="focoBt('continuar');" onmouseout="bt('continuar');" disabled="disabled" />
            </div>  
              	
			</form>
            		
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