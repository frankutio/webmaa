
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <script type="text/javascript">
            function confirma(codigo) {
                if (window.confirm("Confirma exclusão?")) {
                    window.location = "/WebMAA/ControlePelagemServlet?operacao=PelagemApaga&codigo=" + codigo;
                }
            }

        </script>
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
                                <div class="bordaFaixaLeft"><span>Manutenção de Pelagem</span></div>
                                <br />
                                <!-- FILTRO DE PESQUISA -->
                                <div id="filtro">
                                    <table class="grid" style="width:100%;">
                                        <tr>
                                            <td width="6%" align="center" class="grid_titulo">Cod</td>
                                            <td width="76%" align="center" class="grid_titulo">Tipo da Pelagem</td>
                                            <td width="9%" align="center" class="grid_titulo">Alterar</td>
                                            <td width="9%" align="center" class="grid_titulo">Excluir</td>
                                        </tr>
                                        <c:forEach items="${lstPelagem}" var="lstPelagem">
                                           <tr>
                                                <td align="center">
                                                        ${lstPelagem.codigo}

                                                </td>
                                                <td>${lstPelagem.descricao} </td>
                                                <td align="center">
                                                    <a href="/WebMAA/ControlePelagemServlet?operacao=PelagemEdita&codigo=${lstPelagem.codigo}" onclick="mostra('','alterar');" >
                                                    <img src="/WebMAA/Painel_controle/ong/images/botao/document_edit.png" alt="Alterar" title="Alterar" class="seta_link" onclick="mostra('','alterar');"/></a></td>
                                                <td align="center"><img src="/WebMAA/Painel_controle/ong/images/botao/close.png" alt="Excluir" title="Excluir" class="seta_link" onclick="confirma(${lstPelagem.codigo});" /></td>
                                            </tr>
                                        </c:forEach>

                                    </table>
                                    <br />
                                    <div align="center">
                                        <img src="/WebMAA/Painel_controle/ong/images/botao/bt_add.png" alt="Cadastrar" title="Cadastrar" class="seta_link" onclick="mostra('','resultado');" />
                                    </div>

                                    <br />

                                </div>
                                <!-- FILTRO DE PESQUISA -->

            <!-- RESULTADO DA PESQUISA-->
                                <div id="resultado" class="esconde">
                                   <div class="nota_destaque" style="width:100%;">Incluir Nova Pelagem</div>
                                <br />
                                <form id="frmincluirPelagem" action="/WebMAA/ControlePelagemServlet" method="post" >
                                    <input type="hidden" name="operacao" value="PelagemNovoProcessa">
                                    <table class="grid" style="width:100%;">
                                        <tr>
                                            <td width="19%" align="right">Tipo da Pelagem: &nbsp;</td>
                                            <td width="81%"><input type="text" size="30" name="descricao" /></td>
                                        </tr>
                                    </table>
                                    <br />
                                    <div align="center">
                                       <input type="submit"  src="/WebMAA/Painel_controle/ong/images/botao/bt_incluir.png" alt="Incluir"  name="Incluir"  title="Incluir" class="seta_link">
                                           <!--img src="images/botao/bt_incluir.png" alt="Incluir" title="Incluir" class="seta_link" onclick="incluirFormaEnvio();" /-->
                                    </div>
                                </form>
                                </div>
                                <!-- RESULTADO DA PESQUISA-->

            <!-- Alterar Raças -->
                             <c:if test="${editarPelagem.codigo == 0}">
                                <div id="alterar" class="esconde">
                            </c:if>
                            <c:if test="${editarPelagem.codigo != 0}">
                                <div id="alterar" class="mostra">
                            </c:if>

                                  <div class="nota_destaque">Alterar Pelagem</div>
                                    <br />
                                    <form id="frmeditarPelagem" action="/WebMAA/ControlePelagemServlet" method="post" >
                                        <input type="hidden" name="operacao" value="PelagemEditaProcessa">
                                        <input type="hidden" name="codigo" id="codigo" value="${editarPelagem.codigo}">
                                        <table class="grid" style="width:100%;">
                                            <tr>
                                                <td width="19%" align="right">Tipo da Pelagem: &nbsp;</td>
                                                <td width="81%"><input type="text" size="30" name="descricao" id="descricao" value="${editarPelagem.descricao}" /></td>
                                            </tr>
                                        </table>

                                        <div align="center" style="width:90%;">
                                            <input type="submit"  src="/WebMAA/Painel_controle/ong/images/botao/bt_alterar.png" alt="Alterar"  name="Alterar"  title="Alterar" class="seta_link"/>
                                            <!--img src="/WebMAA/Painel_controle/ong/images/botao/bt_alterar.png" alt="Alterar" title="Alterar" class="seta_link" onclick="alert('Raça Alterada com Sucesso');" /-->&nbsp;&nbsp;
                                        </div>
                                    </form>
                                </div>
                                <!-- Alterar Raças -->

                                <br />
                                <br />

                                <div align="right" style="width:90%;">
                                    <a href="painel.jsp"><img src="/WebMAA/Painel_controle/ong/images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link"  /></a>
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