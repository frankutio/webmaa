
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


    <script>
        function focoBt(id){
            if(id ==="cadastrar"){
                $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_cadastrar_light_verde.png");
            }

            else if(id ==="cadastrar2"){
                $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_cadastrar_light_verde.png");
            }
        }

        function bt(id){
            if(id ==="cadastrar"){
                $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_cadastrar.png");
            }

            else if(id ==="cadastrar2"){
                $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_cadastrar_light_verde.png");
            }
        }

        function validaVacina(id){
            var valor = document.dadosOngVacina.vacina.value;

            if(valor =="sim"){
                $("#"+id).show();
            }
        }

        function validaVacina_usr(id){
            var valor = document.dadosOngVacinaUsr.vacinaUsr.value;

            if(valor =="sim"){
                $("#"+id).show();
            }
        }
    </script>

</head>

<body onload="contAba('dadosGerais','dadosG');">

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
                        <!-- CONTEUDO -->
                        <div class="lista">
                            <div class="bordaFaixaLeft"><span>Cadastro de Animais</span></div>
                            <br />
                        </div>
                        <form id="frmanimais"name="frmanimais">
                            <input type="hidden" name="operacao" value="AnimaisNovoProcessa">
                            <input type="hidden" name="codigo_funcionario" value="<%out.print(session.getAttribute("codigoFuncionario"));%>">
                            <div id="canil" class="mostra">
                                <div class="nota_destaque">Cadastro de Animais em Canil/Gatil</div>
                                <br />

                                <div class="tabsB">
                                    <ul>
                                        <li class="ativo" id="dadosG"><a href="#" onclick="contAba('dadosGerais','dadosG');"><span>Dados Gerais</span></a></li>
                                        <li class="" id="dadosC"><a href="#" onclick="contAba('dadosComplementares','dadosC');"><span>Dados Complemetares</span></a></li>
                                        <li class="" id="obs"><a href="#" onclick="contAba('dadosObservacao','obs');"><span>Observações</span></a></li>
                                    </ul>
                                </div>
                                <div id="cont_aba" style="padding-left:nome;">

                                    <!-- ABA DADOS GERAIS -->
                                    <div id="dadosGerais" class="abaEsconde">
                                        <table class="grid" style="width:100%;">
                                            <tr>
                                                <td width="22%" align="right"><span class="obrigatorio">*</span> Especie: &nbsp;</td>
                                                <td colspan="3"><input type="radio" name="especie" id="especie"  value="Gato"/> Gato &nbsp; &nbsp; <input type="radio" name="especie" value="Cao" /> Cachorro</td>
                                            </tr>
                                            <tr>
                                                <td align="right"><span class="obrigatorio">*</span> Raça: &nbsp;</td>
                                                <td colspan="3">
                                                    <select name="raca">
                                                        <option></option>
                                                        <c:forEach items="${lstRaca}" var="lstRaca">
                                                            <option value="${lstRaca.codigo}"> ${lstRaca.descricao}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right"><span class="obrigatorio">*</span> Nome: &nbsp;</td>
                                                <td colspan="3"><input type="text" name="nome" size="30" /></td>
                                            </tr>
                                            <tr>
                                                <td align="right">Idade Aproximada: &nbsp;</td>
                                                <td colspan="3"><input type="text" name="idade" size="5" /></td>
                                            </tr>
                                            <tr>
                                                <td align="right"><span class="obrigatorio">*</span> Cor Predominante: &nbsp;</td>
                                                <td width="20%">
                                                    <select name="cor1">
                                                        <c:forEach items="${lstCor}" var="lstCor">
                                                            <option value="${lstCor.codigo}"> ${lstCor.descricao}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                                <td width="11%" align="right">2ª Cor: &nbsp;</td>
                                                <td width="47%">
                                                    <select name="cor2">
                                                        <option></option>
                                                        <c:forEach items="${lstCor}" var="lstCor">
                                                            <option value="${lstCor.codigo}"> ${lstCor.descricao}</option>
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
                                                            <option value="${lstpelagem.codigo}"> ${lstpelagem.descricao}</option>
                                                        </c:forEach>
                                                </select></td>
                                            </tr>
                                            <tr>
                                                <td align="right"><span class="obrigatorio">*</span> Porte: &nbsp;</td>
                                                <td colspan="3"><select name="porte">
                                                        <option></option>
                                                        <c:forEach items="${lstPorteAnimal}" var="lstPorteAnimal">
                                                            <option value="${lstPorteAnimal.codigo}"> ${lstPorteAnimal.descricao}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right"><span class="obrigatorio">*</span> Sexo: &nbsp;</td>
                                                <td colspan="3">
                                                    <select name="sexo">
                                                        <option value=""></option>
                                                        <option value="M">Macho</option>
                                                        <option value="F">Femea</option>
                                                    </select>
                                                </td>
                                            </tr>
                                        </table>

                                        <br />
                                        <div align="right" style="width:90%;">
                                            <img src="/WebMAA/Painel_controle/ong/images/botao/bt_voltar_off.png" alt="Voltar" title="Voltar" />&nbsp;&nbsp;
                                            <img src="/WebMAA/Painel_controle/ong/images/botao/bt_avancar.png" alt="Proximo" title="Avançar" class="seta_link" onclick="contAba('dadosComplementares','dadosC');" />
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
                                                        <option value="Sim">SIM</option>
                                                        <option value="Nao">NÃO</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right"><span class="obrigatorio">*</span> Animal com certificado/Laudo Veterianário? &nbsp;</td>
                                                <td colspan="3">
                                                    <select name="laudo">
                                                        <option value="">&nbsp;</option>
                                                        <option value="Sim">SIM</option>
                                                        <option value="Nao">NÃO</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right"><span class="obrigatorio">*</span> Animal Vacinado? &nbsp;</td>
                                                <td width="24%">
                                                    <select name="vacina">
                                                        <option value="">&nbsp;</option>
                                                        <option value="Sim">SIM</option>
                                                        <option value="Nao">NÃO</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr class="mostra" >
                                                <td align="right">Especifique as Doses:</td>
                                                <td><textarea rows="3" cols="55" name="doses" id="doses"></textarea></td>
                                            </tr>
                                            <tr>
                                                <td align="right"><span class="obrigatorio">*</span> Forma de Envio: &nbsp;</td>
                                                <td colspan="3">
                                                    <select name="envio">
                                                        <option></option>
                                                        <c:forEach items="${lstFormaEnvio}" var="lstFormaEnvio">
                                                            <option value="${lstFormaEnvio.codigo}"> ${lstFormaEnvio.descricao}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right"><span class="obrigatorio">*</span> Valor Da Taxa: &nbsp;</td>
                                                <td colspan="3"><input type="text" name="valortaxa" id="valortaxa" class="valortaxa" size="8" /></td>
                                            </tr>
                                        </table>
                                        <br />

                                        <div align="right" style="width:90%;">
                                            <img src="/WebMAA/Painel_controle/ong/images/botao/bt_voltar.png" alt="Voltar" title="Voltar" onclick="contAba('dadosGerais','dadosG');" class="seta_link" />&nbsp;&nbsp;
                                            <img src="/WebMAA/Painel_controle/ong/images/botao/bt_avancar.png" alt="Proximo" title="Avançar" class="seta_link" onclick="contAba('dadosObservacao','obs');" />
                                        </div>

                                    </div>
                                    <!-- ABA DADOS COMPLEMENTARES -->

                                    <!-- ABA OBSERVAÇÃO -->
                                    <div id="dadosObservacao" class="abaEsconde">
                                        <h3>Descrição/Comentário</h3>

                                        <table class="grid">
                                            <tr>
                                                <td>Descreva o seu bichinho mais detalhadamente ou deixe um comentario sobre ele, isso ajuda na hora na adoção.</td>
                                            </tr>
                                            <tr>
                                                <td><textarea rows="5" cols="75" name="descricao"></textarea></td>
                                            </tr>
                                        </table>
                                        <br />

                                        <div align="right" style="width:100%;">
                                            <img src="/WebMAA/Painel_controle/ong/images/botao/bt_voltar.png" alt="Voltar" title="Voltar" onclick="contAba('dadosComplementares','dadosC');" class="seta_link" />&nbsp;&nbsp;
                                            <!--input type="submit" style="background-image:/WebMAA/Painel_controle/ong/images/botao/bt_cadastrar.png;"   alt="Incluir"  name="Incluir"  title="Incluir" class="seta_link"/-->
                                         
                                                <img src="/WebMAA/Painel_controle/ong/images/botao/bt_cadastrar.png" alt="Cadastrar" title="Cadastrar" class="seta_link" id="cadastrar" onmouseover="focoBt('cadastrar');" onmouseout="bt('cadastrar');" onclick="submeterAnimal();"/>
                                         
                                        </div>

                                    </div>
                                    <!-- ABA OBSERVAÇÃO -->

                                    <br />
                                </div>
                            </div>
                        </form>
                        <!-- ANIMAIS EM CANIL -->

                <!-- ANIMAIS COLABORADOR -->

                                <!-- ANIMAIS COLABORADOR -->

                        <br />
                        <div align="right" style="width:90%;">
                            <a href="painel.jsp"><img src="/WebMAA/Painel_controle/ong/images/botao/bt_cancelar.png" alt="Cancelar" title="Cancelar" class="seta_link" /></a>
                        </div>


                    </div>
                    <!-- CONTEUDO -->

                </div>

                <div class="clear">
                </div>

            </div>
            <!-- FIM DO CONTEUDO -->

        </div>
        <span class="imgFim_sem_coluna"></span>
    </div>

  
    <!-- Fim do corpo -->

<!-- Rodapé -->

    <div id="rodape">
        Versão do Sistema &nbsp;&nbsp; 1.0
    </div>

</body>

</html>
