<%-- 
    Document   : gerencia_doacao
    Created on : 02/10/2009, 17:01:58
    Author     : usuario
--%>

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

    <script type="text/javascript" src="/WebMAA/Painel_controle/ong/js/jquery.min.js"></script>


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

            else if(id ==="enviar"){
                $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_enviar_light.png");
            }

            else if(id ==="altera"){
                $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_alterar_light.png");
            }

            else if(id ==="ok"){
                $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_ok_light.png");
            }
        }

        function bt(id){
            if(id ==="pesquisa"){
                $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_pesquisar.png");
            }

            else if(id ==="enviar"){
                $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_enviar.png");
            }

            else if(id ==="altera"){
                $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_alterar.png");
            }

            else if(id ==="ok"){
                $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_ok.png");
            }
        }
    </script>

     <script type="text/javascript">
            function confirma(codigo) {
                if (window.confirm("Confirma exclusÃ£o?")) {
                    window.location = "/WebMAA/ControleAnimaisServlet?operacao=AnimaisApagaDoacao&codigo=" + codigo +"&localAnimal=" + document.getElementById("tipoL").value +"&tipoAnimal="+document.getElementById("tipoA").value ;
                }
            }
            function detalhar(codigo) {

                window.location = "/WebMAA/ControleAnimaisServlet?operacao=AnimaisMostraDoacao&codigo=" + codigo;

            }
            function alterar(codigo) {

                window.location = "/WebMAA/ControleAnimaisServlet?operacao=AnimaisEditaDoacao&codigo=" + codigo +"&localAnimal=" + document.getElementById("tipoL").value +"&tipoAnimal="+document.getElementById("tipoA").value+"#dadosGerais" ;

            }


        </script>
</head>

