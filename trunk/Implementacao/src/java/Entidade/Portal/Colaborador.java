package Entidade.Portal;

import java.util.Date;
import java.text.SimpleDateFormat;

public class Colaborador {

    public static final int INCLUSAO = 1;
    public static final int ALTERACAO = 2;
    private int codigo;
    private String nome;
    private String rg;
    private String cpf;
    private String email;
    private String sexo;
    private Date dataNascimento;
    private String senha;
    private String endereco;
    private String cep;
    private int uf;
    private String complemento;
    private int numero;
    private String cidade;
    private String bairro;
    private Date dataCadastro;
    private String telefone;
    private String celular;
    private String endFoto;
    private String termoAceito;
    private String protocolo;
    private String validacao;
    private int login;
    private int valLog;
    private String dataNascimentoString;

    /**
     * @return the cod
     */
    public int getCodigo() {
        return codigo;
    }

    /**
     * @return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @return the rg
     */
    public String getRg() {
        return rg;
    }

    /**
     * @return the cpf
     */
    public String getCpf() {
        return cpf;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @return the sexo
     */
    public String getSexo() {
        return sexo;
    }

    /**
     * @return the dataNascimento
     */
    public Date getDataNascimento() {
        return dataNascimento;
    }

    public String getDataNascimentoString() {
        return new SimpleDateFormat("dd/MM/yyyy").format(dataNascimento);
    }

    /**
     * @return the senha
     */
    public String getSenha() {
        return senha;
    }

    /**
     * @return the endereco
     */
    public String getEndereco() {
        return endereco;
    }

    /**
     * @return the cep
     */
    public String getCep() {
        return cep;
    }

    /**
     * @return the complemento
     */
    public String getComplemento() {
        return complemento;
    }

    /**
     * @return the numero
     */
    public int getNumero() {
        return numero;
    }

    /**
     * @return the cidade
     */
    public String getCidade() {
        return cidade;
    }

    /**
     * @return the bairro
     */
    public String getBairro() {
        return bairro;
    }

    /**
     * @return the dataCadastro
     */
    public Date getDataCadastro() {

        Date dataCadastro = new Date();
        return dataCadastro;
    }

    public String getDataCadastroString() {
        return (new SimpleDateFormat("dd/MM/yyyy")).format(dataCadastro);
    }

    /**
     * @return the telefone
     */
    public String getTelefone() {
        return telefone;
    }

    /**
     * @return the celular
     */
    public String getCelular() {
        return celular;
    }

    /**
     * @return the endFoto
     */
    public String getEndFoto() {
        return endFoto;
    }

    /**
     * @param cod the cod to set
     */
    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * @param rg the rg to set
     */
    public void setRg(String rg) {
        this.rg = rg;
    }

    /**
     * @param cpf the cpf to set
     */
    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @param sexo the sexo to set
     */
    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    /**
     * @param dataNascimento the dataNascimento to set
     */
    public void setDataNascimento(Date dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    /**
     * @param senha the senha to set
     */
    public void setSenha(String senha) {
        this.senha = senha;
    }

    /**
     * @param endereco the endereco to set
     */
    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    /**
     * @param cep the cep to set
     */
    public void setCep(String cep) {
        this.cep = cep;
    }

    /**
     * @param complemento the complemento to set
     */
    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    /**
     * @param numero the numero to set
     */
    public void setNumero(int numero) {
        this.numero = numero;
    }

    /**
     * @param cidade the cidade to set
     */
    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    /**
     * @param bairro the bairro to set
     */
    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    /**
     * @param datacadastro the datacadastro to set
     */
    public void setDatacadastro(Date datacadastro) {
        this.dataCadastro = datacadastro;
    }

    /**
     * @param telefone the telefone to set
     */
    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    /**
     * @param celular the celular to set
     */
    public void setCelular(String celular) {
        this.celular = celular;
    }

    /**
     * @param endFoto the endFoto to set
     */
    public void setEndFoto(String endFoto) {
        this.endFoto = endFoto;
    }

    /**
     * @return the uf
     */
    public int getUf() {
        return uf;
    }

    /**
     * @param uf the uf to set
     */
    public void setUf(int uf) {
        this.uf = uf;
    }

    public String validaDados(int tipoDeValidacao) {

        String msgErro = "";


        return msgErro;

    }

    /**
     * @return the descricaoTermoAceito
     */
    public String getTermoAceito() {
        return termoAceito;
    }

    /**
     * @param descricaoTermoAceito the descricaoTermoAceito to set
     */
    public void setTermoAceito(String termoAceito) {
        this.termoAceito = termoAceito;
    }

    /**
     * @return the protocolo
     */
    public String getProtocolo() {
        return protocolo;
    }

    /**
     * @param protocolo the protocolo to set
     */
    public void setProtocolo(String protocolo) {
        this.protocolo = protocolo;
    }

    /**
     * @param status the status to set
     */
    /**
     * @return the status
     */
    /**
     * @return the login
     */
    public int getLogin() {
        return login;
    }

    /**
     * @param login the login to set
     */
    public void setLogin(int login) {
        this.login = login;
    }

    /**
     * @return the valLog
     */
    public int getValLog() {
        return valLog;
    }

    /**
     * @return the validacao
     */
    public String getValidacao() {
        return validacao;
    }

    /**
     * @param validacao the validacao to set
     */
    public void setValidacao(String validacao) {
        this.validacao = validacao;
    }
}
