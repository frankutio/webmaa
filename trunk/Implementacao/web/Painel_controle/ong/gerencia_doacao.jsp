<%-- 
    Document   : gerencia_doacao
    Created on : 02/10/2009, 17:01:58
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

    <script type="text/javascript" src="js/jquery.min.js"></script>


    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/utilidades.js"></script>
    <script type="text/javascript" src="js/maskedinput.js"></script>
    <script type="text/javascript" src="js/jquery-ui-datepicker.js"></script>
    <script type="text/javascript" src="js/menuVertical.js"></script>

    <script type="text/javascript" src="js/modal.js"></script>
    <link type="text/css" rel="stylesheet" href="css/estilo_modal.css" />

    <script>
        function focoBt(id){
            if(id ==="pesquisa"){
                $("#"+id).attr("src","images/botao/bt_pesquisar_light.png");
            }

            else if(id ==="enviar"){
                $("#"+id).attr("src","images/botao/bt_enviar_light.png");
            }

            else if(id ==="altera"){
                $("#"+id).attr("src","images/botao/bt_alterar_light.png");
            }

            else if(id ==="ok"){
                $("#"+id).attr("src","images/botao/bt_ok_light.png");
            }
        }

        function bt(id){
            if(id ==="pesquisa"){
                $("#"+id).attr("src","images/botao/bt_pesquisar.png");
            }

            else if(id ==="enviar"){
                $("#"+id).attr("src","images/botao/bt_enviar.png");
            }

            else if(id ==="altera"){
                $("#"+id).attr("src","images/botao/bt_alterar.png");
            }

            else if(id ==="ok"){
                $("#"+id).attr("src","images/botao/bt_ok.png");
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

                        <div class="lista">
                            <div class="bordaFaixaLeft"><span>Gerenciamento de Doações</span></div>
                            <br />
                            <!-- FILTRO DE PESQUISA -->
                            <div id="filtro">
                                <br />
                                <div class="nota_destaque">Filtro de Pesquisa</div>
                                <br />

                                <span class="obrigatorio">* Campos de Preenchimento Obrigatório</span>
                                <br />

                                <form name="pesquisa">
                                    <table class="grid">
                                        <tr>
                                            <td width="23%" align="right">Cod: &nbsp;</td>
                                            <td width="77%"><input type="text" name="cod" size="5" /></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Nome: &nbsp;</td>
                                            <td><input type="text" name="nome" size="40" /></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Onde Pesquisar? &nbsp;</td>
                                            <td><select name="tipoPesquisa" disabled="disabled">
                                                    <option value="0"></option>
                                                    <option value="1">Animais em Canil/Gatil</option>
                                                    <option value="2" selected="selected">Animais em Colaborador</option>
                                            </select></td>
                                        </tr>
                                        <tr>
                                            <td align="right"><span class="obrigatorio">*</span> Tipo de animal: &nbsp;</td>
                                            <td><select>
                                                    <option value="0"></option>
                                                    <option value="1">Gato</option>
                                                    <option value="2">Cão</option>
                                                    <option value="3">Todos</option>
                                            </select></td>
                                        </tr>
                                    </table>
                                </form>
                                <br />
                                <br />

                                <div align="right" style="width:90%;">
                                    <a href="painel.jsp"><img src="images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link" /></a>&nbsp;&nbsp;
                                    <img src="images/botao/bt_pesquisar.png" alt="Pesquisar" title="Pesquisar" class="seta_link" id="pesquisa" onmouseover="focoBt('pesquisa');" onmouseout="bt('pesquisa');" onclick="mostra('','rel_colab_fila');" />
                                </div>

                                <br />

                            </div>
                            <!-- FILTRO DE PESQUISA -->


            <!-- RELATÓRIO COLABORADOR FILA -->
                            <div id="rel_colab_fila" class="esconde" >
                                <div class="nota_destaque" style="width:100%;">Total de Animais Cadastrados: XX</div>
                                <br />

                                <table class="grid" style="width:100%;">
                                    <tr>
                                        <td width="13%" align="center" class="grid_titulo">Foto</td>
                                        <td width="6%" align="center" class="grid_titulo">Cod</td>
                                        <td width="15%" align="center" class="grid_titulo">Nome</td>
                                        <td width="8%" align="center" class="grid_titulo">Tipo</td>
                                        <td width="13%" align="center" class="grid_titulo">Raça</td>
                                        <td width="16%" align="center" class="grid_titulo">Dt. Cadastro</td>
                                        <td width="11%" align="center" class="grid_titulo">Detalhar</td>
                                        <td width="9%" align="center" class="grid_titulo">Alterar</td>
                                        <td width="9%" align="center" class="grid_titulo">Excluir</td>
                                    </tr>
                                    <tr class="td_escura">
                                        <td align="center"><img src="images/img_gato/nanda.png" alt="Nanda" width="69" height="59" title="Nanda" /></td>
                                        <td align="center">02</td>
                                        <td align="center">Lucky</td>
                                        <td align="center">Gato</td>
                                        <td align="center">Comum</td>
                                        <td align="center">20/01/2009</td>
                                        <td align="center"><img src="images/botao/zoom.png" alt="Detalhar" title="Detalhar" class="seta_link" onclick="mostra('filtro','detalharColab');" /></td>
                                        <td align="center"><img src="images/botao/document_edit.png" alt="Alterar" title="Alterar" class="seta_link" onclick="mostra('filtro','alterar_colab'); mostrar('dadosGerais_usr');" /></td>
                                        <td align="center"><a href="#conf_del" name="modal"><img src="images/botao/close.png" alt="Excluir" title="Excluir" class="seta_link" /></a></td>
                                    </tr>
                                    <tr>
                                        <td align="center"><img src="images/img_gato/loky.png" alt="locky" width="69" height="59" title="lucky" /></td>
                                        <td align="center">03</td>
                                        <td align="center">Lucky</td>
                                        <td align="center">Gato</td>
                                        <td align="center">Comum</td>
                                        <td align="center">20/01/2009</td>
                                        <td align="center"><img src="images/botao/zoom.png" alt="Detalhar" title="Detalhar" class="seta_link" onclick="mostra('filtro','detalharColab');" /></td>
                                        <td align="center"><img src="images/botao/document_edit.png" alt="Alterar" title="Alterar" class="seta_link" onclick="mostra('filtro','alterar_colab'); mostrar('dadosGerais_usr');" /></td>
                                        <td align="center"><img src="images/botao/close.png" alt="Excluir" title="Excluir" class="seta_link" /></td>
                                    </tr>
                                </table>

                                <br />
                            </div>

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

                                <div class="nota_destaque">Proprietário</div>

                                <br />
                                <span class="obrigatorio">Nota: para mandar uma notificação ao colaborador, clique no envelope na coluna &lt;Notificar&gt;</span>


                                <table class="grid" style="width:100%;">
                                    <tr>
                                        <td width="6%" align="center" class="grid_titulo">Cod</td>
                                        <td width="23%" align="center" class="grid_titulo">Nome</td>
                                        <td width="11%" align="center" class="grid_titulo">Sexo</td>
                                        <td width="5%" align="center" class="grid_titulo">UF</td>
                                        <td width="15%" align="center" class="grid_titulo">Telefone</td>
                                        <td width="29%" align="center" class="grid_titulo">E-mail</td>
                                        <td width="11%" align="center" class="grid_titulo">Notificar</td>
                                    </tr>
                                    <tr>
                                        <td width="6%" align="center">U01</td>
                                        <td width="23%" align="center">José Sicrano</td>
                                        <td width="11%" align="center">Masculino</td>
                                        <td width="5%" align="center">DF</td>
                                        <td width="15%" align="center">61 33974794</td>
                                        <td width="29%" align="center">jose@email.com</td>
                                        <td width="11%" align="center"><a href="#notificar" name="modal"><img src="images/botao/ler_email.png" alt="Notificar" title="Notificar Usuario" class="seta_link" /></a></td>
                                    </tr>
                                </table>
                                <br />
                                <div id="confNote" class="esconde" style="color:#060;">
                                    <img src="images/botao/aprova.png" />&nbsp;&nbsp; Notificação Enviada Com Sucesso!
                                </div>
                                <br />
                                <br />

                                <div align="right" style="width:90%;">
                                    <img src="images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link" onclick="mostra('detalharColab','filtro'); mostrar('rel_colab_fila');" />&nbsp;&nbsp;
                                </div>

                            </div>
                            <!-- DETALHES DO DETALHES DO ANIMAL COLABORADOR -->

            <!-- ALTERAR DADOS -->
                            <div id="alterar_colab" class="esconde">
                                <div class="nota_destaque">Alteração de Dados</div>
                                <br />

                                <div class="tabsB">
                                    <ul>
                                        <li class="ativo" id="dadosG_usr"><a href="#" onclick="contAba('dadosGerais_usr','dadosG_usr');"><span>Dados Gerais</span></a></li>
                                        <li class="" id="dadosC_usr"><a href="#" onclick="contAba('dadosComplementares_usr','dadosC_usr');"><span>Dados Complemetares</span></a></li>
                                        <li class="" id="obs_usr"><a href="#" onclick="contAba('dadosObservacao_usr','obs_usr');"><span>Observações</span></a></li>
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
                                            <img src="images/botao/bt_voltar_off.png" alt="Voltar" title="Voltar" />&nbsp;&nbsp;
                                            <img src="images/botao/bt_avancar.png" alt="Proximo" title="Avançar" class="seta_link" onclick="contAba('dadosComplementares_usr','dadosC_usr');" />
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
                                            <img src="images/botao/bt_voltar.png" alt="Voltar" title="Voltar" onclick="contAba('dadosGerais_usr','dadosG_usr');" class="seta_link" />&nbsp;&nbsp;
                                            <img src="images/botao/bt_avancar.png" alt="Proximo" title="Avançar" class="seta_link" onclick="contAba('dadosObservacao_usr','obs_usr');" />
                                        </div>

                                    </div>
                                    <!-- ABA DADOS COMPLEMENTARES -->

                 <!-- ABA OBSERVAÇÃO -->
                                    <div id="dadosObservacao_usr" class="abaEsconde">
                                        <h3>Descrição/Comentário</h3>

                                        <table class="grid">
                                            <tr>
                                                <td>Descreva o seu bichinho mais detalhadamente ou deixe um comentario sobre ele, isso ajuda na hora na adoção.</td>
                                            </tr>
                                            <tr>
                                                <td><textarea rows="5" cols="75" name="descricao">dlks ksçdksdkç sk dslkç kdkç</textarea></td>
                                            </tr>
                                        </table>
                                        <br />

                                        <div align="right" style="width:90%;">
                                            <img src="images/botao/bt_voltar.png" alt="Voltar" title="Voltar" onclick="contAba('dadosComplementares_usr','dadosC_usr');" class="seta_link" />&nbsp;&nbsp;
                                            <img src="images/botao/bt_alterar.png" alt="Alterar" title="Alterar" class="seta_link" id="altera" onmouseover="focoBt('altera');" onmouseout="bt('altera');" onclick="alert('Cadastro Alterado Com Sucesso.'); mostra('detalharColab','filtro'); mostrar('rel_colab_fila');" />
                                        </div>

                                    </div>
                                    <!-- ABA OBSERVAÇÃO -->

                                    <br />
                                </div>

                                <br />

                                <div align="right" style="width:90%;">
                                    <img src="images/botao/bt_cancelar.png" alt="Cancelar" title="Cancelar" class="seta_link" id="cancelar" onmouseover="focoBt('cancelar');" onmouseout="bt('cancelar');" onclick="mostra('detalharColab','filtro'); mostrar('rel_colab_fila');" />&nbsp;&nbsp;
                                </div>

                            </div>
                            <!-- ALTERAR DADOS -->

                        </div>
                        <!-- RELATÓRIO COLABORADOR FILA -->



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

    <!-- Modal -->
    <div id="boxes">
        <!-- Janela Modal com caixa de diálogo (NOTIFICAÇÕES)-->

        <div id="notificar" class="window">

            <div class="cont_modal">

                <!-- DETALHES DA MENSAGEM -->
                <div id="conteudoDetalhe">
                    <div class="bordaFaixaLeft" style="width:95%; margin-left:2%;">
                        <span>Notificações</span>
                    </div>
                    <br />

                    <span class="obrigatorio">* Campo de Preenchimento Obrigatório</span>
                    <br />
                    <br />
                    <table class="grid" style=" width:98%;">
                        <tr>
                            <td width="26%" align="right">Cod. Usuario: &nbsp;</td>
                            <td width="74%"><input type="text" value="U01" disabled="disabled" size="5" /></td>
                        </tr>
                        <tr>
                            <td width="26%" align="right">Dt. Envio: &nbsp;</td>
                            <td width="74%"><input type="text" value="30/09/2009" disabled="disabled" size="8" /></td>
                        </tr>
                        <tr>
                            <td width="26%" align="right"><font style="color:#F00;">*</font> Motivo: &nbsp;</td>
                            <td width="74%">
                                <select>
                                    <option></option>
                                    <option>Base de Dados</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">Descreva abaixo a Mensagem</td>
                        </tr>
                        <tr>
                            <td colspan="2"><textarea cols="60" rows="5"></textarea></td>
                        </tr>
                    </table>
                    <br />
                    <div align="center">
                        <img src="images/botao/bt_enviar.png" alt="Enviar" title="Enviar" class="seta_link close" id="enviar" onmouseover="focoBt('enviar');" onmouseout="bt('enviar');" onclick="mostrar('confNote');" />
                    </div>


                    <br />
                    <br />

                    <div align="right">
                        <img src="images/botao/fechar.png" alt="Fechar" title="Fechar Janela" class="seta_link close" />
                    </div>

                </div>
                <!-- DETALHES DA MENSAGEM -->
            </div>

        </div>
        <!-- Fim Janela Modal com caixa de diálogo (NOTIFICAÇÕES) -->

                    <!-- Janela Modal com caixa de diálogo (CANIL FILA DE ADOÇÃO)-->

        <div id="conf_del" class="window">

            <div class="cont_modal">

                <!-- DETALHES DA MENSAGEM -->
                <div id="conteudoDetalhe">
                    <div class="bordaFaixaLeft"><span>Confirmação de Exclusão</span></div>
                    <br />

                    <span class="obrigatorio">* Campo de Preenchimento Obrigatório</span>
                    <br />
                    <br />

                    <img src="images/botao/alert.png" /> &nbsp;&nbsp; <span class="obrigatorio">Você está prestes a excluir este animal do cadastro!</span>
                    <br />
                    <table class="grid" style=" width:98%;">
                        <tr>
                            <td width="26%" align="right"><font style="color:#F00;">*</font> Motivo da Exclusão: &nbsp;</td>
                            <td width="74%">
                                <select>
                                    <option></option>
                                    <option>Base de Dados</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"><span class="obrigatorio">*</span> Justificativa</td>
                        </tr>
                        <tr>
                            <td colspan="2"><textarea cols="60" rows="5"></textarea></td>
                        </tr>
                    </table>
                    <br />
                    <div align="center">
                        <img src="images/botao/bt_ok.png" alt="ok" title="Ok" class="seta_link close" id="ok" onmouseover="focoBt('ok');" onmouseout="bt('ok');" />
                    </div>

                    <br />
                    <br />
                    <div align="right">
                        <img src="images/botao/fechar.png" alt="Fechar" title="Fechar Janela" class="seta_link close" />
                    </div>

                </div>
                <!-- DETALHES DA MENSAGEM -->
            </div>

        </div>
        <!-- Fim Janela Modal com caixa de diálogo (CANIL FILA DE ADOÇÃO) -->

                    <!-- Janela Modal com caixa de diálogo (COLABORADOR ADOTADOS)-->

        <div id="colab_adotados" class="window">

            <div class="cont_modal">

                <!-- DETALHES DA MENSAGEM -->
                <div id="conteudoDetalhe">
                    <div class="bordaFaixaLeft"><span>Animal Adotado</span></div>
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
                                <td width="37%" align="right">Nº de Identificação: &nbsp;</td>
                                <td width="63%"><span>01</span></td>
                            </tr>
                            <tr>
                                <td width="37%" align="right">Raça: &nbsp;</td>
                                <td width="63%"><span>Comum</span></td>
                            </tr>
                            <tr>
                                <td width="37%" align="right">Idade Aproximada: &nbsp;</td>
                                <td width="63%"><span>7 Meses</span></td>
                            </tr>
                            <tr>
                                <td width="37%" align="right">Cor Predominante: &nbsp;</td>
                                <td width="63%"><span>champanhe</span></td>
                            </tr>
                            <tr>
                                <td width="37%" align="right">2ª Cor: &nbsp;</td>
                                <td width="63%"><span>Preto</span></td>
                            </tr>
                            <tr>
                                <td width="37%" align="right">Pelagem: &nbsp;</td>
                                <td width="63%"><span>Curto</span></td>
                            </tr>
                            <tr>
                                <td width="37%" align="right" valign="top">Sexo: &nbsp;</td>
                                <td width="63%" valign="top"><span>Macho</span></td>
                            </tr>
                            <tr>
                                <td width="37%" align="center" valign="top" colspan="2">Ex-Dono: &nbsp;</td>
                            </tr>
                            <tr>
                                <td width="37%" align="right" valign="top">Cod: &nbsp;</td>
                                <td width="63%" valign="top"><span>U01</span></td>
                            </tr>
                            <tr>
                                <td width="37%" align="right" valign="top">Nome: &nbsp;</td>
                                <td width="63%" valign="top"><span>José Fulano</span></td>
                            </tr>
                        </table>


                    </div>
                    <!-- DADOS DO Animal -->

                    <div class="clear"></div>
                    <br />
                    <br />
                    <div class="nota_destaque">Dados da Adoção</div>
                    <br />

                    Adotado em <span class="obrigatorio">30/01/2009</span>
                    <table class="grid">
                        <tr>
                            <td class="grid_titulo" align="center">Cod</td>
                            <td class="grid_titulo" align="center">Nome Adotante</td>
                            <td class="grid_titulo" align="center">Sexo</td>
                            <td class="grid_titulo" align="center">End.</td>
                            <td class="grid_titulo" align="center">Telefone</td>
                        </tr>
                        <tr class="td_escura">
                            <td align="center">U01</td>
                            <td align="center">Juliana Martins</td>
                            <td align="center">Femino</td>
                            <td align="center">QNM 45 casa 03</td>
                            <td align="center">61 4444-9999</td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <div align="right">
                        <img src="images/botao/fechar.png" alt="Fechar" title="Fechar Janela" class="seta_link close" />
                    </div>
                    <br />

                </div>
                <!-- DETALHES DA MENSAGEM -->
            </div>

        </div>
        <!-- Fim Janela Modal com caixa de diálogo (COLABORADOR ADOTADOS) -->



        <div id="mask"></div>
    </div>

</body>

</html>