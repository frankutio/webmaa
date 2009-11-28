<%-- 
    Document   : gerencia_portes
    Created on : 02/10/2009, 17:05:17
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Ong Amigos Fieis</title>

        <link type="text/css" rel="stylesheet" href="css/geral.css" />
        <link type="text/css" rel="stylesheet" href="css/jquery-ui-datepicker.css" />
        <link type="text/css" rel="stylesheet" href="css/estilos.css" />
        <link type="text/css" rel="stylesheet" href="css/drop_vertical.css" />
        <link type="text/css" rel="stylesheet" href="css/abas.css" />


        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/utilidades.js"></script>
        <script type="text/javascript" src="js/maskedinput.js"></script>
        <script type="text/javascript" src="js/jquery-ui-datepicker.js"></script>
        <script type="text/javascript" src="js/menuVertical.js"></script>

        <script>
            function focoBt(id){
                if(id ==="pesquisa"){
                    $("#"+id).attr("src","images/botao/bt_pesquisar_light.png");
                }

                else if(id ==="cadastrar"){
                    $("#"+id).attr("src","images/botao/bt_cadastrar_light.png");
                }

                else if(id ==="altera"){
                    $("#"+id).attr("src","images/botao/bt_alterar_light.png");
                }
            }

            function bt(id){
                if(id ==="pesquisa"){
                    $("#"+id).attr("src","images/botao/bt_pesquisar.png");
                }

                else if(id ==="cadastrar"){
                    $("#"+id).attr("src","images/botao/bt_cadastrar.png");
                }

                else if(id ==="altera"){
                    $("#"+id).attr("src","images/botao/bt_alterar.png");
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
                    <!-- BARRA DE CESSAO DO USUARIO -->
                    <div id="topo_painel_left">

                        <div id="ferramenta_esquerda">
                            <table class="grid" style="width:100%; font-size:14px;">
                                <tr>
                                    <td height="28" colspan="2">Fulana Maria</td>
                                </tr>
                                <tr>
                                    <td colspan="2"></td>
                                </tr>
                                <tr>
                                    <td width="53%">&nbsp;</td>
                                    <td width="47%"><img src="images/botao/bt_logoff.png" id="logoff" onmouseover="focoBt('logoff');" onmouseout="bt('logoff');" alt="Sair" title="Sair" class="seta_link" onclick="window.location='admin.jsp';" /></td>
                                </tr>
                            </table>
                        </div>

                    </div>
                    <!-- BARRA DE CESSAO DO USUARIO -->

    <!-- BARRA DE FERRAMENTAS -->
                    <div id="topo_painel_cont">

                        <div id="ferramenta_direita">
                            <table width="90%" class="grid" style="width:70%; font-size:11px; color: #000;">
                                <tr>
                                    <td width="24%" height="49"><div align="center">
                                            <img src="images/botao/senha.png" /><br />
                                            <a href="alterar_senha.jsp">Alterar Senha</a>
                                        </div>
                                    </td>
                                    &nbsp
                                    <td width="19%"><div align="center">
                                            <img src="images/botao/relatorio.png" /><br />
                                            <a href="relatorio_animal.jsp">Relatório</a>
                                        </div>
                                    </td>
                                    <td width="28%"><div align="center">
                                            <img src="images/botao/user_add.png" /><br />
                                            <a href="cad_animal.jsp">Cadastrar Animal</a>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>

                    </div>
                    <!-- BARRA DE FERRAMENTAS -->

                    <div class="clear"></div>
                </div>
                <div class="imgBase_sem_coluna">

                    <!-- CONTEUDO AQUI -->
                    <div id="cont">
                        <div class="menuLeft">
                            <br />
                            <br />

                            <!-- menu -->
                            <div id="menu3">
                                <ul>
                                    <li onmouseover="setaClass('func');" onmouseout="retiraClass('func');"><a href="#" id="func" class="">Funcionarios</a>
                                        <ul>
                                            <li><a href="cad_funcionario.jsp">Novo Funcionario</a></li>
                                            <li><a href="pesquisar_funcionario.jsp">Pesquisar Funcionario</a></li>
                                        </ul>
                                    </li>
                                    <li onmouseover="setaClass('animais');" onmouseout="retiraClass('animais');"><a href="#" id="animais" class="">Animais</a>
                                        <ul>
                                            <li><a href="cad_animal.jsp">Novo Animal</a></li>
                                            <li><a href="pesquisar_animal.jsp">Pesquisar Animais</a></li>
                                            <li><a href="relatorio_animal.jsp">Relatório</a></li>
                                        </ul>
                                    </li>
                                    <li onmouseover="setaClass('colaborador');" onmouseout="retiraClass('colaborador');"><a href="#" id="colaborador" class="">Colaboradores</a>
                                        <ul>
                                            <li><a href="cad_colaborador.jsp">Novo Colaborador</a></li>
                                            <li><a href="pesquisar_colaborador.jsp">Pesquisar Colaborador</a></li>
                                        </ul>
                                    </li>
                                    <li onmouseover="setaClass('gerenciar');" onmouseout="retiraClass('gerenciar');"><a href="#" id="gerenciar" class="">Gerenciar</a>
                                       <ul>
                                            <li><a href="/WebMAA/ControleAdocoesServlet?operacao=AdocoesLista">Adoções</a></li>
                                            <li><a href="/WebMAA/ControleDoacoesServlet?operacao=DoacoesLista">Doações</a></li>
                                            <li><a href="/WebMAA/ControleRacaServlet?operacao=RacaLista">Raças</a></li>
                                            <li><a href="/WebMAA/ControleFormaEnvioServlet?operacao=FormaEnvioLista">Forma de Envio</a></li>
                                            <li><a href="/WebMAA/ControlePelagemServlet?operacao=PelagemLista">Pelagem</a></li>
                                            <li><a href="/WebMAA/ControlePorteServlet?operacao=PorteLista">Portes</a></li>
                                        </ul>
                                    </li>
                                </ul>

                            </div>


                        </div>

                        <div class="conteudo_painel">

                            <div class="lista">
                                <div class="bordaFaixaLeft"><span>Manutenção de Porte de Animais</span></div>
                                <br />
                                <!-- FILTRO DE PESQUISA -->
                                <div id="filtro">
                                    <table class="grid" style="width:100%;">
                                        <tr>
                                            <td width="6%" align="center" class="grid_titulo">Cod</td>
                                            <td width="76%" align="center" class="grid_titulo">Tipo do Porte</td>
                                            <td width="9%" align="center" class="grid_titulo">Alterar</td>
                                            <td width="9%" align="center" class="grid_titulo">Excluir</td>
                                        </tr>
                                        <tr>
                                            <td align="center">01</td>
                                            <td>Grande </td>
                                            <td align="center"><img src="images/botao/document_edit.png" alt="Alterar" title="Alterar" class="seta_link" onclick="mostra('','alterar');" /></td>
                                            <td align="center"><img src="images/botao/close.png" alt="Excluir" title="Excluir" class="seta_link" onclick="excluir();" /></td>
                                        </tr>
                                        <tr class="td_escura">
                                            <td align="center">02</td>
                                            <td>Médio</td>
                                            <td align="center"><img src="images/botao/document_edit.png" alt="Alterar" title="Alterar" class="seta_link" onclick="mostra('','alterar');" /></td>
                                            <td align="center"><img src="images/botao/close.png" alt="Excluir" title="Excluir" class="seta_link" onclick="excluir();" /></td>
                                        </tr>
                                    </table>
                                    <br />
                                    <div align="center">
                                        <img src="images/botao/bt_add.png" alt="Cadastrar" title="Cadastrar" class="seta_link" onclick="mostra('','resultado');" />
                                    </div>

                                    <br />

                                </div>
                                <!-- FILTRO DE PESQUISA -->

            <!-- RESULTADO DA PESQUISA-->
                                <div id="resultado" class="esconde">
                                    <div class="nota_destaque" style="width:100%;">Incluir Novo Porte</div>
                                    <br />

                                    <table class="grid" style="width:100%;">
                                        <tr>
                                            <td width="20%" align="right">Tipo do Porte: &nbsp;</td>
                                            <td width="80%"><input type="text" size="30" /></td>
                                        </tr>
                                    </table>
                                    <br />
                                    <div align="center">
                                        <img src="images/botao/bt_incluir.png" alt="Incluir" title="Incluir" class="seta_link" onclick="alert('Raça Incluida com Sucesso');" />
                                    </div>

                                </div>
                                <!-- RESULTADO DA PESQUISA-->

            <!-- Alterar Raças -->
                                <div id="alterar" class="esconde">
                                    <div class="nota_destaque">Alterar Tipo do Porte</div>
                                    <br />

                                    <table class="grid" style="width:100%;">
                                        <tr>
                                            <td width="20%" align="right">Tipo do Porte: &nbsp;</td>
                                            <td width="80%"><input type="text" size="30" value="Médio" /></td>
                                        </tr>
                                    </table>

                                    <div align="center" style="width:90%;">
                                        <img src="images/botao/bt_alterar.png" alt="Alterar" title="Alterar" class="seta_link" onclick="alert('Raça Alterada com Sucesso');" />&nbsp;&nbsp;
                                    </div>

                                </div>
                                <!-- Alterar Raças -->

                                <br />
                                <br />

                                <div align="right" style="width:90%;">
                                    <a href="painel.jsp"><img src="images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link" /></a>
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