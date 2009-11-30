
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
                if(id ==="limpar"){
                    $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_limpar_light.png");
                }

                if(id ==="cadastrar"){
                    $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_cadastrar_light.png");
                }
            }

            function bt(id){
                if(id ==="limpar"){
                    $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_limpar.png");
                }

                if(id ==="cadastrar"){
                    $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_cadastrar.png");
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

                            <!-- menu --><div id="menu3">
                                <%@include file="menu.jsp" %>

                            </div>

                        </div>

                        <div class="conteudo_painel">

                            <div class="lista">
                                <div class="bordaFaixaLeft"><span>Cadastro de Colaborador</span></div>
                                <br />
                                <span class="obrigatorio">* Campos de Preenchimento Obrigatório</span>
                                <br />
                                <div class="nota_informa">
                                    <span>Use esse formulário somente em caso de extrema precisão.</span>
                                </div>
                                <form id="frmcolaborador" name="frmcolaborador" >
                                   <input type="hidden" name="operacao" value="ColaboradorNovoProcessa">
                                   <fieldset>
                                        <legend>Dados Pessoais</legend>

                                        <table class="grid">
                                            <tr>
                                                <td width="16%" align="right"><span class="obrigatorio">*</span> Nome: &nbsp;</td>
                                                <td colspan="3"><input type="text" name="nome" id="nome" size="50" /></td>
                                            </tr>
                                            <tr>
                                                <td width="16%" align="right"><span class="obrigatorio">*</span> RG: &nbsp;</td>
                                                <td width="25%"><input type="text" name="rg" id="rg" size="10" maxlength="9" /></td>
                                                <td width="11%" align="right"><span class="obrigatorio">*</span> CPF: &nbsp;</td>
                                                <td width="48%"><input type="text" name="cpf" id="cpf" class="cpf" size="10" /></td>
                                            </tr>
                                            <tr>
                                                <td width="16%" align="right"><span class="obrigatorio">*</span> Email (login): &nbsp;</td>
                                                <td width="25%"><input type="text" name="Email" id="Email" size="20"  /></td>
                                                <td width="11%" align="right"><span class="obrigatorio">*</span> Sexo: &nbsp;</td>
                                                <td width="48%"><label>Masculino &nbsp; <input type="radio" name="sexo" value="M" id="masc" /></label> &nbsp;&nbsp; <label>Feminino &nbsp; <input type="radio" name="sexo" value="F" id="femi" /></label></td>
                                            </tr>
                                            <tr>
                                                <td width="16%" align="right"><span class="obrigatorio">*</span> Data de&nbsp; Nascimento: &nbsp;</td>
                                                <td colspan="3"><input type="text" name="datanascimento" id="datanascimento" size="7" class="data" /></td>
                                            </tr>
                                            <tr>
                                                <td width="16%" align="right">Telefone: &nbsp;</td>
                                                <td colspan="3"><input type="text" name="telefone" id="telefone" size="10" class="foneDD" /></td>
                                            </tr>
                                        </table>
                                    </fieldset>

                                    <fieldset>
                                        <legend>Endereço</legend>
                                        <table class="grid">
                                            <tr>
                                                <td width="18%" align="right"><span class="obrigatorio">*</span> CEP: &nbsp;</td>
                                                <td colspan="3"><input type="text" name="cep" id="cep" size="10" class="cep" /></td>
                                            </tr>
                                            <tr>
                                                <td width="18%" align="right"><span class="obrigatorio">*</span> Endereço: &nbsp;</td>
                                                <td colspan="3"><input type="text" name="endereco" size="50" /></td>
                                            </tr>
                                            <tr>
                                                <td width="18%" align="right">Complemento: &nbsp;</td>
                                                <td><input type="text" name="complemento" id="complemento" size="10" /></td>
                                                <td width="15%" align="right">Número: &nbsp;</td>
                                                <td><input type="text" name="numero" id="numero" size="5" /></td>
                                            </tr>
                                            <tr>
                                                <td width="18%" align="right"><span class="obrigatorio">*</span> Cidade: &nbsp;</td>
                                                <td width="22%"><input type="text" name="cidade" id="cidade" size="20" /></td>
                                                <td width="15%" align="right"><span class="obrigatorio">*</span> Bairro: &nbsp;</td>
                                                <td width="45%"><input type="text" name="bairro" id="bairro" size="10" /></td>
                                            </tr>
                                            <tr>
                                                <td width="18%" align="right"><span class="obrigatorio">*</span> UF: &nbsp;</td>
                                                <td colspan="3">
                                                    <select name="uf_codigo">
                                                        <option></option>
                                                       <c:forEach items="${lstUF}" var="lstUF">
                                                          <option value="${lstUF.codigo}"> ${lstUF.UF}</option>
                                                        </c:forEach>

                                                    </select>
                                                </td>
                                            </tr>
                                        </table>
                                    </fieldset>

                                    <!--fieldset>
                                        <legend>Dados de Segurança</legend>
                                        <table class="grid">
                                            <tr>
                                                <td width="26%" align="right">Login (email): &nbsp;</td>
                                                <td colspan="3"><input type="text" name="email" size="50" value="email@email.com" disabled="disabled" /></td>
                                            </tr>
                                            <tr>
                                                <td width="26%" align="right"><span class="obrigatorio">*</span> Senha: &nbsp;</td>
                                                <td width="74%"><input type="password" name="senha" size="10" maxlength="8" /> (Max 8 Min 3 caracteres)</td>
                                            </tr>
                                            <tr>
                                                <td width="26%" align="right"><span class="obrigatorio">*</span> Confirme a Senha: &nbsp;</td>
                                                <td width="74%"><input type="password" name="senhaConf" size="10" maxlength="8" /></td>
                                            </tr>
                                        </table>
                                    </fieldset-->

                                    <br />
                                    <br />

                                    <div align="right" style="width:90%;">
                                        <a href="painel.jsp"><img src="/WebMAA/Painel_controle/ong/images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link" /></a>&nbsp;&nbsp;
                                        <img src="/WebMAA/Painel_controle/ong/images/botao/bt_limpar.png" alt="Limpar" title="Limpar" class="seta_link" id="limpar" onmouseover="focoBt('limpar');" onmouseout="bt('limpar');" />&nbsp;&nbsp;
                                        <!--input type="submit"  src="/WebMAA/Painel_controle/ong/images/botao/bt_cadastrar.png" alt="Incluir"  name="Incluir"  title="Incluir" class="seta_link"/-->
                                        
                                            <img src="/WebMAA/Painel_controle/ong/images/botao/bt_cadastrar.png" alt="Cadastrar" title="Cadastrar" class="seta_link" id="cadastrar" onclick="submeterColaborador();"  />
                                        
                                    </div>
                                </form>
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
