package Entidade.Portal;

import java.util.Date;

public class Animais {

    public static final int INCLUSAO = 1;
    public static final int ALTERACAO = 2;
    private int codigo;
    private Date dataCadastro;
    private String nome;
    private String especie;
    private String sexo;
    private int idade;
    private int codigoRaca;
    private int codigoPelagem;
    private int porte;
    private int cor1;
    private int cor2;
    private String endFoto;
    private String descricao;
    private String disponibilidade;
    private String vacinado;
    private String descricaoVacina;
    private String laudoVeterinario;
    private String certificado;
    private String localAnimal;
    private int uf;
    private String castrado;
    private Double  vlrTaxa;
    private int codigoFormaEnvio;
    private int codigoUsuario;
    private int codigoFuncionario;


     public String validaDados(int tipoDeValidacao) {

        String msgErro = "";

        if(tipoDeValidacao == INCLUSAO){

            if(getEspecie() == null || getEspecie().equals("")){
                msgErro +="Informe a especie.<br />";
            }
            if(getNome() == null || getNome().equals("")){
                msgErro +="Informe o nome.<br />";
            }
            if(getSexo() == null || getSexo().equals("")){
                msgErro +="Informe o Sexo <br />";
            }
            if(getLaudoVeterinario() == null || getLaudoVeterinario().equals("")){

                this.laudoVeterinario = null;
            }
            if(getVacinado() == null || getVacinado().equals("")){

                this.vacinado = null;
            }

            if(getDescricao() == null || getDescricao().equals("")){

                this.descricao = "Sem Descrição do Animal.";
            }
            if(getDescricaoVacina() == null || getDescricaoVacina().equals("")){

                this.descricaoVacina = "N/A";
            }

        }

        return msgErro;
     }

    public int getCodigoUsuario() {
        return codigoUsuario;
    }

    public void setCodigoUsuario(int codigoUsuario) {
        this.codigoUsuario = codigoUsuario;
    } 

    public int getCodigoFormaEnvio() {
        return codigoFormaEnvio;
    }

    public void setCodigoFormaEnvio(int codigoFormaEnvio) {
        this.codigoFormaEnvio = codigoFormaEnvio;
    }


    public String getCastrado() {
        return castrado;
    }

    public void setCastrado(String castrado) {
        this.castrado = castrado;
    }

    public String getCertificado() {
        return certificado;
    }

    public void setCertificado(String certificado) {
        this.certificado = certificado;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public int getCodigoPelagem() {
        return codigoPelagem;
    }

    public void setCodigoPelagem(int codigoPelagem) {
        this.codigoPelagem = codigoPelagem;
    }

    public int getCodigoRaca() {
        return codigoRaca;
    }

    public void setCodigoRaca(int codigoRaca) {
        this.codigoRaca = codigoRaca;
    }

    public int getCor1() {
        return cor1;
    }

    public void setCor1(int cor1) {
        this.cor1 = cor1;
    }

    public int getCor2() {
        return cor2;
    }

    public void setCor2(int cor2) {
        this.cor2 = cor2;
    }

    public Date getDataCadastro() {
        return dataCadastro;
    }

    public void setDataCadastro(Date dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setdescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getDescricaoVacina() {
        return descricaoVacina;
    }

    public void setdescricaoVacina(String descricaoVacina) {
        this.descricaoVacina = descricaoVacina;
    }

    public String getDisponibilidade() {
        return disponibilidade;
    }

    public void setDisponibilidade(String disponibilidade) {
        this.disponibilidade = disponibilidade;
    }

    public String getEndFoto() {
        return endFoto;
    }

    public void setEndFoto(String endFoto) {
        this.endFoto = endFoto;
    }

    public String getEspecie() {
        return especie;
    }

    public void setEspecie(String especie) {
        this.especie = especie;
    }

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }

    public String getLaudoVeterinario() {
        return laudoVeterinario;
    }

    public void setLaudoVeterinario(String laudoVeterinario) {
        this.laudoVeterinario = laudoVeterinario;
    }

    public String getLocalAnimal() {
        return localAnimal;
    }

    public void setLocalAnimal(String localAnimal) {
        this.localAnimal = localAnimal;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getPorte() {
        return porte;
    }

    public void setPorte(int porte) {
        this.porte = porte;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public int getUf() {
        return uf;
    }

    public void setUf(int uf) {
        this.uf = uf;
    }

    public String getVacinado() {
        return vacinado;
    }

    public void setVacinado(String vacinado) {
        this.vacinado = vacinado;
    }

    public Double getVlrTaxa() {
        return vlrTaxa;
    }

    public void setVlrTaxa(Double  vlrTaxa) {
        this.vlrTaxa = vlrTaxa;
    }
    
    /**
     * @return the codigoFuncionario
     */
    public int getCodigoFuncionario() {
        return codigoFuncionario;
    }

    /**
     * @param codigoFuncionario the codigoFuncionario to set
     */
    public void setCodigoFuncionario(int codigoFuncionario) {
        this.codigoFuncionario = codigoFuncionario;
    }

}

