<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Ong Amigos Fieis</title>

<link type="text/css" rel="stylesheet" href="css/geral.css" />
<link type="text/css" rel="stylesheet" href="css/jquery-ui-datepicker.css" />
<link type="text/css" rel="stylesheet" href="css/estilos.css" />
<link type="text/css" rel="stylesheet" href="css/menu_drop.css" />


<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/utilidades.js"></script>
<script type="text/javascript" src="js/maskedinput.js"></script>
<script type="text/javascript" src="js/jquery-ui-datepicker.js"></script>
<script type="text/javascript" src="js/menuSuper.js"></script>

<script>
function focoBt(id){
	if(id ==="continuar"){
		$("#"+id).attr("src","../images/botao/bt_continuar_verde_light.png");
	}
	
	else if(id ==="limpar"){
		$("#"+id).attr("src","../images/botao/bt_limpar_light.png");
	}
}

function bt(id){
	if(id ==="continuar"){
		$("#"+id).attr("src","../images/botao/bt_continuar_verde.png");
	}
	
	else if(id ==="limpar"){
		$("#"+id).attr("src","../images/botao/bt_limpar.png");
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
sadsdsfd
</div>


<!-- Menu do site Horizontal -->

<div id="menu">
	<div class="menuDrop">
		<ul>
			<li><a href="index.jsp" onfocus="limpaMenu();"><span>Inicio</span></a></li>            
    		<li><a href="#" onfocus="limpaMenu();"><span>Notícias</span></a></li>
            <li><a href="#" onfocus="limpaMenu();"><span>Denúncias</span></a></li>
            <li id="adotar" class="" onmouseover="setaClass('adotar');" onmouseout="retiraClass('adotar');"><a href="#" onfocus="ativa('adotar','drop');"><span>Adotar</span></a>
    			<ul class="drop">
        			<li id="gato" class=""><a href="gato/listaGato.jsp" onfocus="ativaLight('gato');">Gato</a></li>
    				<li id="cao" class=""><a href="cao/listaCao.jsp" onfocus="ativaLight('cao');">Cachorro</a></li>
        		</ul>
    		</li>            
    		<li><a href="#" onfocus="limpaMenu();"><span>Direito Animal</span></a></li>
    		<li><a href="cadastro.jsp" onfocus="limpaMenu();"><span>Cadastre-se</span></a></li>
            <li><a href="cadastro/cad_animal.jsp" onfocus="limpaMenu();"><span>Doar</span></a></li>
            <li><a href="final_feliz/index.jsp" onfocus="limpaMenu();"><span>Final Feliz</span></a></li>
		</ul>
	</div>
</div>

<!-- CONTEUDO -->

<div id="conteudo">

	<span class="imgTopo_sem_coluna"></span>
	<div class="imgBase_sem_coluna">
	
	<!-- CONTEUDO AQUI -->
		<div id="cont">
        	<div style="text-align:center;"><h1>Recuperar Senha</h1></div>
            <div class="nota_informa">
            	<span>Uma nova senha será enviada para o seu E-mail cadastrado em nosso sistema..</span>
            </div>
            
            <br />
            <span class="obrigatorio">* Campos de Preenchimento Obrigatório</span>
          <form name="cadastro">
          <table class="grid">
            	<tr>
                	<td width="20%" align="right"><span class="obrigatorio">*</span> CPF: &nbsp;</td>
                    <td width="80%" colspan="3"><input type="text" size="15" /></td>
                </tr>
                <tr>
                	<td align="right"><span class="obrigatorio">*</span> Informe o E-mail Usado no seu Cadastro: &nbsp;</td>
                    <td colspan="3"><input type="text" size="30" /></td>
                </tr>
            </table>
            <br /> 
                  
           </form>
            <br />  
            <br />
            
            <span style="color:#060;" class="esconde" id="notificacao"><img src="images/botao/aprova.png" /> &nbsp; Sua Senha foi enviada Para o seu E-mail Cadastrado em nosso Sistema.</span>  
            
            <br />
            
            <br />      
                   
            <div style="width:70%; text-align:center;">
                <img src="images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link" onclick="window.location='index.html';" />&nbsp;&nbsp;
                <img src="images/botao/bt_ok.png" alt="OK" title="Recuperar" class="seta_link" onclick="mostra('','notificacao');" />
            </div>    	
					
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