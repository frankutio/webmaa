/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Entidade.Painel;

/**
 *
 * @author usuario
 */
public class UF {

    public static final int INCLUSAO = 1;
    public static final int ALTERACAO = 2;
    private int codigo;
    private String UF;

    /**
     * @return the codigo
     */
    public int getCodigo() {
        return codigo;
    }

    /**
     * @return the descricao
     */
    public String getUF() {
        return UF;
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
    public void setUF(String UF) {
        this.UF = UF;
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
