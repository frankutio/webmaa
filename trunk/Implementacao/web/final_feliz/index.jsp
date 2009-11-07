<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Ong Amigos Fieis</title>

<link type="text/css" rel="stylesheet" href="../css/geral.css" />
<link type="text/css" rel="stylesheet" href="../css/estilos.css" />
<link type="text/css" rel="stylesheet" href="../css/menu_drop.css" />

<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/utilidades.js"></script>
<script type="text/javascript" src="../js/maskedinput.js"></script>
<script type="text/javascript" src="../js/menuSuper.js"></script>

<script>
function focoBt(id){
		$("#"+id).attr("src","../images/botao/bt_logoff_light.png");
}

function bt(id){
		$("#"+id).attr("src","../images/botao/bt_logoff.png");
}
</script>

</head>

<body>

<!-- Corpo da pagina -->
<div id="corpo">
<!-- div com o topo do site -->

<div id="faixaTopo">
		<div class="imgBannerLeft"><img src="../images/topo1.png" alt="logo" title="Logo" class="seta_link" /></div>
        <div class="imgBannerRight"></div>   	
</div>

<!-- div com o banner -->

<div id="faixaBanner">
	<div class="imgBannerInfLeft"><img src="../images/topo2.png" alt="Logo" title="Logo" class="seta_link" /></div>
    <div class="imgBannerInfRight"></div>
</div>

<!-- div Status -->

<div id="faixaStatus">
<table class="grid" style=" margin-top:-6px;">
	<tr>
    	<td align="right"><img src="../images/botao/bt_logoff.png" alt="Sair" title="Sair" class="seta_link" id="logoff" onmouseover="focoBt('logoff');" onmouseout="bt('logoff');" onclick="window.location='../index.html';" /></td>
    </tr>
</table>
</div>


<!-- Menu do site Horizontal -->

<div id="menu">
	<div class="menuDrop">
		<ul>
			<li><a href="../index.jsp" onfocus="limpaMenu();"><span>Inicio</span></a></li>            
    		<li><a href="#" onfocus="limpaMenu();"><span>Notícias</span></a></li>
            <li><a href="#" onfocus="limpaMenu();"><span>Denúncias</span></a></li>
            <li id="adotar" class="" onmouseover="setaClass('adotar');" onmouseout="retiraClass('adotar');"><a href="#" onfocus="ativa('adotar','drop');"><span>Adotar</span></a>
    			<ul class="drop">
        			<li id="gato" class=""><a href="listaGato.jsp" onfocus="ativaLight('gato');">Gato</a></li>
    				<li id="cao" class=""><a href="#" onfocus="ativaLight('cao');">Cachorro</a></li>
        		</ul>
    		</li>
    		<li><a href="#" onfocus="limpaMenu();"><span>Direito Animal</span></a></li>
    		<li><a href="../cadastro.jsp" onfocus="limpaMenu();"><span>Cadastre-se</span></a></li>
            <li><a href="../cadastro/cad_animal.jsp" onfocus="limpaMenu();"><span>Doar</span></a></li>
            <li><a href="index.jsp" onfocus="limpaMenu();"><span>Final Feliz</span></a></li>
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
			<div class="bordaFaixaLeft"><span>Final Feliz</span></div>
                <br />
                
                <span class="textoTitulo">  O amor aos animais traduzidos em ações, na esperança que eles tenham novos lares e donos que os amem verdadeiramente...
</span>

<br />
<br />
            <div class="listaAnimal">
               <span>
               <a href="detalharGato_usuario.html"><img src="images/miniaturas/loky.png" alt="gato" class="seta_link" title="Gato codido 002" /></a>
               </span>
                Lucky é um gato muito carinhoso e amigo das crianças, ele está aprocura de um novo dono, pois a sua dona tem uma doença que a impede de ficar com ele, estou com o coração partido e choro muito quando penso que não vou poder ficar mais com ele.<br />
                Estou a procura de um dono que possa dar carinho incondicional assim como eu. Amo muito você e espero que seja feliz no seu novo lar.
                <br />
                <br />
                <div style="color:#000;">* Animal em poder do Usuario</div>
               
              <div class="clear"></div>
          </div>
          <br />
          
           <div class="listaAnimal">
               <span>
               <a href="detalharGato_ong.html"><img src="images/miniaturas/nanda.png" alt="gato" class="seta_link" title="Gato codido 003" /></a>
               </span>
                Nanda foi encontrada na rua pela nossa Ong e se encontra em nosso gatil, Está muito bem tratada e está com as doses de vacina em dias. Com apenas 5 Meses esta carinhosa gata espera anciosa por uma adoção.
                <br />
                <br />
                <div class="obrigatorio"> <img src="../images/ico_canil.png" alt="Em Canil" /> &nbsp; Animal em nosso Gatil e está garantido pela Ong.</div>
               
              <div class="clear"></div>
          </div>
                           
          <br />                
          <br />          
		  </div>
            
			<div id="colunaRight">
            
            <!-- LOGIN -->
            	<div class="login" style="font-size:10px;">
					<div class="bordaFaixaLeft"><span>Login</span></div>
                	<br />
              <table class="grid">
                    	<tr>
                            <td align="center" colspan="2">Fulana@gmail.com</td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">&nbsp;</td>
                        </tr>
                        <tr>
                        	<td width="29%" align="right"><img src="../images/botao/ico_email.png" alt="Mensagem" title="Mensagem" class="seta_link" /> &nbsp;</td>
                            <td width="71%"><a href="../Painel_controle/Usuario/centro_msg.html"><span class="obrigatorio">0</span> Mensagem(s) Nova(s)</a></td>
                        </tr>
                        <tr>
                        	<td align="right"><img src="../images/botao/ico_painel.png" alt="Painel" title="Ir para o Painel de Controle" class="seta_link" /> &nbsp;</td>
                            <td><a href="../Painel_controle/Usuario/index.html">Meu Painel de Controle</a></td>
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

<!-- Rodapé -->

<div id="rodape">
	sdjlarpq
</div>

</body>

</html>