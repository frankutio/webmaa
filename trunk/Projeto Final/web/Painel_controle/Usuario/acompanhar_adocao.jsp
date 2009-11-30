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
	if(id ==="doar"){
		$("#"+id).attr("src","images/botao/bt_doar_light.png");
	}
	
	else if(id ==="logoff"){
		$("#"+id).attr("src","images/botao/bt_logoff_light.png");
	}
	
	else if(id ==="cancelar"){
		$("#"+id).attr("src","images/botao/bt_desistir_light.png");
	}
}

function bt(id){
	if(id ==="doar"){
		$("#"+id).attr("src","images/botao/bt_doar.png");
	}
	
	else if(id ==="logoff"){
		$("#"+id).attr("src","images/botao/bt_logoff.png");
	}
	else if(id ==="cancelar"){
		$("#"+id).attr("src","images/botao/bt_desistir.png");
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
			<div class="bordaFaixaPainel_left"><span><img src="images/botao/ico_painel.png" alt="Painel" title="" style=" float:left; text-align:left; padding-right:5px;" /> Acompanhar Adoção - &nbsp;&nbsp; Painel de Controle</span></div>
                <br />          
            
                <div class="nota_informa">
                    	<span>Bem Vindo à página de acompanhamento de adoção, abaixo segue os dados do animal que está em fase de adoção.</span><br />                        
          </div>
            <!-- FOTO DO USUARIO -->            
            <div id="foto">
           	  <img src="../../gato/images/miniaturas/loky.png" />            
            </div>
            <!-- FOTO -->
            
            <!-- DADOS DO USUARIO -->            
            <div id="dadosUsuario">
            <p><h2>1ª Fase</h2></p>
            
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
                          <td align="center">001</td>
                            <td align="center">Lukcy</td>
                            <td align="center">Comum</td>
                            <td align="center">Gato</td>
                            <td align="center">Macho</td>
                            <td align="center"><font style="color:#F00;">Pendente</font></td>
                        </tr>
                    </table>
                    <div align="right" style="width:95%;">
                    	<img src="images/botao/bt_desistir.png" id="cancelar" onmouseover="focoBt('cancelar');" onmouseout="bt('cancelar');" class="seta_link" />
                    </div>
                    <br />
                    
                    <div class="nota_informa" style="width:90%;">
                    	<span>Animal aguardando aprovação por parte do proprietario. Você ainda pode desistir da adoção clicando no botao acima.</span>
                    </div>
          </div>            
            <!-- DADOS DO USUARIO -->
            
            <div class="clear"></div>
            
            <!-- CONTEUDO DO PAINEL -->
            <div id="cont_painel">
            	<div class="bloco_left">
                    
                  <div class="bordaFaixaLeft"><span>Arquivo</span></div>
              	<br />
                
                
                </div>
                
                <div class="bloco_centro sistema">
                	<h2>Doação</h2>
                    <p>
                    	Caso tenha algum animal que você queira doar para alguem, o mesmo pode ser cadastrado ao lado, no quadro "Doação" clique no botão "Doar" para cadastrar o seu animal.
                    </p>
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
                    	<td><img src="images/botao/ico_acmp.png" alt="Ver Adoção" title="Acompanhar Adoção" class="seta_link" /></td>
                        <td><a href="acompanhar_adocao.html">Acompanhar Adoção</a></td>
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
                 <tr>
                 	<td colspan="2" align="center"><a href="cad_animal.html"><img src="images/botao/bt_doar.png" alt="Cadatrar Animal Para Doação" title="Cadatrar Animal Para Doação" class="seta_link" id="doar" onmouseover="focoBt('doar');" onmouseout="bt('doar');" /></a></td>
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