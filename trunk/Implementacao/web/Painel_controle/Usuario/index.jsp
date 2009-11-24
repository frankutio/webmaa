<%@page contentType="text/html" pageEncoding="ISO-8859-1" %>
<%@page import="Entidade.Portal.Colaborador"%>
<%@page import="Entidade.Portal.Animais"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ong Amigos Fieis</title>

<link type="text/css" rel="stylesheet" href="/WebMAATeste/Painel_controle/Usuario/css/geral.css" />
<link type="text/css" rel="stylesheet" href="/WebMAATeste/Painel_controle/Usuario/css/estilos.css" />
<link type="text/css" rel="stylesheet" href="/WebMAATeste/Painel_controle/Usuario/css/menu_drop.css" />

<script type="text/javascript" src="/WebMAATeste/Painel_controle/Usuario/js/jquery.min.js"></script>

<script type="text/javascript" src="/WebMAATeste/Painel_controle/Usuario/js/jquery.js"></script>
<script type="text/javascript" src="/WebMAATeste/Painel_controle/Usuario/js/utilidades.js"></script>
<script type="text/javascript" src="/WebMAATeste/Painel_controle/Usuario/js/maskedinput.js"></script>
<script type="text/javascript" src="/WebMAATeste/Painel_controle/Usuario/js/menuSuper.js"></script>

<script type="text/javascript" src="/WebMAATeste/Painel_controle/Usuario/js/modal.js"></script>
<link type="text/css" rel="stylesheet" href="/WebMAATeste/Painel_controle/Usuario/css/estilo_modal.css" />

<script>
function focoBt(id){
		if(id ==="doar"){
		$("#"+id).attr("src","/WebMAATeste/Painel_controle/Usuario/images/botao/bt_doar_light.png");
	}
	
	else if(id ==="logoff"){
		$("#"+id).attr("src","/WebMAATeste/Painel_controle/Usuario/images/botao/bt_logoff_light.png");
	}
	
	else if(id ==="ok"){
		$("#"+id).attr("src","/WebMAATeste/Painel_controle/Usuario/images/botao/bt_ok_light.png");
	}
}

