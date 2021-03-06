<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ong Amigos Fieis</title>

<link type="text/css" rel="stylesheet" href="/WebMAA/css/geral.css" />
<link type="text/css" rel="stylesheet" href="/WebMAA/css/estilos.css" />
<link type="text/css" rel="stylesheet" href="/WebMAA/css/menu_drop.css" />

<script type="text/javascript" src="/WebMAA/js/jquery.js"></script>
<script type="text/javascript" src="/WebMAA/js/utilidades.js"></script>
<script type="text/javascript" src="/WebMAA/js/maskedinput.js"></script>
<script type="text/javascript" src="/WebMAA/js/menuSuper.js"></script>

<script type="text/javascript">
<!--
function focoBt(id){
	
	if(id ==="adota"){
		$("#"+id).attr("src","/WebMAA/images/botao/bt_adotar_light.png");
	}
	else if(id ==="logoff"){
		$("#"+id).attr("src","/WebMAA/images/botao/bt_logoff_light.png");
	}
	else if(id ==="continuar"){
		$("#"+id).attr("src","/WebMAA/images/botao/bt_continuar_light.png");
	}
}

function bt(id){
	if(id ==="adota"){
		$("#"+id).attr("src","/WebMAA/images/botao/bt_adotar.png");
	}
	else if(id ==="logoff"){
		$("#"+id).attr("src","/WebMAA/images/botao/bt_logoff.png");
	}
	else if(id ==="continuar"){
		$("#"+id).attr("src","/WebMAA/images/botao/bt_continuar.png");
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
		<div class="imgBannerLeft"><img src="/WebMAA/images/topo1.png" alt="logo" title="Logo" class="seta_link" /></div>
        <div class="imgBannerRight" style="background:url(/WebMAA/images/topo_gato4.png) no-repeat right bottom;"></div>
</div>

<!-- div com o banner -->

<div id="faixaBanner">
	<div class="imgBannerInfLeft"><img src="/WebMAA/images/topo2.png" alt="Logo" title="Logo" class="seta_link" /></div>
    <div class="imgBannerInfRight" style="background:url(/WebMAA/images/topo_gato3.png) no-repeat right;"></div>
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
    		<li><a href="/WebMAA/noticias.jsp" onfocus="limpaMenu();"><span>Not�cias</span></a></li>
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
<li><a href="/WebMAA/fale_conosco.jsp" onfocus="limpaMenu();"><span>Fale Conosco</span></a></li>
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
          
          <!-- TELA DE CONFIRMA��O -->
            	<div id="confirAdocao">
                    <form name="AbrirProcesso" action="GerAnimal" method="post">

                    	<input type="hidden" name="operacao" value="adotar" />
                        <input type="hidden" name="colaborador" value="${Colaborador.codigo}" />
                        <input type="hidden" name="codigoAnimal" value="${DetalharAnimal.codigo}" />
                        <input type="hidden" name="proprietario" value="${DetalharAnimal.codigoUsuario}" />

                    
                	<div class="nota_informa" style=" width:95%;">
                    	<span>Aten��o: Confira abaixo os dados do Animal que est� prestes a ser adotado por Voc�. </span>
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
                        	<td align="center"><img src="/WebMAA/${DetalharAnimal.especie}/images/miniaturas/${DetalharAnimal.endFoto}" alt="${DetalharAnimal.nome}" width="69" height="59" title="${DetalharAnimal.nome}" /></td>
                          <td align="center">${DetalharAnimal.codigo}</td>
                            <td align="center">${DetalharAnimal.nome}</td>
                            <td align="center">
                                <c:forEach items="${lstRaca}" var="lstRaca">
                                    <c:if test="${DetalharAnimal.codigoRaca == lstRaca.codigo}">
                                        ${lstRaca.descricao}
                                    </c:if>
                                </c:forEach>
                            </td>
                            <td align="center">${DetalharAnimal.especie}</td>
                            <td align="center">${DetalharAnimal.sexo}</td>
                        </tr>
                    </table>
                    <br />
                    <br />

                   <table class="grid">
                   	<tr>
                    	<td width="56%">Deseja enviar uma mensagem pessoal ao dono do animal? &nbsp;</td>
                    	<td width="10%"><label>N�o <input type="radio" name="msg" value="nao" checked="checked" onclick="esconde('text');" /></label></td>
                        <td width="34%"><label>Sim <input type="radio" name="msg" value="sim" onclick="mostrar('text');" /></label></td>
                    </tr>
                    <tr class="esconde" id="text">
                    	<td colspan="4"><textarea name="mensagemPessoal" rows="4" cols="50"></textarea></td>
                    </tr>
                  </table>

                   Termo de Responsabilidade de Ado��o<br />
                   <br />
            <span style="overflow:auto; width:50%; height:100px; display:block; border-top:#CCC solid 1px; border-bottom:#CCC solid 1px; border-left:#CCC solid 1px;">
            	ds mlfkrlfml k jfklmklfmdklsf dfkmdsfklsm dfkdsfsk mds�sdfm sdf s�<br />
                ds mlfkrlfml k jfklmklfmdklsf dfkmdsfklsm dfkdsfsk mds�sdfm sdf s�<br />
                ds mlfkrlfml k jfklmklfmdklsf dfkmdsfklsm dfkdsfsk mds�sdfm sdf s�<br />
                ds mlfkrlfml k jfklmklfmdklsf dfkmdsfklsm dfkdsfsk mds�sdfm sdf s�<br />
                ds mlfkrlfml k jfklmklfmdklsf dfkmdsfklsm dfkdsfsk mds�sdfm sdf s�<br />
                ds mlfkrlfml k jfklmklfmdklsf dfkmdsfklsm dfkdsfsk mds�sdfm sdf s�<br />
                ds mlfkrlfml k jfklmklfmdklsf dfkmdsfklsm dfkdsfsk mds�sdfm sdf s�<br />
                ds mlfkrlfml k jfklmklfmdklsf dfkmdsfklsm dfkdsfsk mds�sdfm sdf s�<br />
                ds mlfkrlfml k jfklmklfmdklsf dfkmdsfklsm dfkdsfsk mds�sdfm sdf s�<br />
                ds mlfkrlfml k jfklmklfmdklsf dfkmdsfklsm dfkdsfsk mds�sdfm sdf s�<br />
                ds mlfkrlfml k jfklmklfmdklsf dfkmdsfklsm dfkdsfsk mds�sdfm sdf s�<br />
                ds mlfkrlfml k jfklmklfmdklsf dfkmdsfklsm dfkdsfsk mds�sdfm sdf s�<br />
                ds mlfkrlfml k jfklmklfmdklsf dfkmdsfklsm dfkdsfsk mds�sdfm sdf s�<br />
            </span>
            <br />
            <br />

            <table class="grid">
				<tr>
				  <td width="29%" align="right"><label for="aceitar">Li e aceito o Termo de Ado��o &nbsp;</label></td>
				  <td width="71%"><input type="checkbox" id="aceitar" name="termoAceito" value="true" /></td>
				</tr>
			</table>
            <br />
            <div style="width:50%; text-align:right;">
            	<img src="/WebMAA/images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link" onclick="mostra('confirAdocao','dadosInicio');" />&nbsp;&nbsp;
                <input type="image" src="/WebMAA/images/botao/bt_continuar.png" alt="ok" title="Continuar" class="seta_link" id="continuar" onmouseover="focoBt('continuar');" onmouseout="bt('continuar');" />
            </div>
            
			</form>
                </div>
            <!-- FIM DA CONFIRMA��O -->
            
             
         		 <br />                
          		<br />          
	  	  </div>
            
			<div id="colunaRight">
            
            <c:if test="${Log.login == null}">
                <!-- LOGIN -->
            	<div class="login">
					<div class="bordaFaixaLeft"><span>Login</span></div>
                	<br />

                    <form action="/WebMAA/NavUsr" name="logar" method="post" class="link">

                    	<input type="hidden" name="operacao" value="login" />
                        <input type="hidden" name="dispara" value="listaAnimal?operacao=lista_gato" />

                    	<table class="grid" width="100%">
                        	<tr>
                            	<td>E-mail <br />
                                	<input type="text" name="login" size="15"  /></td>
                            </tr>
                            <tr>
                            	<td>CPF <br />
                                	<input type="text" name="cpf" size="17" class="cpf" /></td>
                            </tr>
                        </table>
                        <br />
                        <div align="center">
                        <input type="image" src="/WebMAA/images/botao/check.png" onmouseover="troca('buscaBotao');" onmouseout="volta('buscaBotao');" id="buscaBotao" title="Buscar"  />
                        </div>
                        <br />
                        <span class="obrigatorio">
                            <%
                            if(request.getAttribute("MsgErro") != null) {
                              out.print(request.getAttribute("MsgErro"));
                            }
                            %>
                        </span>
                        <br />

                    </form>
                </div>
             <!-- LOGIN -->
            </c:if>
            <c:if test="${Log.login != null}">
                <!-- LOGIN -->

            	<div class="login" style="font-size:10px;">
					<div class="bordaFaixaLeft"><span>Login</span></div>
                	<br />
              <table class="grid">
                    	<tr>
                            <td align="center" colspan="2">${Colaborador.email}</td>
                        </tr>
                        <tr>

                            <td align="center" colspan="2">&nbsp;</td>
                        </tr>
                         <c:if test="${empty Msg}">
                            <tr>
                                <td width="29%" align="right"><img src="/WebMAA/images/botao/ico_email.png" alt="Mensagem" title="Mensagem" /> &nbsp;</td>
                                <td width="71%"> Nenhuma Mesagem</td>
                            </tr>
                        </c:if>
                        <c:if test="${!empty Msg}">
                            <tr>
                                <td width="29%" align="right"><img src="/WebMAA/images/botao/ico_email.png" alt="Mensagem" title="Mensagem" class="seta_link" /> &nbsp;</td>
                                <td width="71%"><a href="/WebMAA/Mensagem?operacao=abrirCentro&colaborador=${Colaborador.codigo}"><span class="obrigatorio">${qtd}</span> Mensagen(s) Nova(s)</a></td>
                            </tr>
                        </c:if>
                        <tr>

                        	<td align="right"><img src="/WebMAA/images/botao/ico_painel.png" alt="Painel" title="Ir para o Painel de Controle" class="seta_link" /> &nbsp;</td>
                            <td><a href="/WebMAA/PainelControle?operacao=exibirPainel&colaborador=${Colaborador.codigo}">Meu Painel de Controle</a></td>
                        </tr>
                    </table>

              </div>
             <!-- LOGIN -->

            </c:if>
                
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