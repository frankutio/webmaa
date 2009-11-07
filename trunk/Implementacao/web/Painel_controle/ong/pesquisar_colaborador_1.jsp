<%-- 
    Document   : pesquisar_colaborador
    Created on : 02/10/2009, 17:08:38
    Author     : usuario
--%>

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
                                <div class="bordaFaixaLeft"><span>Pesquisa de Colaboradores</span></div>
                                <br />
                                <!-- FILTRO DE PESQUISA -->
                                <div id="filtro">
                                    <table class="grid">
                                        <tr align="right">
                                            <td colspan="2" align="left">Preencha pelo menos um campo do filtro abaixo.</td>
                                        </tr>
                                        <tr>
                                            <td align="right">Cod: &nbsp;</td>
                                            <td><input type="text" name="cod" size="5" /></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Nome: &nbsp;</td>
                                            <td><input type="text" name="nome" size="40" /></td>
                                        </tr>
                                    </table>

                                    <br />
                                    <br />

                                    <div align="right" style="width:90%;">
                                        <a href="painel.jsp"><img src="/WebMAA/Painel_controle/ong/images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link" /></a>&nbsp;&nbsp;
                                        <img src="/WebMAA/Painel_controle/ong/images/botao/bt_pesquisar.png" alt="Pesquisar" title="Pesquisar" class="seta_link" id="pesquisa" onmouseover="focoBt('pesquisa');" onmouseout="bt('pesquisa');" onclick="mostra('','resultado');" />
                                    </div>

                                    <br />

                                </div>
                                <!-- FILTRO DE PESQUISA -->

            <!-- RESULTADO DA PESQUISA-->
                                <div id="resultado" class="esconde">
                                    <div class="nota_destaque" style="width:100%;">Resultado da Pesquisa</div>
                                    <br />

                                    <table class="grid" style="width:100%;">
                                        <tr>
                                            <td width="6%" align="center" class="grid_titulo">Cod</td>
                                            <td width="23%" align="center" class="grid_titulo">Nome</td>
                                            <td width="13%" align="center" class="grid_titulo">Sexo</td>
                                            <td width="14%" align="center" class="grid_titulo">Telefone</td>
                                            <td width="19%" align="center" class="grid_titulo">E-mail</td>
                                            <td width="5%" align="center" class="grid_titulo">UF</td>
                                            <td width="11%" align="center" class="grid_titulo">Detalhar</td>
                                            <td width="9%" align="center" class="grid_titulo">Excluir</td>
                                        </tr>
                                        <tr>
                                            <td align="center">01</td>
                                            <td align="center">Fulano de Tal Almeida</td>
                                            <td align="center">Masculino</td>
                                            <td align="center">61 33974794</td>
                                            <td align="center">fulano@rmail.com</td>
                                            <td align="center">DF</td>
                                            <td align="center"><img src="/WebMAA/Painel_controle/ong/images/botao/zoom.png" alt="Detalhar" title="Detalhar" class="seta_link" onclick="mostra('filtro','detalhar');" /></td>
                                            <td align="center"><img src="images/botao/close.png" alt="Excluir" title="Excluir" class="seta_link" onclick="excluir();" /></td>
                                        </tr>
                                      
                                    </table>

                                </div>
                                <!-- RESULTADO DA PESQUISA-->

            <!-- DETALHES DO FUNCIONARIO -->
                                <div id="detalhar" class="esconde">
                                    <div class="nota_destaque">Detalhes do Colaborador</div>
                                    <br />

                                    <fieldset>
                                        <legend>Dados Pessoais</legend>
                                        <table class="grid">
                                            <tr>
                                                <td align="right">Cod:&nbsp; </td>
                                                <td colspan="3"><span>001</span></td>
                                            </tr>
                                            <tr>
                                                <td align="right">Data de Cadastro:&nbsp; </td>
                                                <td colspan="3"><span>17/09/2009</span></td>
                                            </tr>
                                            <tr>
                                                <td width="26%" align="right">Nome: &nbsp;</td>
                                                <td colspan="3"><span>Fulano de Tal</span></td>
                                            </tr>
                                            <tr>
                                                <td width="26%" align="right">Sexo: &nbsp;</td>
                                                <td colspan="3"><span>Masculino</span></td>
                                            </tr>
                                            <tr>
                                                <td align="right">RG: &nbsp;</td>
                                                <td width="20%"><span>2.250001</span></td>
                                                <td width="15%" align="right"> CPF: &nbsp;</td>
                                                <td width="39%"><span>00000000000</span></td>
                                            </tr>
                                            <tr>
                                                <td align="right">Data de Nascimento: &nbsp;</td>
                                                <td colspan="3"><span>30011984</span></td>
                                            </tr>
                                            <tr>
                                                <td align="right">Email: &nbsp;</td>
                                                <td colspan="3"><span>fulano@email.com</span></td>
                                            </tr>
                                            <tr>
                                                <td align="right">Telefone: &nbsp;</td>
                                                <td colspan="3"><span>6199999999</span></td>
                                            </tr>
                                        </table>
                                    </fieldset>

                                    <fieldset>
                                        <legend>Endereço</legend>

                                        <table class="grid">
                                            <tr>
                                                <td width="26%" align="right">CEP: &nbsp;</td>
                                                <td colspan="5"><span>70000000</span></td>
                                            </tr>
                                            <tr>
                                                <td align="right">Endereço: &nbsp;</td>
                                                <td colspan="5"><span>Vila São José</span></td>
                                            </tr>
                                            <tr>
                                                <td align="right">Complemento: &nbsp;</td>
                                                <td colspan="5"><span>Rua 321 casa 03</span></td>
                                            </tr>
                                            <tr>
                                                <td align="right">Cidade: &nbsp;</td>
                                                <td width="24%"><span>Taguatinga</span></td>
                                                <td width="13%" align="right">Bairro: &nbsp;</td>
                                                <td width="37%"><span>Norte</span></td>
                                            </tr>
                                            <tr>
                                                <td align="right">UF: &nbsp;</td>
                                                <td colspan="3"><span>UF</span></td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                    <br />
                                    <br />

                                    <div align="right" style="width:90%;">
                                        <img src="/WebMAA/Painel_controle/ong/images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link" onclick="mostra('detalhar','filtro'); mostrar('resultado');" />&nbsp;&nbsp;
                                    </div>

                                </div>
                                <!-- DETALHES DO FUNCIONARIO -->


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
