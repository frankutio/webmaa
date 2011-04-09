

<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!-- BARRA DE CESSAO DO USUARIO -->
                    <div id="topo_painel_left">

                        <div id="ferramenta_esquerda">
                            <table class="grid" style="width:100%; font-size:14px;">
                                <tr>
                                    <%
                                        if(session.getAttribute("login") != null) {
                                    %>
                                    <td height="28" colspan="2"> <% out.print(session.getAttribute("login")); %></td>
                                    <%
                                        } else {
                                    %>
                                        <jsp:forward page="/WebMAA/admin/"></jsp:forward>
                                    <%
                                    }
                                    %>
                                </tr>
                                <tr>
                                    <td colspan="2"></td>
                                </tr>
                                <tr>
                                    <td width="53%">&nbsp;</td>
                                    <td width="47%"><img src="/WebMAA/Painel_controle/ong/images/botao/bt_logoff.png" id="logoff" alt="Sair" title="Sair" class="seta_link" onclick="window.location='/WebMAA/admin/';" /></td>
                                </tr>
                            </table>
                        </div>

                    </div>
                    <!-- BARRA DE CESSAO DO USUARIO -->

    <!-- BARRA DE FERRAMENTAS -->
                    <div id="topo_painel_cont">

                        <div id="ferramenta_direita">
                            <table width="90%" class="grid" style="width:70%; font-size:11px; color: #000;">
                                <tr>
                                    <td width="24%" height="49">
                                    </td>
                                    &nbsp
                                    <td width="19%"><div align="center">
                                            <img src="/WebMAA/Painel_controle/ong/images/botao/relatorio.png" /><br />
                                            <a href="/WebMAA/ControleAnimaisServlet?operacao=AnimaisRelatorio">Relatório</a>
                                        </div>
                                    </td>
                                    <td width="28%"><div align="center">
                                            <img src="/WebMAA/Painel_controle/ong/images/botao/user_add.png" /><br />
                                            <a href="/WebMAA/ControleAnimaisServlet?operacao=AnimaisNovo">Cadastrar Animal</a>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>

                    </div>
                    <!-- BARRA DE FERRAMENTAS -->

                    <div class="clear"></div>