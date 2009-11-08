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

<script type="text/javascript" src="/WebMAATeste/Painel_controle/Usuario/js/jquery.min.js"></script>

<script type="text/javascript" src="/WebMAATeste/Painel_controle/Usuario/js/jquery.js"></script>
<script type="text/javascript" src="/WebMAATeste/Painel_controle/Usuario/js/utilidades.js"></script>
<script type="text/javascript" src="/WebMAATeste/Painel_controle/Usuario/js/maskedinput.js"></script>
<script type="text/javascript" src="/WebMAATeste/Painel_controle/Usuario/js/menuSuper.js"></script>

<script type="text/javascript" src="/WebMAATeste/Painel_controle/Usuario/js/modal.js"></script>
<link type="text/css" rel="stylesheet" href="css/estilo_modal.css" />


<script>
function focoBt(id){
	if(id ==="doar"){
		$("#"+id).attr("src","/WebMAATeste/Painel_controle/Usuario/images/botao/bt_doar_light.png");
	}
	
	else if(id ==="logoff"){
		$("#"+id).attr("src","/WebMAATeste/Painel_controle/Usuario/images/botao/bt_logoff_light.png");
	}
	
	else if(id ==="aprovar"){
		$("#"+id).attr("src","/WebMAATeste/Painel_controle/Usuario/images/botao/bt_aprovar_light.png");
	}
	
	else if(id ==="ok"){
		$("#"+id).attr("src","/WebMAATeste/Painel_controle/Usuario/images/botao/bt_ok_light.png");
	}
	
	else if(id ==="ok1"){
		$("#"+id).attr("src","/WebMAATeste/Painel_controle/Usuario/images/botao/bt_ok_light.png");
	}
	
	else if(id ==="ok2"){
		$("#"+id).attr("src","/WebMAATeste/Painel_controle/Usuario/images/botao/bt_ok_light.png");
	}
	
	else if(id ==="cancelar"){
		$("#"+id).attr("src","/WebMAATeste/Painel_controle/Usuario/images/botao/bt_cancelar_light.png");
	}
}

