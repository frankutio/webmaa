<%@page contentType="text/html" pageEncoding="ISO-8859-1" %>
<%@page import="Entidade.Portal.Colaborador"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ong Amigos Fieis</title>

<link type="text/css" rel="stylesheet" href="/Painel_controle/Usuario/css/geral.css" />
<link type="text/css" rel="stylesheet" href="/Painel_controle/Usuario/css/estilos.css" />
<link type="text/css" rel="stylesheet" href="/Painel_controle/Usuario/css/menu_drop.css" />

<script type="text/javascript" src="/Painel_controle/Usuario/js/jquery.js"></script>
<script type="text/javascript" src="/Painel_controle/Usuario/js/utilidades.js"></script>
<script type="text/javascript" src="/Painel_controle/Usuario/js/maskedinput.js"></script>
<script type="text/javascript" src="/Painel_controle/Usuario/js/menuSuper.js"></script>

<script>
function focoBt(id){
		if(id ==="doar"){
		$("#"+id).attr("src","/Painel_controle/Usuario/images/botao/bt_doar_light.png");
	}
	
	else if(id ==="logoff"){
		$("#"+id).attr("src","/Painel_controle/Usuario/images/botao/bt_logoff_light.png");
	}
	
	else if(id ==="alterar"){
		$("#"+id).attr("src","/Painel_controle/Usuario/images/botao/bt_alterar_light.png");
	}
	
	else if(id ==="cancelar"){
		$("#"+id).attr("src","/Painel_controle/Usuario/images/botao/bt_cancelar_light.png");
	}
}

function bt(id){
		if(id ==="doar"){
		$("#"+id).attr("src","/Painel_controle/Usuario/images/botao/bt_doar.png");
	}
	
	else if(id ==="logoff"){
		$("#"+id).attr("src","/Painel_controle/Usuario/images/botao/bt_logoff.png");
	}
	
	else if(id ==="alterar"){
		$("#"+id).attr("src","/Painel_controle/Usuario/images/botao/bt_alterar.png");
	}
	
	else if(id ==="cancelar"){
		$("#"+id).attr("src","/Painel_controle/Usuario/images/botao/bt_cancelar.png");
	}
}

$(document).ready(function(){

    preencheEspecie();
	preencheSexo();
	preencheLaudo();
	preencheVacina();
});

function preencheEspecie(){

    var esp = "${AnimalEdita.especie}";

    if(esp == "Gato"){

        $("#esp_gato").attr("checked",true);
    }
    else if(esp == "Cao"){

        $("#esp_cao").attr("checked",true);
    }
}

function preencheSexo(){

    var sexo = "${AnimalEdita.sexo}";

    if(sexo == "Macho"){

        $("#m").attr("checked",true);
    }
    else if(sexo == "Femea"){

        $("#f").attr("checked",true);
    }
}

function preencheLaudo(){

    var laudo = "${AnimalEdita.laudoVeterinario}";

    if(laudo == "Sim"){

        $("#laudo_sim").attr("selected",true);
    }
    else if(laudo == "Nao"){

        $("#laudo_nao").attr("selected",true);
    }
}

function preencheVacina(){

    var vacina = "${AnimalEdita.vacinado}";

    if(vacina == "Sim"){

        $("#vacina_sim").attr("selected",true);
		$("#doses_usr").show();
    }
    else if(vacina == "Nao"){

        $("#vacina_nao").attr("selected",true);
    }
}

function submeter(){
  url = "/GerAnimal?operacao=edita_Animal_painel&fotoAnimal=${AnimalEdita.endFoto}&especie=${AnimalEdita.especie}";

  $("#cadastroColabAnl").attr("action",url);
  document.cadastro.submit();
}
</script>

</head>

<body>

<!-- Corpo da pagina -->
<div id="corpo">
<!-- div com o topo do site -->

<div id="faixaTopo">
		<div class="imgBannerLeft"><img src="/Painel_controle/Usuario/images/topo1.png" alt="logo" title="Logo" class="seta_link" /></div>
        <div class="imgBannerRight"></div>   	
