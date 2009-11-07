<%@page contentType="text/html" pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ong Amigos Fieis</title>

<link type="text/css" rel="stylesheet" href="/WebMAATeste/Painel_controle/Usuario/css/geral.css" />
<link type="text/css" rel="stylesheet" href="/WebMAATeste/Painel_controle/Usuario/css/estilos.css" />
<link type="text/css" rel="stylesheet" href="/WebMAATeste/Painel_controle/Usuario/css/menu_drop.css" />

<script type="text/javascript" src="/WebMAATeste/Painel_controle/Usuario/js/jquery.js"></script>
<script type="text/javascript" src="/WebMAATeste/Painel_controle/Usuario/js/utilidades.js"></script>
<script type="text/javascript" src="/WebMAATeste/Painel_controle/Usuario/js/maskedinput.js"></script>
<script type="text/javascript" src="/WebMAATeste/Painel_controle/Usuario/js/menuSuper.js"></script>

<script>
function focoBt(id){
	if(id ==="doar"){
		$("#"+id).attr("src","/WebMAATeste/Painel_controle/Usuario/images/botao/bt_doar_light.png");
	}
	
	else if(id ==="logoff"){
		$("#"+id).attr("src","/WebMAATeste/Painel_controle/Usuario/images/botao/bt_logoff_light.png");
	}
	
	else if(id ==="cancelar"){
		$("#"+id).attr("src","/WebMAATeste/Painel_controle/Usuario/images/botao/bt_desistir_light.png");
	}
	
	else if(id ==="exibir"){
		$("#"+id).attr("src","/WebMAATeste/Painel_controle/Usuario/images/botao/bt_exibir_light.png");
	}
	
	else if(id ==="exibir2"){
		$("#"+id).attr("src","images/botao/bt_exibir_light.png");
	}
}

function bt(id){
	if(id ==="doar"){
		$("#"+id).attr("src","/WebMAATeste/Painel_controle/Usuario/images/botao/bt_doar.png");
	}
	
	else if(id ==="logoff"){
		$("#"+id).attr("src","/WebMAATeste/Painel_controle/Usuario/images/botao/bt_logoff.png");
	}
	else if(id ==="cancelar"){
		$("#"+id).attr("src","/WebMAATeste/Painel_controle/Usuario/images/botao/bt_desistir.png");
	}
	
	else if(id ==="exibir"){
		$("#"+id).attr("src","/WebMAATeste/Painel_controle/Usuario/images/botao/bt_exibir.png");
	}
	
	else if(id ==="exibir2"){
		$("#"+id).attr("src","/WebMAATeste/Painel_controle/Usuario/images/botao/bt_exibir.png");
	}
}
</script>

</head>

<body>

<!-- Corpo da pagina -->
<div id="corpo">
<!-- div com o topo do site -->

<div id="faixaTopo">
		<div class="imgBannerLeft"><img src="/WebMAATeste/Painel_controle/Usuario/images/topo1.png" alt="logo" title="Logo" class="seta_link" /></div>
        <div class="imgBannerRight"></div>   	
</div>

<!-- div com o banner -->

<div id="faixaBanner">
	<div class="imgBannerInfLeft"><img src="/WebMAATeste/Painel_controle/Usuario/images/topo2.png" alt="Logo" title="Logo" class="seta_link" /></div>
    <div class="imgBannerInfRight"></div>
</div>

<!-- div Status -->

<div id="faixaStatus">
<table class="grid" style=" margin-top:-6px;">
	<tr>
    	<td align="right"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/bt_logoff.png" alt="Sair" title="Sair" class="seta_link" id="logoff" onmouseover="focoBt('logoff');" onmouseout="bt('logoff');" onclick="window.location='../../index.html';" /></td>
    </tr>
