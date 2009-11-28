<%@page contentType="text/html" pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<style>

body {
	background:url("/WebMAA/Painel_controle/Usuario/images/bg_msg.png");
}

#cont {
	width:575px;
	height:380px;
	padding-top:220x;
}

#titulo {
	font:Tahoma, Geneva, sans-serif;
	font-size:18px;
	color:#000;
	background: url(/WebMAA/Painel_controle/Usuario/images/bg_titulo_msg.png) no-repeat top left;
	height:33px;
	width:95%;
}

#titulo span {
	background:url("/WebMAA/Painel_controle/Usuario/images/bg_msg_left.png") no-repeat right top ;
	display:block;
	height:33px;
	margin-left:17px;
	font-size:20px;
	font-weight:bold;
	padding-top:5px;
}

#titulo img{
	float:left;
	margin-right:3px;
}

#texto {
	width:535px;
	height:250px;
	border:solid 1px #999999;
	background:#FFF;
	padding-top:20px;
	padding-left:10px;
	overflow-y:scroll;
}

.caixa{
	width:510px;
	height:600px;
}

.seta_link{
	cursor:pointer;
	border:none;
}

.grid{
	font-family:Verdana, Arial, Helvetica, sans-serif;
	font-size:10px;
	color:#646464;
	font-weight:bold;
	width:95%;
}

.grid strong{
	color:#000000;
}

.grid a:link{
	color:#333333;
	text-decoration: underline;
}
.grid a:visited{
	color:#333333;
	text-decoration: underline;
}

.grid input{
color:#2D6AA2;
font-weight:bold;
font-size:12px;
}

.grid select{
font-size:12px;
color:#2D6AA2;
font-weight:bold;
}

.grid textarea{
color:#2D6AA2;
font-size:12px;
font-weight:bold;
border:solid 1px #009900;
}

.grid_titulo {
border:#999999 solid 1px;
background:url("/WebMAA/Painel_controle/Usuario/images/grid_titulo_azul.png");
padding: 5px 5px 5px 5px;
font-family:Tahoma, Arial, Helvetica, sans-serif;
font-size:12px;
color:#FFFFFF;
font-weight:bold;
}
</style>


<title>Mensagem</title>
</head>

<body>

<div id="cont">

<div id="titulo">
	<span>
        <c:if test="${Notificacao.remetenteNotificacao == 'Sim'}">
            <img src="/WebMAA/Painel_controle/Usuario/images/botao/ico_painel2.png" />
        </c:if>
        <c:if test="${Notificacao.remetenteNotificacao == 'Nao'}">
            <img src="/WebMAA/Painel_controle/Usuario/images/botao/ico_ong.png" />
        </c:if>
        &nbsp; ${Notificacao.assunto}
</span>
</div>
<br />

<div id="texto">
<div class="caixa">
        ${Notificacao.mensagem}

</div>

</div>

<br />
<div align="right">
	<img src="/WebMAA/Painel_controle/Usuario/images/botao/fechar.png" alt="Fechar" title="Fechar" class="seta_link" onclick="window.close();" />
</div>

</div>

</body>
</html>
