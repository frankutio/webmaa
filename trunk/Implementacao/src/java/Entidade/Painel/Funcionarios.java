package Entidade.Painel;

import java.util.Date;
import java.text.SimpleDateFormat;

public class Funcionarios {

    public static final int INCLUSAO = 1;
    public static final int ALTERACAO = 2;
    public static final int LOGAR = 3;
    private int codigo;
    private Date dataAdmissao;
    private Date dataCadastro;
    private String nome;
    private String rg;
    private String cpf;
    private Date dataNascimento;
    private String email;
    private boolean  sexo;
    private String telefone;
    private String senha;
    private String cep;
    private String endereco;
    private String cidade;
    private String bairro;
    private String complemento;
    private boolean cargo;
    private int uf;

    /**
     * @return the cod
     */
    public int getCodigo() {
        return codigo;
    }

    /**
     * @return the dataAdmissao
     */
    public Date getDataAdmissao() {
        return dataAdmissao;
    }
     public String getDataAdmissaoString() {
        return (new SimpleDateFormat("dd/MM/yyyy")).format(dataAdmissao);
    }
    /**
     * @return the dataCadastro
     */
    public Date getDataCadastro() {

        Date dataCadastro = new Date();
        return   dataCadastro;
    }
    public String getDataCadastroString() {
        return (new SimpleDateFormat("dd/MM/yyyy")).format(dataCadastro);
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
     * @return the dataNascimento
     */
    public Date getDataNascimento() {
        return dataNascimento;
    }
    public String getDataNascimentoString() {
        return (new SimpleDateFormat("dd/MM/yyyy")).format(dataNascimento);
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
    public boolean getSexo() {
        return sexo;
    }
    /**
     * @return the telefone
     */
    public String getTelefone() {
        return telefone;
    }

    /**
     * @return the senha
     */
    public String getSenha() {
        return senha;
    }

    /**
     * @return the cep
     */
    public String getCep() {
        return cep;
    }

    /**
     * @return the endereco
     */
    public String getEndereco() {
        return endereco;
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
     * @return the complemento
     */
    public String getComplemento() {
        return complemento;
    }

    /**
     * @return the cargo
     */
    public boolean getCargo() {
        return cargo;
    }

     /**
     * @return the uf
     */
    public int getUf() {
        return uf;
    }

    /**
     * @param cod the cod to set
     */
    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    /**
     * @param dataAdmissao the dataAdmissao to set
     */
    public void setDataAdmissao(Date dataAdmissao) {
        this.dataAdmissao = dataAdmissao;

    }

    /**
     * @param dataCadastro the dataCadastro to set
     */
    public void setDataCadastro(Date dataCadastro) {
        this.dataCadastro = dataCadastro;
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
     * @param dataNascimento the dataNascimento to set
     */
    public void setDataNascimento(Date dataNascimento) {
        this.dataNascimento = dataNascimento;
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
    public void setSexo(boolean sexo) {
        this.sexo = sexo;
    }
    /**
     * @param telefone the telefone to set
     */
    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    /**
     * @param senha the senha to set
     */
    public void setSenha(String senha) {
        this.senha = senha;
    }

    /**
     * @param cep the cep to set
     */
    public void setCep(String cep) {
        this.cep = cep;
    }

    /**
     * @param endereco the endereco to set
     */
    public void setEndereco(String endereco) {
        this.endereco = endereco;
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
     * @param complemento the complemento to set
     */
    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    /**
     * @param cargo the cargo to set
     */
    public void setCargo(boolean cargo) {
        this.cargo = cargo;
    }

    /**
     * @param uf the uf to set
     */
    public void setUf(int uf) {
        this.uf = uf;
    }
     public String validaDados(int tipoDeValidacao) {

        String msgErro = "";

        if(getEmail().equals("") && tipoDeValidacao == LOGAR )
        {
            msgErro += "Ops!Digite seu email...<br />";
        }
        if (getCpf().equals("") && tipoDeValidacao == LOGAR ) {
            msgErro += "Ops! Digite seu CPF para logar...<br />";
        }
        

        return msgErro;

    }

}
