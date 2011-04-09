package Entidade.Painel;

import Persistencia.Painel.FormaEnvioDAO;

public class FormaEnvio {

    public static final int INCLUSAO = 1;
    public static final int ALTERACAO = 2;
    private int codigo;
    private String descricao;

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setdescricao(String descricao) {
        this.descricao = descricao;
    }

       public String validaDados(int tipoDeValidacao) {

        String msgErro = "";

       /* if (getCodigo() == 0 && tipoDeValidacao != INCLUSAO ) {
            msgErro += "Codigo deve ser informado!!!<br />";
        } else {
            FormaEnvio formaEnvio = FormaEnvioDAO.getInstance().le(getCodigo());
            if (formaEnvio == null) {
                if (tipoDeValidacao == ALTERACAO) {
                    msgErro += "Codigo do empregado nao cadastrado!!!<br />";
                }
            } else {
                if (tipoDeValidacao == INCLUSAO) {
                    msgErro += "Codigo do empregado ja cadastrado!!!<br />";
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
