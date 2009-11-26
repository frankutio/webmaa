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
   $("#numero").attr("value","0");
    return true;
   }
    return true;
}

function validaUf(uf){
 if(uf == ""){	
   contAba('cadLogradouro','cadL');
   $("#ufErro").html("<font style='color:red;'>Escolha a UF</font>");
   return false;
   }
    return true; 
}

// Validação dos Campos para Animais

function validaCampoAnimal(cadastroAnimal){

if(!validaRaca(cadastroAnimal.raca.value)) return false;
if(!validaIdadeA(cadastroAnimal.idade.value)) return false;
if(!validaCor1(cadastroAnimal.cor1.value)) return false;
if(!validaPelo(cadastroAnimal.pelagem.value)) return false;
if(!validaPorte(cadastroAnimal.porte.value)) return false;
if(!validaEnvio(cadastroAnimal.formaEnvio.value)) return false;

submeter('cadastroAnimal','upFoto');
}

function validaRaca(raca){
  if(raca == ""){
      $("#racaErro").html("<font style='color:red;'>Informe a Raça</font>");
      return false;
  }
  return true;
}
function validaIdadeA(idade){
 if(idade == ""){
   $("#idade").attr("value","0");
    return true;
   }
    return true;
}

function validaCor1(cor1){
 if(cor1 == ""){
  $("#corErro").html("<font style='color:red;'>Informe a Cor</font>");
    return false;
   }
    return true;
}

function validaPelo(pelagem){
 if(pelagem == ""){
  $("#peloErro").html("<font style='color:red;'>Informe a Pelagem</font>");
    return false;
   }
    return true;
}
function validaPorte(porte){
 if(porte == ""){
  $("#porteErro").html("<font style='color:red;'>Informe o Porte</font>");
    return false;
   }
    return true;
}

function validaEnvio(formaEnvio){
 if(formaEnvio == ""){
  $("#envioErro").html("<font style='color:red;'>Escolha a forma de Envio</font>");
    return false;
   }
    return true;
}

function submeter(dados,foto){

   document.dados.submit();
   document.foto.submit();
}
