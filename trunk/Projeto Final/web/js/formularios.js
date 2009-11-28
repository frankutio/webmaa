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

});