function bt(id){
		if(id ==="doar"){
		$("#"+id).attr("src","/WebMAATeste/Painel_controle/Usuario/images/botao/bt_doar.png");
	}
	
	else if(id ==="logoff"){
		$("#"+id).attr("src","/WebMAATeste/Painel_controle/Usuario/images/botao/bt_logoff.png");
	}
	
	else if(id ==="ok"){
		$("#"+id).attr("src","/WebMAATeste/Painel_controle/Usuario/images/botao/bt_ok.png");
	}
}
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
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
    	<td align="right">
            <c:if test="${Log.login != null}">
                <img src="/WebMAATeste/images/botao/bt_logoff.png" alt="Sair" title="Sair" class="seta_link logoff" onclick="window.location='logoff?operacao=sair';" />
            </c:if>
       </td>
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
			<div class="bordaFaixaPainel_left"><span><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/ico_painel.png" alt="Painel" title="" style=" float:left; text-align:left; padding-right:5px;" /> Bem Vindo  - &nbsp;&nbsp; Painel de Controle</span></div>
                <br />          
            
                
            <!-- FOTO DO USUARIO -->            
            <div id="foto">
                <img src="/WebMAATeste/Painel_controle/Usuario/foto/${Colaborador.endFoto}" />
            </div>
            <!-- FOTO -->
            
            <!-- DADOS DO USUARIO -->            
            <div id="dadosUsuario">
            	               
                
                <%
                if(request.getAttribute("Altera") != null){
                    out.print("<br />" +
                     "<span style='color:#090;'> <img src='/WebMAATeste/Painel_controle/Usuario/images/botao/aprova.png' />" +
                     request.getAttribute("Altera") +
                     "</span> <br />");
                }
                %>
               
                <p>
                    <br />
   	    <table class="grid">
                    	<tr>
                        	<td width="24%" align="right">Cod. de Usu&aacute;rio: &nbsp;</td>
                            <td width="76%" colspan="2"><strong>${Colaborador.codigo}</strong></td>
                        </tr>
                        <tr>
                        	<td width="24%" align="right">Nome: &nbsp;</td>
                            <td width="76%" colspan="2"><strong>${Colaborador.nome}</strong></td>
                        </tr>
                        <tr>
                        	<td width="24%" align="right">Avalia&ccedil;&atilde;o: &nbsp;</td>
                            <c:if test="${empty Avaliacao}">
                            <td valign="top" align="center">&nbsp;</td>
                            <td width="76%">                  
                                    Não existem processos para avaliar
                            </td>
                            </c:if>
                            <c:if test="${!empty Avaliacao}">
                            <td valign="top" align="center" style="background:#EEE;"><span class="obrigatorio">${Tamanho}</span></td>
                            <td width="76%">
                                    &nbsp; <a href="/WebMAATeste/gerProcesso?operacao=ver_avaliacao&cod_colaborador=${Colaborador.codigo}">Processo(s) para Avaliação</a>
                             </td>
                             </c:if>
                        </tr>
                    </table>
                </p>
          </div>            
            <!-- DADOS DO USUARIO -->
            
            <div class="clear"></div>
            
            <!-- CONTEUDO DO PAINEL -->
            <div id="cont_painel">
            	<div class="bloco_left">
                	<div align="center"><a href="#alt_foto" name="modal">Alterar Foto</a></div>
                    <br />
                    <br />
                    
                  <div class="bordaFaixaLeft"><span>Arquivo</span></div>
              	<br />
                 <table class="grid">
                    <c:if test="${empty Msg}">
                        <tr>
                        	<td width="29%" align="right"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/ico_email.png" alt="Mensagem" title="Ver Mensagem" />&nbsp;</td>
                            <td width="71%">Nenhuma Mensagem</td>
                        </tr>
                     </c:if>
                     <c:if test="${!empty Msg}">
                       <tr>
                        	<td width="29%" align="right"><a href="#mensagem" name="modal"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/ico_email.png" alt="Mensagem" title="Ver Mensagem" class="seta_link" /></a> &nbsp;</td>
                            <td width="71%"><a href="#mensagem" name="modal">Mensagens</a> <span class="obrigatorio">${qtd}</span></td>
                        </tr>
                     </c:if>
                    </table>
                
                </div>

                <c:if test="${empty listaAnimal}">
                    <div class="bloco_centro sistema">
                        <h2>Doa&ccedil;&atilde;o</h2>
                        <p>
                            Caso tenha algum animal que voc&ecirc; queira doar para alguem, o mesmo pode ser cadastrado ao lado, no quadro "Doa&ccedil;&atilde;" clique no bot&atilde;o "Doar" para cadastrar o seu animal.
                        </p>
                    </div>
                </c:if>
                <c:if test="${!empty listaAnimal}">
                    <div class="bloco_centro sistema">
                        <h2>Doa&ccedil;&atilde;o</h2>
                        <p>
                            Você poderá editar o(s) seu(s) animal(is) cadastro(s) na coluna "Doa&ccedil;&atilde;o."
                        </p>
                    </div>
                </c:if>
              
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
                        	<td width="29%" align="right"><a href="/WebMAATeste/Painel_controle/Usuario/cad_edit.jsp"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/editar.png" alt="Alterar Cadastro" title="Alterar Cadastro" class="seta_link" /></a> &nbsp;</td>
                            <td width="71%"><a href="/WebMAATeste/NavUsr?operacao=alterar_cad">Alterar Cadastro</a></td>
                        </tr>
                    </table>
                    
              </div>
             <!-- LOGIN -->
             <br />
             <div class="bordaFaixaLeft"><span>Acompanhar</span></div>
              	<br />
               
               <table class="grid">
               		<tr>
                    	<td><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/ico_acmp.png" alt="Ver AdoÃ§Ã£o" title="Acompanhar AdoÃ§Ã£o" class="seta_link"  /></td>
                        <td><a href="/WebMAATeste/gerProcesso?operacao=ver_adocao&cod_colaborador=${Colaborador.codigo}">Acompanhar Ado&ccedil;&atilde;o</a></td>
                    </tr>
                    <tr>
                    	<td><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/ico_acmp.png" alt="Ver AdoÃ§Ã£o" title="Acompanhar AdoÃ§Ã£o" class="seta_link"  /></td>
                        <td><a href="/WebMAATeste/gerProcesso?operacao=listar_animais&cod_colaborador=${Colaborador.codigo}">Acompanhar Doa&ccedil;&otilde;es</a></td>
                    </tr>
				</table>				
               <br />
             <div class="bordaFaixaLeft"><span>Doa&ccedil;&atilde;o</span></div>
              	<br />
               
               <table class="grid">
                   <c:if test="${empty listaAnimal}">
                       <tr>
                    	<td valign="top"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/alert.png" alt="alerta" title="alerta" /></td>
                        <td>Nenhum Animal Cadastrado para Ado&ccedil;&atilde;o</td>
                    </tr>
                     <tr>
                 	<td colspan="2" align="center">
                    <a href="/WebMAATeste/Painel_controle/Usuario/cad_animal.html"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/bt_doar.png" alt="Cadatrar Animal Para DoaÃ§Ã£o" title="Cadatrar Animal Para DoaÃ§Ã£o" class="seta_link" id="doar" onmouseover="focoBt('doar');" onmouseout="bt('doar');" /></a></td>
                 </tr>
                   </c:if>
                   <c:if test="${!empty listaAnimal}">
                       <tr>
                    	<td valign="top" align="center" style="background:#EEE;"><span class="obrigatorio">${QtdAnimal}</span></td>
                        <td><a href="#listaCad_animal" name="modal">Animal(is) Cadastrado(s)</a></td>
                 </tr>
                 <tr>
                 	<td colspan="2" align="center">&nbsp;</td>
                 </tr>
                   </c:if>
               		
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

