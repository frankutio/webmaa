<%-- 
    Document   : alterar_senha
    Created on : 02/10/2009, 16:56:03
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Ong Amigos Fieis</title>

        <link type="text/css" rel="stylesheet" href="css/geral.css" />
        <link type="text/css" rel="stylesheet" href="css/jquery-ui-datepicker.css" />
        <link type="text/css" rel="stylesheet" href="css/estilos.css" />
        <link type="text/css" rel="stylesheet" href="css/abas.css" />
        <link type="text/css" rel="stylesheet" href="css/drop_vertical.css" />


        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/utilidades.js"></script>
        <script type="text/javascript" src="js/maskedinput.js"></script>
        <script type="text/javascript" src="js/jquery-ui-datepicker.js"></script>
        <script type="text/javascript" src="js/menuVertical.js"></script>

        <script>
            function focoBt(id){
                if(id ==="logoff"){
                    $("#"+id).attr("src","images/botao/bt_logoff_light.png");
                }

                else if(id ==="exibir"){
                    $("#"+id).attr("src","images/botao/bt_exibir_light.png");
                }

                else if(id ==="exibir2"){
                    $("#"+id).attr("src","images/botao/bt_exibir_light.png");
                }

                else if(id ==="exibir3"){
                    $("#"+id).attr("src","images/botao/bt_exibir_light.png");
                }
            }

            function bt(id){
                if(id ==="logoff"){
                    $("#"+id).attr("src","images/botao/bt_logoff.png");
                }

                else if(id ==="exibir"){
                    $("#"+id).attr("src","images/botao/bt_exibir.png");
                }

                else if(id ==="exibir2"){
                    $("#"+id).attr("src","images/botao/bt_exibir.png");
                }

                else if(id ==="exibir3"){
                    $("#"+id).attr("src","images/botao/bt_exibir.png");
                }

            }
        </script>

    </head>

    <body>

        <!-- Corpo da pagina -->
        <div id="corpo">

            <!-- div com o banner -->

            <div id="faixaBanner">
                <div class="imgBannerInfLeft"><img src="images/topo2.png" alt="Logo" title="Logo" class="seta_link" /></div>
                <div class="imgBannerInfRight"></div>
            </div>

            <!-- CONTEUDO -->

            <div id="conteudo">

                <div id="topo_painel">
                    <%@include file="topo.jsp" %>
                </div>
                <div class="imgBase_sem_coluna">

                    <!-- CONTEUDO AQUI -->
                    <div id="cont">
                        <div class="menuLeft">
                            <br />
                            <br />

                            <!-- menu -->
                            <div id="menu3">
                                <%@include file="menu.jsp" %>
                            </div>

                        </div>

                        <div class="conteudo_painel">

                            <div class="lista">
                                <div class="bordaFaixaLeft">
                                    <span>Alteração de Senha</span>
                                </div>
                                <br />
                                <span class="obrigatorio">* Campos de Preenchimento Obrigatório</span>
                                <br />


                                <table class="grid">
                                    <tr>
                                        <td width="30%" align="right"><span class="obrigatorio">*</span> Senha Atual: &nbsp;</td>
                                        <td width="70%"><input type="password" size="15" name="senha_atual" /></td>
                                    </tr>
                                    <tr>
                                        <td align="right"><span class="obrigatorio">*</span> Nova Senha: &nbsp;</td>
                                        <td><input type="password" size="15" name="senha" /></td>
                                    </tr>
                                    <tr>
                                        <td align="right"><span class="obrigatorio">*</span> Confirme a Senha: &nbsp;</td>
                                        <td><input type="password" size="15" name="senha2" /></td>
                                    </tr>
                                </table>

                                <br />

                                <div align="center">
                                    <img src="images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link" onclick="window.location='painel.jsp';" />&nbsp;&nbsp;
                                    <img src="images/botao/bt_alterar.png" alt="Alterar" title="Alterar" class="seta_link" />
                                </div>

                            </div>

                        </div>

                        <div class="clear">
                        </div>

                    </div>
                    <!-- FIM DO CONTEUDO -->

                </div>
                <span class="imgFim_sem_coluna"></span>
            </div>

        </div>
        <!-- Fim do corpo -->

<!-- Rodapé -->

        <div id="rodape">
            Versão do Sistema &nbsp;&nbsp; 1.0
        </div>

    </body>

</html>