<%-- 
    Document   : cad_animal
    Created on : 02/10/2009, 16:57:36
    Author     : usuario
--%>

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
                if(id ==="cadastrar"){
                    $("#"+id).attr("src","images/botao/bt_cadastrar_light_verde.png");
                }

                else if(id ==="cadastrar2"){
                    $("#"+id).attr("src","images/botao/bt_cadastrar_light_verde.png");
                }
            }

            function bt(id){
                if(id ==="cadastrar"){
                    $("#"+id).attr("src","images/botao/bt_cadastrar.png");
                }

                else if(id ==="cadastrar2"){
                    $("#"+id).attr("src","images/botao/bt_cadastrar_light_verde.png");
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
                            <!-- CONTEUDO -->
                            <div class="lista">
                                <div class="bordaFaixaLeft"><span>Cadastro de Animais</span></div>
                                <br />

                                <!-- FILTRO -->
                                <div id="filtro">
                                    <div class="nota_informa">
                                        <span>Evite o cadastramento de animais fora de nosso Canil/Gatil.</span>
                                    </div>

                                    <span class="obrigatorio">* Campos de Preenchimento Obrigatório</span>
                                    <br />
                                    <br />

                                    <form name="filtro">
                                        <table class="grid">
                                            <tr>
                                                <td colspan="2">Especifique o tipo de Cadastramento a ser Realizado</td>
                                            </tr>
                                            <tr>
                                                <td width="27%" align="right"><span class="obrigatorio">*</span> Tipo de Cadastro: &nbsp;</td>
                                                <td width="73%">
                                                    <select name="cadAnimal" onchange="validaEscolha();">
                                                        <option value="0">:: Escolha ::</option>
                                                        <option value="1">Animais em Canil/Gatil</option>
                                                        <option value="2">Animais em poder do Colaborador</option>
                                                    </select>
                                                </td>
                                            </tr>
                                        </table>
                                    </form>
                                    <br />
                                    <br />

                                </div>
                                <!-- FILTRO -->

                <!-- ANIMAIS EM CANIL -->
                                <div id="canil" class="esconde">
                                    <div class="nota_destaque">Cadastro de Animais em Canil/Gatil</div>
                                    <br />

                                    <div class="tabsB">
                                        <ul>
                                            <li class="ativo" id="dadosG"><a href="#" onclick="contAba('dadosGerais','dadosG');"><span>Dados Gerais</span></a></li>
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
                                                    <td colspan="3"><input type="radio" name="esp" /> Gato &nbsp; &nbsp; <input type="radio" name="esp" /> Cachorro</td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><span class="obrigatorio">*</span> Raça: &nbsp;</td>
                                                    <td colspan="3">
                                                        <select name="raca">
                                                            <option value="0">:: Selecione ::</option>
                                                            <option value="1">Base de Dados</option>
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
                                                            <option value="0"></option>
                                                            <option value="1">Base de Dados</option>
                                                        </select>
                                                    </td>
                                                    <td width="11%" align="right">2ª Cor: &nbsp;</td>
                                                    <td width="47%">
                                                        <select name="cor2">
                                                            <option value="0"></option>
                                                            <option value="1">Base de Dados</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><span class="obrigatorio">*</span> Pelagem: &nbsp;</td>
                                                    <td colspan="3"><select name="pelagem2">
                                                            <option value="0">:: Selecione ::</option>
                                                            <option value="1">Longa</option>
                                                            <option value="1">Media</option>
                                                            <option value="1">Curta</option>
                                                    </select></td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><span class="obrigatorio">*</span> Porte: &nbsp;</td>
                                                    <td colspan="3"><select>
                                                            <option></option>
                                                            <option>Base de Dados</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><span class="obrigatorio">*</span> Sexo: &nbsp;</td>
                                                    <td colspan="3">
                                                        <select name="sexo">
                                                            <option value="0"></option>
                                                            <option value="1">Macho</option>
                                                            <option value="1">Femea</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                            </table>

                                            <br />
                                            <div align="right" style="width:90%;">
                                                <img src="images/botao/bt_voltar_off.png" alt="Voltar" title="Voltar" />&nbsp;&nbsp;
                                                <img src="images/botao/bt_avancar.png" alt="Proximo" title="AvanÃ§ar" class="seta_link" onclick="contAba('dadosComplementares','dadosC');" />
                                            </div>

                                        </div>
                                        <!-- ABA DADOS GERAIS -->

                 <!-- ABA DADOS COMPLEMENTARES -->
                                        <div id="dadosComplementares" class="abaEsconde">
                                            <form name="dadosOngVacina">
                                                <table class="grid" style="width:100%;">
                                                    <tr>
                                                        <td align="right"><span class="obrigatorio">*</span> Foto: &nbsp;</td>
                                                        <td colspan="3"><input type="file" name="foto" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="23%" align="right"><span class="obrigatorio">*</span> Animal Castrado? &nbsp;</td>
                                                        <td colspan="3">
                                                            <select name="posse">
                                                                <option value="0">&nbsp;</option>
                                                                <option value="sim">SIM</option>
                                                                <option value="nao">NÃO</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right"><span class="obrigatorio">*</span> Animal com certificado/Laudo Veterianário? &nbsp;</td>
                                                        <td colspan="3">
                                                            <select name="laudo">
                                                                <option value="0">&nbsp;</option>
                                                                <option value="sim">SIM</option>
                                                                <option value="nao">NÃO</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right"><span class="obrigatorio">*</span> Animal Vacinado? &nbsp;</td>
                                                        <td width="24%">
                                                            <select name="vacina" onchange="validaVacina('doses');">
                                                                <option value="0">&nbsp;</option>
                                                                <option value="sim">SIM</option>
                                                                <option value="nao">NÃO</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr class="esconde" id="doses">
                                                        <td align="right">Especifique as Doses:</td>
                                                        <td><textarea rows="3" cols="30"></textarea></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right"><span class="obrigatorio">*</span> Forma de Envio: &nbsp;</td>
                                                        <td colspan="3">
                                                            <select>
                                                                <option></option>
                                                                <option value="0">A COMBINAR</option>
                                                                <option value="1">CUSTO POR PARTE DO DOADOR</option>
                                                                <option value="2">CUSTO POR PARTE DO INTERESSADO</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right"><span class="obrigatorio">*</span> Valor Da Taxa: &nbsp;</td>
                                                        <td colspan="3"><input type="text" class="valor" size="8" /></td>
                                                    </tr>
                                                </table>
                                            </form>

                                            <br />

                                            <div align="right" style="width:90%;">
                                                <img src="images/botao/bt_voltar.png" alt="Voltar" title="Voltar" onclick="contAba('dadosGerais','dadosG');" class="seta_link" />&nbsp;&nbsp;
                                                <img src="images/botao/bt_avancar.png" alt="Proximo" title="AvanÃ§ar" class="seta_link" onclick="contAba('dadosObservacao','obs');" />
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
                                                    <td><textarea rows="5" cols="75" name="descricao"></textarea></td>
                                                </tr>
                                            </table>
                                            <br />

                                            <div align="right" style="width:90%;">
                                                <img src="images/botao/bt_voltar.png" alt="Voltar" title="Voltar" onclick="contAba('dadosComplementares','dadosC');" class="seta_link" />&nbsp;&nbsp;
                                                <img src="images/botao/bt_cadastrar.png" alt="Cadastrar" title="Cadastrar" class="seta_link" id="cadastrar" onmouseover="focoBt('cadastrar');" onmouseout="bt('cadastrar');" onclick="alert('Cadastro Realizado Com Sucesso.'); window.location='cad_animal.jsp';"/>
                                            </div>

                                        </div>
                                        <!-- ABA OBSERVAÃ‡ÃƒO -->

                                        <br />
                                    </div>
                                </div>
                                <!-- ANIMAIS EM CANIL -->

                <!-- ANIMAIS COLABORADOR -->
                                <div id="colab" class="esconde">
                                    <div class="nota_destaque">Cadastro de Animais em Colaborador</div>
                                    <br />

                                    <div class="tabsB">
                                        <ul>
                                            <li class="ativo" id="dadosG_usr"><a href="#" onclick="contAba('dadosGerais_usr','dadosG_usr');"><span>Dados Gerais</span></a></li>
                                            <li class="" id="dadosC_usr"><a href="#" onclick="contAba('dadosComplementares_usr','dadosC_usr');"><span>Dados Complemetares</span></a></li>
                                            <li class="" id="obs_usr"><a href="#" onclick="contAba('dadosObservacao_usr','obs_usr');"><span>ObservaÃ§Ãµes</span></a></li>
                                        </ul>
                                    </div>
                                    <div class="cont_aba" style="padding-left:nome;">

                                        <!-- ABA DADOS GERAIS -->
                                        <div id="dadosGerais_usr" class="abaEsconde">

                                            <table class="grid" style="width:100%;">
                                                <tr>
                                                    <td width="22%" align="right"><span class="obrigatorio">*</span> Especie: &nbsp;</td>
                                                    <td colspan="3"><input type="radio" name="esp" /> Gato &nbsp; &nbsp; <input type="radio" name="esp" /> Cachorro</td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><span class="obrigatorio">*</span> Raça: &nbsp;</td>
                                                    <td colspan="3">
                                                        <select name="raca">
                                                            <option value="0">:: Selecione ::</option>
                                                            <option value="1">Base de Dados</option>
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
                                                            <option value="0"></option>
                                                            <option value="1">Base de Dados</option>
                                                        </select>
                                                    </td>
                                                    <td width="11%" align="right">2ª Cor: &nbsp;</td>
                                                    <td width="47%">
                                                        <select name="cor2">
                                                            <option value="0"></option>
                                                            <option value="1">Base de Dados</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><span class="obrigatorio">*</span> Pelagem: &nbsp;</td>
                                                    <td colspan="3">
                                                        <select name="pelagem">
                                                            <option value="0">:: Selecione ::</option>
                                                            <option value="1">Longa</option>
                                                            <option value="1">Media</option>
                                                            <option value="1">Curta</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><span class="obrigatorio">*</span> Porte: &nbsp;</td>
                                                    <td colspan="3"><select>
                                                            <option></option>
                                                            <option>Base de Dados</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><span class="obrigatorio">*</span> Sexo: &nbsp;</td>
                                                    <td colspan="3">
                                                        <select name="sexo">
                                                            <option value=""></option>
                                                            <option value="1">Macho</option>
                                                            <option value="0">Femea</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                            </table>

                                            <br />
                                            <div align="right" style="width:90%;">
                                                <img src="images/botao/bt_voltar_off.png" alt="Voltar" title="Voltar" />&nbsp;&nbsp;
                                                <img src="images/botao/bt_avancar.png" alt="Proximo" title="AvanÃ§ar" class="seta_link" onclick="contAba('dadosComplementares_usr','dadosC_usr');" />
                                            </div>

                                        </div>
                                        <!-- ABA DADOS GERAIS -->

                 <!-- ABA DADOS COMPLEMENTARES -->
                                        <div id="dadosComplementares_usr" class="abaEsconde">
                                            <form name="dadosOngVacinaUsr">
                                                <table class="grid" style="width:100%;">
                                                    <tr>
                                                        <td align="right">Foto: &nbsp;</td>
                                                        <td colspan="3"><input type="file" name="foto" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="23%" align="right">Animal Castrado? &nbsp;</td>
                                                        <td colspan="3">
                                                            <select name="posse">
                                                                <option value="0">&nbsp;</option>
                                                                <option value="sim">SIM</option>
                                                                <option value="nao">NÃO</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Animal com certificado/Laudo Veterianário? &nbsp;</td>
                                                        <td colspan="3">
                                                            <select name="laudo">
                                                                <option value="0">&nbsp;</option>
                                                                <option value="sim">SIM</option>
                                                                <option value="nao">NÃO</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right"><span class="obrigatorio">*</span> Animal Vacinado? &nbsp;</td>
                                                        <td width="24%">
                                                            <select name="vacinaUsr" onchange="validaVacina_usr('doses_usr');">
                                                                <option value="0">&nbsp;</option>
                                                                <option value="sim">SIM</option>
                                                                <option value="nao">NÃO</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr class="esconde" id="doses_usr">
                                                        <td align="right">Especifique as Doses:</td>
                                                        <td><textarea rows="3" cols="30"></textarea></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right"><span class="obrigatorio">*</span> Forma de Envio: &nbsp;</td>
                                                        <td colspan="3">
                                                            <select>
                                                                <option></option>
                                                                <option value="0">A COMBINAR</option>
                                                                <option value="1">CUSTO POR PARTE DO DOADOR</option>
                                                                <option value="2">CUSTO POR PARTE DO INTERESSADO</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </form>

                                            <br />

                                            <div align="right" style="width:90%;">
                                                <img src="images/botao/bt_voltar.png" alt="Voltar" title="Voltar" onclick="contAba('dadosGerais_usr','dadosG_usr');" class="seta_link" />&nbsp;&nbsp;
                                                <img src="images/botao/bt_avancar.png" alt="Proximo" title="AvanÃ§ar" class="seta_link" onclick="contAba('dadosObservacao_usr','obs_usr');" />
                                            </div>

                                        </div>
                                        <!-- ABA DADOS COMPLEMENTARES -->

                 <!-- ABA OBSERVAÃ‡ÃƒO -->
                                        <div id="dadosObservacao_usr" class="abaEsconde">
                                            <h3>Descrição/Comentário</h3>

                                            <table class="grid">
                                                <tr>
                                                    <td>Descreva o seu bichinho mais detalhadamente ou deixe um comentario sobre ele, isso ajuda na hora na adoÃ§Ã£o.</td>
                                                </tr>
                                                <tr>
                                                    <td><textarea rows="5" cols="75" name="descricao"></textarea></td>
                                                </tr>
                                            </table>
                                            <br />

                                            <div align="right" style="width:90%;">
                                                <img src="images/botao/bt_voltar.png" alt="Voltar" title="Voltar" onclick="contAba('dadosComplementares_usr','dadosC_usr');" class="seta_link" />&nbsp;&nbsp;
                                                <img src="images/botao/bt_cadastrar.png" alt="Cadastrar" title="Cadastrar" class="seta_link" id="cadastrar2" onmouseover="focoBt('cadastrar2');" onmouseout="bt('cadastrar2');" onclick="alert('Cadastro Realizado Com Sucesso.'); window.location='cad_animal.jsp';"/>
                                            </div>

                                        </div>
                                        <!-- ABA OBSERVAÃ‡ÃƒO -->

                                        <br />
                                    </div>
                                </div>
                                <!-- ANIMAIS COLABORADOR -->

                                <br />
                                <div align="right" style="width:90%;">
                                    <a href="painel.jsp"><img src="images/botao/bt_cancelar.png" alt="Cancelar" title="Cancelar" class="seta_link" /></a>
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

        </div>
        <!-- Fim do corpo -->

<!-- RodapÃ© -->

        <div id="rodape">
            Versão do Sistema &nbsp;&nbsp; 1.0
        </div>

    </body>

</html>
