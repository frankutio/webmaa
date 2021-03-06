<%@page import="Entidade.Painel.Animais"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1" %>
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

<script>
function focoBt(id){
	if(id ==="cadastrar"){
		$("#"+id).attr("src","/images/botao/bt_cadastrar_light.png");
	}
}

function bt(id){
	if(id ==="cadastrar"){
		$("#"+id).attr("src","/images/botao/bt_cadastrar.png");
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

	<span class="imgTopo_sem_coluna"></span>
	<div class="imgBase_sem_coluna">
	
	<!-- CONTEUDO AQUI -->
		<div id="cont">
        	<div style="text-align:center;"><img src="/images/imgTexto/cad_animal.png" alt="Cadastro" title="Cadastramento de Animais" /></div>
            <div class="nota_informa">
            	<span>Confira os dados abaixo.</span>
            </div>
            
            <br />
            <div id="dadosInicio"> 
              <!-- DETALHES DO ANIMAL -->
              
                <div class="descricao">
                
                  <img src="/${Animal.especie}/images/miniaturas/${Animal.endFoto}" alt="${Animal.nome}" title="${Animal.nome}" style="width:218px; height:207px;" />
                  <table class="grid" style="width:70%;">
            	<tr>
                	<td class="grid_titulo" align="center">Especie</td>
                    <td class="grid_titulo" align="center">Ra�a</td>
                    <td class="grid_titulo" align="center">Nome</td>
                    <td class="grid_titulo" align="center">Idade</td>
                    <td class="grid_titulo" align="center">Cor</td>
                    <td class="grid_titulo" align="center">2� Cor</td>
                    <td class="grid_titulo" align="center">Pelagem</td>
                    <td class="grid_titulo" align="center">Sexo</td>
                </tr>
                <tr>
                	<td align="center"><span>${Animal.especie}</span></td>
                    <c:forEach items="${lstRaca}" var="lstRaca">
                        <c:if test="${Animal.codigoRaca == lstRaca.codigo}">
                            <td align="center"><span>${lstRaca.descricao}</span></td>
                        </c:if>
                    </c:forEach>
                    <td align="center"><span>${Animal.nome}</span></td>
                    <td align="center"><span>${Animal.idade}</span></td>
                    <c:forEach items="${lstCor}" var="lstCor">
                        <c:if test="${Animal.cor1 == lstCor.codigo}">
                            <td align="center"><span>${lstCor.cor}</span></td>
                        </c:if>
                    </c:forEach>
                     <c:forEach items="${lstCor}" var="lstCor">
                        <c:if test="${Animal.cor2 == lstCor.codigo}">
                            <td align="center"><span>${lstCor.cor}</span></td>
                        </c:if>
                    </c:forEach>
                     <c:forEach items="${lstPelagem}" var="lstPelagem">
                        <c:if test="${Animal.codigoPelagem == lstPelagem.codigo}">
                            <td align="center"><span>${lstPelagem.pelagem}</span></td>
                        </c:if>
                    </c:forEach>
                    <td align="center"><span>${Animal.sexo}</span></td>
                </tr>
            </table>
                <br />
                Comentario/Descri��o<br />
                <textarea name="comentario" rows="5" cols="40" readonly="readonly">${Animal.descricao}</textarea>
                <br />       
                
      </div>
      <div align="left">
      		<table class="grid" style="width:50%;">
            	<tr>
                	<td width="9%" align="right"><img src="/images/botao/editar.png" alt="Editar" title="Editar" class="seta_link" /> &nbsp;</td>
                    <td width="91%"> <a href="GerAnimal?operacao=editar_animal">Editar os Dados</a></td>
              </tr>
            </table>
       </div>
               
               <!-- FIM DOS DETALHES -->
      </div>
                               
                <div class="clear"></div>
            
            <br />          
             <div class="nota_informa">
             	<span>Voc� ser� notificado assim que o cadastro do seu animal for aprovado!</span>
                
             </div> 
             <br />
             <form name="cadAnimal" method="post" action="GerAnimal">
             
             	<input type="hidden" name="operacao" value="cadastrar" />
                <input type="hidden" name="codUsr" value="${Colaborador.codigo}" />
                <input type="hidden" name="dataCad" value="" class="dataCad" />
                
                <!-- DADOS DO ANIMAL -->
                	
                    <input type="hidden" name="especie" value="${Animal.especie}" />
                    <input type="hidden" name="raca" value="${Animal.codigoRaca}" />
                    <input type="hidden" name="nome" value="${Animal.nome}" />
                    <input type="hidden" name="idade" value="${Animal.idade}" />
                    <input type="hidden" name="cor1" value="${Animal.cor1}" />
                    <input type="hidden" name="cor2" value="${Animal.cor2}" />
                    <input type="hidden" name="pelagem" value="${Animal.codigoPelagem}" />
                    <input type="hidden" name="porte" value="${Animal.porte}" />
                    <input type="hidden" name="sexo" value="${Animal.sexo}" />
                    <input type="hidden" name="foto" value="${Animal.endFoto}" />
                    <input type="hidden" name="laudo" value="${Animal.laudoVeterinario}" />
                    <input type="hidden" name="vacina" value="${Animal.vacinado}" />
                    <input type="hidden" name="descricaoVacina" value="${Animal.descricaoVacina}" />
                    <input type="hidden" name="formaEnvio" value="${Animal.codigoFormaEnvio}" />
                    <input type="hidden" name="descricao" value="${Animal.descricao}" />
                
                <!-- DADOS DO ANIMAL -->
             
            <div style="width:70%; text-align:right;">
                <input type="image" src="/images/botao/bt_cadastrar.png" alt="ok" title="Cadastrar" id="cadastrar" onmouseover="focoBt('cadastrar');" onmouseout="bt('cadastrar');" />
            	
                
            </div>   
            
            </form> 	
		
		</div>
        
	 <!-- FIM DO TEXTO -->	
		
	</div>
   
	<span class="imgFim_sem_coluna"></span>
</div>

</div>
<!-- Fim do corpo -->

<!-- Rodapé -->

<div id="rodape">
	sdjlarpq
</div>

</body>

</html>