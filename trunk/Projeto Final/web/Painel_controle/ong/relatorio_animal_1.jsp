
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
                                <div class="bordaFaixaLeft"><span>Relatório de Animais</span></div>
                                <br />
                                <!-- FILTRO DE PESQUISA -->
                                <div id="filtro">
                                    <br />
                                    <div class="nota_destaque">Filtro de Pesquisa</div>
                                    <br />

                                    <span class="obrigatorio">* Campos de Preenchimento Obrigatório</span>
                                    <br />

                                    <form name="filtroRelatorio">
                                        <table class="grid">
                                            <tr>
                                                <td width="28%" align="right"><span class="obrigatorio">*</span> Exibir Ralatório de: &nbsp;</td>
                                                <td width="72%">
                                                    <select name="exibir" onchange="valida_relatorio();">
                                                        <option value="0"></option>
                                                        <option value="1">Animais em Canil/Gatil</option>
                                                        <option value="2">Animais em Colaborador</option>
                                                        <option value="3">Geral</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="28%" align="right"><span class="obrigatorio">*</span> Tipo de Relatório: &nbsp;</td>
                                                <td><label><input type="radio" name="tipo" value="adotados" id="animal_ad" /> Animais Adotados</label></td>
                                            </tr>
                                            <tr>
                                                <td width="28%" align="right">&nbsp;</td>
                                                <td><label><input type="radio" name="tipo" value="fila" id="animal_fl" /> Animais na Fila de Adoção</label></td>
                                            </tr>
                                            <tr>
                                                <td width="28%" align="right">&nbsp;</td>
                                                <td><label><input type="radio" name="tipo" value="pendente" id="animal_cdp" /> Animais com Cadastro Pendente</label></td>
                                            </tr>
                                        </table>
                                    </form>
                                    <br />
                                    <br />

                                    <div align="right" style="width:90%;">
                                        <a href="painel.jsp"><img src="images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link" /></a>&nbsp;&nbsp;
                                        <img src="images/botao/bt_pesquisar.png" alt="Pesquisar" title="Pesquisar" class="seta_link" id="pesquisa" onmouseover="focoBt('pesquisa');" onmouseout="bt('pesquisa');" onclick="pesquisaRelatorio();" />
                                    </div>

                                    <br />

                                </div>
                                <!-- FILTRO DE PESQUISA -->

                                <!-- RRELATÓRIO CANIL ADOTADOS -->
                                <div id="rel_canil_adotado" class="esconde">
                                    <div class="nota_destaque" style="width:100%;">Relatório de Animais em Canil/Gatil - Adotados</div>
                                    <br />

                                    <table class="grid">
                                        <tr>
                                            <td width="7%" align="center" class="grid_titulo">Cod</td>
                                            <td width="27%" align="center" class="grid_titulo">Nome</td>
                                            <td width="19%" align="center" class="grid_titulo">Data Adoção</td>
                                            <td width="35%" align="center" class="grid_titulo">Adotante</td>
                                            <td width="12%" align="center" class="grid_titulo">Detalhar</td>
                                        </tr>
                                        <tr>
                                            <td align="center">001</td>
                                            <td align="center">Toto</td>
                                            <td align="center">30/01/2009</td>
                                            <td align="center">José Sicrano</td>
                                            <td align="center"><a href="#canil_adotados" name="modal"><img src="images/botao/zoom.png" class="seta_link" alt="Detalhar Processo" title="Detalhar Processo " /></a></td>
                                        </tr>
                                        <tr class="td_escura">
                                            <td align="center">002</td>
                                            <td align="center">Lina</td>
                                            <td align="center">30/09/2009</td>
                                            <td align="center">Maria Aparecida</td>
                                            <td align="center"><a href="#canil_adotados" name="modal"><img src="images/botao/zoom.png" class="seta_link" alt="Detalhar Processo" title="Detalhar Processo " /></a></td>
                                        </tr>
                                    </table>

                                    <br />

                                    <div align="center" style="width:90%;">
                                        <img src="images/botao/printer.png" alt="Imprimir" title="Imprimir Relatório" class="seta_link" onclick="window.print();" />
                                    </div>

                                </div>
                                <!-- RRELATÓRIO CANIL ADOTADOS -->

                                <!-- RRELATÓRIO CANIL FILA -->
                                <div id="rel_canil_fila" class="esconde">
                                    <div class="nota_destaque" style="width:100%;">Relatório de Animais em Canil/Gatil - Fila de Adoção</div>
                                    <br />

                                    <table class="grid">
                                        <tr>
                                            <td width="7%" align="center" class="grid_titulo">Cod</td>
                                            <td width="20%" align="center" class="grid_titulo">Nome</td>
                                            <td width="7%" align="center" class="grid_titulo">Tipo</td>
                                            <td width="22%" align="center" class="grid_titulo">Raça</td>
                                            <td width="17%" align="center" class="grid_titulo">Data Cadastro</td>
                                            <td width="15%" align="center" class="grid_titulo">Visitas Perfil</td>
                                            <td width="12%" align="center" class="grid_titulo">Detalhar</td>
                                        </tr>
                                        <tr>
                                            <td align="center">001</td>
                                            <td align="center">Toto</td>
                                            <td align="center">Cão</td>
                                            <td align="center">Poodle</td>
                                            <td align="center">30/02/2008</td>
                                            <td align="center">2 (Duas)</td>
                                            <td align="center"><a href="#canil_fila" name="modal"><img src="images/botao/zoom.png" class="seta_link" alt="Detalhar Processo" title="Detalhar Processo " /></a></td>
                                        </tr>
                                        <tr class="td_escura">
                                            <td align="center">002</td>
                                            <td align="center">Lina</td>
                                            <td align="center">Gato</td>
                                            <td align="center">Comum</td>
                                            <td align="center">30/02/2008</td>
                                            <td align="center">2 (Duas)</td>
                                            <td align="center"><a href="#canil_fila" name="modal"><img src="images/botao/zoom.png" class="seta_link" alt="Detalhar Processo" title="Detalhar Processo " /></a></td>
                                        </tr>
                                    </table>

                                    <br />

                                    <div align="center" style="width:90%;">
                                        <img src="images/botao/printer.png" alt="Imprimir" title="Imprimir Relatório" class="seta_link" onclick="window.print();" />
                                    </div>

                                </div>
                                <!-- RRELATÓRIO CANIL FILA -->

                                <!-- RELATÓRIO COLABORADOR ADOTADOS -->
                                <div id="rel_colab_adotado" class="esconde" >
                                    <div class="nota_destaque" style="width:100%;">Relatório de Animais em Colaorador - Adotados</div>
                                    <br />

                                    <table class="grid">
                                        <tr>
                                            <td colspan="5" align="center" class="grid_titulo">Dados do Animal</td>
                                            <td colspan="3" align="center" class="grid_titulo">Dados do Colaborador</td>
                                        </tr>
                                        <tr>
                                            <td width="7%" align="center" class="grid_titulo">Cod</td>
                                            <td width="17%" align="center" class="grid_titulo">Nome</td>
                                            <td width="7%" align="center" class="grid_titulo">Tipo</td>
                                            <td width="15%" align="center" class="grid_titulo">Raça</td>
                                            <td width="16%" align="center" class="grid_titulo">Dt. Adoção</td>
                                            <td width="7%" align="center" class="grid_titulo">Cod</td>
                                            <td width="19%" align="center" class="grid_titulo">Nome</td>
                                            <td width="12%" align="center" class="grid_titulo">Detalhar</td>
                                        </tr>
                                        <tr>
                                            <td align="center">01</td>
                                            <td align="center">Lucky</td>
                                            <td align="center">Gato</td>
                                            <td align="center">Comum</td>
                                            <td align="center">20/01/2009</td>
                                            <td align="center">U02</td>
                                            <td align="center">Frank</td>
                                            <td align="center"><a href="#colab_adotados" name="modal"><img src="images/botao/zoom.png" class="seta_link" alt="Detalhar Processo" title="Detalhar Processo " /></a></td>
                                        </tr>
                                        <tr class="td_escura">
                                            <td align="center">02</td>
                                            <td align="center">Paty</td>
                                            <td align="center">Cão</td>
                                            <td align="center">Poodle</td>
                                            <td align="center">20/01/2009</td>
                                            <td align="center">U03</td>
                                            <td align="center">Lina</td>
                                            <td align="center"><a href="#colab_adotados" name="modal"><img src="images/botao/zoom.png" class="seta_link" alt="Detalhar Processo" title="Detalhar Processo " /></a></td>
                                        </tr>
                                    </table>

                                    <br />

                                    <div align="center" style="width:90%;">
                                        <img src="images/botao/printer.png" alt="Imprimir" title="Imprimir Relatório" class="seta_link" onclick="window.print();" />
                                    </div>

                                </div>
                                <!-- RELATÓRIO COLABORADOR ADOTADOS -->

                                <!-- RELATÓRIO COLABORADOR FILA -->
                                <div id="rel_colab_fila" class="esconde" >
                                    <div class="nota_destaque" style="width:100%;">Relatório de Animais em Colaorador - Fila de Adoção</div>
                                    <br />

                                    <table class="grid" style=" width:98%;">
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
                                            <td width="15%" align="center" class="grid_titulo">Visitas Perfil</td>
                                            <td width="6%" align="center" class="grid_titulo">Cod</td>
                                            <td width="15%" align="center" class="grid_titulo">Nome</td>
                                            <td width="11%" align="center" class="grid_titulo">Detalhar</td>
                                        </tr>
                                        <tr>
                                            <td align="center">01</td>
                                            <td align="center">Lucky</td>
                                            <td align="center">Gato</td>
                                            <td align="center">Comum</td>
                                            <td align="center">20/01/2009</td>
                                            <td align="center">2 (Duas)</td>
                                            <td align="center">U02</td>
                                            <td align="center">Frank</td>
                                            <td align="center"><a href="#colab_fila" name="modal"><img src="images/botao/zoom.png" class="seta_link" alt="Detalhar Processo" title="Detalhar Processo " /></a></td>
                                        </tr>
                                        <tr class="td_escura">
                                            <td align="center">02</td>
                                            <td align="center">Nanda</td>
                                            <td align="center">Cão</td>
                                            <td align="center">Comum</td>
                                            <td align="center">20/01/2009</td>
                                            <td align="center">2 (Duas)</td>
                                            <td align="center">U02</td>
                                            <td align="center">Juliana</td>
                                            <td align="center"><a href="#colab_fila" name="modal"><img src="images/botao/zoom.png" class="seta_link" alt="Detalhar Processo" title="Detalhar Processo " /></a></td>
                                        </tr>
                                    </table>

                                    <br />

                                    <div align="center" style="width:90%;">
                                        <img src="images/botao/printer.png" alt="Imprimir" title="Imprimir Relatório" class="seta_link" onclick="window.print();" />
                                    </div>

                                </div>
                                <!-- RELATÓRIO COLABORADOR FILA -->

                                <!-- RRELATÓRIO COLABORADOR PENDENTES -->
                                <div id="rel_colab_pendente" class="esconde">
                                    <div class="nota_destaque" style="width:100%;">Relatório de Animais em Colaborador - Pendentes de Aprovação</div>
                                    <br />

                                    <table class="grid">
                                        <tr>
                                            <td width="7%" align="center" class="grid_titulo">Cod</td>
                                            <td width="27%" align="center" class="grid_titulo">Nome</td>
                                            <td width="19%" align="center" class="grid_titulo">Tipo</td>
                                            <td width="35%" align="center" class="grid_titulo">Raça</td>
                                            <td width="12%" align="center" class="grid_titulo">Dt. Cadastro</td>
                                            <td width="12%" align="center" class="grid_titulo">Detalhar</td>
                                            <td width="12%" align="center" class="grid_titulo">Selecionar</td>
                                        </tr>
                                        <tr>
                                            <td align="center">01</td>
                                            <td align="center">Toto</td>
                                            <td align="center">Cão</td>
                                            <td align="center">Comum</td>
                                            <td align="center">30/01/2009</td>
                                            <td align="center"><a href="coloborador/detehlar_animal.jsp"><img src="images/botao/zoom.png" class="seta_link" alt="Detalhar Processo" title="Detalhar Processo " /></a></td>
                                            <td align="center"><input type="checkbox" /></td>
                                        </tr>
                                        <tr class="td_escura">
                                            <td align="center">02</td>
                                            <td align="center">Xana</td>
                                            <td align="center">Gato</td>
                                            <td align="center">Comum</td>
                                            <td align="center">30/01/2009</td>
                                            <td align="center"><a href="coloborador/detehlar_animal.jsp"><img src="images/botao/zoom.png" class="seta_link" alt="Detalhar Processo" title="Detalhar Processo " /></a></td>
                                            <td align="center"><input type="checkbox" /></td>
                                        </tr>
                                    </table>

                                    <br />

                                    <div align="center" style="width:90%;">
                                        <img src="images/botao/printer.png" alt="Imprimir" title="Imprimir Relatório" class="seta_link" onclick="window.print();" />&nbsp;&nbsp;
                                        <img src="images/botao/bt_aprovar.png" alt="Aprovar" title="Aprovar" class="seta_link" />
                                    </div>

                                </div>
                                <!-- RRELATÓRIO COLABORADOR PENDENTES -->

                                <!-- RRELATÓRIO GERAL -->
                                <div id="rel_geral" class="esconde">
                                    <div class="nota_destaque" style="width:100%;">Relatório de Animais - Geral</div>
                                    <br />

                                    <table class="grid">
                                        <tr>
                                            <td width="29%" align="right"><strong>Animais em Canil: &nbsp;</strong></td>
                                            <td colspan="2"><input type="text" value="20" readonly="readonly" size="8" class="obrigatorio" /></td>
                                        </tr>
                                        <tr>
                                            <td width="29%" align="right"><strong>Animais Adotados: &nbsp;</strong></td>
                                            <td colspan="2"><input type="text" value="08" readonly="readonly" size="8" class="obrigatorio" /></td>
                                        </tr>
                                        <tr>
                                            <td width="29%" align="right"><strong>Animais Cadastrados: &nbsp;</strong></td>
                                            <td width="13%"><input type="text" value="20" readonly="readonly" size="8" class="obrigatorio" /></td>
                                            <td width="58%">(Colaborador)</td>
                                        </tr>
                                        <tr>
                                            <td width="29%" align="right"><strong>Animais Pendentes: &nbsp;</strong></td>
                                            <td width="13%"><input type="text" value="10" readonly="readonly" size="8" class="obrigatorio" /></td>
                                            <td>(Aprovação de Cadastro)</td>
                                        </tr>
                                    </table>
                                    <br />

                                    <table class="grid">
                                        <tr>
                                            <td width="7%" align="center" class="grid_titulo">Cod</td>
                                            <td width="27%" align="center" class="grid_titulo">Nome</td>
                                            <td width="35%" align="center" class="grid_titulo">Raça</td>
                                            <td width="35%" align="center" class="grid_titulo">Status</td>
                                            <td width="12%" align="center" class="grid_titulo">Propriedade</td>
                                            <td width="12%" align="center" class="grid_titulo">Atividade</td>
                                            <td width="12%" align="center" class="grid_titulo">Detalhar</td>
                                        </tr>
                                        <tr>
                                            <td align="center">01</td>
                                            <td align="center">Toto</td>
                                            <td align="center">Comum</td>
                                            <td align="center">Adotado</td>
                                            <td align="center">ONG</td>
                                            <td align="center">&nbsp;</td>
                                            <td align="center">&nbsp;</td>
                                        </tr>
                                        <tr class="td_escura">
                                            <td align="center">02</td>
                                            <td align="center">Xana</td>
                                            <td align="center">Comum</td>
                                            <td align="center">Fila de Adoção</td>
                                            <td align="center">Colaborador</td>
                                            <td align="center"><span class="obrigatorio">Pendente</span></td>
                                            <td align="center"><a href="coloborador/detehlar_animal.jsp"><img src="images/botao/zoom.png" class="seta_link" alt="Detalhar Processo" title="Detalhar Processo " /></a></td>
                                        </tr>
                                        <tr>
                                            <td align="center">03</td>
                                            <td align="center">Lucky</td>
                                            <td align="center">Comum</td>
                                            <td align="center">Fila de Adoção</td>
                                            <td align="center">Colaborador</td>
                                            <td align="center" class="adotado">Aprovado</td>
                                            <td align="center">&nbsp;</td>
                                        </tr>
                                    </table>

                                    <br />

                                    <div align="center" style="width:90%;">
                                        <img src="images/botao/printer.png" alt="Imprimir" title="Imprimir Relatório" class="seta_link" onclick="window.print();" />
                                    </div>

                                </div>
                                <!-- RRELATÓRIO GERAL -->


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
            <!-- Janela Modal com caixa de diálogo (ADOTADOS CANIL)-->

            <div id="canil_adotados" class="window">

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
            <!-- Fim Janela Modal com caixa de diálogo (ALTERAR FOTO) -->

                    <!-- Janela Modal com caixa de diálogo (CANIL FILA DE ADOÇÃO)-->

            <div id="canil_fila" class="window">

                <div class="cont_modal">

                    <!-- DETALHES DA MENSAGEM -->
                    <div id="conteudoDetalhe">
                        <div class="bordaFaixaLeft"><span>Animal na Fila de Adoção</span></div>
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
                                    <td width="37%" align="right">Data de Cadastro: &nbsp;</td>
                                    <td width="63%"><span>30/02/2008</span></td>
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
                            </table>


                        </div>
                        <!-- DADOS DO Animal -->

                        <div class="clear"></div>
                        <br />
                        <br />
                        <div class="nota_destaque">Dados Gerais</div>
                        <br />

                        Total de Visitas no Perfil <span class="obrigatorio">2</span>

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

                    <!-- Janela Modal com caixa de diálogo (COLABORADOR FILA)-->

            <div id="colab_fila" class="window">

                <div class="cont_modal">

                    <!-- DETALHES DA MENSAGEM -->
                    <div id="conteudoDetalhe">
                        <div class="bordaFaixaLeft"><span>Animal na Fila de Adoção</span></div>
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
                                    <td width="37%" align="center" valign="top" colspan="2">Proprietário: &nbsp;</td>
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

                        Total de Visitas no Perfil: <span class="obrigatorio">2</span>
                        <br />
                        <br />
                        <div align="right">
                            <img src="images/botao/fechar.png" alt="Fechar" title="Fechar Janela" class="seta_link close" />
                        </div>

                    </div>
                    <!-- DETALHES DA MENSAGEM -->
                </div>

            </div>
            <!-- Fim Janela Modal com caixa de diálogo (COLABORADOR FILA) -->

            <div id="mask"></div>
        </div>

    </body>

</html>