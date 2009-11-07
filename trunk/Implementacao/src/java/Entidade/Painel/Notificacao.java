package Entidade.Painel;


public class Notificacao {

   private int codigo;
   private int codigoFuncionario;
   private int codigoColaborador;
   private String msg;
   private String remetenteNotificacao;

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

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getRemetenteNotificacao() {
        return remetenteNotificacao;
    }

    public void setRemetenteNotificacao(String remetenteNotificacao) {
        this.remetenteNotificacao = remetenteNotificacao;
    }


}
