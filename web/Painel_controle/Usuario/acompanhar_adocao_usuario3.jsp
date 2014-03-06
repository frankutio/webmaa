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
	
	else if(id ==="cancelar"){
		$("#"+id).attr("src","/images/botao/bt_desistir_light.png");
	}
	else if(id ==="continua"){
		$("#"+id).attr("src","/images/botao/bt_continuar_verde_light.png");
	}
}

function bt(id){
	if(id ==="doar"){
		$("#"+id).attr("src","/images/botao/bt_doar.png");
	}
	
	else if(id ==="logoff"){
		$("#"+id).attr("src","/images/botao/bt_logoff.png");
	}
	else if(id ==="cancelar"){
		$("#"+id).attr("src","/images/botao/bt_desistir_desabilitado.png");
	}
	else if(id ==="continua"){
		$("#"+id).attr("src","/images/botao/bt_continuar.png");
	}
}

function valida(){
	if(confirm("Tem certeza que deseja Continuar? Apos a confirmação não será possivel Desistir.")){
		$("#cancelar").attr("src","/images/botao/bt_desistir_desabilitado.png");
		$("#cancelar").attr("onmouseover","");
		$("#cancelar").attr("onmouseout","");
		$("#cancelar").removeClass("seta_link");
		$("#comunicacao").show();
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
    	<td align="right"><img src="/images/botao/bt_logoff.png" alt="Sair" title="Sair" class="seta_link" id="logoff" onmouseover="focoBt('logoff');" onmouseout="bt('logoff');" onclick="window.location='/index.html';" /></td>
    </tr>
</table>
</div>


<!-- Menu do site Horizontal -->

<div id="menu">
	<div class="menuDrop">
		<ul>
			<li><a href="/index.jsp" onfocus="limpaMenu();"><span>Inicio</span></a></li>            
    		<li><a href="#" onfocus="limpaMenu();"><span>NotÃ­cias</span></a></li>
            <li><a href="#" onfocus="limpaMenu();"><span>DenÃºncias</span></a></li>
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
			<div class="bordaFaixaPainel_left"><span><img src="/images/botao/ico_painel.png" alt="Painel" title="" style=" float:left; text-align:left; padding-right:5px;" /> Acompanhar Adoção - &nbsp;&nbsp; Painel de Controle</span></div>
                <br />          
            
                <div class="nota_informa">
                    	<span>Bem Vindo Ã  pÃ¡gina de acompanhamento de adoÃ§Ã£o, abaixo segue os dados do animal que estÃ¡ em fase de adoÃ§Ã£o.</span><br />                        
          </div>
            <!-- FOTO DO USUARIO -->            
            <div id="foto">
           	  <img src="/gato//images/miniaturas/loky.png" />            
            </div>
            <!-- FOTO -->
            
            <!-- DADOS DO USUARIO -->            
            <div id="dadosUsuario">
			<table width="80%">
				<tr>
				  <td width="36%"><h2>Fase 1/3</h2></td>
					<td width="64%"><img src="/images/botao/aprova.png" /> &nbsp;Concluida!</td>
				</tr>
			</table>
            
            <br />
			<div id="fase1">
				           
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
                            <td align="center"><font style="color: #009900;">Aprovado</font></td>
                        </tr>
                    </table>                    
			</div>
                    <br />
                    
                   
					
          </div>            
            <!-- DADOS DO USUARIO -->
            
            <div class="clear"></div>
            
            <!-- CONTEUDO DO PAINEL -->
            <div id="cont_painel">
            	<div class="bloco_left">
                    
                  <div class="bordaFaixaLeft"><span>Arquivo</span></div>
              	<br />
                
                
                </div>
                
                <div class="bloco_centro">
                	
					<p><h2>Fase 2/3</h2></p>						
					<br />
					<br />
					
						Adoção nÃ£o Ã© brincadeira, Ã© coisa a ser levado a serio. <br />
						<br />
						
						
						Caso decida continuar com a adoÃ§Ã£o deve ficar ciente que apos a sua confirmaÃ§Ã£o nÃ£o poderÃ¡ mais desistir da mesma, o sistema lhe informarÃ¡ os dados para contato com o dono do animal para que assim vocÃª possa contacta-lo para finalizar a adoÃ§Ã£o.
						<br />
						<br />
						
						Leia abaixo as responsabilidades que vocÃª deve ter a adotar um animal.
						<br />
						<br />
						<span style="overflow:auto; width:90%; height:100px; display:block; border-top:#CCC solid 1px; border-bottom:#CCC solid 1px; border-left:#CCC solid 1px; color:#000000;">
            	Etiam eget felis vitae ligula scelerisque pretium. Nam facilisis felis sed enim interdum ac varius magna tristique. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Praesent vehicula rhoncus justo at ornare. Duis ac est sit amet diam hendrerit gravida ac ac tortor. Mauris sit amet mi arcu. Duis semper aliquam eros, molestie malesuada sapien vestibulum et. Etiam magna lectus, sodales et lobortis eu, dignissim non nunc. Sed in velit metus, vitae tempor quam. Curabitur placerat pulvinar dapibus. Nulla feugiat nunc sed mi porttitor porttitor sollicitudin massa posuere. Vestibulum pharetra risus vitae mauris hendrerit accumsan. Nullam vehicula, libero ut adipiscing tincidunt, purus ipsum egestas nisl, et tincidunt turpis ipsum ut elit. Vivamus auctor nulla lorem. 
            </span> 
			<br />
			  
			O que Pretendes Fazer?
					<div align="right" style="width:95%;">
                    	<img src="/images/botao/bt_continuar.png" alt="Continuar" title="Continuar" class="seta_link" id="continua" onmouseover="focoBt('continua');" onmouseout="bt('continua');" onclick="valida();" />&nbsp;&nbsp;<img src="/images/botao/bt_desistir_desabilitado.png" alt="cancelar adoÃ§Ã£o" title="Cancelar Adoção" id="cancelar" onmouseover="focoBt('cancelar');" onmouseout="bt('cancelar');" class="seta_link" />
                    </div>
				<br />
				
				<div id="comunicacao" class="esconde">
					Dados para NegociaÃ§Ã£o<br />
					<table class="grid" style="width:100%;">
						<tr>
							<td class="grid_titulo" align="center">Cod</td>
							<td class="grid_titulo" align="center">Nome</td>
							<td class="grid_titulo" align="center">Endereço</td>
							<td class="grid_titulo" align="center">CEP</td>
							<td class="grid_titulo" align="center">UF</td>
							<td class="grid_titulo" align="center">Email</td>
							<td class="grid_titulo" align="center">Fone</td>
						</tr>
						<tr class="td_escura">
							<td align="center">002</td>
							<td align="center">Maria Fulana</td>
							<td align="center">Rua dos Remedios Nº 15</td>
							<td align="center">7200000</td>
							<td align="center">GO</td>
							<td align="center">fulana@email.com</td>
							<td align="center">62 3397-2895</td>
						</tr>
					</table>
					<br />
					<table class="grid">
						<tr class="td_escura">
							<td width="28%" height="16"><strong>O Animal se encontra em poder do proprietario?</strong></td>
						</tr>
						<tr>
							<td width="72%">SIM</td>
						</tr>
						<tr class="td_escura">
							<td><strong>Animal com certificado Veterianário?</strong></td>
						</tr>
						<tr>
							<td>NÃO</td>
						</tr>
						<tr class="td_escura">
							<td><strong>Animal Vacinado? </strong></td>
						</tr>
						<tr>
							<td>SIM 1 DOSE</td>
						</tr>
						<tr class="td_escura">
							<td><strong>Forma de Envio:</strong></td>
						</tr>
						<tr>
							<td>A COMBINAR</td>
						</tr>
					</table>
					<div class="nota_informa">
						<span>Entre em contato com o Proprietario e negocie a adoÃ§Ã£o. ApÃ³s  a entrega do animal serÃ¡ necessario que vocÃª o avalie na Fase 03.<br />
						Qualquer problema durante a negociaÃ§Ã£o entre com contato com a nossa Ong informando o codigo do usuario.</span>
					</div>
				</div>					
					
                </div>
              
             <div class="clear"></div>
			 <br />
			 
			 <div align="right">
			 	<a href="index.html"><img src="/images/botao/seta_left.png" alt="Voltar" title="Voltar" class="seta_link" /></a>
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
                    	<td><img src="/images/botao/ico_acmp.png" alt="Ver Adoção" title="Acompanhar Adoção" class="seta_link" /></td>
                        <td><a href="#" onclick="mostrar('perfil');">Acompanhar Adoção</a></td>
                    </tr>
               </table>
			   <table class="grid esconde" id="perfil">
					<tr>
						<td colspan="2" align="center"><a href="acompanhar_adocao_usuario.html">Fase 1</a></td>
					</tr>
					<tr>
						<td colspan="2" align="center">&nbsp</td>
					</tr>
               </table>  
               <br />
             <div class="bordaFaixaLeft"><span>DoaÃ§Ã£o</span></div>
              	<br />
               
               <table class="grid">
               		<tr>
                    	<td valign="top"><img src="/images/botao/alert.png" alt="alerta" title="alerta" /></td>
                        <td>Nenhum Animal Cadastrado para Adoção</td>
                 </tr>
                 <tr>
                 	<td colspan="2" align="center"><a href="cad_animal.html"><img src="/images/botao/bt_doar.png" alt="Cadatrar Animal Para DoaÃ§Ã£o" title="Cadatrar Animal Para DoaÃ§Ã£o" class="seta_link" id="doar" onmouseover="focoBt('doar');" onmouseout="bt('doar');" /></a></td>
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

<!-- RodapÃ© -->

<div id="rodape">
	sdjlarpq
</div>

</body>

</html>