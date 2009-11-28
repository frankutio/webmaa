package Entidade.Portal;

import java.util.Date;
import java.text.SimpleDateFormat;


public class Notificacao {

   private int codigo;
   private int codigoFuncionario;
   private int codigoColaborador;
   private String assunto;
   private String remetenteNotificacao;
   private Date dataCadastro;
   private String dataCadastroString;
   private String mensagem;
   private String mensagemPessoal;

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public int getCodigoColaborador() {
        return codigoColaborador;
    }

    public void setCodigoColaborador(int codigoColaborador) {
        this.codigoColaborador = codigoColaborador;
    }

    public int getCodigoFuncionario() {
        return codigoFuncionario;
    }

    public void setCodigoFuncionario(int codigoFuncionario) {
        this.codigoFuncionario = codigoFuncionario;
    }

    public String getAssunto() {
        return assunto;
    }

    public void setAssunto(String assunto) {
        this.assunto = assunto;
    }

    public String getRemetenteNotificacao() {
        return remetenteNotificacao;
    }

    public void setRemetenteNotificacao(String remetenteNotificacao) {
        this.remetenteNotificacao = remetenteNotificacao;
    }

    /**
     * @return the dataCadastro
     */
    public Date getDataCadastro() {
        return dataCadastro;
    }

     public String getDataCadastroString() {
        return new SimpleDateFormat("dd/MM/yyyy").format(dataCadastro);
    }

    /**
     * @param dataCadastro the dataCadastro to set
     */
    public void setDataCadastro(Date dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

    /**
     * @return the mensagem
     */
    public String getMensagem() {
        return mensagem;
    }

    /**
     * @param mensagem the mensagem to set
     */
    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }

    /**
     * @return the mensagemPessoal
     */
    public String getMensagemPessoal() {
        return mensagemPessoal;
    }

    /**
     * @param mensagemPessoal the mensagemPessoal to set
     */
    public void setMensagemPessoal(String mensagemPessoal) {
        if(mensagemPessoal == ""){
            this.mensagemPessoal = "Sem Mensagem Pessoal Enviada!";
        }
        else if(mensagemPessoal == null){
            this.mensagemPessoal = "Sem Mensagem Pessoal Enviada!";
        }

        else {
            this.mensagemPessoal = mensagemPessoal;
        }
        
    }

}
