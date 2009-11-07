
package Entidade.Painel;

public class Raca {

    public static final int INCLUSAO = 1;
    public static final int ALTERACAO = 2;
    private int codigo;
    private String descricao;

    public boolean isEspecie() {
        return especie;
    }

    public void setEspecie(boolean especie) {
        this.especie = especie;
    }
    private boolean  especie;

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
     * @param cod the cod to set
     */
    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    /**
     * @param nome the nome to set
     */
    public void setDescricao(String descricao) {
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
