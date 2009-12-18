
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
         <script type="text/javascript">
            
       </script>
    </head>

    <body>

        <!-- Corpo da pagina -->
        <div id="corpo">

            <div id="faixaBanner">
                <div class="imgBannerInfLeft"><img src="/WebMAA/Painel_controle/ong/images/topo2.png" alt="Logo" title="Logo" class="seta_link" /></div>
                <div class="imgBannerInfRight"></div>
            </div>

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
                                <!-- RRELATÃ“RIO CANIL ADOTADOS -->
                                 <c:if test="${lstProcesso == null}">
                                    <div id="rel_canil_adotado" class="esconde">
                                  </c:if>
                                 <c:if test="${lstProcesso != null && detalheAdotados.codigo==0}">
                                    <div id="rel_canil_adotado" class="mostra">
                                </c:if>
                                <c:if test="${lstProcesso != null && detalheAdotados.codigo!=0}">
                                    <div id="rel_canil_adotado" class="esconde">
                                </c:if>
                                    <div class="nota_destaque" style="width:100%;">Relatório de Animais em Canil/Gatil - Adotados</div>
                                    <br />
                                    
                                    <table class="grid"  style="width:100%;">
                                        <tr>
                                            <td width="7%" align="center" class="grid_titulo">Cod</td>
                                            <td width="22%" align="center" class="grid_titulo">Nome</td>
                                            <td width="29%" align="center" class="grid_titulo">Data Adoção</td>
                                            <td width="55%" align="center" class="grid_titulo">Adotante</td>
                                            <td width="12%" align="center" class="grid_titulo">Detalhar</td>
                                        </tr>
                                        <c:forEach  items="${lstProcesso}" var="lstProcesso">
                                        <tr>
                                            <td align="center">${lstProcesso.codigo}</td>
                                            <c:forEach items="${lstAnimais}" var="lstAnimais">
                                                      <c:if test="${lstProcesso.animaisCodigo==lstAnimais.codigo}">
                                                        <td align="center">${lstAnimais.nome}</td>
                                                    </c:if>
                                            </c:forEach>
                                            <td align="center">${lstProcesso.dataProcesso}</td>
                                            
                                            <c:forEach items="${lstColaborador}" var="lstColaborador">
                                                      <c:if test="${lstProcesso.colaboradorCodigo==lstColaborador.codigo}">
                                                        <td align="center">${lstColaborador.nome}</td>
                                                    </c:if>
                                            </c:forEach>
                                            <td align="center">
                                                <a href="/WebMAA/ControleAnimaisServlet?operacao=AnimaisMostraAdotados&codigoanimal=<c:out value="${lstProcesso.animaisCodigo}"></c:out>&codigocolaborador=<c:out value="${lstProcesso.colaboradorCodigo}"></c:out>" onclick="mostra('rel_canil_adotado','canil_adotados');">
                                                    <img src="/WebMAA/Painel_controle/ong/images/botao/zoom.png" class="seta_link" alt="Detalhar Processo" title="Detalhar Processo" />
                                                </a>
                                            </td>
                                        </tr>
                                        </c:forEach>
                                    </table>

                                    <br />

                                    <div align="center" style="width:90%;">
                                        <img src="/WebMAA/Painel_controle/ong/images/botao/printer.png" alt="Imprimir" title="Imprimir Relatório" class="seta_link" onclick="window.print();" />
                                    </div>

                                </div>
                                
                                <!-- DETALHES DA MENSAGEM -->
                                <c:if test="${detalheAdotados.codigo==0}">
                                    <div id="canil_adotados" class="esconde">
                                </c:if>
                                <c:if test="${detalheAdotados.codigo!=0}">
                                    <div id="canil_adotados" class="mostra">
                                </c:if>
                                    <div class="nota_destaque" style="width:100%;">Animal Adotado</div>
                                    <br />
                                    
                                    <!-- FOTO DO ANIMAL -->
                                    <div id="foto">
                                        <img src="../../gato/images/loky.jpg" />
                                    </div>
                                    <!-- FOTO -->
                                    <!-- DADOS DO ANIMAL -->
                                    <div id="dadosUsuario" style="width:400px;">
                                        <table class="grid">
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
                                        </table>



                                        </div>
                                        <!-- DADOS DO Animal -->

                                        <div class="clear"></div>
                                        <br />
                                        <br />
                                        <div class="nota_destaque" style="width:100%;">Dados da Adoção</div>
                                        <br />
                                        

                                        <!--Adotado em <span class="obrigatorio">30/01/2009</span-->
                                        <table class="grid" style="width:100%;">
                                            <tr>
                                                <td class="grid_titulo" align="center">Cod</td>
                                                <td class="grid_titulo"   align="center">Nome Adotante</td>
                                                <td class="grid_titulo" align="center">Sexo</td>
                                                <td class="grid_titulo" width="35%"  align="center">End.</td>
                                                <td class="grid_titulo" align="center">Telefone</td>
                                            </tr>
                                            <tr class="td_escura">
                                                <td align="center">${detalheColaborador.codigo}</td>
                                                <td align="center">${detalheColaborador.nome}</td>
                                                 <c:if test="${detalheColaborador.sexo=='M'}">
                                                    <td align="center">Masculino</td>
                                                </c:if>
                                                <c:if test="${detalheColaborador.sexo!='M'}">
                                                    <td align="center">Feminino</td>
                                                </c:if>
                                                <td align="center">${detalheColaborador.endereco}</td>
                                                <td align="center">${detalheColaborador.telefone}</td>
                                            </tr>
                                        </table>
                                        <br />
                                        <br />
                                        <div align="right">
                                            <img src="/WebMAA/Painel_controle/ong/images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link"  onclick="mostra('canil_adotados','rel_canil_adotado');"/>
                                        </div>
                                        <br />

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
     
        <div id="rodape">
            Versão do Sistema &nbsp;&nbsp; 1.0
        </div>

        <!-- Modal -->
      
    </body>

</html>