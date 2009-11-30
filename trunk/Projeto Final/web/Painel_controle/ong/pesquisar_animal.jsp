
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
                    window.location = "/WebMAA/ControleAnimaisServlet?operacao=AnimaisApaga&codigo=" + codigo +"&localAnimal=" + document.getElementById("tipoL").value +"&tipoAnimal="+document.getElementById("tipoA").value ;
                }
            }
            function detalharCanil(codigo) {

                window.location = "/WebMAA/ControleAnimaisServlet?operacao=AnimaisMostraCanil&codigo=" + codigo;

            }
            function detalharColab(codigo) {

                window.location = "/WebMAA/ControleAnimaisServlet?operacao=AnimaisMostraColaborador&codigo=" + codigo;

            }
            function alterar(codigo) {

                window.location = "/WebMAA/ControleAnimaisServlet?operacao=AnimaisEdita&codigo=" + codigo +"&localAnimal=" + document.getElementById("tipoL").value +"&tipoAnimal="+document.getElementById("tipoA").value+"#dadosGerais" ;
                
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
                                    <form name="frmPesquisa" id="frmPesquisa" >
                                    <input type="hidden" name="operacao" value="AnimaisProcessaPesquisa">
                                    <input type="hidden" name="tipoL" id="tipoL" value="<%out.print(session.getAttribute("localAnimal"));%>">
                                    <input type="hidden" name="tipoA" id="tipoA" value="<%out.print(session.getAttribute("tipoAnimal"));%>">
                                        <table class="grid">
                                            <tr align="right">
                                                <td colspan="2" align="left">Preencha pelo menos um campo do filtro abaixo.</td>
                                            </tr>
                                            <tr>
                                                <td align="right"><span class="obrigatorio">*</span> Onde Pesquisar? &nbsp;</td>
                                                <td>
                                                    <select name="localAnimal">
                                                            <option value=""></option>
                                                            <option value="Sim">Animais em Canil/Gatil</option>
                                                            <option value="Nao">Animais em Colaborador</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right"><span class="obrigatorio">*</span> Tipo de animal: &nbsp;</td>
                                                <td>
                                                    <select name="tipoAnimal">
                                                            <option value=""></option>
                                                            <option value="Gato">Gato</option>
                                                            <option value="Cao">Cão</option>
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
                                            <img src="/WebMAA/Painel_controle/ong/images/botao/bt_pesquisar.png" alt="Pesquisar" title="Pesquisar" class="seta_link" id="pesquisa" onmouseover="focoBt('pesquisa');" onmouseout="bt('pesquisa');" onclick="pesquisaAnimais();" />
                                           
                                        </div>
                                        <br />
                                    </form>
                                </div>
                                <!-- FILTRO DE PESQUISA -->

            <!-- RESULTADO DA PESQUISA-->
                                  <c:if test="${lstAnimais == null}">
                                    <div id="resultAnimal" class="esconde">
                                  </c:if>
                                 <c:if test="${lstAnimais != null}">
                                    <div id="resultAnimal" class="mostra">
                                  </c:if>
                                <div class="nota_destaque" style="width:100%;">Pesquisa de Animais</div>
                                <br />
                                <form name="frmResultadoPesquisa" method="post">
                                
                                    <table class="grid" style="width:100%;">
                                        <tr>
                                            <td width="12%" align="center" class="grid_titulo">Foto</td>
                                            <td width="7%" align="center" class="grid_titulo">Cod</td>
                                            <td width="9%" align="center" class="grid_titulo">Esp.</td>
                                            <td width="20%" align="center" class="grid_titulo">Nome</td>
                                            <td width="7%" align="center" class="grid_titulo">Sexo</td>
                                            <td width="16%" align="center" class="grid_titulo">Dt. Cadastro</td>
                                            <td width="16%" align="center" class="grid_titulo">Proprietário</td>
                                            <td width="11%" align="center" class="grid_titulo">Detalhar</td>
                                            <td width="9%" align="center" class="grid_titulo">Alterar</td>
                                            <td width="9%" align="center" class="grid_titulo">Excluir</td>
                                        </tr>
                                        <c:forEach  items="${lstAnimais}" var="lstAnimais">
                                            
                                            <tr>
                                                <td align="center"><img src="/WebMAA/Painel_controle/ong/images/img_gato/loky.png" alt="locky" width="69" height="59" title="lucky" /></td>
                                                <td align="center"><c:out value="${lstAnimais.codigo}"></c:out></td>
                                                <td align="center">${lstAnimais.especie}</td>
                                                <td align="center">${lstAnimais.nome}</td>
                                                <td align="center">${lstAnimais.sexo}</td>
                                                <td align="center">${lstAnimais.dataCadastro}</td>
                                                <c:if test="${lstAnimais.codigoColaborador!=0}">
                                                    <c:forEach items="${lstColaborador}" var="lstColaborador">
                                                              <c:if test="${lstAnimais.codigoColaborador==lstColaborador.codigo}">
                                                                <td align="center">${lstColaborador.nome}</td>
                                                            </c:if>
                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${lstAnimais.codigoColaborador==0}">
                                                    <td align="center">ONG Amigos Fies</td>
                                                </c:if>
                                                <c:if test="${lstAnimais.codigoColaborador==0}">
                                                <td align="center"><img src="/WebMAA/Painel_controle/ong/images/botao/zoom.png" alt="Detalhar" title="Detalhar" class="seta_link" onclick="detalharCanil(${lstAnimais.codigo});mostrar('resultAnimal');mostra('filtro','detalharCanil');" /></td>
                                                <td align="center"><img src="/WebMAA/Painel_controle/ong/images/botao/document_edit.png" alt="Alterar" title="Alterar" class="seta_link" onclick="alterar(${lstAnimais.codigo});" /></td>
                                                <td align="center"><img src="/WebMAA/Painel_controle/ong/images/botao/close.png" alt="Excluir" title="Excluir" class="seta_link" onclick="confirma(${lstAnimais.codigo});mostrar('resultAnimal');" /></td>
                                                </c:if>
                                                <c:if test="${lstAnimais.codigoColaborador!=0}">
                                                  <td align="center"><img src="/WebMAA/Painel_controle/ong/images/botao/zoom.png" alt="Detalhar" title="Detalhar" class="seta_link" onclick="mostra('filtro','detalharColab');detalharColab(${lstAnimais.codigo});" /></td>
                                                  <td align="center" ><img  src="/WebMAA/Painel_controle/ong/images/botao/document_edit.png" alt="Alterar" title="Alterar" class="seta_link" onclick="alert('Ops!Dados do animal do colaborador não pode ser alterado.');"  /></td>
                                                  <td align="center"><img src="/WebMAA/Painel_controle/ong/images/botao/close.png" alt="Excluir" title="Excluir" class="seta_link" onclick="alert('Ops!Dados do animal do colaborador não pode ser excluido.');" /></td>
                                                </c:if>
                                            </tr>
                                            
                                        </c:forEach>
                                       
                                        
                                    </table>
                                </form>
                                </div>
                                <!-- RESULTADO DA PESQUISA-->
                                <!-- DETALHES DO ANIMAL NO CANIL -->
                                <c:if test="${detalheCanil.codigo==0}">
                                <div id="detalharCanil" class="esconde">
                                </c:if>
                                <c:if test="${detalheCanil.codigo!=0}">
                                <div id="detalharCanil" class="mostra">
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
                                        <a href="javascript:document.getElementById('frmPesquisa').submit();">
                                            <img src="/WebMAA/Painel_controle/ong/images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link" onclick="mostra('detalharCanil','filtro'); mostrar('resultAnimal');" />&nbsp;&nbsp;
                                        </a>
                                    </div>

                                </div>
                                <!-- DETALHES DO DETALHES DO ANIMAL NO CANIL -->

                                <!-- ALTERAR DADOS -->
                                <!--fecha alteraçao-->
                                
                                <!-- ALTERAR DADOS -->

                                <!-- DETALHES DO COLABORADOR - detalheColab -->
                                <c:if test="${detalheColab.codigo==0}">
                                <div id="detalharColab" class="esconde">
                                </c:if>
                                <c:if test="${detalheColab.codigo!=0}">
                                <div id="detalharColab" class="mostra">
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
                                                <td width="67%"><span>${detalheColab.codigo}</span></td>
                                            </tr>
                                            <tr>
                                                <td width="33%" align="right">Raça: &nbsp;</td>
                                                <td width="67%"><span>${detalheColab.especie}</span></td>
                                            </tr>
                                            <tr>
                                                <td width="33%" align="right">Idade Aproximada: &nbsp;</td>
                                                <td width="67%"><span>${detalheColab.idade}</span></td>
                                            </tr>
                                            <tr>
                                                <td width="33%" align="right">Cor Predominante: &nbsp;</td>

                                                <c:forEach  items="${lstCor}" var="lstCor">
                                                    <c:if test="${lstCor.codigo ==detalheColab.cor1}">
                                                       <td width="67%"><span>${lstCor.descricao}</span></td>
                                                    </c:if>
                                               </c:forEach>
                                            </tr>
                                            <tr>
                                                <td width="33%" align="right">2ª Cor: &nbsp;</td>
                                                <c:forEach  items="${lstCor}" var="lstCor">
                                                    <c:if test="${lstCor.codigo ==detalheColab.cor2}">
                                                       <td width="67%"><span>${lstCor.descricao}</span></td>
                                                    </c:if>
                                               </c:forEach>

                                            </tr>
                                            <tr>
                                                <td width="33%" align="right">Pelagem: &nbsp;</td>
                                                <c:forEach  items="${lstpelagem}" var="lstpelagem">
                                                    <c:if test="${lstpelagem.codigo ==detalheColab.codigoPelagem}">
                                                        <td width="67%">
                                                            <span>${lstpelagem.descricao}</span>
                                                        </td>
                                                    </c:if>
                                                </c:forEach>
                                            </tr>
                                            <tr>
                                                <td width="33%" align="right" valign="top">Sexo: &nbsp;</td>
                                                <td width="67%" valign="top">
                                                    <c:if test="${detalheColab.sexo==M}">
                                                        <span>Macho</span>
                                                    </c:if>
                                                    <c:if test="${detalheColab.sexo!=M}">
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
                                            <td>${detalheColab.descricao}</td>
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
                                            <td width="72%">${detalheColab.castrado}</td>
                                        </tr>
                                        <tr class="td_escura">
                                            <td><strong>Animal com certificado Veterianário?</strong></td>
                                        </tr>
                                        <tr>
                                            <td>${detalheColab.laudoVeterinario}</td>
                                        </tr>
                                        <tr class="td_escura">
                                            <td><strong>Animal Vacinado? </strong></td>
                                        </tr>
                                        <tr>
                                            <td>${detalheColab.vacinado} - ${detalheColab.descricaoVacina}</td>
                                        </tr>
                                        <tr class="td_escura">
                                            <td><strong>Forma de Envio:</strong></td>
                                        </tr>
                                        <tr>
                                            <c:forEach  items="${lstFormaEnvio}" var="lstFormaEnvio">
                                                    <c:if test="${lstFormaEnvio.codigo ==detalheColab.codigoFormaEnvio}">
                                                        <td>${lstFormaEnvio.descricao}</td>
                                                    </c:if>
                                            </c:forEach>
                                        </tr>

                                    </table>
                                    
                                    <br />
                                    <br />

                                    <div align="right" style="width:90%;">
                                        <a href="javascript:document.getElementById('frmPesquisa').submit();">
                                            <img src="/WebMAA/Painel_controle/ong/images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link" onclick="mostra('detalharColab','filtro'); mostrar('resultAnimal');" />&nbsp;&nbsp;
                                        </a>
                                    </div>

                                </div>
                                <!-- DETALHES DO DETALHES DO ANIMAL COLABORADOR -->

           

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