// JavaScript Document

function validaCampoColab(cadastrar){
	
if(!validaIdade(cadastrar.idade.value)) return false;
if(!validaNumero(cadastrar.numero.value)) return false;
if(!validaUf(cadastrar.uf.value)) return false;
}

function validaIdade(idade){
 if(idade == ""){	
   contAba('inicio','cadInicio');
   $("#idadeErro").html("<font style='color:red;'>Informe a Idade</font>");
   return false;   
   }
   return true;
}

function validaNumero(numero){
 if(numero == ""){	
   numero.value="0";
   return true; 
   }
   return false; 
}

function validaUf(uf){
 if(uf == ""){	
   contAba('cadLogradouro','cadL');
   $("#ufErro").html("<font style='color:red;'>Escolha a UF</font>");
   return false;
   }
    return true; 
}