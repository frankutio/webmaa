<%@page contentType="text/html" pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



                        	<!-- FOTO DO USUARIO -->
            					<div id="foto">
           	  						<img src="foto/fotoUsr.png" />
            					</div>
            				<!-- FOTO -->

                            <!-- DADOS DO USUARIO -->
            					<div id="dadosUsuario" style="width:370px;">
                                		<h3 class="titulo3">${Processo.colaborador.nome}</h3>
                                        <table class="grid dadosModal" width="100%">

                                        	<tr>
                                            	<td width="24%" align="right">Cod: &nbsp;</td>
                                                <td width="76%"><strong>${Processo.colaborador.codigo}</strong></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Data Nasc: &nbsp;</td>
                                                <td><strong>${Processo.colaborador.dataNascimento}</strong></td>

                                          </tr>
                                            <tr>
                                            	<td align="right">Sexo: &nbsp;</td>
                                                <td><strong>${Processo.colaborador.sexo}</strong></td>
                                          </tr>
                                          <tr>
                                            	<td align="right">Estado: &nbsp;</td>

                                                <td><strong>${Processo.colaborador.uf}</strong></td>
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
                                    <span class="obrigatorio" style="font-size:14px">Mensagem Pessoal enviada por ${Processo.colaborador.nome}.</span>

                                    <br />
                                    <br />


                                    <textarea rows="5" cols="60" readonly="readonly">${Processo.processo.mensagem}</textarea>

                                    <br />
                                    <br />
                                   <span class="escondeFase obrigatorio" id="usrReprovado"><img src="images/botao/alert.png" alt="alerta" title="alerta" /> &nbsp; Usuario Negado. </span>

                                   <br />
                                    <br />
                                    
                                </div>
                            <!-- DETALHES DA PETIÇÃO -->