</div>

<!-- div com o banner -->

<div id="faixaBanner">
	<div class="imgBannerInfLeft"><img src="/Painel_controle/Usuario/images/topo2.png" alt="Logo" title="Logo" class="seta_link" /></div>
    <div class="imgBannerInfRight"></div>
</div>

<!-- div Status -->

<div id="faixaStatus">
<table class="grid" style=" margin-top:-6px;">
	<tr>
    	<td align="right">
            <c:if test="${Log.login != null}">
                <img src="/images/botao/bt_logoff.png" alt="Sair" title="Sair" class="seta_link" id="logoff" onmouseover="focoBt('logoff');" onmouseout="bt('logoff');" onclick="window.location='/logoff?operacao=sair';" />
            </c:if>
       </td>
    </tr>
</table>
</div>


<!-- Menu do site Horizontal -->

<div id="menu">
	<div class="menuDrop">
		<ul>
			<li><a href="/index.jsp" onfocus="limpaMenu();"><span>Inicio</span></a></li>
    		<li><a href="/noticias.jsp" onfocus="limpaMenu();"><span>Notícias</span></a></li>
            <li><a href="/denuncia.jsp" onfocus="limpaMenu();"><span>Den&uacute;ncias</span></a></li>
            <li id="adotar" class="" onmouseover="setaClass('adotar');" onmouseout="retiraClass('adotar');"><a href="#" onfocus="ativa('adotar','drop');"><span>Adotar</span></a>
    			<ul class="drop">
        			<li id="gato" class=""><a href="/listaAnimal?operacao=lista_gato" onfocus="ativaLight('gato');">Gato</a></li>
    				<li id="cao" class=""><a href="/listaAnimal?operacao=lista_cao" onfocus="ativaLight('cao');">Cachorro</a></li>
        		</ul>
    		</li>            
    		<li><a href="/direito_animal.jsp" onfocus="limpaMenu();"><span>Direito Animal</span></a></li>
    		<li><a href="/cadastro.jsp" onfocus="limpaMenu();"><span>Cadastre-se</span></a></li>
            <li><a href="/GerAnimal?operacao=iniciar_cad" onfocus="limpaMenu();"><span>Doar</span></a></li>
            <li><a href="/final_feliz/index.jsp" onfocus="limpaMenu();"><span>Final Feliz</span></a></li>
