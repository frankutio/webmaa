
<%@page contentType="text/html" pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Ong Amigos Fieis</title>

        <link type="text/css" rel="stylesheet" href="/WebMAA/Painel_controle/ong/css/geral.css" />
        <link type="text/css" rel="stylesheet" href="/WebMAA/Painel_controle/ong/css/estilos.css" />
        <link type="text/css" rel="stylesheet" href="/WebMAA/Painel_controle/ong/css/drop_vertical.css" />

        <script type="text/javascript" src="/WebMAA/Painel_controle/ong/js/jquery.js"></script>
        <script type="text/javascript" src="/WebMAA/Painel_controle/ong/js/utilidades.js"></script>
        <script type="text/javascript" src="/WebMAA/Painel_controle/ong/js/maskedinput.js"></script>
        <script type="text/javascript" src="/WebMAA/Painel_controle/ong/js/menuVertical.js"></script>

        <script type="text/javascript">
            <!--
            function focoBt(id){

                if(id ==="adota"){
                    $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_adotar_light.png");
                }
                else if(id ==="logoff"){
                    $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_logoff_light.png");
                }
                else if(id ==="continuar"){
                    $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_continuar_light.png");
                }
            }

            function bt(id){
                if(id ==="adota"){
                    $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_adotar.png");
                }
                else if(id ==="logoff"){
                    $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_logoff.png");
                }
                else if(id ==="continuar"){
                    $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_continuar.png");
                }
            }
            -->
          
        </script>

    </head>

    <body>

        <!-- Corpo da pagina -->
        <div id="corpo">
            <!-- div com o banner -->

            <div id="faixaBanner">
                <div class="imgBannerInfLeft"><img src="/WebMAA/Painel_controle/ong/images/topo2.png" alt="Logo" title="Logo" class="seta_link" /></div>
                <div class="imgBannerInfRight"></div>
                <div class="clear"></div>
            </div>

            <!-- CONTEUDO -->

            <div id="conteudo">

                <span class="imgTopo_sem_coluna"></span>
                <div class="imgBase_sem_coluna">

                    <!-- CONTEUDO AQUI -->
                    <div id="cont">

                        <div id="colunaLeft_geral" style="width:95%;">

                            <div style="text-align:center;"><h2>PAINEL DE CONTROLE</h2></div>
                            <br />
                            <br />

                            <div style="width:40%; margin-left:250px;">
                                <div class="bordaFaixaLeft">
                                    <span>Login</span>
                                </div>
                                <br />

                                <form name="login" id="login" >
                                    <table class="grid">
                                        <tr>
                                            <td width="22%" align="right">Email: &nbsp;</td>
                                            <td width="78%" colspan="2"><input type="text" id="email" name="email" /></td>
                                        </tr>
                                        <tr>
                                            <td align="right">CPF: &nbsp;</td>
                                            <td><input type="text" name="cpf" id="cpf" size="10" class="cpf"/></td>
                                            <td>
                                                <input type="image" alt="Entrar" title="Entrar" src="/WebMAA/Painel_controle/ong/images/botao/entrar.png"  id="entrar" onclick="javascript:logar();"/></td>

                                        </tr>
                                        <tr>
                                            <td colspan="2"><c:out value="${msgErro}"></c:out></td>
                                        </tr>
                                    </table>
                                </form>

                            </div>

                        </div>

                    </div>
                    <div class="clear"></div>
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
