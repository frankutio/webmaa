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

<script type="text/javascript">
<!--
function focoBt(id){
	
	if(id ==="adota"){
		$("#"+id).attr("src","/images/botao/bt_adotar_light.png");
	}
	else if(id ==="logoff"){
		$("#"+id).attr("src","/images/botao/bt_logoff_light.png");
	}
	else if(id ==="continuar"){
		$("#"+id).attr("src","/images/botao/bt_continuar_light.png");
	}
}

function bt(id){
	if(id ==="adota"){
		$("#"+id).attr("src","/images/botao/bt_adotar.png");
	}
	else if(id ==="logoff"){
		$("#"+id).attr("src","/images/botao/bt_logoff.png");
	}
	else if(id ==="continuar"){
		$("#"+id).attr("src","/images/botao/bt_continuar.png");
	}
}
-->
</script>

</head>

<body>

<!-- Corpo da pagina -->
<div id="corpo">
<!-- div com o topo do site -->

<div id="faixaTopo">
		<div class="imgBannerLeft"><img src="/images/topo1.png" alt="logo" title="Logo" class="seta_link" /></div>
        <div class="imgBannerRight" style="background:url(/images/topo_gato4.png) no-repeat right bottom;"></div>   	
</div>

<!-- div com o banner -->

<div id="faixaBanner">
	<div class="imgBannerInfLeft"><img src="/images/topo2.png" alt="Logo" title="Logo" class="seta_link" /></div>
    <div class="imgBannerInfRight" style="background:url(/images/topo_gato3.png) no-repeat right;"></div>
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
			<div class="bordaFaixaLeft"><span>Detalhes do Animal</span></div>
                <br />
          
          <!-- TELA 01 -->	    
          <div id="dadosInicio"> 
              <!-- DETALHES DO ANIMAL -->
              <table class="grid">
                	<tr>
                    	<td width="8%"><img src="images/miniaturas/ico_gato.png" alt="gato" title="gato" /></td>
                        <td width="92%" colspan="2"><font style=" font-size:20px; color:#000;">Nanda</font></td>
                    </tr>
            </table>			
                <div class="descricao">
                
                  <img src="images/nanda.png" alt="Luky" title="Luky" />
                  <table class="grid descricaoFoto" >
              <tr>
                    	<td width="41%" align="right">N� de Identifica��o: &nbsp;</td>
                        <td width="59%"><span style="color:#000;">002</span></td>
                    </tr> 
                    <tr>
                    	<td width="41%" align="right">Ra�a: &nbsp;</td>
                        <td width="59%"><span style="color:#000;">Comum</span></td>
                    </tr>
                    <tr>
                    	<td width="41%" align="right">Idade Aproximada: &nbsp;</td>
                        <td width="59%"><span style="color:#000;">4 Meses</span></td>
                    </tr>
                    <tr>
                    	<td width="41%" align="right">Cor Predominante: &nbsp;</td>
                        <td width="59%"><span style="color:#000;">Preto</span></td>
                    </tr> 
                    <tr>
                    	<td width="41%" align="right">2� Cor: &nbsp;</td>
                        <td width="59%"><span style="color:#000;">Branco</span></td>
                    </tr> 
                    <tr>
                    	<td width="41%" align="right">Pelagem: &nbsp;</td>
                        <td width="59%"><span style="color:#000;">Curto</span></td>
                    </tr> 
                    <tr>
                    	<td width="41%" align="right" valign="top">Sexo: &nbsp;</td>
                        <td width="59%" valign="top"><span style="color:#000;">Femea</span></td>
                    </tr>
                     <tr>
                    	<td align="right" colspan="2">&nbsp;</td>
                    </tr>
                     <tr>
                    	<td width="41%" align="right" valign="top">Taxa de Ado��o: &nbsp;</td>
                        <td width="59%" valign="top"><span style="color:#000;">R$ 10,00</span></td>
                    </tr>  
                    <tr>
                    	<td width="41%" align="right" valign="top">Forma de Envio: &nbsp;</td>
                        <td width="59%" valign="top"><span style="color:#000;">CUSTO POR PARTE DO INTERESSADO</span></td>
                    </tr>                 
                </table>
                <br />
                <br />       
                
      </div>
      <div align="center">
                	<img src="/images/botao/bt_adotar.png" alt="Adotar" title="Adotar este Animal" class="seta_link" id="adota" onmouseover="focoBt('adota');" onmouseout="bt('adota');" onclick="mostra('dadosInicio','confirAdocao')" />
                </div>
               
               <!-- FIM DOS DETALHES -->
                               
                <div class="clear"></div>
                
                <!-- COMENTARIO DO USUARIO -->
                
                <div id="comentario">
                <br />
                <span class="obrigatorio">Descri��o/Coment�rio do Gatinho(a):</span><br /><br />
                	Nanda é uma gatinha muito carente mais a sua dona faleceu e ela não pode mais viver em seu antigo lar.<br />
                    Se encontra em nosso Gatil, damos muita atenção e cuidados, só que o nosso Gatil esta muito lotado e isso torna impossivel a sua 
                    estadia.<br />
                    <br />
                    Faça uma boa ação, adote uma vida, adote a Nanda.
                </div>  
                <!-- FIM DO COMENTARIO -->
           </div>
            <!-- FIM DA TELA 01 -->
            
            <!-- TELA DE CONFIRMAÇÃO -->
            	<div id="confirAdocao" class="esconde">
                	<div class="nota_informa" style=" width:95%;">
                    	<span>Atenção: Confira abaixo os dados do Animal que está prestes a ser adotado por Você. </span>
                    </div>
                    <br />
                    
              <table class="grid" style="width:60%;" align="center">
                    	<tr>
                        	<td width="18%" align="center" class="grid_titulo">Foto</td>
                            <td width="15%" align="center" class="grid_titulo">Cod</td>
                            <td width="27%" align="center" class="grid_titulo">Nome</td>
                            <td width="15%" align="center" class="grid_titulo">Ra�a</td>
                            <td width="14%" align="center" class="grid_titulo">Tipo</td>
                            <td width="11%" align="center" class="grid_titulo">Sexo</td>
                        </tr>
                        <tr class="td_escura">
                        	<td align="center"><img src="images/miniaturas/nanda.png" alt="locky" width="69" height="59" title="lucky" /></td>
                          <td align="center">002</td>
                            <td align="center">Nanda</td>
                            <td align="center">Comum</td>
                            <td align="center">Gato</td>
                            <td align="center">Femea</td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    
                   <span class="obrigatorio">* O seu pedido passará por uma triagem por nossos funcionarios.
                   </span>
                   <br />
                   <br />
                   
                   Termo de Responsabilidade de Ado��o<br />
                   <br />            
            <span style="overflow:auto; width:50%; height:100px; display:block; border-top:#CCC solid 1px; border-bottom:#CCC solid 1px; border-left:#CCC solid 1px;">
            	ds mlfkrlfml k jfklmklfmdklsf dfkmdsfklsm dfkdsfsk mdsçsdfm sdf sç<br />
                ds mlfkrlfml k jfklmklfmdklsf dfkmdsfklsm dfkdsfsk mdsçsdfm sdf sç<br />
                ds mlfkrlfml k jfklmklfmdklsf dfkmdsfklsm dfkdsfsk mdsçsdfm sdf sç<br />
                ds mlfkrlfml k jfklmklfmdklsf dfkmdsfklsm dfkdsfsk mdsçsdfm sdf sç<br />
                ds mlfkrlfml k jfklmklfmdklsf dfkmdsfklsm dfkdsfsk mdsçsdfm sdf sç<br />
                ds mlfkrlfml k jfklmklfmdklsf dfkmdsfklsm dfkdsfsk mdsçsdfm sdf sç<br />
                ds mlfkrlfml k jfklmklfmdklsf dfkmdsfklsm dfkdsfsk mdsçsdfm sdf sç<br />
                ds mlfkrlfml k jfklmklfmdklsf dfkmdsfklsm dfkdsfsk mdsçsdfm sdf sç<br />
                ds mlfkrlfml k jfklmklfmdklsf dfkmdsfklsm dfkdsfsk mdsçsdfm sdf sç<br />
                ds mlfkrlfml k jfklmklfmdklsf dfkmdsfklsm dfkdsfsk mdsçsdfm sdf sç<br />
                ds mlfkrlfml k jfklmklfmdklsf dfkmdsfklsm dfkdsfsk mdsçsdfm sdf sç<br />
                ds mlfkrlfml k jfklmklfmdklsf dfkmdsfklsm dfkdsfsk mdsçsdfm sdf sç<br />
                ds mlfkrlfml k jfklmklfmdklsf dfkmdsfklsm dfkdsfsk mdsçsdfm sdf sç<br />
            </span>   
            <br />
            <br /> 
            
            <table class="grid">
				<tr>
				  <td width="29%" align="right"><label for="aceitar">Li e aceito o Termo de Ado��o &nbsp;</label></td>
				  <td width="71%"><input type="checkbox" id="aceitar" /></td>
				</tr>
			</table>
            <br />
            <div style="width:50%; text-align:right;">
            	<img src="/images/botao/seta_left.png" alt="Voltar" title="Voltar" class="seta_link" onclick="mostra('confirAdocao','dadosInicio');" />&nbsp;&nbsp;
                <img src="/images/botao/bt_continuar.png" alt="ok" title="Continuar" class="seta_link" id="continuar" onmouseover="focoBt('continuar');" onmouseout="bt('continuar');" onclick="mostra('confirAdocao','confirmacao')" />
            </div> 
                              
                </div>
            <!-- FIM DA CONFIRMAÇÃO --> 
            
            <!-- FINALIZAR -->
            	<div id="confirmacao" class="esconde">
                	<div class="nota_informa">
                   		<span>Transação realizada com Sucesso!</span> 
                    </div>
                  	<br />
                    
                    <div style="width:80%; color:#F60; border:#CCC solid 2px; line-height:20px; padding:10px 5px 5px 30px;"><br />
                        Assim que o seu pedido for aprovado, você receberá uma notifica��o por email, somente após isso será
                         possivel dar continuaidade ao processo de adoção.<br /><br />
                         Você tambem pode acompanhar o processo atravez do seu "Painel de Controle".
                  </div>
                </div>
            <!-- fINALIZAR -->   
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
                        	<td width="29%" align="right"><img src="/images/botao/ico_email.png" alt="Mensagem" title="Mensagem" class="seta_link" /> &nbsp;</td>
                            <td width="71%"><a href="/Painel_controle/Usuario/centro_msg.html"><span class="obrigatorio">0</span> Mensagem(s) Nova(s)</a></td>
                        </tr>
                        <tr>
                        	<td align="right"><img src="/images/botao/ico_painel.png" alt="Painel" title="Ir para o Painel de Controle" class="seta_link" /> &nbsp;</td>
                            <td><a href="/Painel_controle/Usuario/index.html">Meu Painel de Controle</a></td>
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