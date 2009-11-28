package Entidade.Painel;

import java.text.SimpleDateFormat;
import java.util.Date;


public class Notificacao {

   public static final int INCLUSAO = 1;
   public static final int ALTERACAO = 2;
   private int codigo;
   private int codigoFuncionario;
   private int codigoColaborador;
   private String remetenteNotificacao;
   private String descricao;
   private Date datacadastro;
   private String mensagem;
   
   /**
     * @return the dataCadastro
     */
    public Date getDataCadastro() {

        Date dataCadastro = new Date();
        return   dataCadastro;
    }
    public String getDataCadastroString() {
        return (new SimpleDateFormat("dd/MM/yyyy")).format(datacadastro);
    }

    public void setDatacadastro(Date datacadastro) {
        this.datacadastro = datacadastro;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getMensagem() {
        return mensagem;
    }

    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }
   

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

     public String getRemetenteNotificacao() {
        return remetenteNotificacao;
    }

    public void setRemetenteNotificacao(String remetenteNotificacao) {
        this.remetenteNotificacao = remetenteNotificacao;
    }
      public String validaDados(int tipoDeValidacao) {

        String msgErro = "";

       /* if (getCodigoigo() == 0 && tipoDeValidacao != INCLUSAO ) {
            msgErro += "Codigoigo deve ser informado!!!<br />";
        } else {
            FormaEnvio formaEnvio = FormaEnvioDAO.getInstance().le(getCodigoigo());
            if (formaEnvio == null) {
                if (tipoDeValidacao == ALTERACAO) {
                    msgErro += "Codigoigo do empregado nao cadastrado!!!<br />";
                }
            } else {
                if (tipoDeValidacao == INCLUSAO) {
                    msgErro += "Codigoigo do empregado ja cadastrado!!!<br />";
                }
            }
        }

        if (getDescricao() == null || getDescricao().equals("")) {
            msgErro += "A descricao da forma de envio deve ser informado!!!<br />";
        }
        */
        return msgErro;

    }

}