<li><a href="/fale_conosco.jsp" onfocus="limpaMenu();"><span>Fale Conosco</span></a></li>
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
			<div class="bordaFaixaPainel_left"><span><img src="/Painel_controle/Usuario/images/botao/ico_painel.png" alt="Painel" title="" style=" float:left; text-align:left; padding-right:5px;" /> Bem Vindo fulano@gmail.com - &nbsp;&nbsp; Painel de Controle</span></div>
                <br />          
            
                
            <!-- FOTO DO USUARIO -->            
            <div id="foto">
            	<img src="/${AnimalEdita.especie}/images/miniaturas/${AnimalEdita.endFoto}" />
            </div>
            <!-- FOTO -->
            
            <!-- DADOS DO USUARIO -->            
            <div id="dadosUsuario">
             <br />
            <span class="obrigatorio">* Campos de Preenchimento Obrigat&oacute;rio</span>
          <form name="cadastro" method="post" action="" id="cadastroColabAnl" onsubmit="return submeter();" enctype="multipart/form-data">
              <input type="hidden" name="codUsr" value="${Colaborador.codigo}" />
              <input type="hidden" name="codigo" value="${AnimalEdita.codigo}" />
              

          <table class="grid">
            	<tr>
                	<td width="28%" align="right"><span class="obrigatorio">*</span> Esp&eacute;cie: &nbsp;</td>
                    <td colspan="3">
                   	  <input type="radio" name="especie1" value="Gato" id="esp_gato" disabled  /> Gato &nbsp; &nbsp; <input type="radio" name="especie1" value="Cao" id="esp_cao" disabled /> Cachorro
                    </td>
                </tr>
                <tr>
                	<td align="right"><span class="obrigatorio">*</span> Ra&ccedil;a: &nbsp;</td>
                    <td colspan="3">
                   	 <select name="raca">
                        	<option></option>
                                <c:forEach items="${lstRaca}" var="lstRaca">
                                     <option value="${lstRaca.codigo}"
                                     <c:if  test="${AnimalEdita.codigoRaca == lstRaca.codigo}">
                                         selected ="${lstRaca.descricao}"
                                      </c:if>   > ${lstRaca.descricao}</option>
                                </c:forEach>

                        </select>
                    </td>
                </tr>
                <tr>
                	<td align="right"><span class="obrigatorio">*</span> Nome: &nbsp;</td>
                  <td colspan="3"><input type="text" name="nome" size="30" value="${AnimalEdita.nome}" /></td>
            </tr>
                <tr>
                	<td align="right">Idade Aproximada: &nbsp;</td>
				  <td colspan="3"><input type="text" name="idade" size="5" value="${AnimalEdita.idade}" /></td>
                </tr>
                <tr>
                	<td align="right"><span class="obrigatorio">*</span> Cor Predominante: &nbsp;</td>
				  <td width="19%">
                  	<select name="cor1">
                    	<option></option>
                        <c:forEach items="${lstCor}" var="lstCor">
                              <option value="${lstCor.codigo}"
                              <c:if  test="${AnimalEdita.cor1 == lstCor.codigo}">
                                   selected ="${lstCor.cor}"
                              </c:if>   > ${lstCor.cor}</option>
                         </c:forEach>
                    </select>
                  </td>
                    <td width="18%" align="right">2&ordf; Cor: &nbsp;</td>
                  <td width="35%">
                      <select name="cor2">
                    	<option></option>
                         <c:forEach items="${lstCor}" var="lstCor">
                              <option value="${lstCor.codigo}"
                              <c:if  test="${AnimalEdita.cor2 == lstCor.codigo}">
                                   selected ="${lstCor.cor}"
                              </c:if>   > ${lstCor.cor}</option>
                         </c:forEach>
                    </select>
                  </td>
                </tr>
                <tr>
                	<td align="right"><span class="obrigatorio">*</span> Pelagem: &nbsp;</td>
					<td colspan="3">
                   	 <select name="pelagem">
                        	<option></option>
                                <c:forEach items="${lstPelagem}" var="lstPelagem">
                                      <option value="${lstPelagem.codigo}"
                                      <c:if  test="${AnimalEdita.codigoPelagem == lstPelagem.codigo}">
                                           selected ="${lstPelagem.pelagem}"
                                      </c:if>   > ${lstPelagem.pelagem}</option>
                                 </c:forEach>
                        </select>
                    </td>
                </tr>
                 <tr>
                        	<td align="right"><span class="obrigatorio">*</span> Porte: &nbsp;</td>
                            <td colspan="3">
                            <select name="porte">
                            	<option></option>
                                    <c:forEach items="${lstPorte}" var="lstPorte">
                                      <option value="${lstPorte.codigo}"
                                      <c:if  test="${AnimalEdita.porte == lstPorte.codigo}">
                                           selected ="${lstPorte.porte}"
                                      </c:if>   > ${lstPorte.porte}</option>
                                 </c:forEach>
                                </select>
                          </td>
                      </tr>
                <tr>
                	<td align="right"><span class="obrigatorio">*</span> Sexo: &nbsp;</td>
                <td align="center"><label>Macho <input type="radio" name="sexo" value="Macho" id="m" /></label></td>
                  <td colspan="2"><label>Femea <input type="radio" name="sexo" value="Femea" id="f" /></label></td>
                </tr>
                
                <tr>
                	<td align="right">Foto: &nbsp;</td>
                  <td colspan="3"><input type="file" name="foto" /></td>
                </tr>
            </table>
            <br />
            <h3>Dados Complementares</h3>
            <br />
