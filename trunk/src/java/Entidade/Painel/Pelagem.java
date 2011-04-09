
package Entidade.Painel;

public class Pelagem {

    public static final int INCLUSAO = 1;
    public static final int ALTERACAO = 2;
    private int codigo;
    private String descricao;

    /**
     * @return the codigo
     */
    public int getCodigo() {
        return codigo;
    }

    /**
     * @return the descricao
     */
    public String getDescricao() {
        return descricao;
    }

    /**
     * @param codigo the codigo to set
     */
    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    /**
     * @param descricao the descricao to set
     */
    public void setDescricao(String descricao) {
        this.descricao = descricao;
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
