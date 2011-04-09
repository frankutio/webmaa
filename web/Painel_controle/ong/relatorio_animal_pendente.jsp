

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
                                    <span>Animais Pendentes</span>
                                </div>
                                <br />

                                <table class="grid">
                                    <tr>
                                        <td width="11%" align="center" class="grid_titulo">Cod</td>
                                        <td width="33%" align="center" class="grid_titulo">Nome</td>
                                        <td width="13%" align="center" class="grid_titulo">Tipo</td>
                                        <td width="10%" align="center" class="grid_titulo">Sexo</td>
                                        <td width="21%" align="center" class="grid_titulo">Dt. Cadastro</td>
                                        <td width="12%" align="center" class="grid_titulo">Detalhar</td>
                                    </tr>
                                    <tr>
                                        <td align="center">001</td>
                                        <td align="center">Juju</td>
                                        <td align="center">Cão</td>
                                        <td align="center">Femea</td>
                                        <td align="center">30/09/2009</td>
                                        <td align="center"><a href="coloborador/detehlar_animal.jsp"><img src="images/botao/zoom.png" class="seta_link" alt="Detalhar Processo" title="Detalhar Processo " /></a></td>
                                    </tr>
                                    <tr class="td_escura">
                                        <td align="center">004</td>
                                        <td align="center">Lucky</td>
                                        <td align="center">Gato</td>
                                        <td align="center">Macho</td>
                                        <td align="center">23/08/2009</td>
                                        <td align="center"><a href="coloborador/detehlar_animal.jsp"><img src="images/botao/zoom.png" class="seta_link" alt="Detalhar Processo" title="Detalhar Processo " /></a></td>
                                    </tr>
                                    <tr>
                                        <td align="center">008</td>
                                        <td align="center">Mimi</td>
                                        <td align="center">Gato</td>
                                        <td align="center">Femea</td>
                                        <td align="center">03/08/2009</td>
                                        <td align="center"><a href="coloborador/detehlar_animal.jsp"><img src="images/botao/zoom.png" class="seta_link" alt="Detalhar Processo" title="Detalhar Processo " /></a></td>
                                    </tr>
                                    <tr>
                                        <td colspan="6">Relação de Animais Pendentes.</td>
                                    </tr>
                                </table>
                                <br />

                                <div style=" width:90%;" align="center">
                                    <img src="images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link" onclick="window.location='painel.jsp';" />
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
            Vers�o do Sistema &nbsp;&nbsp; 1.0
        </div>

    </body>

</html>