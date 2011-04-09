

<%@page contentType="text/html" pageEncoding="ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Ong Amigos Fieis</title>

        <link type="text/css" rel="stylesheet" href="css/geral.css" />
        <link type="text/css" rel="stylesheet" href="css/jquery-ui-datepicker.css" />
        <link type="text/css" rel="stylesheet" href="css/estilos.css" />
        <link type="text/css" rel="stylesheet" href="css/menu_drop.css" />


        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/utilidades.js"></script>
        <script type="text/javascript" src="js/maskedinput.js"></script>
        <script type="text/javascript" src="js/jquery-ui-datepicker.js"></script>
        <script type="text/javascript" src="js/menuSuper.js"></script>

        <script>
            function focoBt(id){
                $("#"+id).attr("src","images/botao/bt_doar_light.png");
            }

            function bt(id){
                $("#"+id).attr("src","images/botao/bt_doar.png");
            }
        </script>
    </head>
    <body>

        <!-- Corpo da pagina -->
        <div id="corpo">
            <!-- div com o topo do site -->

            <div id="faixaTopo">
                <div class="imgBannerLeft"><img src="images/topo1.png" alt="logo" title="Logo" class="seta_link" /></div>
                <div class="imgBannerRight"></div>
            </div>

            <!-- div com o banner -->

            <div id="faixaBanner">
                <div class="imgBannerInfLeft"><img src="images/topo2.png" alt="Logo" title="Logo" class="seta_link" /></div>
                <div class="imgBannerInfRight"></div>
            </div>

            <!-- div Status -->

            <div id="faixaStatus">
                sadsdsfd
            </div>


            <!-- Menu do site Horizontal -->

            <div id="menu">
                <div class="menuDrop">
                    <ul>
                        <li><a href="index.html" onfocus="limpaMenu();"><span>Inicio</span></a></li>
                        <li><a href="#" onfocus="limpaMenu();"><span>Notícias</span></a></li>
                        <li><a href="#" onfocus="limpaMenu();"><span>Denúncias</span></a></li>
                        <li id="adotar" class="" onmouseover="setaClass('adotar');" onmouseout="retiraClass('adotar');"><a href="#" onfocus="ativa('adotar','drop');"><span>Adotar</span></a>
                            <ul class="drop">
                                <li id="gato" class=""><a href="gato/listaGato.html" onfocus="ativaLight('gato');">Gato</a></li>
                                <li id="cao" class=""><a href="cao/listaCao.html" onfocus="ativaLight('cao');">Cachorro</a></li>
                            </ul>
                        </li>
                        <li><a href="#" onfocus="limpaMenu();"><span>Direito Animal</span></a></li>
                        <li><a href="cadastro.html" onfocus="limpaMenu();"><span>Cadastre-se</span></a></li>
                        <li><a href="cadastro/cad_animal.html" onfocus="limpaMenu();"><span>Doar</span></a></li>
                        <li><a href="final_feliz/index.html" onfocus="limpaMenu();"><span>Final Feliz</span></a></li>
                    </ul>
                </div>
            </div>

            <!-- CONTEUDO -->

            <div id="conteudo">

                <span class="imgTopo"></span>
                <div class="imgBase">

                    <!-- CONTEUDO AQUI -->
                    <div id="contIndex">

                        <!-- Colunas -->
                        <div id="colunaLeft">
                            <div class="bordaFaixaLeft"><span>Adotar</span></div>
                            <br />
                            <a href="gato/listaGato.html"><img src="images/img_galeria.png" width="273" height="273" style="border:none;" /></a>

                            <br />
                            <br />

                            <div class="bordaFaixaLeft"><span>Doar</span></div>
                            <br />

                            Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque.
                            <br />
                            <br />

                            <div align="center">
                                <a href="cadastro/cad_animal.html"><img src="images/botao/bt_doar.png" alt="Doar" title="Doar Animal" class="seta_link" id="doar" onmouseover="focoBt('doar');" onmouseout="bt('doar');" /></a>
                            </div>

                        </div>
                        <div id="colunaCenter">
                            <h2 style="color:#090;">Kako, o gatinho abandonado</h2><br />
                            <img src="images/kako_p.jpg" style="float:left; margin-right:5px;" />
                            <p style="color:#000;">
                                Se você souber o início da história do Kako, nos ajude a escrevê-la, porque de seu final fizemos parte.

                                Avise o dono do Kako que encontramos o gato dele... e que só queríamos saber se ele caiu da janela que ele insistiu em não telar porque acha que gato não cai de janela ou se o deixou na rua porque ia viajar e como "gato se vira mesmo"... na volta o pegaria de volta nas ruas. <br />

                                Avise-o também que ele não precisa mais se preocupar em ter com quem deixar seu gatinho porque ele agora está bem cuidado.

                            </p>

                        </div>
                        <div id="colunaRight">

                            <!-- LOGIN -->
                            <div class="login">
                                <div class="bordaFaixaLeft"><span>Login</span></div>
                                <br />

                                <form action="Painel_controle/Usuario/index.html" name="logar" method="post" class="link">
                                    <table class="grid" width="100%">
                                        <tr>
                                            <td>Login <br />
                                            <input type="text" name="login" size="15"  /></td>
                                        </tr>
                                        <tr>
                                            <td>Senha <br />
                                            <input type="password" name="login" size="17" /></td>
                                        </tr>
                                    </table>
                                    <br />
                                    <div align="center">
                                        <input type="image" src="images/botao/check.png" onmouseover="troca('buscaBotao');" onmouseout="volta('buscaBotao');" id="buscaBotao" title="Buscar"  />
                                    </div>
                                    <br />
                                    <a href="recuperar_senha.html" >Esqueceu a Senha?</a>
                                </form>
                            </div>
                            <!-- LOGIN -->

                        </div>
                        <!-- Fim das colunas -->
                        <div class="clear"></div>

                    </div>
                    <!-- FIM DO TEXTO -->

                </div>
                <span class="imgFim"></span>
            </div>

        </div>
        <!-- Fim do corpo -->

<!-- Rodapé -->

        <div id="rodape">
            sdjlarpq
        </div>

    </body>
</html>
