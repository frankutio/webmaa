
<%@page contentType="text/html" pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
            function pesquisar() {

                window.location = "/WebMAA/ControleAnimaisServlet?operacao=AnimaisProcessaPesquisaDoacao&localAnimal=" + document.getElementById("tipoL").value +"&tipoAnimal="+document.getElementById("tipoA").value ;
                mostrar('dadosGerais');
            }


        </script>
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

                else if(id ==="altera2"){
                    $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_alterar_light.png");
                }

                else if(id ==="cancelar"){
                    $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_cancelar_light.png");
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

                else if(id ==="altera2"){
                    $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_alterar.png");
                }

                else if(id ==="cancelar"){
                    $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_cancelar.png");
                }
            }
        </script>

    </head>

 <body onload="contAba('dadosGerais','dadosG');">

        <!-- Corpo da pagina -->
        <div id="corpo"onload="">

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
                                <div class="bordaFaixaLeft"><span>Gerenciar Doações de Animais</span></div>
                                <br />
                            </div>
                            <form id="frmeditaanimais" action="/WebMAA/ControleAnimaisServlet" method="post">
                                <input type="hidden" name="operacao" value="AnimaisEditaProcessaDoacao">
                               <input type="hidden" name="codigo" value="${editaAnimais.codigo}">
                               <input type="hidden" name="codigo_funcionario" value="<%out.print(session.getAttribute("codigoFuncionario")); %>">
                                <input type="hidden" name="tipoL" id="tipoL" value="<%out.print(session.getAttribute("localAnimal"));%>">
                                <input type="hidden" name="tipoA" id="tipoA" value="<%out.print(session.getAttribute("tipoAnimal"));%>">

                                <div id="alterar" class="mostra">

                                    <div class="nota_destaque">AlteraÃ§Ã£o de Dados</div>
                                    <br />

                                    <div class="tabsB">
                                        <ul>
                                            <li class="" id="dadosG"><a href="#" onclick="contAba('dadosGerais','dadosG');"><span>Dados Gerais</span></a></li>
                                            <li class="" id="dadosC"><a href="#" onclick="contAba('dadosComplementares','dadosC');"><span>Dados Complemetares</span></a></li>
                                            <li class="" id="obs"><a href="#" onclick="contAba('dadosObservacao','obs');"><span>ObservaÃ§Ãµes</span></a></li>
                                        </ul>
                                    </div>

                                    <div id="cont_aba" style="padding-left:nome;">

                                        <!-- ABA DADOS GERAIS -->
                                        <div id="dadosGerais" class="abaEsconde">
                                            <table class="grid" style="width:100%;">
                                                <tr>
                                                    <td width="22%" align="right"><span class="obrigatorio">*</span> Especie: &nbsp;</td>
                                                    <td colspan="3">
                                                        <input type="radio" name="especie"
                                                               <c:if test="${editaAnimais.especie!='CAO'}">
                                                                   checked="true"
                                                               </c:if>
                                                               value="Gato"/> Gato &nbsp; &nbsp;
                                                        <input type="radio" name="especie"
                                                               <c:if test="${editaAnimais.especie=='CAO'}">
                                                                   checked="true"
                                                               </c:if> value="Cao" />
                                                    Cachorro</td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><span class="obrigatorio">*</span> Raça: &nbsp;</td>
                                                    <td colspan="3">
                                                        <select name="raca">
                                                            <option></option>
                                                            <c:forEach items="${lstRaca}" var="lstRaca">
                                                                <option value="${lstRaca.codigo}"
                                                                        <c:if test="${editaAnimais.codigoRaca==lstRaca.codigo}">
                                                                            selected="${lstRaca.descricao}"
                                                                        </c:if>
                                                                        > ${lstRaca.descricao}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><span class="obrigatorio">*</span> Nome: &nbsp;</td>
                                                    <td colspan="3"><input type="text" name="nome" size="30" value="${editaAnimais.nome}" /></td>
                                                </tr>
                                                <tr>
                                                    <td align="right">Idade Aproximada: &nbsp;</td>
                                                    <td colspan="3"><input type="text" name="idade" size="5" value="${editaAnimais.idade}" /></td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><span class="obrigatorio">*</span> Cor Predominante: &nbsp;</td>
                                                    <td width="20%">
                                                        <select name="cor1">
                                                            <c:forEach items="${lstCor}" var="lstCor">
                                                                <option value="${lstCor.codigo}"
                                                                        <c:if test="${editaAnimais.cor1==lstCor.codigo}">
                                                                            selected="${lstCor.descricao}"
                                                                        </c:if>
                                                                        > ${lstCor.descricao}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                    <td width="11%" align="right">2ª Cor: &nbsp;</td>
                                                    <td width="47%">
                                                        <select name="cor2">
                                                            <option></option>
                                                            <c:forEach items="${lstCor}" var="lstCor">
                                                                <option value="${lstCor.codigo}"
                                                                        <c:if test="${editaAnimais.cor2==lstCor.codigo}">
                                                                            selected="${lstCor.descricao}"
                                                                        </c:if>
                                                                        > ${lstCor.descricao}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><span class="obrigatorio">*</span> Pelagem: &nbsp;</td>
                                                    <td colspan="3">
                                                        <select name="cbopelagem">
                                                            <option></option>
                                                            <c:forEach items="${lstpelagem}" var="lstpelagem">
                                                                <option value="${lstpelagem.codigo}"
                                                                        <c:if test="${editaAnimais.codigoPelagem==lstpelagem.codigo}">
                                                                            selected="${lstpelagem.descricao}"
                                                                        </c:if>
                                                                        > ${lstpelagem.descricao}</option>
                                                            </c:forEach>
                                                    </select></td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><span class="obrigatorio">*</span> Porte: &nbsp;</td>
                                                    <td colspan="3"><select name="porte">
                                                            <option></option>
                                                            <c:forEach items="${lstPorteAnimal}" var="lstPorteAnimal">
                                                                <option value="${lstPorteAnimal.codigo}"
                                                                        <c:if test="${editaAnimais.porte==lstPorteAnimal.codigo}">
                                                                            selected="${lstPorteAnimal.descricao}"
                                                                        </c:if>
                                                                        > ${lstPorteAnimal.descricao}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><span class="obrigatorio">*</span> Sexo: &nbsp;</td>
                                                    <td colspan="3">
                                                        <select name="sexo" >
                                                            <option value=""></option>
                                                            <c:if test="${editaAnimais.sexo=='M'}">
                                                            <option value="M"  selected="Macho">Macho</option>
                                                            <option value="F"  >Femea</option>
                                                            </c:if>
                                                            <c:if test="${editaAnimais.sexo!='M'}">
                                                                <option value="M"  >Macho</option>
                                                            <option value="F"  selected="Femea">Femea</option>
                                                            </c:if>
                                                        </select>
                                                    </td>
                                                </tr>
                                            </table>

                                            <br />
                                            <div align="right" style="width:90%;">
                                                <img src="/WebMAA/Painel_controle/ong/images/botao/bt_voltar_off.png" alt="Voltar" title="Voltar" />&nbsp;&nbsp;
                                                <img src="/WebMAA/Painel_controle/ong/images/botao/bt_avancar.png" alt="Proximo" title="AvanÃ§ar" class="seta_link" onclick="contAba('dadosComplementares','dadosC');" />
                                            </div>

                                        </div>
                                        <!-- ABA DADOS GERAIS -->

                                        <!-- ABA DADOS COMPLEMENTARES -->
                                        <div id="dadosComplementares" class="abaEsconde">
                                            <table class="grid" style="width:100%;">
                                                <tr>
                                                    <td align="right"><span class="obrigatorio">*</span> Foto: &nbsp;</td>
                                                    <td colspan="3"><input type="file" name="foto" /></td>
                                                </tr>
                                                <tr>
                                                    <td width="23%" align="right"><span class="obrigatorio">*</span> Animal Castrado? &nbsp;</td>
                                                    <td colspan="3">
                                                        <select name="castrado">
                                                            <option value="">&nbsp;</option>
                                                            <c:if  test="${editaAnimais.castrado=='Sim'}">
                                                            <option value="Sim"  selected="SIM">SIM</option>
                                                            <option value="Nao"  >NÃO</option>
                                                            </c:if>
                                                            <c:if test="${editaAnimais.castrado!='Sim'}">
                                                            <option value="Sim"  >SIM</option>
                                                            <option value="Nao"  selected="NÃO">NÃO</option>
                                                            </c:if>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><span class="obrigatorio">*</span> Animal com certificado/Laudo Veterianário? &nbsp;</td>
                                                    <td colspan="3">
                                                        <select name="laudo">
                                                            <option value="">&nbsp;</option>
                                                            <c:if test="${editaAnimais.laudoVeterinario=='Sim'}">
                                                            <option value="Sim"  selected="SIM">SIM</option>
                                                            <option value="Nao"  >NÃO</option>
                                                            </c:if>
                                                            <c:if test="${editaAnimais.laudoVeterinario!='Sim'}">
                                                            <option value="Sim"  >SIM</option>
                                                            <option value="Nao"  selected="NÃO">NÃO</option>
                                                            </c:if>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><span class="obrigatorio">*</span> Animal Vacinado? &nbsp;</td>
                                                    <td width="24%">
                                                        <select name="vacina" >
                                                            <option value="">&nbsp;</option>
                                                            <c:if test="${editaAnimais.vacinado=='Sim'}">
                                                                <option value="Sim"  selected="SIM">SIM</option>
                                                                <option value="Nao"  >NÃO</option>
                                                            </c:if>
                                                            <c:if test="${editaAnimais.vacinado!='Sim'}">
                                                                <option value="Sim"  >SIM</option>
                                                            <option value="Nao"  selected="NÃO">NÃO</option>
                                                            </c:if>
                                                            
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr class="mostra" >
                                                    <td align="right">Especifique as Doses:</td>
                                                    <td><textarea rows="3" cols="55" name="doses" id="doses" value="${editaAnimais.descricaoVacina}">${editaAnimais.descricaoVacina}</textarea></td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><span class="obrigatorio">*</span> Forma de Envio: &nbsp;</td>
                                                    <td colspan="3">
                                                        <select name="envio">
                                                            <option></option>
                                                            <c:forEach items="${lstFormaEnvio}" var="lstFormaEnvio">
                                                                <option value="${lstFormaEnvio.codigo}"
                                                                        <c:if test="${editaAnimais.codigoFormaEnvio==lstFormaEnvio.codigo}">
                                                                            selected="${lstFormaEnvio.descricao}"
                                                                        </c:if>
                                                                        > ${lstFormaEnvio.descricao}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><span class="obrigatorio">*</span> Valor Da Taxa: &nbsp;</td>
                                                    <td colspan="3"><input type="text" name="valortaxa" id="valortaxa" class="valortaxa" value="${editaAnimais.vlrTaxa}" size="8" /></td>
                                                </tr>
                                            </table>
                                            <br />

                                            <div align="right" style="width:90%;">
                                                <img src="/WebMAA/Painel_controle/ong/images/botao/bt_voltar.png" alt="Voltar" title="Voltar" onclick="contAba('dadosGerais','dadosG');" class="seta_link" />&nbsp;&nbsp;
                                                <img src="/WebMAA/Painel_controle/ong/images/botao/bt_avancar.png" alt="Proximo" title="AvanÃ§ar" class="seta_link" onclick="contAba('dadosObservacao','obs');" />
                                            </div>

                                        </div>
                                        <!-- ABA DADOS COMPLEMENTARES -->

                                        <!-- ABA OBSERVAÃ‡ÃƒO -->
                                        <div id="dadosObservacao" class="abaEsconde">
                                            <h3>Descrição/Comentário</h3>

                                            <table class="grid">
                                                <tr>
                                                    <td>Descreva o seu bichinho mais detalhadamente ou deixe um comentario sobre ele, isso ajuda na hora na adoÃ§Ã£o.</td>
                                                </tr>
                                                <tr>
                                                    <td><textarea rows="5" cols="75" name="descricao" id="descricao"   >${editaAnimais.descricao}</textarea></td>
                                                </tr>
                                            </table>
                                            <br />

                                            <div align="right" style="width:100%;">
                                                <img src="/WebMAA/Painel_controle/ong/images/botao/bt_voltar.png" alt="Voltar" title="Voltar" onclick="contAba('dadosComplementares','dadosC');" class="seta_link" />&nbsp;&nbsp;
                                                <a href="javascript:document.getElementById('frmeditaanimais').submit();">
                                                    <img src="/WebMAA/Painel_controle/ong/images/botao/bt_alterar.png" alt="Alterar" title="Alterar" class="seta_link" id="Alterar" onmouseover="focoBt('altera');" onmouseout="bt('altera');" onclick="alert('Cadastro Alterado Com Sucesso.'); mostra('detalhar','filtro'); mostrar('resultAnimal');"/>
                                                </a>
                                            </div>

                                        </div>
                                        <!-- ABA OBSERVAÃ‡ÃƒO -->

                                        <br />
                                    </div>
                                </div>
                            </form>
                            <br />

                            <div align="right" style="width:90%;">
                                <a href="javascript:pesquisar();">
                                    <img src="/WebMAA/Painel_controle/ong/images/botao/bt_cancelar.png" alt="Cancelar" title="Cancelar" class="seta_link" id="cancelar" onmouseover="focoBt('cancelar');" onmouseout="bt('cancelar');" onclick="mostra('alterar','resultAnimal'); mostrar('resultAnimal');" />&nbsp;&nbsp;
                                </a>
                            </div>

                        </div><!--fecha alteRaçao-->



                    </div>

                    <div class="clear">
                    </div>

                </div>
                <!-- FIM DO CONTEUDO -->

            </div>
            <span class="imgFim_sem_coluna"></span>
        </div>


        <!-- Fim do corpo -->

<!-- RodapÃ© -->

        <div id="rodape">
            Versão do Sistema &nbsp;&nbsp; 1.0
        </div>

    </body>

</html>