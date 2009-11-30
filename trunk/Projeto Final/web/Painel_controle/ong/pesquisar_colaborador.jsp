

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
                    window.location = "/WebMAA/ControleColaboradorServlet?operacao=ColaboradorApaga&codigo=" + codigo;
                }
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
                            <c:if test="${editarColaborador.codigo == 0}">
                                <div id="resultado" class="mostra">
                            </c:if>
                            <c:if test="${editarColaborador.codigo != 0}">
                                <div id="resultado" class="esconde">
                            </c:if>
                                    <div class="nota_destaque" style="width:100%;">Resultado da Pesquisa</div>
                                    <br />

                                    <table class="grid" style="width:100%;">
                                        <tr>
                                            <td width="6%" align="center" class="grid_titulo">Cod</td>
                                            <td width="23%" align="center" class="grid_titulo">Nome</td>
                                            <td width="13%" align="center" class="grid_titulo">Sexo</td>
                                            <td width="14%" align="center" class="grid_titulo">Telefone</td>
                                            <!--td width="19%" align="center" class="grid_titulo">E-mail</td-->
                                            <td width="5%" align="center" class="grid_titulo">UF</td>
                                            <td width="11%" align="center" class="grid_titulo">Detalhar</td>
                                            <td width="9%" align="center" class="grid_titulo">Excluir</td>
                                        </tr>
                                       <c:forEach items="${lstColaborador}" var="lstColaborador">
                                          <tr>
                                            <td align="center">${lstColaborador.codigo}</td>
                                            <td align="center">${lstColaborador.nome}</td>
                                            <c:if test="${lstColaborador.sexo==true}">
                                               <td align="center">Masc.</td>
                                            </c:if>
                                            <c:if test="${lstColaborador.sexo==false}">
                                               <td align="center">Fem.</td>
                                            </c:if>
                                            <td align="center">${lstColaborador.telefone}</td>
                                            <!--td align="center">${lstColaborador.email}</td-->
                                            <td align="center">
                                                    <c:forEach items="${lstUF}" var="lstUF">
                                                        <c:if  test="${lstColaborador.uf==lstUF.codigo}">
                                                         ${lstUF.UF}
                                                         </c:if>
                                                    </c:forEach>
                                                   
                                               </td>
                                            <td align="center"><a href="/WebMAA/ControleColaboradorServlet?operacao=ColaboradorMostra&codigo=${lstColaborador.codigo}">
                                            <img src="/WebMAA/Painel_controle/ong/images/botao/zoom.png" alt="Detalhar" title="Detalhar" class="seta_link" onclick="mostra('filtro','detalhar');" /></a>
                                            </td>
                                            <td align="center"><img src="images/botao/close.png" alt="Excluir" title="Excluir" class="seta_link" onclick="confirma(${lstColaborador.codigo});" /></td>
                                        </tr>
                                      </c:forEach>
                                    </table>

                                </div>
                                <br/>
                                
                                <!-- RESULTADO DA PESQUISA-->

            <!-- DETALHES DO FUNCIONARIO -->
                            <c:if test="${editarColaborador.codigo == 0}">
                                <div align="right" style="width:100%;">
                                    <a href="painel.jsp"><img src="/WebMAA/Painel_controle/ong/images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link" /></a>
                                </div>
                                <div id="detalhar" class="esconde">
                            </c:if>
                            <c:if test="${editarColaborador.codigo != 0}">
                                <div id="detalhar" class="mostra">
                            </c:if>
                                
                                    <div class="nota_destaque" style="width:100%;">Detalhes do Colaborador</div>
                                    <br />
                                    
                                    <fieldset>
                                        <legend>Dados Pessoais</legend>
                                        <table class="grid">
                                            <tr>
                                                <td align="right">Cod:&nbsp; </td>
                                                <td colspan="3"><span>${editarColaborador.codigo}</span></td>
                                            </tr>
                                            <tr>
                                                <td align="right">Data de Cadastro:&nbsp; </td>
                                                <td colspan="3"><span>${editarColaborador.dataCadastro}</span></td>
                                            </tr>
                                            <tr>
                                                <td width="26%" align="right">Nome: &nbsp;</td>
                                                <td colspan="3"><span>${editarColaborador.nome}</span></td>
                                            </tr>
                                            <tr>
                                                <td width="26%" align="right">Sexo: &nbsp;</td>
                                                 <c:if test="${editarColaborador.sexo==true}">
                                                    <td colspan="3"><span>Masc.</span></td>
                                                </c:if>
                                                <c:if test="${editarColaborador.sexo==false}">
                                                   <td colspan="3"><span>Fem.</span></td>
                                                </c:if>

                                            </tr>
                                            <tr>
                                                <td align="right">RG: &nbsp;</td>
                                                <td width="20%"><span>${editarColaborador.rg}</span></td>
                                                <td width="15%" align="right"> CPF: &nbsp;</td>
                                                <td width="39%"><span>${editarColaborador.cpf}</span></td>
                                            </tr>
                                            <tr>
                                                <td align="right">Data de Nascimento: &nbsp;</td>
                                                <td colspan="3"><span>${editarColaborador.dataNascimento}</span></td>
                                            </tr>
                                            <tr>
                                                <td align="right">Email: &nbsp;</td>
                                                <td colspan="3"><span>${editarColaborador.email}</span></td>
                                            </tr>
                                            <tr>
                                                <td align="right">Telefone: &nbsp;</td>
                                                <td colspan="3"><span>${editarColaborador.telefone}</span></td>
                                            </tr>
                                        </table>
                                    </fieldset>

                                    <fieldset>
                                        <legend>Endereço</legend>

                                        <table class="grid">
                                            <tr>
                                                <td width="26%" align="right">CEP: &nbsp;</td>
                                                <td colspan="5"><span>${editarColaborador.cep}</span></td>
                                            </tr>
                                            <tr>
                                                <td align="right">Endereço: &nbsp;</td>
                                                <td colspan="5"><span>${editarColaborador.endereco}</span></td>
                                            </tr>
                                            <tr>
                                                <td align="right">Complemento: &nbsp;</td>
                                                <td colspan="5"><span>${editarColaborador.complemento}</span></td>
                                            </tr>
                                            <tr>
                                                <td align="right">Cidade: &nbsp;</td>
                                                <td width="24%"><span>${editarColaborador.cidade}</span></td>
                                                <td width="13%" align="right">Bairro: &nbsp;</td>
                                                <td width="37%"><span>${editarColaborador.bairro}</span></td>
                                            </tr>
                                            <tr>
                                                <td align="right">UF: &nbsp;</td>
                                                <td colspan="3"><span>
                                                     <c:forEach items="${lstUF}" var="lstUF">
                                                        <c:if  test="${editarColaborador.uf==lstUF.codigo}">
                                                         ${lstUF.UF}
                                                         </c:if>
                                                    </c:forEach>
                                                </span></td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                   
                                    <br />
                                    <br />

                                    <div align="right" style="width:100%;">
                                        <img src="/WebMAA/Painel_controle/ong/images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link" onclick="mostra('detalhar','filtro'); mostrar('resultado');" />&nbsp;&nbsp;
                                    </div>

                                </div>
                                <!-- DETALHES DO FUNCIONARIO -->


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
