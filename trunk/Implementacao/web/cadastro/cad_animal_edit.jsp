<%@page import="Entidade.Portal.Colaborador"%>
<%
Colaborador usr = (Colaborador) session.getAttribute("Colaborador");
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Ong Amigos Fieis</title>

<link type="text/css" rel="stylesheet" href="/WebMAATeste/css/geral.css" />
<link type="text/css" rel="stylesheet" href="/WebMAATeste/css/jquery-ui-datepicker.css" />
<link type="text/css" rel="stylesheet" href="/WebMAATeste/css/estilos.css" />
<link type="text/css" rel="stylesheet" href="/WebMAATeste/css/menu_drop.css" />


<script type="text/javascript" src="/WebMAATeste/js/jquery.js"></script>
<script type="text/javascript" src="/WebMAATeste/js/utilidades.js"></script>
<script type="text/javascript" src="/WebMAATeste/js/maskedinput.js"></script>
<script type="text/javascript" src="/WebMAATeste/js/jquery-ui-datepicker.js"></script>
<script type="text/javascript" src="/WebMAATeste/js/menuSuper.js"></script>
<script type="text/javascript" src="/WebMAATeste/js/preenche_animal.js"></script>

<script>

$(document).ready(function(){

    preencheEspecie();
	preencheSexo();
	preencheLaudo();
	preencheVacina();
});

function focoBt(id){
	if(id ==="continuar"){
		$("#"+id).attr("src","/WebMAATeste/images/botao/bt_continuar_verde_light.png");
	}
	
	else if(id ==="limpar"){
		$("#"+id).attr("src","/WebMAATeste/images/botao/bt_limpar_light.png");
	}
}

function bt(id){
	if(id ==="continuar"){
		$("#"+id).attr("src","/WebMAATeste/images/botao/bt_continuar_verde.png");
	}
	
	else if(id ==="limpar"){
		$("#"+id).attr("src","/WebMAATeste/images/botao/bt_limpar.png");
	}
}

function preencheEspecie(){

    var esp = "${Animal.especie}";

    if(esp == "Gato"){

        $("#esp_gato").attr("checked",true);
    }
    else if(esp == "Cao"){

        $("#esp_cao").attr("checked",true);
    }
}

function preencheSexo(){

    var sexo = "${Animal.sexo}";

    if(sexo == "Macho"){

        $("#m").attr("checked",true);
    }
    else if(sexo == "Femea"){

        $("#f").attr("checked",true);
    }
}

function preencheLaudo(){

    var laudo = "${Animal.laudoVeterinario}";

    if(laudo == "Sim"){

        $("#laudo_sim").attr("selected",true);
    }
    else if(laudo == "Nao"){

        $("#laudo_nao").attr("selected",true);
    }
}

function preencheVacina(){

    var vacina = "${Animal.vacinado}";

    if(vacina == "Sim"){

        $("#vacina_sim").attr("selected",true);
		$("#doses_usr").show();
    }
    else if(vacina == "Nao"){

        $("#vacina_nao").attr("selected",true);
    }
}
</script>

</head>

<body>

<!-- Corpo da pagina -->
<div id="corpo">
<!-- div com o topo do site -->

<div id="faixaTopo">
		<div class="imgBannerLeft"><img src="/WebMAATeste/images/topo1.png" alt="logo" title="Logo" class="seta_link" /></div>
        <div class="imgBannerRight"></div>   	
</div>

<!-- div com o banner -->

<div id="faixaBanner">
	<div class="imgBannerInfLeft"><img src="/WebMAATeste/images/topo2.png" alt="Logo" title="Logo" class="seta_link" /></div>
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
			<li><a href="/WebMAATeste/index.jsp" onfocus="limpaMenu();"><span>Inicio</span></a></li>            
    		<li><a href="#" onfocus="limpaMenu();"><span>Notícias</span></a></li>
            <li><a href="#" onfocus="limpaMenu();"><span>Denúncias</span></a></li>
            <li id="adotar" class="" onmouseover="setaClass('adotar');" onmouseout="retiraClass('adotar');"><a href="#" onfocus="ativa('adotar','drop');"><span>Adotar</span></a>
    			<ul class="drop">
        			<li id="gato" class=""><a href="/WebMAATeste/gato/listaGato.jsp" onfocus="ativaLight('gato');">Gato</a></li>
    				<li id="cao" class=""><a href="#" onfocus="ativaLight('cao');">Cachorro</a></li>
        		</ul>
    		</li>
    		<li><a href="#" onfocus="limpaMenu();"><span>Direito Animal</span></a></li>
    		<li><a href="/WebMAATeste/cadastro.jsp" onfocus="limpaMenu();"><span>Cadastre-se</span></a></li>
            <li><a href="/WebMAATeste/cad_animal.jsp" onfocus="limpaMenu();"><span>Doar</span></a></li>
            <li><a href="/WebMAATeste/final_feliz/index.jsp" onfocus="limpaMenu();"><span>Final Feliz</span></a></li>
		</ul>
	</div>
</div>

<!-- CONTEUDO -->

