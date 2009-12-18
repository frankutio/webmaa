<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ong Amigos Fieis</title>

<link type="text/css" rel="stylesheet" href="../css/geral.css" />
<link type="text/css" rel="stylesheet" href="../css/jquery-ui-datepicker.css" />
<link type="text/css" rel="stylesheet" href="../css/estilos.css" />
<link type="text/css" rel="stylesheet" href="../css/menu_drop.css" />
<link type="text/css" rel="stylesheet" href="../css/abas.css" />


<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/utilidades.js"></script>
<script type="text/javascript" src="../js/maskedinput.js"></script>
<script type="text/javascript" src="../js/jquery-ui-datepicker.js"></script>
<script type="text/javascript" src="../js/menuSuper.js"></script>

<script>
function focoBt(id){
		$("#"+id).attr("src","../images/botao/bt_cadastrar_light.png");
}

function bt(id){
		$("#"+id).attr("src","../images/botao/bt_cadastrar.png");
}
</script>

</head>

<body>

<!-- Corpo da pagina -->
<div id="corpo">
<!-- div com o topo do site -->

<div id="faixaTopo">
		<div class="imgBannerLeft"><img src="../images/topo1.png" alt="logo" title="Logo" class="seta_link" /></div>
        <div class="imgBannerRight"></div>   	
</div>

<!-- div com o banner -->

<div id="faixaBanner">
	<div class="imgBannerInfLeft"><img src="../images/topo2.png" alt="Logo" title="Logo" class="seta_link" /></div>
    <div class="imgBannerInfRight"></div>
</div>

<!-- div Status -->

<div id="faixaStatus">
	
</div>


<!-- Menu do site Horizontal -->

<div id="menu">
	<div class="menuDrop">
		<ul>
			<li><a href="../index.jsp" onfocus="limpaMenu();"><span>Inicio</span></a></li>            
    		<li><a href="#" onfocus="limpaMenu();"><span>NotÃ­cias</span></a></li>
            <li><a href="#" onfocus="limpaMenu();"><span>DenÃºncias</span></a></li>
            <li id="adotar" class="" onmouseover="setaClass('adotar');" onmouseout="retiraClass('adotar');"><a href="#" onfocus="ativa('adotar','drop');"><span>Adotar</span></a>
    			<ul class="drop">
        			<li id="gato" class=""><a href="../gato/listaGato.jsp" onfocus="ativaLight('gato');">Gato</a></li>
    				<li id="cao" class=""><a href="../cao/listaCao.jsp" onfocus="ativaLight('cao');">Cachorro</a></li>
        		</ul>
    		</li>
    		<li><a href="#" onfocus="limpaMenu();"><span>Direito Animal</span></a></li>
    		<li><a href="../cadastro.jsp" onfocus="limpaMenu();"><span>Cadastre-se</span></a></li>
            <li><a href="cad_animal.jsp" onfocus="limpaMenu();"><span>Doar</span></a></li>
            <li><a href="../final_feliz/index.jsp" onfocus="limpaMenu();"><span>Final Feliz</span></a></li>
		</ul>
	</div>
</div>

<!-- CONTEUDO -->

<div id="conteudo">

	<span class="imgTopo_sem_coluna"></span>
	<div class="imgBase_sem_coluna">
	
	<!-- CONTEUDO AQUI -->
		<div id="cont">
				<div style="text-align:center;"><img src="../images/imgTexto/cadastro.png" alt="Cadastro" title="Cadastro"  /></div>
		<div id="tabsB">
					<ul>
						<li><a href="inicioCad.html" class="ativo"><span>Dados Pessoais</span></a></li>
      					<li><a href="cadSeguro.html" class="ativo"><span>Dados de SeguranÃ§a</span></a></li>
      					<li class="ativo"><a href="cadLogradouro.html" class="ativo"><span>Logradouro</span></a></li>
					</ul>
		</div>
		
		<!-- CONTEUDO DAS ABAS -->
		<div id="cont_aba">
			<div id="inicio">
			<br />
			<span class="obrigatorio">* Campos de Preenchimento Obrigatório</span>
			<br />
			<br />
			
			<form action="confirmCad.html">
				<table class="grid">
					<tr>
						<td width="13%" align="right"><span class="obrigatorio">*</span> CEP: &nbsp;</td>
				      <td colspan="3"><input type="text" name="cep" size="10" class="cep" /></td>
					</tr>
					<tr>
						<td width="13%" align="right"><span class="obrigatorio">*</span> Endereço: &nbsp;</td>
				      <td colspan="3"><input type="text" name="end" size="50" /></td>
					</tr>
					<tr>
						<td width="13%" align="right">Complemento: &nbsp;</td>
				        <td><input type="text" name="complemento" size="10" /></td>
						<td width="13%" align="right">Número: &nbsp;</td>
				        <td><input type="text" name="numero" size="5" /></td>
					</tr>
					<tr>
						<td width="13%" align="right"><span class="obrigatorio">*</span> Cidade: &nbsp;</td>
				      <td width="17%"><input type="text" name="cidade" size="20" /></td>
						<td width="9%" align="right"><span class="obrigatorio">*</span> Bairro: &nbsp;</td>
					  <td width="61%"><input type="text" name="bairro" size="10" /></td>
					</tr>
					<tr>
						<td width="13%" align="right"><span class="obrigatorio">*</span> UF: &nbsp;</td>
				      <td width="17%" colspan="3">
					  	<select name="uf">
							<option></option>
							<option value="1">XX</option>
						</select>
					  </td>
					</tr>
				</table>
				<br />
				<br />
				
				<div style="width:90%; text-align:center;">
					<input type="image" src="../images/botao/bt_cadastrar.png" alt="ok" title="Finalizar Cadastro" id="cadastro" onmouseover="focoBt('cadastro');" onmouseout="bt('cadastro');" />
				</div>
			</form>
			</div>
		</div>	
       <!-- CONTEUDO DAS ABAS -->
					
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