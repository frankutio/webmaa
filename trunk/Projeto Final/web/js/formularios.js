// JavaScript Document
$(document).ready( function() {

$("#termoAceite").validate({

// Define as regras

rules:{

termoAceito:{
		required: true
	}
},

messages:{
	
	termoAceito:{
		required: "Você deve aceitar o termo para realizar o seu cadastro."
	}

}

});

$("#cadastroColab").validate({

// Define as regras

rules:{

nome:{
		required: true
		
	}
},

messages:{
	
	nome:{
		required: "Digite o seu Nome."
		
	}

}

});

////// Validação do Email /////

$("#FormContato").validate({

// Define as regras

rules:{

nome:{required: true},
email:{required: true,  email: true},
mensagem:{required: true}

},

messages:{

nome:{required: "  Digite o seu Nome."},
email:{required: "  Digite o seu e-mail para contato", email: "  Digite um e-mail v&aacute;lido"},
mensagem:{required:"  Descreva uma Mensagem"}

}

});

});