
<%@page contentType="text/html" pageEncoding="ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Ong Amigos Fieis</title>
        <script type="text/javascript" src="/WebMAA/Painel_controle/ong/js/jquery.min.js"></script>

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

        <script type="text/javascript" src="/WebMAA/Painel_controle/ong/js/modal.js"></script>
        <link type="text/css" rel="stylesheet" href="/WebMAA/Painel_controle/ong/css/estilo_modal.css" />

        <script>
            function focoBt(id){
                if(id ==="pesquisa"){
                    $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_pesquisar_light.png");
                }
                else if(id ==="cadastrar"){
                    $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_cadastrar_light.png");
                }
                else if(id ==="altera"){
                    $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_alterar_light.png");
                }
            }
            function bt(id){
                if(id ==="pesquisa"){
                    $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_pesquisar.png");
                }
                else if(id ==="cadastrar"){
                    $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_cadastrar.png");
                }
                else if(id ==="altera"){
                    $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_alterar.png");
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
                                <div class="bordaFaixaLeft"><span>Relatório de Animais</span></div>
                                <br />
                                <!-- FILTRO DE PESQUISA -->
                                <div id="filtro">
                                    <br />
                                    <div class="nota_destaque">Filtro de Pesquisa</div>
                                    <br />

                                    <span class="obrigatorio">* Campos de Preenchimento Obrigatório</span>
                                    <br />

                                    <form name="filtroRelatorio" id="filtroRelatorio" >
                                    <input type="hidden" name="operacao" value="AnimaisProcessaRelatorio">
                                    <input type="hidden" name="localAnimal" id="localAnimal" value="<%out.print(session.getAttribute("localAnimal"));%>">
                                    <input type="hidden" name="tipoRelatorio" id="tipoRelatorio" value="<%out.print(session.getAttribute("tipoRelatorio"));%>">
                                        <table class="grid">
                                            <tr>
                                                <td width="28%" align="right"><span class="obrigatorio">*</span> Exibir Relatório de: &nbsp;</td>
                                                <td width="72%">
                                                    <select name="local" id="local" onchange="valida_relatorio();">
                                                        <option value=""></option>
                                                        <option value="Sim">Animais em Canil/Gatil</option>
                                                        <option value="Nao">Animais em Colaborador</option>
                                                        <option value="Todos">Geral</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="28%" align="right"><span class="obrigatorio">*</span> Tipo de Relatório: &nbsp;</td>
                                                <td><label><input type="radio" name="tipo" value="adotados" id="tipo" /> Animais Adotados</label></td>
                                            </tr>
                                            <tr>
                                                <td width="28%" align="right">&nbsp;</td>
                                                <td><label><input type="radio" name="tipo" value="fila" id="tipo" /> Animais na Fila de Adoção</label></td>
                                            </tr>
                                            <tr>
                                                <td width="28%" align="right">&nbsp;</td>
                                                <td><label><input type="radio" name="tipo" value="pendente" id="tipo" /> Animais com Cadastro Pendente</label></td>
                                            </tr>
                                        </table>
                                    </form>
                                    <br />
                                    <br />

                                    <div align="right" style="width:90%;">
                                        <a href="painel.jsp">
                                            <img src="/WebMAA/Painel_controle/ong/images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link" />
                                        </a>&nbsp;&nbsp;
                                       
                                            <img src="/WebMAA/Painel_controle/ong/images/botao/bt_pesquisar.png" alt="Pesquisar" title="Pesquisar" class="seta_link" id="pesquisa" onmouseover="focoBt('pesquisa');" onmouseout="bt('pesquisa');" onclick="relatorioAnimais()" />
                                       
                                    </div>

                                    <br />

                                </div>
                                <!-- FILTRO DE PESQUISA -->
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
        <!-- RodapÃ© -->
        <div id="rodape">
            Versão do Sistema &nbsp;&nbsp; 1.0
        </div>
    </body>
</html>