<div id="conteudo">

	<span class="imgTopo_sem_coluna"></span>
	<div class="imgBase_sem_coluna">
	
	<!-- CONTEUDO AQUI -->
		<div id="cont">
        	<div style="text-align:center;"><img src="/WebMAATeste/images/imgTexto/cad_animal.png" alt="Cadastro" title="Cadastramento de Animais" /></div>
            <div class="nota_informa">
            	<span>Preencha os Campos da forma mais clara possivel e evite usar termos que poucas pessoas conhecem.</span>
            </div>
            
            <br />
            <span class="obrigatorio">* Campos de Preenchimento Obrigatório</span>
          <form name="cadastro" method="post" action="GerAnimal">
          
          <input type="hidden" name="codUsr" value="<%= usr.getCodigo() %>" />
          <input type="hidden" name="operacao" value="Listar_Cad" />
          <input type="hidden" name="dataCad" value="" id="data" />
          
          
          <table class="grid">
            	<tr>
                	<td width="18%" align="right"><span class="obrigatorio">*</span> Especie: &nbsp;</td>
                    <td colspan="3"><input type="radio" name="especie" value="Gato" id="esp_gato" /> Gato &nbsp; &nbsp; <input type="radio" name="especie" value="Cao" id="esp_cao" /> Cachorro</td>
                </tr>
                <tr>
                	<td align="right"><span class="obrigatorio">*</span> Raça: &nbsp;</td>
                    <td colspan="3">
                   	  <select name="raca">
                        	<option></option>
                                <c:forEach items="${lstRaca}" var="lstRaca">
                                     <option value="${lstRaca.codigo}"
                                     <c:if  test="${Animal.codigoRaca == lstRaca.codigo}">
                                         selected ="${lstRaca.descricao}"
                                      </c:if>   > ${lstRaca.descricao}</option>
                                </c:forEach>
                                    
                        </select>
                    </td>
                </tr>
                <tr>
                	<td align="right"><span class="obrigatorio">*</span> Nome: &nbsp;</td>
                  <td colspan="3"><input type="text" name="nome" size="30" value="${Animal.nome}" /></td>
            </tr>
                <tr>
                	<td align="right">Idade Aproximada: &nbsp;</td>
				  <td colspan="3"><input type="text" name="idade" size="5" value="${Animal.idade}" /></td>
                </tr>
                <tr>
                	<td align="right"><span class="obrigatorio">*</span> Cor Predominante: &nbsp;</td>
				  <td width="16%">
                  	<select name="cor1">
                    	<option></option>
                        <c:forEach items="${lstCor}" var="lstCor">
                              <option value="${lstCor.codigo}"
                              <c:if  test="${Animal.cor1 == lstCor.codigo}">
                                   selected ="${lstCor.cor}"
                              </c:if>   > ${lstCor.cor}</option>
                         </c:forEach>
                    </select>
                  </td>
                    <td width="9%" align="right">2ª Cor: &nbsp;</td>
                  <td width="57%">
                  	<select name="cor2">
                    	<option></option>
                         <c:forEach items="${lstCor}" var="lstCor">
                              <option value="${lstCor.codigo}"
                              <c:if  test="${Animal.cor2 == lstCor.codigo}">
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
                                      <c:if  test="${Animal.codigoPelagem == lstPelagem.codigo}">
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
                                      <c:if  test="${Animal.porte == lstPorte.codigo}">
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
                	<td colspan="4"><span class="obrigatorio">Atenção: Caso queira colocar uma foto do animal a mesma deve ter o formato X e tamanho maximo de XMB</span></td>
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
                    	<td align="right">Animal com certificado/Laudo Veterianário? &nbsp;</td>
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
                        <td width="65%">
                       	  <select name="vacina" onchange="validaVacina_usr();">
                            	<option value="0">&nbsp;</option>
                                <option value="Sim" id="vacina_sim">SIM</option>
                                <option value="Nao" id="vacina_nao">N&atilde;O</option>
                            </select>
                        </td>
                    </tr>
                    <tr class="esconde" id="doses_usr">
                        	<td align="right">Especifique as Doses:</td>
                          	<td><textarea rows="3" cols="30" name="descricaoVacina">${Animal.descricaoVacina}</textarea></td>
                    </tr>
                    <tr>
                    	<td align="right"><span class="obrigatorio">*</span> Forma de Envio: &nbsp;</td>
                        <td colspan="3">
                       	  <select name="formaEnvio">
                            	<option></option>
                                    <c:forEach items="${lstEnvio}" var="lstEnvio">
                                      <option value="${lstEnvio.codigo}"
                                      <c:if  test="${Animal.codEnvio == lstEnvio.codigo}">
                                           selected ="${lstEnvio.envio}"
                                      </c:if>   > ${lstEnvio.envio}</option>
                                 </c:forEach>
                            </select>
                        </td>
                    </tr>
                </table>
            <br />
            <h3>Descrição/Comentário</h3>
            <br />
            Descreva o seu bichinho mais detalhadamente ou deixe um comentario sobre ele, isso ajuda na hora na adoção.<br />
            <textarea rows="5" cols="75" name="descricao">${Animal.descricao}</textarea>
          
            <br />
             <br />
                   
            <div style="width:70%; text-align:right;">
              <input type="image" src="/WebMAATeste/images/botao/bt_continuar_verde.png" alt="ok" title="Continuar" class="seta_link" id="continuar" onmouseover="focoBt('continuar');" onmouseout="bt('continuar');" />
              &nbsp;&nbsp;
                <img src="/WebMAATeste/images/botao/bt_limpar.png" alt="Limpar" title="limpar" id="limpar" onmouseover="focoBt('limpar');" onmouseout="bt('limpar');" onclick="document.cadastro.reset();" class="seta_link" />&nbsp;&nbsp;
                <img src="/WebMAATeste/images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link" onclick="history.back();"  />
                
            </div>    	
	</form>		
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