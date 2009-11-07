$(document).ready(function(){

    preencheEspecie();
	preencheSexo();
	preenchePosse();
	preencheLaudo();
	preencheVacina();
});

function preencheEspecie(){

    var esp = "${Animal.especie}";

    if(esp == "Gato"){

        $("#gato").attr("checked",true);
    }
    else if(esp == "Cao"){

        $("#cao").attr("checked",true);
    }
}

function preencheSexo(){

    var sexo = "${Animal.sexo}";

    if(sexo == "Macho"){

        $("#m").attr("checked",true);
    }
    else if(sexo == "Femea"){

        $("#f").attr("checked",true);
    }
}

function preenchePosse(){

    var posse = "${Animal.disponibilidade}";

    if(posse == "true"){

        $("#posse_sim").attr("selected",true);
    }
    else if(posse == "false"){

        $("#posse_nao").attr("selected",true);
    }
}

function preencheLaudo(){

    var laudo = "${Animal.laudoVeterinario}";

    if(laudo == "true"){

        $("#laudo_sim").attr("selected",true);
    }
    else if(laudo == "false"){

        $("#laudo_nao").attr("selected",true);
    }
}

function preencheVacina(){

    var vacina = "${Animal.vacinado}";

    if(vacina == "true"){

        $("#vacina_sim").attr("selected",true);
		$("#doses_usr").show();
    }
    else if(vacina == "false"){

        $("#vacina_nao").attr("selected",true);
    }
}