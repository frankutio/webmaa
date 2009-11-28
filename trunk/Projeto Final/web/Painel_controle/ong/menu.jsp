



<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<ul>
     <%
     if(session.getAttribute("cargoFuncionario").equals("Diretor")) {
    %>
        <li onmouseover="setaClass('func');" onmouseout="retiraClass('func');"><a href="#" id="func" class="">Funcionarios</a>
            <ul>
                <li><a href="/WebMAA/ControleFuncionarioServlet?operacao=FuncionarioNovo">Novo Funcionario</a></li>
                <li><a href="/WebMAA/ControleFuncionarioServlet?operacao=FuncionarioLista">Listar Funcionario</a></li>
            </ul>
        </li>
        <%
     }
    %>
   
    <li onmouseover="setaClass('animais');" onmouseout="retiraClass('animais');"><a href="#" id="animais" class="">Animais</a>
        <ul>
            <li><a href="/WebMAA/ControleAnimaisServlet?operacao=AnimaisNovo">Novo Animal</a></li>
            <li><a href="/WebMAA/ControleAnimaisServlet?operacao=AnimaisPesquisar">Pesquisar Animais</a></li>
            <li><a href="/WebMAA/ControleAnimaisServlet?operacao=AnimaisRelatorio">Relatório</a></li>
        </ul>
    </li>
    <li onmouseover="setaClass('colaborador');" onmouseout="retiraClass('colaborador');"><a href="#" id="colaborador" class="">Colaboradores</a>
        <ul>
            <li><a href="/WebMAA/ControleColaboradorServlet?operacao=ColaboradorNovo">Novo Colaborador</a></li>
            <li><a href="/WebMAA/ControleColaboradorServlet?operacao=ColaboradorLista">Listar Colaborador</a></li>
        </ul>
    </li>
    <li onmouseover="setaClass('gerenciar');" onmouseout="retiraClass('gerenciar');"><a href="#" id="gerenciar" class="">Gerenciar</a>
     <ul>
            <li><a href="/WebMAA/ControleAnimaisServlet?operacao=AdocoesPesquisar">Adoções</a></li>
            <li><a href="/WebMAA/ControleAnimaisServlet?operacao=DoacoesPesquisar">Doações</a></li>
            <li><a href="/WebMAA/ControleRacaServlet?operacao=RacaLista">Raças</a></li>
            <li><a href="/WebMAA/ControleFormaEnvioServlet?operacao=FormaEnvioLista">Forma de Envio</a></li>
            <li><a href="/WebMAA/ControlePelagemServlet?operacao=PelagemLista">Pelagem</a></li>
            <li><a href="/WebMAA/ControlePorteServlet?operacao=PorteLista">Portes</a></li>
            <li><a href="/WebMAA/ControleCorServlet?operacao=CorLista">Cor do Animal</a></li>
            <li><a href="/WebMAA/ControleUFServlet?operacao=UFLista">Unidade Federação</a></li>
            <li><a href="/WebMAA/ControleFaseProcessoServlet?operacao=FaseProcessoLista">Fase Processo</a></li>
        </ul>
    </li>
</ul>
