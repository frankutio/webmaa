package Entidade.Portal;

import java.util.Date;

public class Processo {

    private int codigo;
    private int faseProcesso;
    private int codigoAnimal;
    private int codigoColaborador;
    private Date dataProcesso;
    private Date dataCadastro;
    private String status;
    private String avaliacao;
    private String descricaoAvaliacao;
    private String notaAvaliacao;
    private String mensagem;
    private String entregaAnimal;
    private String statusAvaliacao;

    /**
     * @return the codigo
     */
    public int getCodigo() {
        return codigo;
    }

    /**
     * @return the faseProcesso
     */
    public int getFaseProcesso() {
        return faseProcesso;
    }

    /**
     * @return the codigoAnimal
     */
    public int getCodigoAnimal() {
        return codigoAnimal;
    }

    /**
     * @return the codigoColaborador
     */
    public int getCodigoColaborador() {
        return codigoColaborador;
    }

    /**
     * @return the dataProcesso
     */
    public Date getDataProcesso() {
        return dataProcesso;
    }

    /**
     * @return the dataCadastro
     */
    public Date getDataCadastro() {
        return dataCadastro;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @return the avaliacao
     */
    public String getAvaliacao() {
        return avaliacao;
    }

    /**
     * @return the descricaoAvaliacao
     */
    public String getDescricaoAvaliacao() {
        return descricaoAvaliacao;
    }

    /**
     * @return the notaAvaliacao
     */
    public String getNotaAvaliacao() {
        return notaAvaliacao;
    }

    /**
     * @param codigo the codigo to set
     */
    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    /**
     * @param faseProcesso the faseProcesso to set
     */
    public void setFaseProcesso(int faseProcesso) {
        this.faseProcesso = faseProcesso;
    }

    /**
     * @param codigoAnimal the codigoAnimal to set
     */
    public void setCodigoAnimal(int codigoAnimal) {
        this.codigoAnimal = codigoAnimal;
    }

    /**
     * @param codigoColaborador the codigoColaborador to set
     */
    public void setCodigoColaborador(int codigoColaborador) {
        this.codigoColaborador = codigoColaborador;
    }

    /**
     * @param dataProcesso the dataProcesso to set
     */
    public void setDataProcesso(Date dataProcesso) {
        this.dataProcesso = dataProcesso;
    }

    /**
     * @param dataCadastro the dataCadastro to set
     */
    public void setDataCadastro(Date dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * @param avaliacao the avaliacao to set
     */
    public void setAvaliacao(String avaliacao) {
        this.avaliacao = avaliacao;
    }

    /**
     * @param descricaoAvaliacao the descricaoAvaliacao to set
     */
    public void setDescricaoAvaliacao(String descricaoAvaliacao) {
        this.descricaoAvaliacao = descricaoAvaliacao;
    }

    /**
     * @param notaAvaliacao the notaAvaliacao to set
     */
    public void setNotaAvaliacao(String notaAvaliacao) {
        this.notaAvaliacao = notaAvaliacao;
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
     * @return the entregaAnimal
     */
    public String getEntregaAnimal() {
        return entregaAnimal;
    }

    /**
     * @param entregaAnimal the entregaAnimal to set
     */
    public void setEntregaAnimal(String entregaAnimal) {
        this.entregaAnimal = entregaAnimal;
    }

    /**
     * @return the statusAvaliacao
     */
    public String getStatusAvaliacao() {
        return statusAvaliacao;
    }

    /**
     * @param statusAvaliacao the statusAvaliacao to set
     */
    public void setStatusAvaliacao(String statusAvaliacao) {
        this.statusAvaliacao = statusAvaliacao;
    }


}