function bt(id){
	if(id ==="doar"){
		$("#"+id).attr("src","/WebMAATeste/Painel_controle/Usuario/images/botao/bt_doar.png");
	}
	
	else if(id ==="logoff"){
		$("#"+id).attr("src","/WebMAATeste/Painel_controle/Usuario/images/botao/bt_logoff.png");
	}
	else if(id ==="aprovar"){
		$("#"+id).attr("src","/WebMAATeste/Painel_controle/Usuario/images/botao/bt_aprovar.png");
	}
	
	else if(id ==="ok"){
		$("#"+id).attr("src","/WebMAATeste/Painel_controle/Usuario/images/botao/bt_ok.png");
	}
	
	else if(id ==="ok1"){
		$("#"+id).attr("src","/WebMAATeste/Painel_controle/Usuario/images/botao/bt_ok.png");
	}
	
	else if(id ==="ok2"){
		$("#"+id).attr("src","/WebMAATeste/Painel_controle/Usuario/images/botao/bt_ok.png");
	}
	
	else if(id ==="cancelar"){
		$("#"+id).attr("src","/WebMAATeste/Painel_controle/Usuario/images/botao/bt_cancelar_vermelho.png");
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
			<li><a href="../../index.jsp" onfocus="limpaMenu();"><span>Inicio</span></a></li>            
    		<li><a href="#" onfocus="limpaMenu();"><span>Notícias</span></a></li>
            <li><a href="#" onfocus="limpaMenu();"><span>Denúncias</span></a></li>
            <li id="adotar" class="" onmouseover="setaClass('adotar');" onmouseout="retiraClass('adotar');"><a href="#" onfocus="ativa('adotar','drop');"><span>Adotar</span></a>
    			<ul class="drop">
        			<li id="gato" class=""><a href="../../gato/listaGato.jsp" onfocus="ativaLight('gato');">Gato</a></li>
    				<li id="cao" class=""><a href="#" onfocus="ativaLight('cao');">Cachorro</a></li>
        		</ul>
    		</li>
    		<li><a href="#" onfocus="limpaMenu();"><span>Direito Animal</span></a></li>
    		<li><a href="../../cadastro.jsp" onfocus="limpaMenu();"><span>Cadastre-se</span></a></li>
            <li><a href="cad_animal.jsp" onfocus="limpaMenu();"><span>Doar</span></a></li>
            <li><a href="../../final_feliz/index.jsp" onfocus="limpaMenu();"><span>Final Feliz</span></a></li>
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
			<div class="bordaFaixaPainel_left"><span><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/ico_painel.png" alt="Painel" title="" style=" float:left; text-align:left; padding-right:5px;" /> Acompanhar Adoção - &nbsp;&nbsp; Painel de Controle</span></div>
                <br />          
            
                <div class="nota_informa">
                    	<span>Bem Vindo à página de acompanhamento de adoção.</span><br />                        
          </div>
            <!-- FOTO DO USUARIO -->            
            <div id="foto">
           	  <img src="/WebMAATeste/${Animal.especie}/images/miniaturas/${Animal.endFoto}" />
            </div>
            <!-- FOTO -->
            
            <!-- DADOS DO USUARIO -->            
            <div id="dadosUsuario">           
            
            <!-- fase 01 -->
            <div id="fase01">

            <table width="80%">
				<tr>
				  <td width="28%"><h2>Fase 1/3</h2></td>
					<td width="72%"><span id="fase1_completa" class="escondeFase"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/aprova.png" /> &nbsp;Concluida!</span></td>
				</tr>
			</table>
            
            <br />       
            <div class="nota_destaque">Dado(s) do(s) Enteressado(s)</div> 
            <br />
            
            <p>
            	${Colaborador.nome}, abaixo segue a lista de enteressados na adoção.<br />
                <br />
                Somente 1 pessoa poderá adotar o seu animal, por isso pense bem e analise todos os casos com cuidado.<br />
                Apos a escolha da pessoa, selecione a coluna corespendente a mesma e clique em "Aprovar".<br /><br />
                
                <span class="obrigatorio">Os demais usuarios, caso haja mais de 1, recebera um email informando a sua decisão.<br />
                Você tambem podera mandar uma Mensagem personalizada caso assim desseje.</span>
                <br>
                    
            </p>    
            <br />
   	    <table class="grid" style="width:100%;">
                    	<tr>
                            <td width="8%" align="center" class="grid_titulo">Cod</td>
                            <td width="38%" align="center" class="grid_titulo">Nome</td>
                            <td width="10%" align="center" class="grid_titulo">Idade</td>
                            <td width="13%" align="center" class="grid_titulo">Sexo</td>
                            <td width="17%" align="center" class="grid_titulo">Mensagem</td>
                            <td width="14%" align="center" class="grid_titulo">Detalhar</td>
                            <td width="14%" align="center" class="grid_titulo">Selecionar</td>
                        </tr>
                        <c:forEach items="${Processos}" var="sup">
                            <tr>
                              <td align="center">${sp.colaborador.codigo}</td>
                                <td align="center">${sp.colaborador.nome}</td>
                                <td align="center">${sp.colaborador.dataNascimento}</td>
                                <td align="center">
                                    <c:if test="${sp.colaborador.sexo == 'M'}">
                                        Masculino
                                    </c:if>
                                    <c:if test="${sp.colaborador.sexo == 'F'}">
                                        Feminino
                                    </c:if>
                                </td>
                                <td align="center">
                                    <c:if test="${sp.processo.mensagem == null}">
                                        0
                                    </c:if>
                                    <c:if test="${sp.processo.mensagem != null}">
                                        <span class="obrigatorio">1</span>
                                    </c:if>
                                </td>
                                <td align="center"><a href="#detalhar" name="modal" onclick="mostra('${sp.colaborador.codigo}')"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/zoom.png" alt="Detalhar" title="Detalhar" class="seta_link" /></a></td>
                                <td align="center"><input type="radio" name="usr" id="usr" value="${sp.processo.codigo}" /></td>
                            </tr>
                        </c:forEach>
                        <tr>
                          <td align="center">001</td>
                            <td align="center">Maria Fulana Aparecida</td>
                            <td align="center">23</td>
                            <td align="center">Feminino</td>
                            <td align="center">0</td>
                            <td align="center"><a href="#detalhar" name="modal"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/zoom.png" alt="Detalhar" title="Detalhar" class="seta_link" /></a></td>
                            <td align="center"><input type="radio" name="usr" id="usr" /></td>
                        </tr>
                        <tr class="td_escura">
                          <td align="center">001</td>
                            <td align="center">José Sicrano Aparecido</td>
                            <td align="center">44</td>
                            <td align="center">Masculino</td>
                            <td align="center"><span class="obrigatorio">1</span></td>
                            <td align="center"><a href="#detalharMsg" name="modal"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/zoom.png" alt="Detalhar" title="Detalhar" class="seta_link" /></a></td>
                            <td align="center"><input type="radio" name="usr" id="usrMsg" /></td>
                        </tr>
                    </table>
                    <div align="center" style="width:95%;">
                    	<a href="#confirm_Aprovacao" name="modal"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/bt_aprovar.png" id="aprovar" onmouseover="focoBt('aprovar');" onmouseout="bt('aprovar');" class="seta_link" alt="Aprovar" title="Aprovar" /></a>
                    </div>
                    <br />
                    
                    
                    
                    </div>
                    <!-- fase 01 -->
                    
                    <!-- FASE 02 -->
                    <div id="fase02" class="escondeFase">
                    	<table width="80%">
							<tr>
				  				<td width="28%"><h2>Fase 2/3</h2></td>
								<td width="72%"><span id="fase2_completa" class="escondeFase"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/aprova.png" /> &nbsp;Concluida!</span></td>
							</tr>
						</table>
                        
                        <br />
                        
                        Informamos ao usuario José Sicrano a sua aprovação em relação a essa adoção.<br />
                        Assim que o usuario der continuidade ao processo, você será notificado e poderá finalizar a sua doação.
                        <br />
                        <br />
                        
                        prazo Previsto para que o usuario possa dar uma resposta: <span class="obrigatorio" onclick="aprova();">48 Horas</span> .
                        <br />
                        
                        <div class="nota_informa" style="width:98%;">
                        	<span>Aguarde até que o usuario dê uma resposta. </span>
                        </div>
                        
                        <div class="nota_destaque" style="width:98%;">Dados do Usuario</div>
                        <br />
                        
                        
                        <table class="grid" style="width:98%;">
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
							<td align="center">José Sicrano Aparecido</td>
							<td align="center">QND 45 Casa 03</td>
							<td align="center">7200000</td>
							<td align="center">DF</td>
							<td align="center">sicano@email.com</td>
							<td align="center">61 3397-2895</td>
						</tr>
					</table>
                    <div align="right" style="width:95%;">
                    	<img src="/WebMAATeste/Painel_controle/Usuario/images/botao/bt_cancelar_vermelho.png" id="cancelar" onmouseover="focoBt('cancelar');" onmouseout="bt('cancelar');" class="seta_link" alt="Cancelar" title="Cancelar esta Adoção" onclick="cancel_adocao();" />
                    </div>
                    <br />
                    
                    <div id="aprovado" class="escondeFase">
                    
                    	<span style="color:#060; font-size:14px;"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/aprova.png" /> &nbsp; Parabéns Fulano, O processo de adoçaõ foi aceito pelo usuario.</span>
                        <br />
                        <br />
                        
                        Agora podemos dar continuidade...
                        <br />
                        
                        <div class="nota_informa" style="width:98%;">
                        	<span class="obrigatorio">Atenção: Entre em contato com o interessado atravez de um dos dados fornecidos acima e negocie a entrega do seu animal.</span>
                        </div>
                        
                        Após a entrega do animal você deve retornar a esta pagina e finalizar este procedimento.
                        <br />
                        <br />
                        
                        <table class="grid">
                        	<tr>
                            	<td width="72%"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/alert.png" /> &nbsp; Afirmo que ja entreguei o animal ao Enteressado:</td>
                              <td width="28%" valign="bottom"><input type="checkbox" onclick="finaliarCheck();" /></td>
                          </tr>
                        </table>
                         <div align="center" style="width:95%;">
                    		<input type="image" src="/WebMAATeste/Painel_controle/Usuario/images/botao/bt_finalizar.png" alt="Finalizar" title="Finalizar Adoção" onclick="mostrar('fase03'); mostrar('fase2_completa');" disabled="disabled" id="btFinalizar" />
                    	</div>
                        
                    </div>
                    
                    </div>
                    <!-- FASE 02 -->
                    
                    <!-- Fase 03 -->
                    	<div id="fase03" class="escondeFase">
                        	<table width="80%">
							<tr>
				  				<td width="28%"><h2>Fase 3/3</h2></td>
								<td width="72%"><span id="fase3_completa" class="escondeFase"><img src="images/botao/aprova.png" /> &nbsp;Concluida!</span></td>
							</tr>
						</table>
                               
                               <div class="nota_informa">
                               		<span>Avalie o Processo com o Usuario.</span>
                               </div>
                               
                               <form name="fase03">
<table class="grid">
                               		<tr>
                                    	<td colspan="2"><span class="obrigatorio">Essa avaliação é muito importante para que nos posssamos saber se o processo foi como você esperava.</span></td>
                                    </tr>
                                    <tr>
                                    	<td colspan="2">&nbsp;</td>
                                    </tr>
                                    <tr>
                                    	<td width="54%" align="right">O usuario atendeu as suas expectativas? &nbsp;</td>
                                        <td width="46%" align="left">
                                        	<select name="entrega">
                                            	<option value="0" selected="selected">:: Selecione ::</option>
                                                <option value="1">Sim</option>
                                                <option value="2">Não</option>
                                            </select>
                                        </td>
                                    </tr>                                    
                                    <tr>
                                    	<td colspan="2">&nbsp;</td>
                                    </tr>
                                    <tr>
                                    	<td colspan="2">Conte para agante como foi a sau experiencia com a Adoção:</td>
                                    </tr>
                                    <tr>
                                    	<td colspan="2"><textarea rows="5" cols="60" id="coment"></textarea></td>
                                    </tr>
                               </table>
                               </form>  
                               
                                   <br /><br />
                          
                               <div id="avaliacao">
                               		<p> Escolha o tipo de Avaliação</p>
                                    <br />
                               <div align="center" style="width:90%;">
                					<input type="image" src="/WebMAATeste/Painel_controle/Usuario/images/botao/bt_positiva.png" alt="Positiva" title="Positiva" onclick="mostra('avaliacao','positiva');"  /> &nbsp;&nbsp;
                                    <input type="image" src="/WebMAATeste/Painel_controle/Usuario/images/botao/bt_negativa.png" alt="Negativa" title="Negativa" onclick="mostra('avaliacao','negativa'); " />
                				</div>
                                </div>
                                
                                <br />
                                <!-- AVALIAÇÃO POSITIVA -->
                                <div id="positiva" class="esconde">
                                	<span class="obrigatorio">Pontuação de 1 a 5</span>
                                    <br />
                                    
                                    <img src="/WebMAATeste/Painel_controle/Usuario/images/botao/avaliação.png" />
                                    <br />
                                    
                                     <div align="center" style="width:90%;">
                                     	<img src="/WebMAATeste/Painel_controle/Usuario/images/botao/bt_ok.png" alt="Ok" title="Ok" class="seta_link" id="ok1" onmouseover="focoBt('ok1');" onmouseout="bt('ok1');" onclick="window.alert('Processo Realizado com Sucesso'); window.location='index.html';" />
                					</div> 
                                    
                                </div>
                                <!-- AVALIAÇÃO POSITIVA -->
                                
                                <!-- AVALIAÇÃO NEGATIVA -->
                                <div id="negativa" class="esconde">
                                	<span class="obrigatorio">Informe o motivo da Negativação</span>
                                    <br />
                                    
                                    <table class="grid">
                                    	<tr>
                                        	<td width="26%" align="right" valign="top"><span class="obrigatorio">*</span> Justificativa: &nbsp;</td>
                                          <td width="74%"><textarea rows="5" cols="40"></textarea></td>
                                      </tr>
                                    </table>
                                    <br />
                                    
                                     <div align="center" style="width:90%;">
                                     	<img src="/WebMAATeste/Painel_controle/Usuario/images/botao/bt_ok.png" alt="Ok" title="Ok" class="seta_link" id="ok2" onmouseover="focoBt('ok2');" onmouseout="bt('ok2');" onclick="window.alert('Processo Realizado com Sucesso'); window.location='index.html';" />
                					</div> 
                                </div>                
                               <!-- AVALIAÇÃO NEGATIVA -->
                        </div>
                    <!-- Fase 03 -->
                    
          </div>            
            <!-- DADOS DO USUARIO -->
            
            <div class="clear"></div>
            
            
                           
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
                            <td width="71%"><a href="cad_edit.html">Alterar Cadastro</a></td>
                        </tr>
                        <tr>
                        	<td align="right"><a href="senha_edit.html"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/senha.png" alt="Alterar Aenha" title="Alterar Senha" class="seta_link" /></a> &nbsp;</td>
                            <td><a href="senha_edit.html">Alterar Senha</a></td>
                        </tr>
                        <tr>
                        	<td align="right"><a href="index.html"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/ico_painel.png" alt="painel de Controle" title="Painel de Controle" class="seta_link" /></a> &nbsp;</td>
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
                    	<td><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/ico_acmp.png" alt="Ver Adoção" title="Acompanhar Adoção" class="seta_link" /></td>
                        <td><a href="#">Acompanhar Adoção</a></td>
                    </tr>
               </table> 
               <br />
             <div class="bordaFaixaLeft"><span>Doação</span></div>
              	<br />
               
               <table class="grid">
               		<tr>
                    	<td valign="top" align="center" style="background:#EEE;"><span class="obrigatorio">1</span></td>
                        <td><a href="#listaCad_animal" name="modal">Animal Cadastrado</a></td>
                 </tr>
                 <tr>
                 	<td colspan="2" align="center">&nbsp;</td>
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

<div id="boxes">
                    <!-- Janela Modal com caixa de diálogo -->  
                    
					<div id="detalhar" class="window" >
  						<div class="cont_modal">

                            <div id="${sp.colaborador.codigo}" class="esconde">
                        	
                            <div class="bordaFaixaLeft" style="width:95%; margin-left:2%;">
                            	<span>Detalhes do Usuário</span>
                            </div>
                            <br />
                            
                        	<!-- FOTO DO USUARIO -->            
            					<div id="foto">
           	  						<img src="/WebMAATeste/Painel_controle/Usuario/foto/fotoUsr.png" />
            					</div>
            				<!-- FOTO -->
                            
                            <!-- DADOS DO USUARIO -->            
            					<div id="dadosUsuario" style="width:370px;">
                                		<h3 class="titulo3">${sp.colaborador.nome}</h3>
                                        <table class="grid dadosModal" width="100%">
                                        	<tr>
                                            	<td width="24%" align="right">Cod: &nbsp;</td>
                                                <td width="76%"><strong>${sp.colaborador.codigo}</strong></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Idade: &nbsp;</td>
                                                <td><strong>${sp.colaborador.dataNascimento}</strong></td>
                                          </tr>
                                            <tr>
                                            	<td align="right">Sexo: &nbsp;</td>
                                                <td><strong>${sp.colaborador.sexo}</strong></td>
                                          </tr>
                                          <tr>
                                            	<td align="right">Estado: &nbsp;</td>
                                                <td><strong>${sp.colaborador.uf}</strong></td>
                                          </tr>
                                        </table>
                                </div>
                            <!-- DADOS DO USUARIO -->
                             
                                <div class="clear"></div>
                                
                            <!-- DETALHES DA PETIÇÃO -->
                                <div id="conteudoDetalhe">
                                	<br />
                                    <br />
                                    
                                    <p>
                                    	${sp.colaborador.nome}, demonstrou enteresse em seu animal. <br />
                                        
                                    </p>
                                    <span class="obrigatorio" style="font-size:14px">Mensagem Pessoal enviada por ${sp.colaborador.nome}.</span>
                                    
                                    <br />
                                    <br />
                                    
                                    <textarea rows="5" cols="60" readonly="readonly">${sp.processo.mensagem}</textarea>
                                    
                                    <br />
                                    <br />
                                   <span class="escondeFase obrigatorio" id="usrReprovado"><img src="/WebMAATeste/Painel_controle/Usuario/images/botao/alert.png" alt="alerta" title="alerta" /> &nbsp; Usuario Negado. </span>
                                   
                                   <br />

                                    <br />
                                    
                                    <div align="right">
                                    	<img src="/WebMAATeste/Painel_controle/Usuario/images/botao/fechar.png" alt="Fechar" title="Fechar a Janela" class="seta_link close" />
                                    </div>
                                </div>
                            <!-- DETALHES DA PETIÇÃO -->
                        </div>

                        </div>

					</div>
					<!-- Fim Janela Modal com caixa de diálogo -->
                    
                    <!-- Janela Modal com caixa de diálogo (Usuario com MSG)-->  
                    
					<div id="detalharMsg" class="window" >
  						<div class="cont_modal">
                        	
                            <div class="bordaFaixaLeft" style="width:95%; margin-left:2%;">
                            	<span>Detalhes do Usuário</span>
                            </div>
                            <br />
                            
                        	<!-- FOTO DO USUARIO -->            
            					<div id="foto">
           	  						<img src="/WebMAATeste/Painel_controle/Usuario/foto/fotoUsr.png" />
            					</div>
            				<!-- FOTO -->
                            
                            <!-- DADOS DO USUARIO -->            
            					<div id="dadosUsuario" style="width:370px;">
                                		<h3 class="titulo3">José Sicrano Aparecido</h3>
                                        <table class="grid dadosModal" width="100%">
                                        	<tr>
                                            	<td width="24%" align="right">Cod: &nbsp;</td>
                                                <td width="76%"><strong>002</strong></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Idade: &nbsp;</td>
                                                <td><strong>44</strong></td>
                                          </tr>
                                            <tr>
                                            	<td align="right">Sexo: &nbsp;</td>
                                                <td><strong>Masculino</strong></td>
                                          </tr>
                                          <tr>
                                            	<td align="right">Estado: &nbsp;</td>
                                                <td><strong>DF</strong></td>
                                          </tr>
                                        </table>
                                </div>
                            <!-- DADOS DO USUARIO -->
                             
                                <div class="clear"></div>
                                
                            <!-- DETALHES DA PETIÇÃO -->
                                <div id="conteudoDetalhe">
                                	<br />
                                    <br />
                                    
                                    <p>
                                    	José Sicrano Aparecido, demonstrou enteresse em seu animal. <br />
                                        
                                    </p>
                                    <span class="obrigatorio" style="font-size:14px">Mensagem Pessoal enviada por José.</span>
                                    
                                    <br />
                                    <br />
                                    
                                    <textarea rows="5" cols="60" readonly="readonly" >Gosto muito de gatos e a minha filha quando viu o seu ficou apaixonada por ele. Moramos numa casa bem protegida e queremos muito esse gato.</textarea>
                                    
                                    <br />
                                    <br />
                                    <span class="escondeFase" id="usrAprovado" style="color:#060;"><img src="images/botao/aprova.png" alt="alerta" title="alerta" /> &nbsp; Usuario Escolhido por Você. </span>
                                    
                                    <br />
                                    <br />
                                    
                                    <div align="right">
                                    	<img src="/WebMAATeste/Painel_controle/Usuario/images/botao/fechar.png" alt="Fechar" title="Fechar a Janela" class="seta_link close" />
                                    </div>
                                </div>
                            <!-- DETALHES DA PETIÇÃO -->
                        </div>

					</div>
					<!-- Fim Janela Modal com caixa de diálogo (Usuario com MSG) -->
                    
                    
                    <!-- Janela Modal com caixa de diálogo (CONFRM DE APROVAÇÃO)-->  
                    
					<div id="confirm_Aprovacao" class="window"  >
  						<div class="cont_modal">
                        	
                            <div class="bordaFaixaLeft" style="width:95%; margin-left:2%;">
                            	<span>Mensagem de Reprovação</span>
                            </div>
                            <br /> 
                                
                            <!-- DETALHES DA MENSAGEM -->
                                <div id="conteudoDetalhe">
                           	  <div class="nota_informa" style="width:98%;">
                                    	<span>Será enviada uma mensagem com a sua decisão aos demais usuarios.</span>
                                    </div>
                                    
                                    <p>
                                    	<span class="obrigatorio">Os usuarios que não foram escolhidos por você, receberão um email informando a sua escolha.</span>
                                        <br />
                                        
                                       <br />
                                       
                                       Enviaremos a seguinte Mensagem:<br /><br />
                                    </p>
                                    
                                    <font style="color:#003;">Infelizmente o seu pedido de Adoção para o gato <span style="text-decoration:underline">Lucky</span> foi negado pelo Portador/Proprietário.<br />
                                    Caso tenha duvidas desse processo entre em contato com a nossa Ong para esclarecimentos.</font>
                                    
                                    <br />
                                    <br />
                                    Gostaria de explicar a sua decisao? então a descreva abaixo:
                                    <br />
                                    <br />
                                    <table class="grid" width="100%">
                                    	<tr>
                                        	<td width="19%" align="right" valign="top">Justificativa: &nbsp;</td>
                                          <td width="81%"><textarea name="textarea" cols="50" rows="3"></textarea></td>
                                      </tr>
                                        <tr>
                                        	<td>&nbsp;</td>
                                            <td>A justificativa não é Obrigatória.</td>
                                        </tr>
                                    </table>
                                    <br />
                                    <br />
                                    
                                    <div align="center">
                                    	<img src="/WebMAATeste/Painel_controle/Usuario/images/botao/bt_ok.png" alt="Ok" title="OK" class="seta_link close" onclick="aprovaUsr();" id="ok" onmouseover="focoBt('ok');" onmouseout="bt('ok');" />
                                    </div>
                                    <br />
                                    
                                </div>
                            <!-- DETALHES DA MENSAGEM -->
                        </div>

					</div>
					<!-- Fim Janela Modal com caixa de diálogo (CONFRM DE APROVAÇÃO ) -->
                    
                     <!-- Janela Modal com caixa de diálogo (CADASTRO DE ANIMAIS)-->  
                    
					<div id="listaCad_animal" class="window" >
                    
                    <script type="text/javascript">
						<!--
							function confirmDel(){
								if(confirm("Ao Excluir este animal o mesmo tambem será deletado da nossa base de dados. Deseja Realmente Excluir?")){
									alert("Animal Excluido com Sucesso");
									window.location="index.html";
								}
							}
						
						-->
					</script>
                    
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
                                        <tr class="td_escura">
                                            <td align="center"><img src="../../gato/images/miniaturas/loky.png" alt="locky" width="69" height="59" title="lucky" /></td>
                                          <td align="center">001</td>
                                            <td align="center">Lukcy</td>
                                            <td align="center">Comum</td>
                                            <td align="center">Gato</td>
                                            <td align="center">Macho</td>
                                            <td align="center"><img src="images/botao/editar.png" alt="Editar" title="Editar" class="seta_link" onclick="window.location='alt_animal.html';" /></td>
                                            <td align="center"><img src="images/botao/close.png" alt="Excluir" title="Excluir" class="seta_link" onclick="confirmDel();" /></td>
                                        </tr>
                    				</table>
                    
                                    <br />
                                    <br />
                                    
                                    <div align="right">
                                    	<img src="images/botao/fechar.png" alt="Fechar" title="Fechar Janela" class="seta_link close" />
                                    </div>
                                    <br />
                                    
                                </div>
                            <!-- DETALHES DA MENSAGEM -->
                        </div>

					</div>
					<!-- Fim Janela Modal com caixa de diálogo (CADASTRO DE ANIMAIS) -->
                    
                    <div id="mask"></div> 
 </div>
</body>

</html>