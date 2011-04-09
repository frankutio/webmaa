
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
                                <div class="bordaFaixaLeft"><span>Pesquisa de Animais</span></div>
                                <br />
                                <!-- FILTRO DE PESQUISA -->
                                <div id="filtro">
                                    <span class="obrigatorio">* Campos de Preenchimento Obrigatório</span>
                                    <br />
                                    <form name="frmPesquisa" action="/WebMAA/ControleAnimaisServlet?operacao=AnimaisProcessaPesquisa" method="post">
                                    <input type="hidden" name="operacao" value="AnimaisProcessaPesquisa">
                                        <table class="grid">
                                            <tr align="right">
                                                <td colspan="2" align="left">Preencha pelo menos um campo do filtro abaixo.</td>
                                            </tr>
                                            <tr>
                                                <td align="right"><span class="obrigatorio">*</span> Onde Pesquisar? &nbsp;</td>
                                                <td>
                                                    <select name="localAnimal">
                                                            <option value="Nao"></option>
                                                            <option value="Nao">Animais em Canil/Gatil</option>
                                                            <option value="Sim">Animais em Colaborador</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right"><span class="obrigatorio">*</span> Tipo de animal: &nbsp;</td>
                                                <td>
                                                    <select name="tipoAnimal">
                                                            <option value=""></option>
                                                            <option value="Gato">Gato</option>
                                                            <option value="Cao">CÃ£o</option>
                                                            <option value="Todos">Todos</option>
                                                    </select>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                        <br />
                                        <div align="right" style="width:90%;">
                                            <a href="painel.jsp">
                                                <img src="/WebMAA/Painel_controle/ong/images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link" />
                                            </a>&nbsp;&nbsp;
                                            <a href="javascript:document.getElementById('frmPesquisa').submit();">
                                                <img src="/WebMAA/Painel_controle/ong/images/botao/bt_pesquisar.png" alt="Pesquisar" title="Pesquisar" class="seta_link" id="pesquisa" onmouseover="focoBt('pesquisa');" onmouseout="bt('pesquisa');" onclick="pesquisaAnimal();" />
                                            </a>
                                        </div>
                                        <br />
                                    </form>
                                </div>
                                <!-- FILTRO DE PESQUISA -->

            <!-- RESULTADO DA PESQUISA-->
                                <c:if test="${ResultadoAnimais.codigo == 0}">
                                    <div id="resultAnimal" class="esconde">
                                </c:if>
                                <c:if test="${ResultadoAnimais.codigo != 0}">
                                    <div id="resultAnimal" class="mostra">
                                </c:if>
                                    <div class="nota_destaque" style="width:100%;">Pesquisa de Animais em Canil/Gatil</div>
                                    <br />
                                <form name="frmResultadoPesquisa" method="post">
                                <input type="hidden" name="codigo" id="codigo" value="${ResultadoAnimais.codigo}">
                                    <table class="grid" style="width:100%;">
                                        <tr>
                                            <td width="12%" align="center" class="grid_titulo">Foto</td>
                                            <td width="7%" align="center" class="grid_titulo">Cod</td>
                                            <td width="9%" align="center" class="grid_titulo">Raça</td>
                                            <td width="20%" align="center" class="grid_titulo">Nome</td>
                                            <td width="7%" align="center" class="grid_titulo">Sexo</td>
                                            <td width="16%" align="center" class="grid_titulo">Proprietário</td>
                                            <td width="11%" align="center" class="grid_titulo">Detalhar</td>
                                            <td width="9%" align="center" class="grid_titulo">Alterar</td>
                                            <td width="9%" align="center" class="grid_titulo">Excluir</td>
                                        </tr>
                                        <tr>
                                            <td align="center"><img src="/WebMAA/Painel_controle/ong/images/img_gato/loky.png" alt="locky" width="69" height="59" title="lucky" /></td>
                                            <td align="center">${ResultadoAnimais.codigo}</td>
                                            <td align="center">${ResultadoAnimais.especie}</td>
                                            <td align="center">${ResultadoAnimais.nome}</td>
                                            <td align="center">${ResultadoAnimais.sexo}</td>
                                            <td align="center">${lstColaborador.nome}</td>
                                            <td align="center"><img src="/WebMAA/Painel_controle/ong/images/botao/zoom.png" alt="Detalhar" title="Detalhar" class="seta_link" onclick="mostra('filtro','detalharCanil');" /></td>
                                            <td align="center"><img src="/WebMAA/Painel_controle/ong/images/botao/document_edit.png" alt="Alterar" title="Alterar" class="seta_link" onclick="mostra('filtro','alterar'); mostrar('dadosGerais');" /></td>
                                            <td align="center"><img src="/WebMAA/Painel_controle/ong/images/botao/close.png" alt="Excluir" title="Excluir" class="seta_link" /></td>
                                        </tr>
                                        <tr class="td_escura">
                                            <td align="center"><img src="/WebMAA/Painel_controle/ong/images/img_gato/nanda.png" alt="Nanda" width="69" height="59" title="Nanda" /></td>
                                            <td align="center">02</td>
                                            <td align="center">Comum</td>
                                            <td align="center">Nanda</td>
                                            <td align="center">Femea</td>
                                            <td align="center">Maria Fulana de Aparecida</td>
                                            <td align="center"><img src="/WebMAA/Painel_controle/ong/images/botao/zoom.png" alt="Detalhar" title="Detalhar" class="seta_link" onclick="mostra('filtro','detalharCanil');" /></td>
                                            <td align="center"><img src="/WebMAA/Painel_controle/ong/images/botao/document_edit.png" alt="Alterar" title="Alterar" class="seta_link" onclick="mostra('filtro','alterar'); mostrar('dadosGerais');" /></td>
                                            <td align="center"><img src="/WebMAA/Painel_controle/ong/images/botao/close.png" alt="Excluir" title="Excluir" class="seta_link" /></td>
                                        </tr>
                                    </table>
                                </form>
                                </div>
                                <!-- RESULTADO DA PESQUISA-->

            <!-- RESULTADO DA PESQUISA COLABORADOR -->
                                <div id="resultAnimal_colab" class="esconde">
                                    <div class="nota_destaque" style="width:100%;">Pesquisa de Animais em Colaborador</div>
                                    <br />

                                    <table class="grid" style="width:100%;">
                                        <tr>
                                            <td width="13%" align="center" class="grid_titulo">Foto</td>
                                            <td width="6%" align="center" class="grid_titulo">Cod</td>
                                            <td width="12%" align="center" class="grid_titulo">Raça</td>
                                            <td width="19%" align="center" class="grid_titulo">Nome</td>
                                            <td width="7%" align="center" class="grid_titulo">Sexo</td>
                                            <td width="16%" align="center" class="grid_titulo">Dt. Cadastro</td>
                                            <td width="16%" align="center" class="grid_titulo">Proprietário</td>
                                            <td width="11%" align="center" class="grid_titulo">Detalhar</td>
                                        </tr>
                                        <tr class="td_escura">
                                            <td align="center"><img src="/WebMAA/Painel_controle/ong/images/img_gato/nanda.png" alt="Nanda" width="69" height="59" title="Nanda" /></td>
                                            <td align="center">02</td>
                                            <td align="center">Comum</td>
                                            <td align="center">Nanda</td>
                                            <td align="center">Femea</td>
                                            <td align="center">30/03/2009</td>
                                            <td align="center">Maria Fulana de Aparecida</td>
                                            <td align="center"><img src="/WebMAA/Painel_controle/ong/images/botao/zoom.png" alt="Detalhar" title="Detalhar" class="seta_link" onclick="mostra('filtro','detalharColab');" /></td>
                                        </tr>
                                        <tr>
                                            <td align="center"><img src="/WebMAA/Painel_controle/ong/images/img_gato/loky.png" alt="locky" width="69" height="59" title="lucky" /></td>
                                            <td align="center">01</td>
                                            <td align="center">Comum</td>
                                            <td align="center">Lucky</td>
                                            <td align="center">Macho</td>
                                            <td align="center">04/09/2009</td>
                                            <td align="center">Maria Cicrana de Almeida</td>
                                            <td align="center"><img src="/WebMAA/Painel_controle/ong/images/botao/zoom.png" alt="Detalhar" title="Detalhar" class="seta_link" onclick="mostra('filtro','detalharColab');" /></td>
                                        </tr>
                                    </table>

                                </div>
                                <!-- RESULTADO DA PESQUISA COLABORADOR -->

            <!-- DETALHES DO ANIMAL NO CANIL -->
                                <div id="detalharCanil" class="esconde">
                                    <div class="nota_destaque">Detalhes do Animal</div>
                                    <br />

                                    <!-- FOTO DO ANIMAL -->
                                    <div id="foto">
                                        <img src="../../gato/images/loky.jpg" />
                                    </div>
                                    <!-- FOTO -->
            <!-- DADOS DO ANIMAL -->
                                    <div id="dadosUsuario">
                                        <table class="grid">
                                            <tr>
                                                <td width="33%" align="right">Nº de Identificação: &nbsp;</td>
                                                <td width="67%"><span>01</span></td>
                                            </tr>
                                            <tr>
                                                <td width="33%" align="right">Raça: &nbsp;</td>
                                                <td width="67%"><span>Comum</span></td>
                                            </tr>
                                            <tr>
                                                <td width="33%" align="right">Idade Aproximada: &nbsp;</td>
                                                <td width="67%"><span>7 Meses</span></td>
                                            </tr>
                                            <tr>
                                                <td width="33%" align="right">Cor Predominante: &nbsp;</td>
                                                <td width="67%"><span>champanhe</span></td>
                                            </tr>
                                            <tr>
                                                <td width="33%" align="right">2ª Cor: &nbsp;</td>
                                                <td width="67%"><span>Preto</span></td>
                                            </tr>
                                            <tr>
                                                <td width="33%" align="right">Pelagem: &nbsp;</td>
                                                <td width="67%"><span>Curto</span></td>
                                            </tr>
                                            <tr>
                                                <td width="33%" align="right" valign="top">Sexo: &nbsp;</td>
                                                <td width="67%" valign="top"><span>Macho</span></td>
                                            </tr>
                                        </table>


                                    </div>
                                    <!-- DADOS DO Animal -->

                                    <div class="clear"></div>

                                    <table class="grid">
                                        <tr>
                                            <td><span class="obrigatorio">Descrição do Animal</span></td>
                                        </tr>
                                        <tr>
                                            <td>Oi sou o Lucky, estou a procura de um novo lar, sou muito carinhoso e gosto muito de brincar.</td>
                                        </tr>
                                    </table>
                                    <br />
                                    <div class="nota_destaque">Informações Adicionais</div>
                                    <br />

                                    <table class="grid">
                                        <tr class="td_escura">
                                            <td width="28%" height="16"><strong>Animal Castrado?</strong></td>
                                        </tr>
                                        <tr>
                                            <td width="72%">SIM</td>
                                        </tr>
                                        <tr class="td_escura">
                                            <td><strong>Animal com certificado Veterianário?</strong></td>
                                        </tr>
                                        <tr>
                                            <td>SIM</td>
                                        </tr>
                                        <tr class="td_escura">
                                            <td><strong>Animal Vacinado? </strong></td>
                                        </tr>
                                        <tr>
                                            <td>SIM 1 DOSE</td>
                                        </tr>
                                        <tr class="td_escura">
                                            <td><strong>Forma de Envio:</strong></td>
                                        </tr>
                                        <tr>
                                            <td>CUSTO POR PARTE DO INTERESSADO</td>
                                        </tr>
                                        <tr class="td_escura">
                                            <td>Valor da Taxa:</td>
                                        </tr>
                                        <tr>
                                            <td>R$ 10,00</td>
                                        </tr>
                                    </table>
                                    <br />
                                    <br />

                                    <div align="right" style="width:90%;">
                                        <img src="/WebMAA/Painel_controle/ong/images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link" onclick="mostra('detalhar','filtro'); mostrar('resultAnimal');" />&nbsp;&nbsp;
                                    </div>

                                </div>
                                <!-- DETALHES DO DETALHES DO ANIMAL NO CANIL -->

            <!-- ALTERAR DADOS -->
                                <div id="alterar" class="esconde">
                                    <div class="nota_destaque">AlteraÃ§Ã£o de Dados</div>
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
                                                    <td colspan="3">
                                                        <select name="tipo">
                                                            <option value="0">:: Selecione ::</option>
                                                            <option value="1" selected="selected">Gato</option>
                                                            <option value="2">Cachorro</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><span class="obrigatorio">*</span> Raça: &nbsp;</td>
                                                    <td colspan="3">
                                                        <select name="raca">
                                                            <option value="0">:: Selecione ::</option>
                                                            <option value="1" selected="selected">Base de Dados</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><span class="obrigatorio">*</span> Nome: &nbsp;</td>
                                                    <td colspan="3"><input type="text" name="nome" size="30" value="Lucky" /></td>
                                                </tr>
                                                <tr>
                                                    <td align="right">Idade Aproximada: &nbsp;</td>
                                                    <td colspan="3"><input type="text" name="idade" size="5" value="7 Meses" /></td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><span class="obrigatorio">*</span> Cor Predominante: &nbsp;</td>
                                                    <td width="20%">
                                                        <select name="cor1">
                                                            <option value="0"></option>
                                                            <option value="1" selected="selected">Base de Dados</option>
                                                        </select>
                                                    </td>
                                                    <td width="11%" align="right">2ª Cor: &nbsp;</td>
                                                    <td width="47%">
                                                        <select name="cor2">
                                                            <option value="0"></option>
                                                            <option value="1" selected="selected">Base de Dados</option>
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
                                                            <option value="1" selected="selected">Curta</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><span class="obrigatorio">*</span> Sexo: &nbsp;</td>
                                                    <td colspan="3">
                                                        <select name="sexo">
                                                            <option value="0"></option>
                                                            <option value="1" selected="selected">Macho</option>
                                                            <option value="1">Femea</option>
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
                                                                <option value="sim" selected="selected">SIM</option>
                                                                <option value="nao">NÃO</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right"><span class="obrigatorio">*</span> Animal com certificado/Laudo Veterianário? &nbsp;</td>
                                                        <td colspan="3">
                                                            <select name="laudo">
                                                                <option value="0">&nbsp;</option>
                                                                <option value="sim" selected="selected">SIM</option>
                                                                <option value="nao">NÃO</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right"><span class="obrigatorio">*</span> Animal Vacinado? &nbsp;</td>
                                                        <td width="24%">
                                                            <select name="vacina" onchange="validaVacina('doses');">
                                                                <option value="0">&nbsp;</option>
                                                                <option value="sim" selected="selected">SIM</option>
                                                                <option value="nao">NÃO</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr id="doses">
                                                        <td align="right">Especifique as Doses:</td>
                                                        <td><textarea rows="3" cols="30"> 3 Doses da Vacina Anti-rabica</textarea></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right"><span class="obrigatorio">*</span> Forma de Envio: &nbsp;</td>
                                                        <td colspan="3">
                                                            <select>
                                                                <option></option>
                                                                <option value="0">A COMBINAR</option>
                                                                <option value="1">CUSTO POR PARTE DO DOADOR</option>
                                                                <option value="2" selected="selected">CUSTO POR PARTE DO INTERESSADO</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right"><span class="obrigatorio">*</span> Valor Da Taxa: &nbsp;</td>
                                                        <td colspan="3"><input type="text" class="valor" size="8" value="1000" /></td>
                                                    </tr>
                                                </table>
                                            </form>

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
                                                    <td><textarea rows="5" cols="75" name="descricao">dlks ksÃ§dksdkÃ§ sk dslkÃ§ kdkÃ§</textarea></td>
                                                </tr>
                                            </table>
                                            <br />

                                            <div align="right" style="width:90%;">
                                                <img src="/WebMAA/Painel_controle/ong/images/botao/bt_voltar.png" alt="Voltar" title="Voltar" onclick="contAba('dadosComplementares','dadosC');" class="seta_link" />&nbsp;&nbsp;
                                                <img src="/WebMAA/Painel_controle/ong/images/botao/bt_alterar.png" alt="Alterar" title="Alterar" class="seta_link" id="altera" onmouseover="focoBt('altera');" onmouseout="bt('altera');" onclick="alert('Cadastro Alterado Com Sucesso.'); mostra('detalhar','filtro'); mostrar('resultAnimal');" />
                                            </div>

                                        </div>
                                        <!-- ABA OBSERVAÃ‡ÃƒO -->

                                        <br />
                                    </div>

                                    <br />

                                    <div align="right" style="width:90%;">
                                        <img src="/WebMAA/Painel_controle/ong/images/botao/bt_cancelar.png" alt="Cancelar" title="Cancelar" class="seta_link" id="cancelar" onmouseover="focoBt('cancelar');" onmouseout="bt('cancelar');" onclick="mostra('detalhar','filtro'); mostrar('resultAnimal');" />&nbsp;&nbsp;
                                    </div>

                                </div>
                                <!-- ALTERAR DADOS -->

            <!-- DETALHES DO COLABORADOR -->
                                <div id="detalharColab" class="esconde">
                                    <div class="nota_destaque">Detalhes do Animal</div>
                                    <br />

                                    <!-- FOTO DO ANIMAL -->
                                    <div id="foto">
                                        <img src="../../gato/images/loky.jpg" />
                                    </div>
                                    <!-- FOTO -->
            <!-- DADOS DO ANIMAL -->
                                    <div id="dadosUsuario">
                                        <table class="grid">
                                            <tr>
                                                <td width="33%" align="right">Nº de Identificação: &nbsp;</td>
                                                <td width="67%"><span>01</span></td>
                                            </tr>
                                            <tr>
                                                <td width="33%" align="right">Raça: &nbsp;</td>
                                                <td width="67%"><span>Comum</span></td>
                                            </tr>
                                            <tr>
                                                <td width="33%" align="right">Idade Aproximada: &nbsp;</td>
                                                <td width="67%"><span>7 Meses</span></td>
                                            </tr>
                                            <tr>
                                                <td width="33%" align="right">Cor Predominante: &nbsp;</td>
                                                <td width="67%"><span>champanhe</span></td>
                                            </tr>
                                            <tr>
                                                <td width="33%" align="right">2ª Cor: &nbsp;</td>
                                                <td width="67%"><span>Preto</span></td>
                                            </tr>
                                            <tr>
                                                <td width="33%" align="right">Pelagem: &nbsp;</td>
                                                <td width="67%"><span>Curto</span></td>
                                            </tr>
                                            <tr>
                                                <td width="33%" align="right" valign="top">Sexo: &nbsp;</td>
                                                <td width="67%" valign="top"><span>Macho</span></td>
                                            </tr>
                                        </table>


                                    </div>
                                    <!-- DADOS DO Animal -->

                                    <div class="clear"></div>

                                    <table class="grid">
                                        <tr>
                                            <td><span class="obrigatorio">Descrição do Animal</span></td>
                                        </tr>
                                        <tr>
                                            <td>Oi sou o Lucky, estou a procura de um novo lar, sou muito carinhoso e gosto muito de brincar.</td>
                                        </tr>
                                    </table>
                                    <br />
                                    <div class="nota_destaque">Informações Adicionais</div>
                                    <br />

                                    <table class="grid">
                                        <tr class="td_escura">
                                            <td width="28%" height="16"><strong>Animal Castrado?</strong></td>
                                        </tr>
                                        <tr>
                                            <td width="72%">SIM</td>
                                        </tr>
                                        <tr class="td_escura">
                                            <td><strong>Animal com certificado Veterianário?</strong></td>
                                        </tr>
                                        <tr>
                                            <td>SIM</td>
                                        </tr>
                                        <tr class="td_escura">
                                            <td><strong>Animal Vacinado? </strong></td>
                                        </tr>
                                        <tr>
                                            <td>SIM 1 DOSE</td>
                                        </tr>
                                        <tr class="td_escura">
                                            <td><strong>Forma de Envio:</strong></td>
                                        </tr>
                                        <tr>
                                            <td>CUSTO POR PARTE DO INTERESSADO</td>
                                        </tr>
                                    </table>
                                    <br />
                                    <br />

                                    <div align="right" style="width:90%;">
                                        <img src="/WebMAA/Painel_controle/ong/images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link" onclick="mostra('detalharColab','filtro'); mostrar('resultAnimal_colab');" />&nbsp;&nbsp;
                                    </div>

                                </div>
                                <!-- DETALHES DO DETALHES DO ANIMAL COLABORADOR -->

            <!-- ALTERAR DADOS -->
                                <div id="alterar_colab" class="esconde">
                                    <div class="nota_destaque">AlteraÃ§Ã£o de Dados</div>
                                    <br />

                                    <div class="tabsB">
                                        <ul>
                                            <li class="ativo" id="dadosG_usr"><a href="#" onclick="contAba('dadosGerais_usr','dadosG_usr');"><span>Dados Gerais</span></a></li>
                                            <li class="" id="dadosC_usr"><a href="#" onclick="contAba('dadosComplementares_usr','dadosC_usr');"><span>Dados Complemetares</span></a></li>
                                            <li class="" id="obs_usr"><a href="#" onclick="contAba('dadosObservacao_usr','obs_usr');"><span>ObservaÃ§Ãµes</span></a></li>
                                        </ul>
                                    </div>
                                    <div id="cont_aba" style="padding-left:nome;">

                                        <!-- ABA DADOS GERAIS -->
                                        <div id="dadosGerais_usr" class="abaEsconde">
                                            <table class="grid" style="width:100%;">
                                                <tr>
                                                    <td width="22%" align="right"><span class="obrigatorio">*</span> Especie: &nbsp;</td>
                                                    <td colspan="3"> Gato <input type="radio" name="tipo" checked="checked" /> &nbsp;&nbsp; Cachorro <input type="radio" name="tipo" /></td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><span class="obrigatorio">*</span> Raça: &nbsp;</td>
                                                    <td colspan="3">
                                                        <select name="raca">
                                                            <option value="0">:: Selecione ::</option>
                                                            <option value="1" selected="selected">Base de Dados</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><span class="obrigatorio">*</span> Nome: &nbsp;</td>
                                                    <td colspan="3"><input type="text" name="nome" size="30" value="Lucky" /></td>
                                                </tr>
                                                <tr>
                                                    <td align="right">Idade Aproximada: &nbsp;</td>
                                                    <td colspan="3"><input type="text" name="idade" size="5" value="7 Meses" /></td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><span class="obrigatorio">*</span> Cor Predominante: &nbsp;</td>
                                                    <td width="20%">
                                                        <select name="cor1">
                                                            <option value="0"></option>
                                                            <option value="1" selected="selected">Base de Dados</option>
                                                        </select>
                                                    </td>
                                                    <td width="11%" align="right">2ª Cor: &nbsp;</td>
                                                    <td width="47%">
                                                        <select name="cor2">
                                                            <option value="0"></option>
                                                            <option value="1" selected="selected">Base de Dados</option>
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
                                                            <option value="1" selected="selected">Curta</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><span class="obrigatorio">*</span> Sexo: &nbsp;</td>
                                                    <td colspan="3">
                                                        <select name="sexo">
                                                            <option value="0"></option>
                                                            <option value="1" selected="selected">Macho</option>
                                                            <option value="1">Femea</option>
                                                        </select>
                                                    </td>
                                                </tr>

                                            </table>

                                            <br />
                                            <div align="right" style="width:90%;">
                                                <img src="/WebMAA/Painel_controle/ong/images/botao/bt_voltar_off.png" alt="Voltar" title="Voltar" />&nbsp;&nbsp;
                                                <img src="/WebMAA/Painel_controle/ong/images/botao/bt_avancar.png" alt="Proximo" title="AvanÃ§ar" class="seta_link" onclick="contAba('dadosComplementares_usr','dadosC_usr');" />
                                            </div>

                                        </div>
                                        <!-- ABA DADOS GERAIS -->

                 <!-- ABA DADOS COMPLEMENTARES -->
                                        <div id="dadosComplementares_usr" class="abaEsconde">
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
                                                                <option value="sim" selected="selected">SIM</option>
                                                                <option value="nao">NÃO</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right"><span class="obrigatorio">*</span> Animal com certificado/Laudo Veterianário? &nbsp;</td>
                                                        <td colspan="3">
                                                            <select name="laudo">
                                                                <option value="0">&nbsp;</option>
                                                                <option value="sim" selected="selected">SIM</option>
                                                                <option value="nao">NÃO</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right"><span class="obrigatorio">*</span> Animal Vacinado? &nbsp;</td>
                                                        <td width="24%">
                                                            <select name="vacina" onchange="validaVacina('doses');">
                                                                <option value="0">&nbsp;</option>
                                                                <option value="sim" selected="selected">SIM</option>
                                                                <option value="nao">NÃO</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr id="doses">
                                                        <td align="right">Especifique as Doses:</td>
                                                        <td><textarea rows="3" cols="30"> 3 Doses da Vacina Anti-rabica</textarea></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right"><span class="obrigatorio">*</span> Forma de Envio: &nbsp;</td>
                                                        <td colspan="3">
                                                            <select>
                                                                <option></option>
                                                                <option value="0">A COMBINAR</option>
                                                                <option value="1">CUSTO POR PARTE DO DOADOR</option>
                                                                <option value="2" selected="selected">CUSTO POR PARTE DO INTERESSADO</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </form>

                                            <br />

                                            <div align="right" style="width:90%;">
                                                <img src="/WebMAA/Painel_controle/ong/images/botao/bt_voltar.png" alt="Voltar" title="Voltar" onclick="contAba('dadosGerais_usr','dadosG_usr');" class="seta_link" />&nbsp;&nbsp;
                                                <img src="/WebMAA/Painel_controle/ong/images/botao/bt_avancar.png" alt="Proximo" title="AvanÃ§ar" class="seta_link" onclick="contAba('dadosObservacao_usr','obs_usr');" />
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
                                                    <td><textarea rows="5" cols="75" name="descricao">dlks ksÃ§dksdkÃ§ sk dslkÃ§ kdkÃ§</textarea></td>
                                                </tr>
                                            </table>
                                            <br />

                                            <div align="right" style="width:90%;">
                                                <img src="/WebMAA/Painel_controle/ong/images/botao/bt_voltar.png" alt="Voltar" title="Voltar" onclick="contAba('dadosComplementares_usr','dadosC_usr');" class="seta_link" />&nbsp;&nbsp;
                                                <img src="/WebMAA/Painel_controle/ong/images/botao/bt_alterar.png" alt="Alterar" title="Alterar" class="seta_link" id="altera2" onmouseover="focoBt('altera2');" onmouseout="bt('altera2');" onclick="alert('Cadastro Alterado Com Sucesso.'); mostra('detalharColab','filtro'); mostrar('resultAnimal_colab');" />
                                            </div>

                                        </div>
                                        <!-- ABA OBSERVAÃ‡ÃƒO -->

                                        <br />
                                    </div>

                                    <br />

                                    <div align="right" style="width:90%;">
                                        <img src="/WebMAA/Painel_controle/ong/images/botao/bt_cancelar.png" alt="Cancelar" title="Cancelar" class="seta_link" id="cancelar" onmouseover="focoBt('cancelar');" onmouseout="bt('cancelar');" onclick="mostra('detalharColab','filtro'); mostrar('resultAnimal_colab');" />&nbsp;&nbsp;
                                    </div>

                                </div>
                                <!-- ALTERAR DADOS -->

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