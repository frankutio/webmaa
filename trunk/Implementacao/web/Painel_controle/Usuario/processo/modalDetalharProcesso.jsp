<%@page contentType="text/html" pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



                        	<!-- FOTO DO USUARIO -->
            					<div id="foto">
           	  						<img src="/WebMAATeste/Painel_controle/Usuario/foto/${Processo.colaborador.endFoto}" />
            					</div>
            				<!-- FOTO -->

                            <!-- DADOS DO USUARIO -->
            					<div id="dadosUsuario" style="width:370px;">
                                		<h3 class="titulo3">${Processo.colaborador.nome}</h3>
                                        <table class="grid dadosModal" width="100%">

                                        	<tr>
                                            	<td width="27%" align="right">Cod: &nbsp;</td>
                                                <td width="73%"><strong>${Processo.colaborador.codigo}</strong></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Data Nasc: &nbsp;</td>
                                                <td><strong>${Processo.colaborador.dataNascimentoString}</strong></td>
                                          </tr>
                                            <tr>
                                            	<td align="right">Sexo: &nbsp;</td>
                                                <td>
                                                    <c:if test="${Processo.colaborador.sexo == 'M'}">
                                                        <strong>Masculino</strong>
                                                    </c:if>
                                                    <c:if test="${Processo.colaborador.sexo == 'F'}">
                                                        <strong>Feminino</strong>
                                                    </c:if>
                                               </td>
                                          </tr>
                                          <tr>
                                            	<td align="right">Estado: &nbsp;</td>
                                                <td>
                                                    <c:forEach items="${lstUF}" var="uf">
                                                        <c:if test="${uf.codigo == Processo.colaborador.uf}">
                                                            <strong>${uf.UF}</strong>
                                                        </c:if>
                                                    </c:forEach>
                                              </td>
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
                                    	${Processo.colaborador.nome}, demonstrou enteresse em seu animal. <br />

                                    </p>
                                    <br />
                                    <span class="obrigatorio" style="font-size:14px">Mensagem Pessoal enviada por ${Processo.colaborador.nome}.</span>

                                    <br />
                                    <br />


                                    <textarea rows="5" cols="60" readonly="readonly">${Processo.processo.mensagem}</textarea>

                                    <br />
                                    

                                   <br />
                                    <br />
                                    
                                </div>
                            <!-- DETALHES DA PETIÇÃO -->