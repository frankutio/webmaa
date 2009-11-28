<%@page import="Entidade.Portal.Colaborador"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<script type="text/javascript" src="/WebMAATeste/js/valida_campos.js"></script>

<script>
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


function validaCampoAnimal(cadastroAnimal){

if(!validaRaca(cadastroAnimal.raca.value)) return false;
if(!validaIdadeA(cadastroAnimal.idade.value)) return false;
if(!validaCor1(cadastroAnimal.cor1.value)) return false;
if(!validaPelo(cadastroAnimal.pelagem.value)) return false;
if(!validaPorte(cadastroAnimal.porte.value)) return false;
if(!validaEnvio(cadastroAnimal.formaEnvio.value)) return false;


// document.cadastroAnimal.submit();

submeter();
}

function submeter(){
  especie = $("input:radio[name=especie]:checked").val();
  url = "GerAnimal?operacao=Listar_Cad&especie="+especie;

  $("#cadastroColabAnl").attr("action",url);
  document.cadastroAnimal.submit();
}

function validaRaca(raca){
  if(raca == ""){
      $("#racaErro").html("<font style='color:red;'>Informe a Raça</font>");
      return false;
  }
  return true;
}
function validaIdadeA(idade){
 if(idade == ""){
   $("#idade").attr("value","0");
    return true;
   }
    return true;
}

function validaCor1(cor1){
 if(cor1 == ""){
  $("#corErro").html("<font style='color:red;'>Informe a Cor</font>");
    return false;
   }
    return true;
}

function validaPelo(pelagem){
 if(pelagem == ""){
  $("#peloErro").html("<font style='color:red;'>Informe a Pelagem</font>");
    return false;
   }
    return true;
}
function validaPorte(porte){
 if(porte == ""){
  $("#porteErro").html("<font style='color:red;'>Informe o Porte</font>");
    return false;
   }
    return true;
}

