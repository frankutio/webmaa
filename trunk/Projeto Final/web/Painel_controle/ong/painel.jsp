

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Ong Amigos Fieis</title>

         <link type="text/css" rel="stylesheet" href="/WebMAA/Painel_controle/ong/css/geral.css" />
        <link type="text/css" rel="stylesheet" href="/WebMAA/Painel_controle/ong/css/jquery-ui-datepicker.css" />
        <link type="text/css" rel="stylesheet" href="/WebMAA/Painel_controle/ong/css/estilos.css" />
        <link type="text/css" rel="stylesheet" href="/WebMAA/Painel_controle/ong/css/drop_vertical.css" />
        <link type="text/css" rel="stylesheet" href="/WebMAA/Painel_controle/ong/css/abas.css" />


        <script type="text/javascript" src="/WebMAA/Painel_controle/ong/js/jquery.js"></script>
        <script type="text/javascript" src="/WebMAA/Painel_controle/ong/js/utilidades.js"></script>
        <script type="text/javascript" src="/WebMAA/Painel_controle/ong/js/maskedinput.js"></script>
        <script type="text/javascript" src="/WebMAA/Painel_controle/ong/js/jquery-ui-datepicker.js"></script>
        <script type="text/javascript" src="/WebMAA/Painel_controle/ong/js/menuVertical.js"></script>

        <script>
            function focoBt(id){
                if(id ==="logoff"){
                    $("#"+id).attr("src","/WebMAA/Painel_controle/ong/mages/botao/bt_logoff_light.png");
                }

                else if(id ==="exibir"){
                    $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_exibir_light.png");
                }

                else if(id ==="exibir2"){
                    $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_exibir_light.png");
                }

                else if(id ==="exibir3"){
                    $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_exibir_light.png");
                }
            }

            function bt(id){
                if(id ==="logoff"){
                    $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_logoff.png");
                }

                else if(id ==="exibir"){
                    $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_exibir.png");
                }

                else if(id ==="exibir2"){
                    $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_exibir.png");
                }

                else if(id ==="exibir3"){
                    $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_exibir.png");
                }

            }
        </script>

    </head>

    <body>

        <!-- Corpo da pagina -->
        <div id="corpo">

            <!-- div com o banner -->

            <div id="faixaBanner">
                <div class="imgBannerInfLeft"><img src="/WebMAA/Painel_controle/ong/images/topo2.png" alt="Logo" title="Logo" class="seta_link" /></div>
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
                                    <span>Resumo das Atividades</span>
                                </div>
                                <br />

                                <!-- colocar aqui as alterações -->

                                <div style="float:left; width:250px; min-height:80px;">

                                    <fieldset>
                                        <legend>Cadastros Pendentes</legend>
                                        <br />

                                        <table style="width:100%;">
                                            <tr>
                                                <td valign="top"><img src="/WebMAA/Painel_controle/ong/images/botao/alert.png" /></td>
                                                <td>Existem <font style="color:#F00;"><% out.print(session.getAttribute("totalpendentescolab")); %></font> Animais Pendentes.</td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="2"><img src="/WebMAA/Painel_controle/ong/images/botao/bt_exibir.png" alt="Exibir" title="Exibir" class="seta_link" id="exibir" onmouseover="focoBt('exibir');" onmouseout="bt('exibir');" onclick="window.location='/WebMAA/ControleAnimaisServlet?operacao=AnimaisProcessaRelatorio&local=Nao&tipo=pendente';" /></td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                </div>

                                <div style="float:left; width:250px; min-height:80px; margin-left:10px;">

                                    <fieldset>
                                        <legend>Adoções Ativas</legend>
                                        <br />

                                        <table style="width:100%;">
                                            <tr>
                                                <td valign="top"><img src="/WebMAA/Painel_controle/ong/images/botao/alert.png" /></td>
                                                <td>Existem <font style="color:#F00;"><% out.print(session.getAttribute("totalEmFase")); %></font> Animais em fase de Adoção.</td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="2"><a href="/WebMAA/ControleAnimaisServlet?operacao=AdocoesPesquisar"><img src="/WebMAA/Painel_controle/ong/images/botao/bt_exibir.png" alt="Exibir" title="Exibir" class="seta_link" id="exibir2" onmouseover="focoBt('exibir2');" onmouseout="bt('exibir2');" /></a></td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                </div>


                                <div class="clear"></div>

                                <br />
                                <div style="float:left; width:250px; margin-top:10px;">
                                    <fieldset>
                                        <legend>Solicitação de Adoções</legend>
                                        <br />

                                        <table style="width:100%;">
                                            <tr>
                                                <td width="11%"><img src="/WebMAA/Painel_controle/ong/images/botao/atencao.png" /></td>
                                                <td width="89%" valign="bottom"><span class="obrigatorio"><% out.print(session.getAttribute("totalProcessos")); %></span> Solicitação(s) em Aberto</td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="2"><a href="/WebMAA/ControleAnimaisServlet?operacao=AdocoesPesquisar"><img src="/WebMAA/Painel_controle/ong/images/botao/bt_exibir.png" alt="Exibir" title="Exibir" class="seta_link" id="exibir3" onmouseover="focoBt('exibir3');" onmouseout="bt('exibir3');" /></a></td>
                                            </tr>
                                        </table>
                                    </fieldset>
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
