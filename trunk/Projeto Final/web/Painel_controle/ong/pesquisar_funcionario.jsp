

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
            function confirma(codigo) {
                if (window.confirm("Confirma exclusão?")) {
                    window.location = "/WebMAA/ControleFuncionarioServlet?operacao=FuncionarioApaga&codigo=" + codigo;
                }
            }
             function alterar(codigo){
                window.location ="/WebMAA/ControleFuncionarioServlet?operacao=FuncionarioEdita&codigo=" + codigo;
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
                                
                             <!-- RESULTADO DA PESQUISA-->
                              <c:if test="${mostrarFuncionario.codigo == 0 || editarFuncionario.codigo == 0}">
                                <div id="resultado" class="mostra">
                              </c:if>
                             
                             <c:if test="${mostrarFuncionario.codigo != 0 || editarFuncionario.codigo != 0}">
                                <div id="resultado" class="esconde">
                             </c:if>
                                    <div class="nota_destaque" style="width:100%;">Resultado da Pesquisa</div>
                                    <br />

                                    <table class="grid" style="width:100%;">
                                        <tr>
                                            <td width="8%" align="center" class="grid_titulo">Cod</td>
                                            <td width="20%" align="center" class="grid_titulo">Nome</td>
                                            <td width="14%" align="center" class="grid_titulo">Telefone</td>
                                            <td width="13%" align="center" class="grid_titulo">Cargo</td>
                                            <td width="16%" align="center" class="grid_titulo">Dt. Admissão</td>
                                            <td width="11%" align="center" class="grid_titulo">Detalhar</td>
                                            <td width="9%" align="center" class="grid_titulo">Alterar</td>
                                            <td width="9%" align="center" class="grid_titulo">Excluir</td>
                                        </tr>
                                          <c:forEach items="${lstFuncionario}" var="lstFuncionario">
                                            <tr>

                                               <td align="center">${lstFuncionario.codigo}</td>
                                                <td align="center">${lstFuncionario.nome}</td>
                                                <td align="center">${lstFuncionario.telefone}</td>
                                                <td align="center">${lstFuncionario.cargo}</td>
                                                <td align="center">${lstFuncionario.dataAdmissao}</td>
                                                <td align="center">
                                                    <a href="/WebMAA/ControleFuncionarioServlet?operacao=FuncionarioMostra&codigo=${lstFuncionario.codigo}">
                                                    <img src="images/botao/zoom.png" alt="Detalhar" title="Detalhar" class="seta_link" onclick="mostra('resultado','detalhar');" /></a></td>
                                                <td align="center">
                                                    
                                                    <img src="/WebMAA/Painel_controle/ong/images/botao/document_edit.png" alt="Alterar" title="Alterar" class="seta_link" onclick="mostra('resultado','alterar');alterar(${lstFuncionario.codigo});" /></td>
                                                <td align="center">
                                                    <img src="/WebMAA/Painel_controle/ong/images/botao/close.png" alt="Excluir" title="Excluir" class="seta_link" onclick="confirma(${lstFuncionario.codigo});"  /></td>
                                            </tr>
                                            </c:forEach>
                                    </table>
                                    <br/>
                                    <div align="right" style="width:100%;">
                                        <a href="/WebMAA/Painel_controle/ong/painel.jsp">
                                        <img src="/WebMAA/Painel_controle/ong/images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link" />&nbsp;&nbsp;
                                        </a>
                                    </div>
                                </div>
                                 
                                <!-- RESULTADO DA PESQUISA-->

            <!-- DETALHES DO FUNCIONARIO -->
                           <c:if test="${mostrarFuncionario.codigo == 0 }">
                                <div id="detalhar" class="esconde">
                            </c:if>
                            <c:if test="${mostrarFuncionario.codigo != 0}">
                                <div id="detalhar" class="mostra">
                            </c:if>
                                    <div class="nota_destaque" style="width:100%;">Detalhes do Funcionario</div>
                                    <br />

                                    <fieldset>
                                        <legend>Dados Pessoais</legend>
                                        <table class="grid">
                                            <tr>
                                                <td align="right">Cod:&nbsp; </td>
                                                <td colspan="3"><span>${mostrarFuncionario.codigo}</span></td>
                                            </tr>
                                            <tr>
                                                <td align="right">Data de Cadastro:&nbsp; </td>
                                                <td colspan="3"><span>${mostrarFuncionario.dataCadastro}</span></td>
                                            </tr>
                                            <tr>
                                                <td width="26%" align="right">Nome: &nbsp;</td>
                                                <td colspan="3"><span>${mostrarFuncionario.nome}</span></td>
                                            </tr>
                                            <tr>
                                                <td align="right">RG: &nbsp;</td>
                                                <td width="20%"><span>${mostrarFuncionario.rg}</span></td>
                                                <td width="15%" align="right"> CPF: &nbsp;</td>
                                                <td width="39%"><span>${mostrarFuncionario.cpf}</span></td>
                                            </tr>
                                            <tr>
                                                <td align="right">Data de Nascimento: &nbsp;</td>
                                                <td colspan="3"><span>${mostrarFuncionario.dataNascimento}</span></td>
                                            </tr>
                                            <tr>
                                                <td align="right">Email: &nbsp;</td>
                                                <td colspan="3"><span>${mostrarFuncionario.email}</span></td>
                                            </tr>
                                            <tr>
                                                <td align="right">Telefone: &nbsp;</td>
                                                <td colspan="3"><span>${mostrarFuncionario.telefone}</span></td>
                                            </tr>
                                            <tr>
                                                <td align="right">Cargo: &nbsp;</td>
                                                <td><span>${mostrarFuncionario.cargo}</span></td>
                                                <td align="right">Data de Admissão: &nbsp;</td>
                                                <td><span>${mostrarFuncionario.dataAdmissao}</span></td>
                                            </tr>
                                        </table>
                                    </fieldset>

                                    <fieldset>
                                        <legend>Endereço</legend>

                                        <table class="grid">
                                            <tr>
                                                <td width="26%" align="right">CEP: &nbsp;</td>
                                                <td colspan="5"><span>${mostrarFuncionario.cep}</span></td>
                                            </tr>
                                            <tr>
                                                <td align="right">Endereço: &nbsp;</td>
                                                <td colspan="5"><span>${mostrarFuncionario.endereco}</span></td>
                                            </tr>
                                            <tr>
                                                <td align="right">Complemento: &nbsp;</td>
                                                <td colspan="5"><span>${mostrarFuncionario.complemento}</span></td>
                                            </tr>
                                            <tr>
                                                <td align="right">Cidade: &nbsp;</td>
                                                <td width="24%"><span>${mostrarFuncionario.cidade}</span></td>
                                                <td width="13%" align="right">Bairro: &nbsp;</td>
                                                <td width="37%"><span>${mostrarFuncionario.bairro}</span></td>
                                            </tr>
                                            <tr>
                                                <td align="right">UF: &nbsp;</td>
                                                <td colspan="3"><span>
                                                <c:forEach items="${lstUF}" var="lstUF">
                                                        <c:if  test="${mostrarFuncionario.uf==lstUF.codigo}">
                                                         ${lstUF.UF}
                                                         </c:if>
                                                    </c:forEach></span></td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                    <br />
                                    <br />

                                    <div align="right" style="width:100%;">
                                        <img src="/WebMAA/Painel_controle/ong/images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link" onclick="mostra('detalhar','filtro'); mostrar('resultado');window.location='/WebMAA/ControleFuncionarioServlet?operacao=FuncionarioLista';" />&nbsp;&nbsp;
                                    </div>

                                </div>
                                <!-- DETALHES DO FUNCIONARIO -->

            <!-- ALTERAR DADOS -->
                                 <c:if test="${editarFuncionario.codigo == 0 || mostrarFuncionario.codigo != 0}">
                                    <div id="alterar" class="esconde">
                                </c:if>
                                <c:if test="${editarFuncionario.codigo != 0 || mostrarFuncionario.codigo == 0}">
                                    <div id="alterar" class="mostra">
                                </c:if>
                                    <!--div class="nota_destaque" style="width:100%;">Alteração de Dados Cadastrais</div-->
                                        <form id="frmeditarFuncionario" name="frmeditarFuncionario">
                                        <input type="hidden" name="operacao" value="FuncionarioEditaProcessa">
                                        <input type="hidden" name="codigo" value="${editarFuncionario.codigo}">
                                        <fieldset>
                                            <legend>Dados Pessoais</legend>
                                            <table class="grid">
                                                <tr>
                                                    <td align="right">Cod:&nbsp; </td>
                                                    <td colspan="3"><input type="text" name="codigo" size="5" value="${editarFuncionario.codigo}" disabled="true" /></td>
                                                </tr>
                                                <tr>
                                                    <td align="right">Data de Cadastro:&nbsp; </td>
                                                    <td colspan="3"><input type="text" size="10" name="dataCadastro" value="${editarFuncionario.dataCadastro}" disabled="disabled" class="data" /></td>
                                                </tr>
                                                <tr>
                                                    <td width="26%" align="right"><span class="obrigatorio">*</span> Nome: &nbsp;</td>
                                                    <td colspan="3"><input type="text" name="nome" size="30" value="${editarFuncionario.nome}" /></td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><span class="obrigatorio">*</span> RG: &nbsp;</td>
                                                    <td width="20%"><input type="text" name="rg" size="10" value="${editarFuncionario.rg}" /></td>
                                                    <td width="15%" align="right"><span class="obrigatorio">*</span> CPF: &nbsp;</td>
                                                    <td width="39%"><input type="text" name="cpf" size="10" class="cpf" value="${editarFuncionario.cpf}" /></td>
                                                </tr>
                                                <tr>
                                                    <td align="right">Data de Nascimento: &nbsp;</td>
                                                    <td colspan="3"><input type="text" name="dataNascimento" size="8" class="data" value="${editarFuncionario.dataNascimento}" /></td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><span class="obrigatorio">*</span> Email: &nbsp;</td>
                                                    <td colspan="3"><input type="text" name="Email" size="30" value="${editarFuncionario.email}" /></td>
                                                </tr>
                                                <tr>
                                                    <td align="right">Telefone: &nbsp;</td>
                                                    <td colspan="3"><input type="text" name="telefone" size="10" class="foneDD" value="${editarFuncionario.telefone}" /></td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><span class="obrigatorio">*</span> Cargo: &nbsp;</td>
                                                    <td>
                                                       
                                                        <select name="cargo" id="cargo">
                                                             <c:if test="${editarFuncionario.cargo!='Diretor'}">
                                                            <option value="Auxiliar" selected="Auxiliar">Auxiliar</option>
                                                            <option value="Diretor">Diretor</option>
                                                            </c:if>
                                                            <c:if test="${editarFuncionario.cargo=='Diretor'}">
                                                            <option value="Auxiliar">Auxiliar</option>
                                                            <option value="Diretor" selected="Diretor">Diretor</option>
                                                            </c:if>
                                                        </select>
                                                    </td>
                                                    <td align="right">Data de Admissão: &nbsp;</td>
                                                    <td><input type="text" name="dataadmissao" size="8" class="data" value="${editarFuncionario.dataAdmissao}"  /></td>
                                                </tr>
                                            </table>
                                        </fieldset>

                                        <fieldset>
                                            <legend>Endereço</legend>
                                            <table class="grid">
                                                <tr>
                                                    <td width="30%" align="right"><span class="obrigatorio">*</span> CEP: &nbsp;</td>
                                                    <td colspan="5"><input type="text" name="cep" size="10" class="cep" value="${editarFuncionario.cep}" /></td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><span class="obrigatorio">*</span> Endereço: &nbsp;</td>
                                                    <td colspan="5"><input type="text" name="endereco" size="30" value="${editarFuncionario.endereco}" /></td>
                                                </tr>
                                                <tr>
                                                    <td align="right">Complemento: &nbsp;</td>
                                                    <td colspan="5"><input type="text" name="complemento" size="30" value="${editarFuncionario.complemento}" /></td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><span class="obrigatorio">*</span> Cidade: &nbsp;</td>
                                                    <td width="20%"><input type="text" name="cidade" size="15" value="${editarFuncionario.cidade}"  /></td>
                                                    <td width="13%" align="right">Bairro: &nbsp;</td>
                                                    <td width="37%"><input type="text" name="bairro" size="10" value="${editarFuncionario.bairro}"  /></td>
                                                </tr>
                                                <tr>
                                                    <td align="right"><span class="obrigatorio">*</span> UF: &nbsp;</td>
                                                    <td colspan="3">
                                                        <select name="uf_codigo">
                                                            <option></option>
                                                           <c:forEach items="${lstUF}" var="lstUF">
                                                              <option value="${lstUF.codigo}"
                                                              <c:if  test="${editarFuncionario.uf==lstUF.codigo}">
                                                                selected ="${lstUF.UF}"
                                                             </c:if>   > ${lstUF.UF}</option>
                                                            </c:forEach>

                                                        </select>
                                                    </td>
                                                </tr>
                                            </table>
                                        </fieldset>
                                        <br />
                                        <br />

                                        <div align="right" style="width:100%;">
                                            <img src="/WebMAA/Painel_controle/ong/images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link" onclick="mostra('alterar','resultado'); mostrar('resultado');window.location='/WebMAA/ControleFuncionarioServlet?operacao=FuncionarioLista';" />&nbsp;&nbsp;
                                            <!--input type="submit"  src="/WebMAA/Painel_controle/ong/images/botao/bt_alterar.png" alt="Alterar"  name="Alterar"  title="Alterar" class="seta_link"/-->
                                            
                                                <img src="/WebMAA/Painel_controle/ong/images/botao/bt_alterar.png" alt="Alterar" title="Alterar" class="seta_link" id="altera" onmouseover="focoBt('altera');" onmouseout="bt('altera');"  onclick="submeterFuncionarioAlteracao();"/>
                                            
                                        </div>
                                     </form>
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

<!-- Rodapé -->

        <div id="rodape">
            Versão do Sistema &nbsp;&nbsp; 1.0
        </div>

    </body>

</html>