</table>
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
        			<li id="gato" class=""><a href="/WebMAATeste/listaAnimal?operacao=lista_gato" onfocus="ativaLight('gato');">Gato</a></li>
    				<li id="cao" class=""><a href="/WebMAATeste/listaAnimal?operacao=lista_cao" onfocus="ativaLight('cao');">Cachorro</a></li>
        		</ul>
    		</li>
    		<li><a href="#" onfocus="limpaMenu();"><span>Direito Animal</span></a></li>
    		<li><a href="/WebMAATeste/cadastro.jsp" onfocus="limpaMenu();"><span>Cadastre-se</span></a></li>
            <li><a href="/WebMAATeste/GerAnimal?operacao=iniciar_cad" onfocus="limpaMenu();"><span>Doar</span></a></li>
            <li><a href="/WebMAATeste/final_feliz/index.jsp" onfocus="limpaMenu();"><span>Final Feliz</span></a></li>
            <li><a href="../../fale_conosco.html" onfocus="limpaMenu();"><span>Fale Conosco</span></a></li>
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
			<div class="bordaFaixaPainel_left"><span><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/ico_painel.png" alt="Painel" title="" style=" float:left; text-align:left; padding-right:5px;" /> Acompanhar Adoção &nbsp;&nbsp; - &nbsp;&nbsp; Painel de Controle</span></div>
                <br />          
            
                
                <p>
                	Escolha em um dos blocos abaixo o processo que voc&ecirc; gostaria de acompanhar. 
                   
                </p>
                
                <br />
                <br />
                
                <div style="width:45%; float:left;">
                	<div class="bordaFaixaLeft"><span>Minhas Ado&ccedil;&otilde;es</span></div>
                    <br />
                    
                    Aqui voc&ecirc; pode acompanhar os pedidos de Ado&ccedil;&atilde;o feitos por voc&ecirc;.
                    <br />
                    <br />
                    <table class="grid" width="100%">
                    	<tr>
                        	<td class="td_escura">
                            	<span style="color:#F00;">Existe um Processo de Ado&ccedil;&atilde;o em aberto.</span> &nbsp; <br />
                            	<div align="center">
                                	<img src="/WebMAATeste/Painel_controle/Usuario/images/botao/bt_exibir.png" alt="Exibir" title="Exibir" class="seta_link" id="exibir" onmouseover="focoBt('exibir');" onmouseout="bt('exibir');" onclick="window.location='acompanhar_adocao_usuario.jsp';" />
                                </div>
                            </td>
                        </tr>
                    </table>                   
                    
                </div>
                
                <div style="width:45%; float:right;">
                	<div class="bordaFaixaLeft"><span>Minhas Doa&ccedil;&otilde;es</span></div>
                    
                    <br />
                    
                    Aqui voc&ecirc; gerencia os seus animais que est&atilde;o em processo de ado&ccedil;&atilde;o.
                    <br />
                    <br />
                    
                    <table class="grid" width="100%">
                    	<tr>
                        	<td class="td_escura">
                            	<span style="color:#F00;">Existe uma solicita&ccedil;&atilde;o de Ado&ccedil;&atilde; em aberto.</span> &nbsp; <br />
                            	<div align="center">
                                	<img src="/WebMAATeste/Painel_controle/Usuario/images/botao/bt_exibir.png" alt="Exibir" title="Exibir" class="seta_link" id="exibir2" onmouseover="focoBt('exibir2');" onmouseout="bt('exibir2');" onclick="window.location='acompanhar_doacao_usuario.jsp';" />
                                </div>
                            </td>
                        </tr>
                    </table> 
                    
                </div>
                
                <div class="clear"></div>
            
            <!-- CONTEUDO DO PAINEL -->
            <div id="cont_painel">
              <div class="clear"></div>
              
			 <br />
             <hr style="color:#F8F8F8;" />
             <br />
			 
			 <div align="right">
			 	<a href="index.html"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link" /></a>
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
                        	<td width="29%" align="right"><a href="cad_edit.html"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/editar.png" alt="Alterar Cadastro" title="Alterar Cadastro" class="seta_link" /></a> &nbsp;</td>
                            <td width="71%"><a href="/WebMAATeste/NavUsr?operacao=alterar_cad">Alterar Cadastro</a></td>
                        </tr>
                        
                        <tr>
                        	<td align="right"><a href="index.html"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/ico_painel.png" alt="painel de Controle" title="Painel de Controle" class="seta_link" /></a> &nbsp;</td>
                            <td><a href="/WebMAATeste/PainelControle?operacao=exibirPainel&colaborador=${Colaborador.codigo}">Painel de Controle</a></td>
                        </tr>

                    </table>
                    
              </div>
             <!-- LOGIN -->
             <br />
             
                       
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