<div id="boxes">
			<!-- Janela Modal com caixa de diÃ¡logo (ALTERAR FOTO)-->  
                    
					<div id="alt_foto" class="window" >
                    
  						<div class="cont_modal">                        	
                                                           
                            <!-- DETALHES DA MENSAGEM -->
                                <div id="conteudoDetalhe">
                                   
                                    <br />
                                    <form name="altFoto" action="PainelControle?operacao=alterar_foto&codigo=${Colaborador.codigo}" method="post" enctype="multipart/form-data">
                                    
                                                                      
                                     <table class="grid" style="font-size:14px;">
                                     	<tr>
                                        	<td colspan="2">Procure por uma nova foto.</td>
                                        </tr>
                                     	<tr>
                                        	<td align="right">Anexar: &nbsp;</td>
                                            <td><input type="file" name="foto" /></td>
                                        </tr>
                                        <tr>
                                        	<td colspan="2">&nbsp;</td>
                                        </tr>
                                         <tr>
                                        	<td colspan="2" align="center">
                                            <input type="image" src="/WebMAATeste/Painel_controle/Usuario/images/botao/bt_ok.png" alt="Ok" title="Ok" class="seta_link" id="ok" onmouseover="focoBt('ok');" onmouseout="bt('ok');" />
                                           </td>
                                        </tr>
                                     </table>
                    				</form>
                                    
                                    <br />
                                    <br />
                                    
                                    <div align="right">
                                    	<img src="/WebMAATeste/Painel_controle/Usuario/images/botao/fechar.png" alt="Fechar" title="Fechar Janela" class="seta_link close" />
                                    </div>
                                    
                                </div>
                            <!-- DETALHES DA MENSAGEM -->
                        </div>

					</div>
					<!-- Fim Janela Modal com caixa de diÃ¡logo (ALTERAR FOTO) -->
                    
                    
                    <!-- Janela Modal com caixa de diÃ¡logo (CENTRO DE MENSAGENS)-->  
                    
					<div id="mensagem" class="window" >
                    
  						<div class="cont_modal">                        	
                                                           
                            <!-- DETALHES DA MENSAGEM -->
                                <div id="conteudoDetalhe">
                                   <div class="bordaFaixaLeft" style="width:95%; margin-left:2%;">
                                   		<span>Centro de Mensagens</span>
                                   </div>
                                    <br />
                                    
                                     Ol&aacute; ${Colaborador.nome}, Voc&ecirc; tem <span class="obrigatorio">${qtd}</span> Mensagem(s) Nova(s)
                                     <br />
                                     <br />                                    
                    					<table class="grid" style=" width:98%;">
                                        	<tr>
                                            	<td width="6%" align="center" class="grid_titulo">De</td>
                                                <td width="63%" align="center" class="grid_titulo">Assunto</td>
                                                <td width="15%" align="center" class="grid_titulo">Data</td>
                                                <td width="6%" align="center" class="grid_titulo">Ler</td>
                                                <td width="10%" align="center" class="grid_titulo">Excluir</td>
                                          </tr>
                                          <c:forEach items="${Msg}" var="Not">
                                              <tr class="td_escura">
                                            	<td align="center">
                                                    <c:if test="${Not.remetenteNotificacao == 'Sim'}">
                                                        <img src="/WebMAATeste/Painel_controle/Usuario/images/botao/ico_painel2.png" />
                                                    </c:if>
                                                     <c:if test="${Not.remetenteNotificacao == 'Nao'}">
                                                        <img src="/WebMAATeste/Painel_controle/Usuario/images/botao/ico_ong.png" />
                                                    </c:if>
                                                </td>
                                                <td align="center"><a href="#" name="popUp" onclick="MM_openBrWindow('Mensagem?operacao=lerMsg&codigoMsg=${Not.codigo}','','status=yes,scrollbars=yes,width=600,height=400')">${Not.assunto}</a></td>
                                                <td align="center">${Not.dataCadastroString}</td>
                                                <td align="center"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/ler_email.png" alt="Ler Email" title="Ler Email" class="seta_link" onclick="MM_openBrWindow('Mensagem?operacao=lerMsg&codigoMsg=${Not.codigo}','','status=yes,scrollbars=yes,width=600,height=400');" /></td>
                                                <td align="center"><a href="Mensagem?operacao=apagaMsg&codigoMsg=${Not.codigo}&colaborador=${Not.codigoColaborador}&dispara=painel"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/ico_delete.png" alt="Excluir" title="Excluir" class="seta_link" /></a></td>
                                             </tr>
                                          </c:forEach>  
                                        </table>
                                     <br />
                                        
                                          Legenda:

                               <table style=" width:98%;">
                                     	<tr>
                                        	<td width="5%" align="center"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/ico_painel2.png" /></td>
                                            <td width="34%">Msg Enviada pelo Sistema</td>
                                            <td width="5%" align="center"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/ico_ong.png" /></td>
                                            <td width="56%">Msg Enviada pela Ong</td>
                                        </tr>
                                        <tr>
                                        	<td width="5%" align="center"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/ler_email.png" /></td>
                                            <td width="34%">Mensagem</td>
                                            <td width="5%" align="center">&nbsp;</td>
                                            <td width="56%">&nbsp;</td>
                                        </tr>
                                     </table>
                                     
                                    <br />
                                    <br />
                                    
                                    <div align="right">
                                    	<img src="/WebMAATeste/Painel_controle/Usuario/images/botao/fechar.png" alt="Fechar" title="Fechar Janela" class="seta_link close" />
                                    </div>
                                    
                                </div>
                            <!-- DETALHES DA MENSAGEM -->
                        </div>

					</div>
					<!-- Fim Janela Modal com caixa de diÃ¡logo (CENTRO DE MENSAGENS) -->

                    <!-- Janela Modal com caixa de diálogo (CADASTRO DE ANIMAIS)-->

					<div id="listaCad_animal" class="window" >

                    

  						<div class="cont_modal">

                            <div class="bordaFaixaLeft" style="width:95%; margin-left:2%;">
                            	<span>Cadastro de Animais</span>
                            </div>
                            <br />

                            <!-- DETALHES DA MENSAGEM -->
                                <div id="conteudoDetalhe">

                                    <p>
                                    	Nesta tela é possivel a alteração dos dados ou ate mesmo a exclusão de animais cadastrados por Você.
                                    </p>

                                    <br />

                                     <table class="grid" style="width:90%;" align="center">
                                        <tr>
                                            <td width="14%" align="center" class="grid_titulo">Foto</td>
                                            <td width="8%" align="center" class="grid_titulo">Cod</td>
                                            <td width="21%" align="center" class="grid_titulo">Nome</td>
                                            <td width="17%" align="center" class="grid_titulo">Raça</td>
                                            <td width="10%" align="center" class="grid_titulo">Tipo</td>
                                            <td width="9%" align="center" class="grid_titulo">Sexo</td>
                                            <td width="10%" align="center" class="grid_titulo">Editar</td>
                                            <td width="11%" align="center" class="grid_titulo">Excluir</td>

                                        </tr>
                                        <c:forEach items="${listaAnimal}" var="Animal">
                                      <tr class="td_escura">
                                            <td align="center"><img src="/WebMAATeste/${Animal.especie}/images/miniaturas/${Animal.endFoto}" alt="${Animal.nome}" width="69" height="59" title="${Animal.nome}" /></td>
                                            <td align="center">${Animal.codigo}</td>
                                            <td align="center">${Animal.nome}</td>
                                            <c:forEach items="${lstRaca}" var="lstRaca">
                                                <c:if test="${Animal.codigoRaca == lstRaca.codigo}">
                                                    <td align="center">${lstRaca.descricao}</td>
                                                </c:if>
                                           </c:forEach>
                                            <td align="center">${Animal.especie}</td>
                                            <td align="center">${Animal.sexo}</td>
                                            <td align="center"><a href="/WebMAATeste/GerAnimal?operacao=exibir_dados_animal&codigo=${Animal.codigo}"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/editar.png" alt="Editar" title="Editar" class="seta_link" /></a></td>
                                            <td align="center"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/close.png" alt="Excluir" title="Excluir" class="seta_link" onclick="confirmaExclusao('${Animal.codigo}');" /></td>
                                        </tr>
                                       </c:forEach>
                    				</table>

                                    <br />
                                    <br />

                                    <div align="right">
                                    	<img src="/WebMAATeste/Painel_controle/Usuario/images/botao/fechar.png" alt="Fechar" title="Fechar Janela" class="seta_link close" />
                                    </div>

                                </div>
                            <!-- DETALHES DA MENSAGEM -->
                        </div>

					</div>
					<!-- Fim Janela Modal com caixa de diálogo (CADASTRO DE ANIMAIS) -->
                    
                    <div id="mask"></div> 
 </div>
</body>

</html>