function validaEnvio(formaEnvio){
 if(formaEnvio == ""){
  $("#envioErro").html("<font style='color:red;'>Escolha a forma de Envio</font>");
    return false;
   }
    return true;
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
    		<li><a href="#" onfocus="limpaMenu();"><span>NotÃ­cias</span></a></li>
            <li><a href="#" onfocus="limpaMenu();"><span>DenÃºncias</span></a></li>
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
            <span class="obrigatorio">* Campos de Preenchimento Obrigat&oacute;rio</span>
            <br/>
            <br />

          <form name="cadastroAnimal" id="cadastroColabAnl" method="post" action="" onsubmit="return validaCampoAnimal(this);" enctype="multipart/form-data">
          
          <input type="hidden" name="codUsr" value="${Colaborador.codigo}" />
          <input type="hidden" name="dataCad" value="" id="data" />
          
          
          <table class="grid">
            	<tr>
                	<td width="18%" align="right"><span class="obrigatorio">*</span> Especie: &nbsp;</td>
                    <td colspan="3"><input type="radio" name="especie" value="Gato" /> Gato &nbsp; &nbsp; <input type="radio" name="especie" value="Cao" /> Cachorro</td>
                </tr>
                <tr>
                	<td align="right"><span class="obrigatorio">*</span> Ra&ccedil;a: &nbsp;</td>
                    <td colspan="3">
                   	  <select name="raca">
                        	<option value=""></option>
                                    <c:forEach items="${lstRaca}" var="lstRaca">
                                    <option value="${lstRaca.codigo}"> ${lstRaca.descricao}</option>
                                    </c:forEach>
                        </select> &nbsp; <span id="racaErro"></span>
                    </td>
                </tr>
                <tr>
                	<td align="right"><span class="obrigatorio">*</span> Nome: &nbsp;</td>
                  <td colspan="3"><input type="text" name="nome" size="30" value="${Animal.nome}" /></td>
            </tr>
                <tr>
                	<td align="right">Idade Aproximada: &nbsp;</td>
				  <td colspan="3"><input type="text" name="idade" size="5" id="idade" /></td>
                </tr>
                <tr>
                	<td align="right"><span class="obrigatorio">*</span> Cor Predominante: &nbsp;</td>
				  <td width="16%">
                  	<select name="cor1">
                    	<option value=""></option>
                         <c:forEach items="${lstCor}" var="lstCor">
                           <option value="${lstCor.codigo}"> ${lstCor.cor}</option>
                        </c:forEach>
                    </select>
                  </td>
                    <td width="9%" align="right">2ª Cor: &nbsp;</td>
                  <td width="57%">
                  	<select name="cor2">
                    	<option value="0"></option>
                         <c:forEach items="${lstCor}" var="lstCor">
                           <option value="${lstCor.codigo}"> ${lstCor.cor}</option>
                        </c:forEach>
                    </select> &nbsp; <span id="corErro"></span>
                  </td>
                </tr>
                <tr>
                	<td align="right"><span class="obrigatorio">*</span> Pelagem: &nbsp;</td>
					<td colspan="3">
                   	  <select name="pelagem">
                        	<option value=""></option>
                                    <c:forEach items="${lstPelagem}" var="lstPelagem">
                                    <option value="${lstPelagem.codigo}"> ${lstPelagem.pelagem}</option>
                                    </c:forEach>
                        </select> &nbsp; <span id="peloErro"></span>
                    </td>
                </tr>
                <tr>
                        	<td align="right"><span class="obrigatorio">*</span> Porte: &nbsp;</td>
                            <td colspan="3">
                            <select name="porte">
                            	<option value=""></option>
                                    <c:forEach items="${lstPorte}" var="lstPorte">
                                    <option value="${lstPorte.codigo}"> ${lstPorte.porte}</option>
                                    </c:forEach>
                                </select> &nbsp; <span id="porteErro"></span>
                          </td>
                      </tr>
                <tr>
                	<td align="right"><span class="obrigatorio">*</span> Sexo: &nbsp;</td>
                <td align="center"><label>Macho <input type="radio" name="sexo" value="Macho" /></label></td>
                  <td colspan="2"><label>Femea <input type="radio" name="sexo" value="Femea" /></label></td>
                </tr>
                <tr>
                	<td colspan="4">Caso queira, adicione uma foto do seu animal</td>
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
                    	<td align="right">Animal com certificado/Laudo Veterinário? &nbsp;</td>
                        <td colspan="3">
                       	  <select name="laudo">
                            	<option value="">&nbsp;</optgroup>
                                <option value="Sim">SIM</optgroup>
                                <option value="Nao">N&Atilde;O</optgroup>
                            </select>
                        </td>
                    </tr>
                    <tr>
                    	<td align="right">Animal Vacinado? &nbsp;</td>
                        <td width="65%">
                       	  <select name="vacina" onchange="validaVacina_usr();">
                            	<option value="">&nbsp;</option>
                                <option value="Sim">SIM</option>
                                <option value="Nao">N&Atilde;O</option>
                            </select>
                        </td>
                    </tr>
                    <tr class="esconde" id="doses_usr">
                        	<td align="right">Especifique as Doses:</td>
                          	<td><textarea rows="3" cols="30" name="descricaoVacina"></textarea></td>
                    </tr>
                    <tr>
                    	<td align="right"><span class="obrigatorio">*</span> Forma de Envio: &nbsp;</td>
                        <td colspan="3">
                       	  <select name="formaEnvio">
                            	<option value=""></option>
                                    <c:forEach items="${lstEnvio}" var="lstEnvio">
                                    <option value="${lstEnvio.codigo}"> ${lstEnvio.envio}</option>
                                    </c:forEach>
                            </select> &nbsp; <span id="envioErro"></span>
                        </td>
                    </tr>
                </table>
            <br />
            <h3>Descrição/Comentário</h3>
            <br />
            Descreva o seu bichinho mais detalhadamente ou deixe um comentario sobre ele, isso ajuda na hora na adoção.<br />
            <textarea rows="5" cols="75" name="descricao"></textarea>            
          
            <br />
             <br />
             <br>
                <span style="color:red;">
                    ${msgErro}
                </span>
                   
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

<!-- RodapÃ© -->

<div id="rodape">
	sdjlarpq
</div>

</body>

</html>