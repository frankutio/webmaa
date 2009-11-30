<%@page import="Entidade.Colaborador"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ong Amigos Fieis</title>

<link type="text/css" rel="stylesheet" href="css/geral.css" />
<link type="text/css" rel="stylesheet" href="css/estilos.css" />
<link type="text/css" rel="stylesheet" href="css/menu_drop.css" />

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/utilidades.js"></script>
<script type="text/javascript" src="js/maskedinput.js"></script>
<script type="text/javascript" src="js/menuSuper.js"></script>

<script>
function focoBt(id){
		if(id ==="cadastrar"){
		$("#"+id).attr("src","images/botao/bt_cadastrar_light.png");
	}
	
	else if(id ==="logoff"){
		$("#"+id).attr("src","images/botao/bt_logoff_light.png");
	}
}

function bt(id){
		if(id ==="cadastrar"){
		$("#"+id).attr("src","images/botao/bt_cadastrar.png");
	}
	
	else if(id ==="logoff"){
		$("#"+id).attr("src","images/botao/bt_logoff.png");
	}
}
</script>

</head>

<body>

<!-- Corpo da pagina -->
<div id="corpo">
<!-- div com o topo do site -->

<div id="faixaTopo">
		<div class="imgBannerLeft"><img src="images/topo1.png" alt="logo" title="Logo" class="seta_link" /></div>
        <div class="imgBannerRight"></div>   	
</div>

<!-- div com o banner -->

<div id="faixaBanner">
	<div class="imgBannerInfLeft"><img src="images/topo2.png" alt="Logo" title="Logo" class="seta_link" /></div>
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
    		<li><a href="/WebMAA/noticias.jsp" onfocus="limpaMenu();"><span>Notcias</span></a></li>
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
			<div class="bordaFaixaPainel_left"><span><img src="images/botao/ico_painel.png" alt="Painel" title="" style=" float:left; text-align:left; padding-right:5px;" /> Bem Vindo fulano@gmail.com - &nbsp;&nbsp; Painel de Controle</span></div>
                <br /><!-- FOTO DO USUARIO -->            
            <div id="foto">
                <img src="/WebMAA/Painel_controle/Usuario/foto/<%= usr.getEndFoto() %>" />
            </div>
            <!-- FOTO -->
            
            <!-- DADOS DO USUARIO -->            
            <div id="dadosUsuario">
                	<h2>Cadastramento de Animais</h2>
                    
             <br />
             <br />
                <p>
   	    			<div class="nota_informa">
                    	<span>Não recebemos animais para o nosso Gatil/Canil.</span>
                    </div>
                </p>
                <P>
                	Atravez deste canal você pode oferecer o seu animal para doação, A Ong Amigos Fieis não é a responsavel por adoções de animais que estão fora do nosso Gatil/Canil.<br />
                </P>
          </div>            
            <!-- DADOS DO USUARIO -->
            
            <div class="clear"></div>
            
            <!-- CONTEUDO DO PAINEL -->
            <div id="cont_painel">
            	<div class="bloco_left">
                	<div align="center"><a href="#">Alterar Foto</a></div>
                    <br />
                    <br />
                    
                  <div class="bordaFaixaLeft"><span>Arquivo</span></div>
              	<br />
                
                
                </div>
                
                <div class="bloco_centro">
                	Nota que para criterios de doação a Ong NÃO se responsabiliza pela saude do animal, sendo que o mesmo deve ter o Laudo Veterinario.
                    <br />
                    <br />
                    
                    <div align="center">
                    	<a href="../../cadastro/cad_animal.html"><img src="images/botao/bt_cadastrar.png" alt="Cadastrar" title="Cadastrar Animal" id="cadastrar" onmouseover="focoBt('cadastrar');" onmouseout="bt('cadastrar');" class="seta_link" /></a>
                    </div>
                    
                </div>
              
             <div class="clear"></div>
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
                        	<td width="29%" align="right"><a href="cad_edit.html"><img src="images/botao/editar.png" alt="Alterar Cadastro" title="Alterar Cadastro" class="seta_link" /></a> &nbsp;</td>
                            <td width="71%"><a href="cad_edit.html">Alterar Cadastro</a></td>
                        </tr>
                        <tr>
                        	<td align="right"><a href="senha_edit.html"><img src="images/botao/senha.png" alt="Alterar Aenha" title="Alterar Senha" class="seta_link" /></a> &nbsp;</td>
                            <td><a href="senha_edit.html">Alterar Senha</a></td>
                        </tr>
                        <tr>
                        	<td align="right"><a href="index.html"><img src="images/botao/ico_painel.png" alt="painel de Controle" title="Painel de Controle" class="seta_link" /></a> &nbsp;</td>
                            <td><a href="index.html">Painel de Controle</a></td>
                        </tr>
                    </table>
                    
              </div>
             <!-- LOGIN -->
             <br />
             <div class="bordaFaixaLeft"><span>Acompanhar</span></div>
              	<br />
               
               <table class="grid">
               		<tr>
                    	<td><img src="images/botao/ico_acmp.png" alt="Ver Adoção" title="Acompanhar Adoção" class="seta_link"  /></td>
                        <td><a href="#" onclick="mostrar('perfil');">Acompanhar Adoção</a></td>
                    </tr>
				</table>
				<table class="grid esconde" id="perfil">
					<tr>
						<td colspan="2" align="center"><a href="acompanhar_adocao_usuario.html">Adotando</a></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><a href="acompanhar_doacao_usuario.html">Doando</a></td>
					</tr>
               </table> 
               <br />
             <div class="bordaFaixaLeft"><span>Doação</span></div>
              	<br />
               
               <table class="grid">
               		<tr>
                    	<td valign="top"><img src="images/botao/alert.png" alt="alerta" title="alerta" /></td>
                        <td>Nenhum Animal Cadastrado para Adoção</td>
                 </tr>
               </table> 
                       
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