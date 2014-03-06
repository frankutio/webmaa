<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ong Amigos Fieis</title>

<link type="text/css" rel="stylesheet" href="/css/geral.css" />
<link type="text/css" rel="stylesheet" href="/css/estilos.css" />
<link type="text/css" rel="stylesheet" href="/css/menu_drop.css" />

<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/utilidades.js"></script>
<script type="text/javascript" src="/js/maskedinput.js"></script>
<script type="text/javascript" src="/js/menuSuper.js"></script>

<script>
function focoBt(id){
		if(id ==="doar"){
		$("#"+id).attr("src","/images/botao/bt_doar_light.png");
	}
	
	else if(id ==="logoff"){
		$("#"+id).attr("src","/images/botao/bt_logoff_light.png");
	}
	
	else if(id ==="alterar"){
		$("#"+id).attr("src","/images/botao/bt_alterar_light.png");
	}
	
	else if(id ==="cancelar"){
		$("#"+id).attr("src","/images/botao/bt_cancelar_light.png");
	}
}

function bt(id){
		if(id ==="doar"){
		$("#"+id).attr("src","/images/botao/bt_doar.png");
	}
	
	else if(id ==="logoff"){
		$("#"+id).attr("src","/images/botao/bt_logoff.png");
	}
	
	else if(id ==="alterar"){
		$("#"+id).attr("src","/images/botao/bt_alterar.png");
	}
	
	else if(id ==="cancelar"){
		$("#"+id).attr("src","/images/botao/bt_cancelar.png");
	}
}

function valida(){
	window.alert("Senha Alterada com Sucesso");
	return true;
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
    	<td align="right"><img src="/images/botao/bt_logoff.png" alt="Sair" title="Sair" class="seta_link" id="logoff" onmouseover="focoBt('logoff');" onmouseout="bt('logoff');" onclick="window.location='/index.html';" /></td>
    </tr>
</table>
</div>


<!-- Menu do site Horizontal -->

<div id="menu">
	<div class="menuDrop">
		<ul>
			<li><a href="/index.jsp" onfocus="limpaMenu();"><span>Inicio</span></a></li>            
    		<li><a href="#" onfocus="limpaMenu();"><span>Notícias</span></a></li>
            <li><a href="#" onfocus="limpaMenu();"><span>Denúncias</span></a></li>
            <li id="adotar" class="" onmouseover="setaClass('adotar');" onmouseout="retiraClass('adotar');"><a href="#" onfocus="ativa('adotar','drop');"><span>Adotar</span></a>
    			<ul class="drop">
        			<li id="gato" class=""><a href="/gato/listaGato.jsp" onfocus="ativaLight('gato');">Gato</a></li>
    				<li id="cao" class=""><a href="#" onfocus="ativaLight('cao');">Cachorro</a></li>
        		</ul>
    		</li>
    		<li><a href="#" onfocus="limpaMenu();"><span>Direito Animal</span></a></li>
    		<li><a href="/cadastro.jsp" onfocus="limpaMenu();"><span>Cadastre-se</span></a></li>
            <li><a href="cad_animal.jsp" onfocus="limpaMenu();"><span>Doar</span></a></li>
            <li><a href="/final_feliz/index.jsp" onfocus="limpaMenu();"><span>Final Feliz</span></a></li>
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
			<div class="bordaFaixaPainel_left"><span><img src="/images/botao/ico_painel.png" alt="Painel" title="" style=" float:left; text-align:left; padding-right:5px;" /> Bem Vindo fulano@gmail.com - &nbsp;&nbsp; Painel de Controle</span></div>
                <br /><!-- FOTO DO USUARIO -->            
            <div id="foto">
                <img src="/Painel_controle/Usuario/foto/<%= usr.getEndFoto() %>" />
            </div>
            <!-- FOTO -->
            
            <!-- DADOS DO USUARIO -->            
            <div id="dadosUsuario">
            <span class="obrigatorio">* Campos de Preenchimento Obrigat�rio</span>
            <br />
            <form name="editaDados" onsubmit="return valida(this);" action="index.html">
            	<fieldset>
                	<legend> Nova Senha </legend>
                    <br />           
                		<table class="grid">
                			<tr>
                    			<td width="32%" align="right"><span class="obrigatorio">*</span> Nova Senha: &nbsp;</td>
                              	<td><input type="password" name="senha" size="10" maxlength="8" /></td>
                   		  </tr>
                          <tr>
                    			<td width="32%" align="right"><span class="obrigatorio">*</span> Confirme a Senha: &nbsp;</td>
                              	<td width="68%"><input type="password" name="senhaConf" size="10" maxlength="8" /></td>
                   		  </tr>
                          <tr>
                    			<td width="32%" align="right"><span class="obrigatorio">*</span> Lembrete de Senha: &nbsp;</td>
                              	<td><input type="text" name="lembrete" value="Minha Mãe" size="30" /></td>
                   		  </tr>
               			</table>
               	</fieldset>
                <br />
                
                     <br />
       <div align="center">
                     	<input type="image" src="/images/botao/bt_alterar.png" alt="Alterar" title="Alterar" id="alterar" onmouseover="focoBt('alterar');" onmouseout="bt('alterar');" />&nbsp; &nbsp;
                        <a href="index.html"><img src="/images/botao/bt_cancelar.png" alt="Cancelar" title="Cancelar" class="seta_link" id="cancelar" onmouseover="focoBt('cancelar');" onmouseout="bt('cancelar');" /></a></div>
                </form>
          </div>            
            <!-- DADOS DO USUARIO -->
            
            <div class="clear"></div>
            
            <!-- CONTEUDO DO PAINEL -->
            <div id="cont_painel">
            	<div class="bloco_left">
                	                    
                 
              	<br />
                
                
                </div>
                
                <div class="bloco_centro">
                	&nbsp;
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
                        	<td width="29%" align="right"><a href="cad_edit.html"><img src="/images/botao/editar.png" alt="Alterar Cadastro" title="Alterar Cadastro" class="seta_link" /></a> &nbsp;</td>
                            <td width="71%"><a href="cad_edit.html">Alterar Cadastro</a></td>
                        </tr>
                        <tr>
                        	<td align="right"><a href="senha_edit.html"><img src="/images/botao/senha.png" alt="Alterar Aenha" title="Alterar Senha" class="seta_link" /></a> &nbsp;</td>
                            <td><a href="senha_edit.html">Alterar Senha</a></td>
                        </tr>
                        <tr>
                        	<td align="right"><a href="index.html"><img src="/images/botao/ico_painel.png" alt="painel de Controle" title="Painel de Controle" class="seta_link" /></a> &nbsp;</td>
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
                    	<td><img src="/images/botao/ico_acmp.png" alt="Ver Ado��o" title="Acompanhar Ado��o" class="seta_link"  /></td>
                        <td><a href="#" onclick="mostrar('perfil');">Acompanhar Ado��o</a></td>
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
                    	<td valign="top"><img src="/images/botao/alert.png" alt="alerta" title="alerta" /></td>
                        <td>Nenhum Animal Cadastrado para Ado��o</td>
                 </tr>
                 <tr>
                 	<td colspan="2" align="center">
                    <a href="cad_animal.html"><img src="/images/botao/bt_doar.png" alt="Cadatrar Animal Para Doação" title="Cadatrar Animal Para Doação" class="seta_link" id="doar" onmouseover="focoBt('doar');" onmouseout="bt('doar');" /></a></td>
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