<body>
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
            <div id="cont">
                    <div class="menuLeft">
                        <br />
                        <br />
                        <div id="menu3">
                            <%@include file="menu.jsp" %>
                        </div>
                   </div>
                    <div class="conteudo_painel">

                        <div class="lista">
                           
                            <!-- FILTRO DE PESQUISA -->


                            <c:if test="${lstAnimais == null ||detalheCanil.codigo==0}">
                                <div id="filtro" class="mostra">
                              </c:if>
                             <c:if test="${lstAnimais != null ||detalheCanil.codigo!=0}">
                                <div id="filtro" class="esconde">
                              </c:if>
                               <div class="bordaFaixaLeft"><span>Gerenciamento de Doações</span></div>
                                <br />
                          
                                <br />
                                <div class="nota_destaque" style="width:100%;">Filtro de Pesquisa</div>
                                <br />

                                <span class="obrigatorio">* Campos de Preenchimento Obrigatório</span>
                                <br />
                                <form name="frmPesquisa" id="frmPesquisa" action="/WebMAA/ControleAnimaisServlet?operacao=AnimaisProcessaPesquisaDoacao" method="post">
                                <input type="hidden" name="operacao" value="AnimaisProcessaPesquisaDoacao">
                                <input type="hidden" name="tipoL" id="tipoL" value="<%out.print(session.getAttribute("localAnimal"));%>">
                                <input type="hidden" name="tipoA" id="tipoA" value="<%out.print(session.getAttribute("tipoAnimal"));%>">
                                    <table class="grid">
                                        
                                        <tr>
                                            <td align="right">Onde Pesquisar? &nbsp;</td>
                                            <td><select name="localAnimal" disabled="disabled">
                                                    <option value=""></option>
                                                    <option value="Sim">Animais em Canil/Gatil</option>
                                                    <option value="Nao" selected="selected">Animais em Colaborador</option>
                                            </select></td>
                                        </tr>
                                        <tr>
                                            <td align="right"><span class="obrigatorio">*</span> Tipo de animal: &nbsp;</td>
                                            <td>  <select name="tipoAnimal">
                                                            <option value=""></option>
                                                            <option value="Gato">Gato</option>
                                                            <option value="Cao">CÃ£o</option>
                                                            <option value="Todos">Todos</option>
                                                    </select>
                                            </td>
                                        </tr>
                                    </table>
                                </form>
                                <br />
                                <br />

                                <div align="right" style="width:90%;">
                                    <a href="painel.jsp">
                                        <img src="/WebMAA/Painel_controle/ong/images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link" />
                                   </a>&nbsp;&nbsp;
                                   <a href="javascript:document.getElementById('frmPesquisa').submit();">
                                        <img src="/WebMAA/Painel_controle/ong/images/botao/bt_pesquisar.png" alt="Pesquisar" title="Pesquisar" class="seta_link" id="pesquisa" onmouseover="focoBt('pesquisa');" onmouseout="bt('pesquisa');" onclick="mostra('filtro','rel_colab_fila');" />
                                   </a>
                                </div>

                                <br />

                            </div>
                            <!-- FILTRO DE PESQUISA -->


                            <!-- RELATÃ“RIO COLABORADOR FILA -->
                             <c:if test="${lstAnimais == null}">
                                <div id="rel_colab_fila" class="esconde">
                              </c:if>
                             <c:if test="${lstAnimais != null}">
                                <div id="rel_colab_fila" class="mostra">
                              </c:if>
                                <div class="nota_destaque" style="width:100%;">Animais Cadastrados</div>
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
                                     <c:forEach  items="${lstAnimais}" var="lstAnimais">
                                    <tr class="td_escura">
                                        <td align="center"><img src="/WebMAA/Painel_controle/ong/images/img_gato/nanda.png" alt="Nanda" width="69" height="59" title="Nanda" /></td>
                                        <td align="center"><c:out value="${lstAnimais.codigo}"></c:out></td>
                                        <td align="center"><c:out value="${lstAnimais.nome}"></c:out></td>
                                        <td align="center"><c:out value="${lstAnimais.especie}"></c:out></td>
                                        <td align="center">Comun</td>
                                        <td align="center"><c:out value="${lstAnimais.dataCadastro}"></c:out></td>
                                        <td align="center"><img src="/WebMAA/Painel_controle/ong/images/botao/zoom.png" alt="Detalhar" title="Detalhar" class="seta_link" onclick="detalhar(${lstAnimais.codigo});mostra('filtro','detalharColab');" /></td>
                                        <td align="center"><img src="/WebMAA/Painel_controle/ong/images/botao/document_edit.png" alt="Alterar" title="Alterar" class="seta_link" onclick="alterar(${lstAnimais.codigo});mostra('filtro','alterar_colab'); mostrar('dadosGerais_usr');" /></td>
                                        <td align="center"><img src="/WebMAA/Painel_controle/ong/images/botao/close.png" alt="Excluir" title="Excluir" class="seta_link" onclick="confirma(${lstAnimais.codigo});"/></td>
                                    </tr>
                                    </c:forEach>
                                
                                </table>

                                <br />
                                <div align="right" style="width:90%;">
                                    <a href="/WebMAA/ControleAnimaisServlet?operacao=DoacoesPesquisar">
                                        <img src="/WebMAA/Painel_controle/ong/images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link" onclick="mostra('rel_colab_fila','filtro'); " />&nbsp;&nbsp;
                                    </a>
                                </div>
                            </div>

                            <!-- DETALHES DO COLABORADOR -->
                            <c:if test="${detalheCanil.codigo==0}">
                                <div id="detalharColab" class="esconde">
                                </c:if>
                                <c:if test="${detalheCanil.codigo!=0}">
                                <div id="detalharColab" class="mostra">
                                </c:if>
                                  <div class="nota_destaque" style="width:100%;">Detalhes do Animal</div>
                                    <br />
                                    <div id="foto">
                                        <img src="../../gato/images/loky.jpg" />
                                    </div>
                                  
                                    <!-- DADOS DO ANIMAL -->
                                    <div id="dadosUsuario">
                                        <table class="grid" style="width:100%;">
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

                                    <table class="grid" style="width:100%;">
                                        <tr>
                                            <td><span class="obrigatorio">Descrição do Animal</span></td>
                                        </tr>
                                        <tr>
                                            <td>${detalheCanil.descricao}</td>
                                        </tr>
                                    </table>
                                    <br />
                                    <div class="nota_destaque" style="width:100%;">Informações Adicionais</div>
                                    <br />
                                    <table class="grid" style="width:100%;">
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
                                 <div class="nota_destaque" style="width:100%;">Proprietário</div>
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
                                        <td width="6%" align="center">${dadosColaborador.codigo}</td>
                                        <td width="23%" align="center">${dadosColaborador.nome}</td>
                                        <c:if test="${dadosColaborador.sexo=='M'}">
                                        <td width="11%" align="center">Masculino</td>
                                        </c:if>
                                        <c:if test="${dadosColaborador.sexo!='M'}">
                                        <td width="11%" align="center">Feminino</td>
                                        </c:if>
                                        <c:forEach items="${lstUf}"  var="lstUf">
                                            <c:if test="${dadosColaborador.uf ==lstUf.codigo}">
                                                <td width="5%" align="center">${lstUf.UF}</td>
                                            </c:if>
                                        </c:forEach>
                                        <td width="15%" align="center">${dadosColaborador.telefone}</td>
                                        <td width="29%" align="center">${dadosColaborador.email}</td>
                                        <td width="11%" align="center">
                                            
                                            <img src="/WebMAA/Painel_controle/ong/images/botao/ler_email.png" alt="Notificar" title="Notificar Usuario" class="seta_link" onclick="mostra('detalharColab','notificar')" />
                                            
                                       </td>
                                    </tr>
                                </table>
                                <br />
                                
                                <br />
                                <br />

                                <div align="right" style="width:90%;">
                                    <a href="javascript:document.getElementById('frmPesquisa').submit();">
                                    <img src="/WebMAA/Painel_controle/ong/images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link" onclick="mostra('detalharColab','filtro'); mostrar('rel_colab_fila');" />&nbsp;&nbsp;
                                    </a>
                                </div>

                            </div>
                            <!-- DETALHES DO DETALHES DO ANIMAL COLABORADOR -->
                           
                             <!-- DETALHES DA MENSAGEM -->
                            <div id="notificar" class="esconde">
                                <div class="bordaFaixaLeft" style="width:100%; ">
                                    <span>Gerenciar Doações - Notificação</span>
                                </div>
                                <br />

                                <span class="obrigatorio">* Campo de Preenchimento Obrigatório</span>
                                <br />
                                <br />
                                <form name="frmNotificacao" id="frmNotificacao" action="/WebMAA/ControleNotificacaoServlet?operacao=AnimaisProcessaNotificacao" method="post">
                                <input type="hidden" name="operacao" value="AnimaisProcessaNotificacao">
                                <input type="hidden" name="codigo_funcionario" value="<%out.print(session.getAttribute("codigoFuncionario"));%>">
                                <input type="hidden" name="codigoanimal" value="${detalheCanil.codigo}">
                                <input type="hidden" name="codigo_colaborador" value="${dadosColaborador.codigo}">
                                    
                                <table class="grid" style=" width:98%;">
                                    <tr>
                                        <td width="26%" align="left">Cod. Usuario: &nbsp;<input type="text" name="codigocolaborador" value="<c:out value="${dadosColaborador.codigo}"></c:out>" readonly size="5" /></td>
                                        <td width="74%" align="left"></td>
                                    </tr>
                                    <tr>
                                        <td width="26%" align="left">Colaborador: &nbsp;
                                        <input type="text" value="${dadosColaborador.nome}" disabled="disabled" size="30" /></td>
                                        <td width="74%" align="left"></td>
                                    </tr>
                                     <tr>
                                        <td width="26%" align="left">Assunto: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="text" name="descricaoassunto" id="descricaoassunto" size="30" /></td>
                                        <td width="74%" align="left"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">Descreva abaixo a Mensagem</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><textarea cols="85" rows="5" name="mensagem"></textarea></td>
                                    </tr>
                                </table>
                                <br />
                                <div align="right">
                                    <a href="javascript:document.getElementById('frmNotificacao').submit();">
                                        <img src="/WebMAA/Painel_controle/ong/images/botao/bt_enviar.png" alt="Enviar" title="Enviar" class="seta_link close" id="enviar" onmouseover="focoBt('enviar');" onmouseout="bt('enviar');" onclick="mostra('notificar','');alert('NotificaÃ§Ã£o Enviada Com Sucesso!');" />&nbsp;&nbsp;
                                    </a>
                                    <img src="/WebMAA/Painel_controle/ong/images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link"  onclick="mostra('notificar','detalharColab');" />&nbsp;&nbsp;
                                </div>


                                <br />
                                <br />

                            
                                </form>
                            </div>
                            <!-- DETALHES DA MENSAGEM -->
                          
                           

                        </div>
                        <!-- RELATÃ“RIO COLABORADOR FILA -->

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