
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
                                <!-- RRELATÃ“RIO GERAL -->
                                 <c:if test="${lstTodosAnimais !=null && detalheCanil.codigo==0}">
                                <div id="rel_geral" class="mostra">
                                 </c:if>
                                 <c:if test="${lstTodosAnimais !=null && detalheCanil.codigo!=0}">
                                <div id="rel_geral" class="esconde">
                                 </c:if>
                                 <c:if test="${lstTodosAnimais ==null}">
                                <div id="rel_geral" class="esconde">
                                 </c:if>
                                    <div class="nota_destaque" style="width:100%;">Relatório de Animais - Geral</div>
                                    <br />

                                    <table class="grid">
                                        <tr>
                                            <td width="29%" align="right"><strong>Animais em Canil: &nbsp;</strong></td>
                                            <td colspan="2"><input type="text" value="<c:out value="${totalfilacani}"></c:out>" readonly="readonly" size="8" class="obrigatorio" /></td>
                                        </tr>
                                        <tr>
                                            <td width="29%" align="right"><strong>Animais Adotados: &nbsp;</strong></td>
                                            <td colspan="2"><input type="text" value="${totalAdotados}" readonly="readonly" size="8" class="obrigatorio" /></td>
                                        </tr>
                                        <tr>
                                            <td width="29%" align="right"><strong>Animais Cadastrados: &nbsp;</strong></td>
                                            <td width="13%"><input type="text" value="${totalanimaisCadastrados}" readonly="readonly" size="8" class="obrigatorio" /></td>
                                            <td width="58%"></td>
                                        </tr>
                                        <tr>
                                            <td width="29%" align="right"><strong>Animais Pendentes: &nbsp;</strong></td>
                                            <td width="13%"><input type="text" value="${totalpendentescolab}" readonly="readonly" size="8" class="obrigatorio" /></td>
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
                                        <c:forEach items="${lstTodosAnimais}" var="lstTodosAnimais">
                                        <tr>
                                            <td align="center">${lstTodosAnimais.codigo}</td>
                                            <td align="center">${lstTodosAnimais.nome}</td>
                                            <td align="center">Comum</td>
                                            <c:if test="${lstTodosAnimais.disponibilidade=='Nao' && lstTodosAnimais.bloqueio=='Nao'}">
                                                <td align="center">Indisponivel</td>
                                            </c:if>
                                            <c:if test="${lstTodosAnimais.disponibilidade=='Sim'&& lstTodosAnimais.bloqueio=='Nao'}">
                                                <td align="center">Disponivel</td>
                                            </c:if>
                                             <c:if test="${lstTodosAnimais.disponibilidade=='Nao'&& lstTodosAnimais.bloqueio=='Sim'}">
                                                <td align="center">Indisponivel</td>
                                            </c:if>
                                            
                                            <c:if test="${lstTodosAnimais.codigoColaborador ==0}">
                                            <td align="center">ONG</td>
                                            </c:if>
                                            <c:if test="${lstTodosAnimais.codigoColaborador!=0}">
                                            <td align="center">Colaborador</td>
                                            </c:if>
                                            <c:if test="${lstTodosAnimais.bloqueio!='Nao'}">
                                            <td align="center"><span class="obrigatorio">Pendente</span></td>
                                            </c:if>
                                            <c:if test="${lstTodosAnimais.bloqueio=='Nao'}">
                                            <td align="center" class="adotado">Aprovado</td>
                                            </c:if>
                                            <c:if test="${lstTodosAnimais.bloqueio!='Nao'}">
                                            <td align="center">
                                               <a href="/WebMAA/ControleAnimaisServlet?operacao=AnimaisMostraPendentesAprovacao&codigoanimal=<c:out value="${lstTodosAnimais.codigo}"></c:out>" onclick="mostra('rel_geral','colab_pendente');">
                                                    <img src="/WebMAA/Painel_controle/ong/images/botao/zoom.png" class="seta_link" alt="Detalhar Processo" title="Detalhar Processo" />
                                                </a>
                                            </td>

                                            </c:if>
                                        </tr>
                                        </c:forEach>
                                     </table>

                                    <br />

                                    <div align="center" style="width:90%;">
                                        <img src="images/botao/printer.png" alt="Imprimir" title="Imprimir Relatório" class="seta_link" onclick="window.print();" />
                                    </div>

                                </div>
                                <!-- RRELATÃ“RIO GERAL -->
                                <!-- DETALHES DA MENSAGEM -->
                                 <c:if test="${detalheCanil.codigo==0}">
                                <div id="colab_pendente" class="esconde">
                                </c:if>
                                <c:if test="${detalheCanil.codigo!=0}">
                                <div id="colab_pendente" class="mostra">
                                </c:if>
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
                                                <td width="67%"><span>${detalheCanil.codigo}</span></td>
                                            </tr>
                                            <tr>
                                                <td width="33%" align="right">Raça: &nbsp;</td>
                                                <td width="67%"><span>${detalheCanil.especie}</span></td>
                                            </tr>
                                            <tr>
                                                <td width="33%" align="right">Idade Aproximada: &nbsp;</td>
                                                <td width="67%"><span>${detalheCanil.idade}</span></td>
                                            </tr>
                                            <tr>
                                                <td width="33%" align="right">Cor Predominante: &nbsp;</td>

                                                <c:forEach  items="${lstCor}" var="lstCor">
                                                    <c:if test="${lstCor.codigo ==detalheCanil.cor1}">
                                                       <td width="67%"><span>${lstCor.descricao}</span></td>
                                                    </c:if>
                                               </c:forEach>
                                            </tr>
                                            <tr>
                                                <td width="33%" align="right">2ª Cor: &nbsp;</td>
                                                <c:forEach  items="${lstCor}" var="lstCor">
                                                    <c:if test="${lstCor.codigo ==detalheCanil.cor2}">
                                                       <td width="67%"><span>${lstCor.descricao}</span></td>
                                                    </c:if>
                                               </c:forEach>

                                            </tr>
                                            <tr>
                                                <td width="33%" align="right">Pelagem: &nbsp;</td>
                                                <c:forEach  items="${lstpelagem}" var="lstpelagem">
                                                    <c:if test="${lstpelagem.codigo ==detalheCanil.codigoPelagem}">
                                                        <td width="67%">
                                                            <span>${lstpelagem.descricao}</span>
                                                        </td>
                                                    </c:if>
                                                </c:forEach>
                                            </tr>
                                            <tr>
                                                <td width="33%" align="right" valign="top">Sexo: &nbsp;</td>
                                                <td width="67%" valign="top">
                                                    <c:if test="${detalheCanil.sexo==M}">
                                                        <span>Macho</span>
                                                    </c:if>
                                                    <c:if test="${detalheCanil.sexo!=M}">
                                                        <span>Femea</span>
                                                    </c:if>
                                                </td>
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
                                            <td>${detalheCanil.descricao}</td>
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
                                            <td width="72%">${detalheCanil.castrado}</td>
                                        </tr>
                                        <tr class="td_escura">
                                            <td><strong>Animal com certificado Veterianário?</strong></td>
                                        </tr>
                                        <tr>
                                            <td>${detalheCanil.laudoVeterinario}</td>
                                        </tr>
                                        <tr class="td_escura">
                                            <td><strong>Animal Vacinado? </strong></td>
                                        </tr>
                                        <tr>
                                            <td>${detalheCanil.vacinado} - ${detalheCanil.descricaoVacina}</td>
                                        </tr>
                                        <tr class="td_escura">
                                            <td><strong>Forma de Envio:</strong></td>
                                        </tr>
                                        <tr>
                                            <c:forEach  items="${lstFormaEnvio}" var="lstFormaEnvio">
                                                    <c:if test="${lstFormaEnvio.codigo ==detalheCanil.codigoFormaEnvio}">
                                                        <td>${lstFormaEnvio.descricao}</td>
                                                    </c:if>
                                            </c:forEach>
                                        </tr>
                                        <tr class="td_escura">
                                            <td>Valor da Taxa:</td>
                                        </tr>
                                        <tr>
                                            <td>R$ ${detalheCanil.vlrTaxa} </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <br />

                                    <div align="right" style="width:90%;">
                                             <a href="/WebMAA/ControleAnimaisServlet?operacao=AnimaisAprovarPendentesAprovacao&codigoanimal=<c:out value="${detalheCanil.codigo}"></c:out>" >
                                                    <img src="images/botao/bt_aprovar.png" alt="Aprovar" title="Aprovar" class="seta_link" />
                                                </a>
                                            <img src="/WebMAA/Painel_controle/ong/images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link" onclick="mostra('colab_pendente','rel_geral'); mostrar('rel_geral');" />&nbsp;&nbsp;
                                           
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

       

    </body>

</html>