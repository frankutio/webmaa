
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
                               <!-- RELATÃ“RIO COLABORADOR FILA -->
                               <c:if test="${lstProcesso == null}">
                                    <div id="rel_colab_fila" class="esconde">
                                  </c:if>
                                 <c:if test="${lstProcesso != null && detalheAdotados.codigo==0}">
                                    <div id="rel_colab_fila" class="mostra">
                                </c:if>
                                <c:if test="${lstProcesso != null && detalheAdotados.codigo!=0}">
                                    <div id="rel_colab_fila" class="esconde">
                                </c:if>
                                    <div class="nota_destaque" style="width:100%;">Relatório de Animais em Colaorador - Fila de Adoção</div>
                                    <br />

                                    <table class="grid" style=" width:100%;">
                                        <tr>
                                            <td colspan="6" align="center" class="grid_titulo">Dados do Animal</td>
                                            <td colspan="3" align="center" class="grid_titulo">Dados do Colaborador</td>
                                        </tr>
                                        <tr>
                                            <td width="6%" align="center" class="grid_titulo">Cod</td>
                                            <td width="13%" align="center" class="grid_titulo">Nome</td>
                                            <td width="7%" align="center" class="grid_titulo">Tipo</td>
                                            <td width="12%" align="center" class="grid_titulo">Raça</td>
                                            <td width="15%" align="center" class="grid_titulo">Dt. Cadastro</td>
                                            <td width="6%" align="center" class="grid_titulo">Cod</td>
                                            <td width="55%" align="center" class="grid_titulo">Nome</td>
                                            <td width="11%" align="center" class="grid_titulo">Detalhar</td>
                                        </tr>
                                        <c:forEach  items="${lstProcesso}" var="lstProcesso">
                                        <tr>
                                            <td align="center">${lstProcesso.codigo}</td>
                                            <td align="center">${lstProcesso.nome}</td>
                                            <td align="center">${lstProcesso.especie}</td>
                                            <td align="center">Comum</td>
                                            <td align="center">${lstProcesso.dataCadastro}</td>
                                            <td align="center">${lstProcesso.codigoColaborador}</td>
                                            <c:forEach items="${lstColaborador}" var="lstColaborador">
                                                      <c:if test="${lstProcesso.codigoColaborador==lstColaborador.codigo}">
                                                        <td align="center">${lstColaborador.nome}</td>
                                                    </c:if>
                                            </c:forEach>
                                            <td align="center">
                                                <a href="/WebMAA/ControleAnimaisServlet?operacao=AnimaisMostraFilaColab&codigoanimal=<c:out value="${lstProcesso.codigo}"></c:out>&codigocolaborador=<c:out value="${lstProcesso.codigoColaborador}"></c:out>" onclick="mostra('rel_colab_fila','colab_fila');">
                                                    <img src="/WebMAA/Painel_controle/ong/images/botao/zoom.png" class="seta_link" alt="Detalhar Processo" title="Detalhar Processo" />
                                                </a>
                                            </td>
                                        </tr>
                                        </c:forEach>
                                      
                                    </table>

                                    <br />

                                    <div align="center" style="width:90%;">
                                        <img src="images/botao/printer.png" alt="Imprimir" title="Imprimir Relatório" class="seta_link" onclick="window.print();" />
                                    </div>

                                </div>
                                <!-- RELATÃ“RIO COLABORADOR FILA -->
                                <!-- DETALHES DA MENSAGEM -->
                                <c:if test="${detalheAdotados.codigo==0}">
                                    <div id="colab_fila" class="esconde">
                                </c:if>
                                <c:if test="${detalheAdotados.codigo!=0}">
                                    <div id="colab_fila" class="mostra">
                                </c:if>
                                
                                    <div class="nota_destaque"><span>Animal na Fila de Adoção</span></div>
                                    <br />

                                    <!-- FOTO DO ANIMAL -->
                                    <div id="foto">
                                        <img src="../../gato/images/loky.jpg" />
                                    </div>
                                    <!-- FOTO -->
                                <!-- DADOS DO ANIMAL -->
                                    <div id="dadosUsuario" style="width:400px;">
                                       <table class="grid" style="width:100%;">
                                            <tr>
                                                <td width="35%" align="right">Nº de Identificação: &nbsp;</td>
                                                <td width="67%">${detalheAdotados.codigo}</td>
                                            </tr>
                                            <tr>
                                                <td width="35%" align="right">Raça: &nbsp;</td>
                                                <td width="67%"><span>${detalheAdotados.especie}</span></td>
                                            </tr>
                                            <tr>
                                                <td width="33%" align="right">Idade Aproximada: &nbsp;</td>
                                                <td width="67%">${detalheAdotados.idade}</td>
                                            </tr>
                                            <tr>
                                                <td width="33%" align="right">Cor Predominante: &nbsp;</td>

                                                <c:forEach  items="${lstCor}" var="lstCor">
                                                    <c:if test="${lstCor.codigo ==detalheAdotados.cor1}">
                                                       <td width="67%"><span>${lstCor.descricao}</span></td>
                                                    </c:if>
                                               </c:forEach>
                                            </tr>
                                            <tr>
                                                <td width="33%" align="right">2ª Cor: &nbsp;</td>
                                                <c:forEach  items="${lstCor}" var="lstCor">
                                                    <c:if test="${lstCor.codigo ==detalheAdotados.cor2}">
                                                       <td width="67%"><span>${lstCor.descricao}</span></td>
                                                    </c:if>
                                               </c:forEach>

                                            </tr>
                                            <tr>
                                                <td width="33%" align="right">Pelagem: &nbsp;</td>
                                                <c:forEach  items="${lstpelagem}" var="lstpelagem">
                                                    <c:if test="${lstpelagem.codigo ==detalheAdotados.codigoPelagem}">
                                                        <td width="67%">
                                                            <span>${lstpelagem.descricao}</span>
                                                        </td>
                                                    </c:if>
                                                </c:forEach>
                                            </tr>
                                            <tr>
                                                <td width="33%" align="right" valign="top">Sexo: &nbsp;</td>
                                                <td width="67%" valign="top">
                                                    <c:if test="${detalheAdotados.sexo=='M'}">
                                                        <span>Macho</span>
                                                    </c:if>
                                                    <c:if test="${detalheAdotados.sexo!='M'}">
                                                        <span>Femea</span>
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="37%" align="right" valign="top">Cod: &nbsp;</td>
                                                <td width="63%" valign="top"><span>${detalheAdotados.codigoColaborador}</span></td>
                                            </tr>
                                            <tr>
                                                <td width="37%" align="right" valign="top">Nome: &nbsp;</td>
                                                <td width="63%" valign="top">
                                                    <c:forEach items="${lstColaborador}" var="lstColaborador">
                                                          <c:if test="${detalheAdotados.codigoColaborador==lstColaborador.codigo}">
                                                            <span>${lstColaborador.nome}</span></td>
                                                        </c:if>
                                                </c:forEach>

                                            </tr>
                                        </table>


                                    </div>
                                    <!-- DADOS DO Animal -->

                                    <div class="clear"></div>
                                    <br />
                                    <br />
                                   
                                    <br />
                                    <br />
                                    <div align="right">
                                        <img src="/WebMAA/Painel_controle/ong/images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link"  onclick="mostra('colab_fila','rel_colab_fila');"/>
                                    </div>

                                </div>
                                <!-- DETALHES DA MENSAGEM -->

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

        <!-- Modal -->
 

    </body>

</html>