<table class="grid">                	
                    <tr>
                    	<td align="right">Animal com certificado/Laudo Veterin&aacute;rio? &nbsp;</td>
                        <td colspan="3">
                       	  <select name="laudo">
                            	<option value="0">&nbsp;</optgroup>
                                <option value="Sim" id="laudo_sim">SIM</optgroup>
                                <option value="Nao" id="laudo_nao">N&atilde;O</optgroup>
                            </select>
                        </td>
                    </tr>
                    <tr>
                    	<td align="right">Animal Vacinado? &nbsp;</td>
                        <td width="61%" colspan="3">
                       	  <select name="vacina" onchange="validaVacina_usr();">
                            	<option value="0">&nbsp;</option>
                                <option value="Sim" id="vacina_sim">SIM</option>
                                <option value="Nao" id="vacina_nao">N&atilde;O</option>
                            </select>
                        </td>
                    </tr>
                    <tr class="esconde" id="doses_usr">
                        	<td align="right">Especifique as Doses:</td>
                          	<td><textarea rows="3" cols="30" name="descricaoVacina">${AnimalEdita.descricaoVacina}</textarea></td>
                    </tr>
                    <tr>
                    	<td align="right">Forma de Envio: &nbsp;</td>
                        <td colspan="3">
                       	  <select name="formaEnvio">
                            	<option></option>
                                    <c:forEach items="${lstEnvio}" var="lstEnvio">
                                      <option value="${lstEnvio.codigo}"
                                      <c:if  test="${AnimalEdita.codigoFormaEnvio == lstEnvio.codigo}">
                                           selected ="${lstEnvio.envio}"
                                      </c:if>   > ${lstEnvio.envio}</option>
                                 </c:forEach>
                            </select>
                        </td>
                    </tr>
                </table>
            <br />
            <h3>Descri&ccedil;&atilde;o/Coment&aacute;rio</h3>
            <br />
            Descreva o seu bichinho mais detalhadamente ou deixe um comentario sobre ele, isso ajuda na hora da ado&ccedil;&atilde;o.<br /><br />
            <textarea rows="5" cols="55" name="descricao">${AnimalEdita.descricao}</textarea>
           
            <br />          
            <br />
            <div align="center">
                     	<input type="image" src="/Painel_controle/Usuario/images/botao/bt_alterar.png" alt="Alterar" title="Alterar" id="alterar" onmouseover="focoBt('alterar');" onmouseout="bt('alterar');" />&nbsp; &nbsp;
                        <a href="PainelControle?operacao=exibirPainel&colaborador=${Colaborador.codigo}"><img src="/Painel_controle/Usuario/images/botao/bt_cancelar.png" alt="Cancelar" title="Cancelar" class="seta_link" id="cancelar" onmouseover="focoBt('cancelar');" onmouseout="bt('cancelar');" /></a>
                        
           </div>
            </form>
          </div>            
            <!-- DADOS DO USUARIO -->
            
            <div class="clear"></div>
            
            <!-- CONTEUDO DO PAINEL -->
            <div id="cont_painel">
            	
                
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
                        	<td width="29%" align="right"><a href="cad_edit.html"><img src="/Painel_controle/Usuario/images/botao/editar.png" alt="Alterar Cadastro" title="Alterar Cadastro" class="seta_link" /></a> &nbsp;</td>
                            <td width="71%"><a href="/NavUsr?operacao=alterar_cad">Alterar Cadastro</a></td>
                        </tr>
                        <tr>
                        	<td align="right"><a href="index.html"><img src="images/botao/ico_painel.png" alt="painel de Controle" title="Painel de Controle" class="seta_link" /></a> &nbsp;</td>
                            <td><a href="PainelControle?operacao=exibirPainel&colaborador=${Colaborador.codigo}">Painel de Controle</a></td>
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

<!-- RodapÃ© -->

<div id="rodape">
	sdjlarpq
</div>

</body>

</html>