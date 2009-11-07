<%-- 
    Document   : gerencia_adocao
    Created on : 02/10/2009, 17:00:51
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
        <link type="text/css" rel="stylesheet" href="css/abas.css" />
        <link type="text/css" rel="stylesheet" href="css/drop_vertical.css" />

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
                if(id ==="logoff"){
                    $("#"+id).attr("src","images/botao/bt_logoff_light.png");
                }

                else if(id ==="exibir"){
                    $("#"+id).attr("src","images/botao/bt_exibir_light.png");
                }

                else if(id ==="exibir2"){
                    $("#"+id).attr("src","images/botao/bt_exibir_light.png");
                }

                else if(id ==="exibir3"){
                    $("#"+id).attr("src","images/botao/bt_exibir_light.png");
                }
            }

            function bt(id){
                if(id ==="logoff"){
                    $("#"+id).attr("src","images/botao/bt_logoff.png");
                }

                else if(id ==="exibir"){
                    $("#"+id).attr("src","images/botao/bt_exibir.png");
                }

                else if(id ==="exibir2"){
                    $("#"+id).attr("src","images/botao/bt_exibir.png");
                }

                else if(id ==="exibir3"){
                    $("#"+id).attr("src","images/botao/bt_exibir.png");
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
                                <div class="bordaFaixaLeft">
                                    <span>Gerenciamento de Adoções</span>
                                </div>
                                <br />

                                <div id="inicio">

                                    Existe <span class="obrigatorio">33</span> adoções em processo.
                                    <br />
                                    <br />
                                    <span class="obrigatorio">* Campos de Preenchimento Obrigatório</span>
                                    <br />

                                    <form name="filtroRelatorio">
                                        <table class="grid">
                                            <tr>
                                                <td width="25%" align="right"><span class="obrigatorio">*</span> Exibir Adoções de: &nbsp;</td>
                                                <td width="34%">
                                                    <select name="exibir">
                                                        <option value="0"></option>
                                                        <option value="1">Animais em Canil/Gatil</option>
                                                        <option value="2">Animais em Colaborador</option>
                                                    </select>
                                                </td>
                                                <td width="41%"><img src="images/botao/zoom.png" alt="Pesquisar" title="Pesquisar" class="seta_link" onclick="mostrar('resultado');" /></td>
                                            </tr>
                                        </table>
                                    </form>
                                    <br />

                                    <div align="center">
                                        <img src="images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link" onclick="window.location='painel.jsp';" />&nbsp;&nbsp;
                                    </div>
                                    <br />

                                    <div id="resultado" class="esconde">
                                        <div class="nota_destaque" style="width:100%;">XX Adoções para este filtro</div>
                                        <br />

                                        <table class="grid" style=" width:98%;">
                                            <tr>
                                                <td width="12%" align="center" class="grid_titulo">Foto</td>
                                                <td width="6%" align="center" class="grid_titulo">Cod</td>
                                                <td width="19%" align="center" class="grid_titulo">Nome</td>
                                                <td width="10%" align="center" class="grid_titulo">Tipo</td>
                                                <td width="12%" align="center" class="grid_titulo">Raça</td>
                                                <td width="15%" align="center" class="grid_titulo">Dt. Cadastro</td>
                                                <td width="15%" align="center" class="grid_titulo">Nº de Interessados</td>
                                                <td width="11%" align="center" class="grid_titulo">Detalhar</td>
                                            </tr>
                                            <tr>
                                                <td align="center"><img src="images/img_gato/miniaturas/loky.png" width="69" height="59" /></td>
                                                <td align="center">01</td>
                                                <td align="center">Lucky</td>
                                                <td align="center">Gato</td>
                                                <td align="center">Comum</td>
                                                <td align="center">20/01/2009</td>
                                                <td align="center" style="color:#F00;">02</td>
                                                <td align="center"><img src="images/botao/zoom.png" class="seta_link" alt="Detalhar Processo" title="Detalhar Processo" onclick="mostra('inicio','detalhes');" /></td>
                                            </tr>
                                            <tr class="td_escura">
                                                <td align="center"><img src="images/img_gato/miniaturas/nanda.png" width="69" height="59" /></td>
                                                <td align="center">02</td>
                                                <td align="center">Nanda</td>
                                                <td align="center">Cão</td>
                                                <td align="center">Comum</td>
                                                <td align="center">20/01/2009</td>
                                                <td align="center" style="color:#F00;">02</td>
                                                <td align="center"><img src="images/botao/zoom.png" class="seta_link" alt="Detalhar Processo" title="Detalhar Processo " /></td>
                                            </tr>
                                        </table>
                                    </div>



                                </div>

                                <div id="detalhes" class="esconde">
                                    <p>
                                        Somente 1 pessoa poderá adotar o animal, por isso pense bem e analise todos os casos com cuidado.<br />
                                        Apos a escolha do colaborador, selecione a coluna corespendente a mesma e clique em "Aprovar".<br /><br />

                                        <span class="obrigatorio">Os demais usuarios, caso haja mais de 1, recebera um email informando a sua decisão.<br />
                                        Você tambem podera mandar uma Mensagem personalizada caso assim desseje.</span>
                                    </p>
                                    <br />

                                    <table class="grid" style="width:100%;">
                                        <tr>
                                            <td width="8%" align="center" class="grid_titulo">Cod</td>
                                            <td width="38%" align="center" class="grid_titulo">Nome</td>
                                            <td width="10%" align="center" class="grid_titulo">Idade</td>
                                            <td width="13%" align="center" class="grid_titulo">Sexo</td>
                                            <td width="17%" align="center" class="grid_titulo">Mensagem</td>
                                            <td width="14%" align="center" class="grid_titulo">Detalhar</td>
                                            <td width="14%" align="center" class="grid_titulo">Selecionar</td>
                                        </tr>
                                        <tr>
                                            <td align="center">001</td>
                                            <td align="center">Maria Fulana Aparecida</td>
                                            <td align="center">23</td>
                                            <td align="center">Feminino</td>
                                            <td align="center">0</td>
                                            <td align="center"><a href="#detalharUsr" name="modal"><img src="images/botao/zoom.png" alt="Detalhar" title="Detalhar" class="seta_link" /></a></td>
                                            <td align="center"><input type="radio" name="usr" id="usr" /></td>
                                        </tr>
                                        <tr class="td_escura">
                                            <td align="center">001</td>
                                            <td align="center">José Sicrano Aparecido</td>
                                            <td align="center">44</td>
                                            <td align="center">Masculino</td>
                                            <td align="center"><span class="obrigatorio">1</span></td>
                                            <td align="center"><a href="#detalharMsg" name="modal"><img src="images/botao/zoom.png" alt="Detalhar" title="Detalhar" class="seta_link" /></a></td>
                                            <td align="center"><input type="radio" name="usr" id="usrMsg" /></td>
                                        </tr>
                                    </table>
                                    <br />

                                    <div align="center" style="width:95%;">
                                        <img src="images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link" onclick="mostra('detalhes','inicio'); mostrar('resultado');" />&nbsp;&nbsp;
                                        <a href="#confirm_Aprovacao" name="modal"><img src="images/botao/bt_aprovar_light.png" id="aprovar" onmouseover="focoBt('aprovar');" onmouseout="bt('aprovar');" class="seta_link" alt="Aprovar" title="Aprovar" /></a>
                                    </div>

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


        <!-- Modal -->
        <div id="boxes">
            <!-- Janela Modal com caixa de diálogo -->

            <div id="detalharUsr" class="window" >
                <div class="cont_modal">

                    <div class="bordaFaixaLeft" style="width:95%; margin-left:2%;">
                        <span>Detalhes do Usuário</span>
                    </div>
                    <br />

                    <!-- FOTO DO USUARIO -->
                    <div id="foto">
                        <img src="foto/fotoUsr.png" />
                    </div>
                    <!-- FOTO -->

                            <!-- DADOS DO USUARIO -->
                    <div id="dadosUsuario" style="width:370px;">
                        <h3 class="titulo3">Maria Fulana Apareceida</h3>
                        <table class="grid dadosModal" width="100%">
                            <tr>
                                <td width="24%" align="right">Cod: &nbsp;</td>
                                <td width="76%"><strong>001</strong></td>
                            </tr>
                            <tr>
                                <td align="right">Idade: &nbsp;</td>
                                <td><strong>23</strong></td>
                            </tr>
                            <tr>
                                <td align="right">Sexo: &nbsp;</td>
                                <td><strong>Feminino</strong></td>
                            </tr>
                            <tr>
                                <td align="right">Estado: &nbsp;</td>
                                <td><strong>DF</strong></td>
                            </tr>
                        </table>
                    </div>
                    <!-- DADOS DO USUARIO -->

                    <div class="clear"></div>

                    <!-- DETALHES DA PETIÇÃO -->
                    <div id="conteudoDetalhe">
                        <br />
                        <br />

                        <p>
                            Fulana Maria Aparecida, demonstrou enteresse no animal. <br />

                        </p>
                        <span class="obrigatorio" style="font-size:14px">Mensagem Pessoal enviada por Fulana.</span>

                        <br />
                        <br />

                        <textarea rows="5" cols="60" readonly="readonly"></textarea>

                        <br />
                        <br />
                        <span class="escondeFase obrigatorio" id="usrReprovado"><img src="images/botao/alert.png" alt="alerta" title="alerta" /> &nbsp; Usuario Negado. </span>

                        <br />
                        <br />

                        <div align="right">
                            <img src="images/botao/fechar.png" alt="Fechar" title="Fechar a Janela" class="seta_link close" />
                        </div>
                    </div>
                    <!-- DETALHES DA PETIÇÃO -->
                </div>

            </div>
            <!-- Fim Janela Modal com caixa de diálogo -->

                    <!-- Janela Modal com caixa de diálogo (Usuario com MSG)-->

            <div id="detalharMsg" class="window" >
                <div class="cont_modal">

                    <div class="bordaFaixaLeft" style="width:95%; margin-left:2%;">
                        <span>Detalhes do Usuário</span>
                    </div>
                    <br />

                    <!-- FOTO DO USUARIO -->
                    <div id="foto">
                        <img src="foto/fotoUsr.png" />
                    </div>
                    <!-- FOTO -->

                            <!-- DADOS DO USUARIO -->
                    <div id="dadosUsuario" style="width:370px;">
                        <h3 class="titulo3">José Sicrano Aparecido</h3>
                        <table class="grid dadosModal" width="100%">
                            <tr>
                                <td width="24%" align="right">Cod: &nbsp;</td>
                                <td width="76%"><strong>002</strong></td>
                            </tr>
                            <tr>
                                <td align="right">Idade: &nbsp;</td>
                                <td><strong>44</strong></td>
                            </tr>
                            <tr>
                                <td align="right">Sexo: &nbsp;</td>
                                <td><strong>Masculino</strong></td>
                            </tr>
                            <tr>
                                <td align="right">Estado: &nbsp;</td>
                                <td><strong>DF</strong></td>
                            </tr>
                        </table>
                    </div>
                    <!-- DADOS DO USUARIO -->

                    <div class="clear"></div>

                    <!-- DETALHES DA PETIÇÃO -->
                    <div id="conteudoDetalhe">
                        <br />
                        <br />

                        <p>
                            José Sicrano Aparecido, demonstrou enteresse no animal. <br />

                        </p>
                        <span class="obrigatorio" style="font-size:14px">Mensagem Pessoal enviada por José.</span>

                        <br />
                        <br />

                        <textarea rows="5" cols="60" readonly="readonly" >Gosto muito de gatos e a minha filha quando viu o seu ficou apaixonada por ele. Moramos numa casa bem protegida e queremos muito esse gato.</textarea>

                        <br />
                        <br />
                        <span class="escondeFase" id="usrAprovado" style="color:#060;"><img src="images/botao/aprova.png" alt="alerta" title="alerta" /> &nbsp; Usuario Escolhido por Você. </span>

                        <br />
                        <br />

                        <div align="right">
                            <img src="images/botao/fechar.png" alt="Fechar" title="Fechar a Janela" class="seta_link close" />
                        </div>
                    </div>
                    <!-- DETALHES DA PETIÇÃO -->
                </div>

            </div>
            <!-- Fim Janela Modal com caixa de diálogo (Usuario com MSG) -->


                    <!-- Janela Modal com caixa de diálogo (CONFRM DE APROVAÇÃO)-->

            <div id="confirm_Aprovacao" class="window">
                <div class="cont_modal">

                    <div class="bordaFaixaLeft" style="width:95%; margin-left:2%;">
                        <span>Mensagem de Reprovação</span>
                    </div>
                    <br />

                    <!-- DETALHES DA MENSAGEM -->
                    <div id="conteudoDetalhe">
                        <div class="nota_informa" style="width:98%;">
                            <span>Será enviada uma mensagem com a sua decisão aos demais usuarios.</span>
                        </div>

                        <p>
                            <span class="obrigatorio">Os usuarios que não foram escolhidos, receberão um email informativo.</span>
                            <br />

                            <br />

                            O Email conterá a seguinte Mensagem:<br /><br />
                        </p>

                        <font style="color:#003;">Infelizmente o seu pedido de Adoção para o gato <span style="text-decoration:underline">Lucky</span> não foi aceito.<br />
                        Caso tenha duvidas desse processo entre em contato com a nossa Ong para esclarecimentos.</font>

                        <br />
                        <br />
                        Caso seja necessário, descreva uma justificativa:
                        <br />
                        <br />
                        <table class="grid" width="100%">
                            <tr>
                                <td width="19%" align="right" valign="top">Justificativa: &nbsp;</td>
                                <td width="81%"><textarea name="textarea" cols="50" rows="3"></textarea></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>A justificativa não é Obrigatória.</td>
                            </tr>
                        </table>
                        <br />
                        <br />

                        <div align="center">
                            <img src="images/botao/bt_ok.png" alt="Ok" title="OK" class="seta_link close" onclick="aprovaUsr();" id="ok" onmouseover="focoBt('ok');" onmouseout="bt('ok');" />
                        </div>
                        <br />

                    </div>
                    <!-- DETALHES DA MENSAGEM -->
                </div>

            </div>
            <!-- Fim Janela Modal com caixa de diálogo (CONFRM DE APROVAÇÃO ) -->



            <div id="mask"></div>
        </div>

    </body>

</html>