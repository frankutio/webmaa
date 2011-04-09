package Entidade.Painel;

import java.util.Date;

public class Processo {

    private int codigo;
    private int faseProcessoCodigo;
    private int animaisCodigo;
    private int colaboradorCodigo;
    private Date dataProcesso;
    private Date dataCadastro;
    private String codigoStatus;
    private String avaliacao;
    private String descricaoAvaliacao;
    private String notaAvaliacao;
    private String mensagem;

    public String getMensagem() {
        return mensagem;
    }

    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }

    public int getAnimaisCodigo() {
        return animaisCodigo;
    }

    public void setAnimaisCodigo(int AnimaisCodigo) {
        this.animaisCodigo = AnimaisCodigo;
    }

    public int getColaboradorCodigo() {
        return colaboradorCodigo;
    }

    public void setColaboradorCodigo(int ColaboradorCodigo) {
        this.colaboradorCodigo = ColaboradorCodigo;
    }

    public int getFaseProcessoCodigo() {
        return faseProcessoCodigo;
    }

    public void setFaseProcessoCodigo(int FaseProcessoCodigo) {
        this.faseProcessoCodigo = FaseProcessoCodigo;
    }

    public String getAvaliacao() {
        return avaliacao;
    }

    public void setAvaliacao(String avaliacao) {
        this.avaliacao = avaliacao;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getCodigoStatus() {
        return codigoStatus;
    }

    public void setCodigoStatus(String codigoStatus) {
        this.codigoStatus = codigoStatus;
    }

    public Date getDataCadastro() {
        return dataCadastro;
    }

    public void setDataCadastro(Date dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

    public Date getDataProcesso() {
        return dataProcesso;
    }

    public void setDataProcesso(Date dataProcesso) {
        this.dataProcesso = dataProcesso;
    }

    public String getDescricaoAvaliacao() {
        return descricaoAvaliacao;
    }

    public void setDescricaoAvaliacao(String descricaoAvaliacao) {
        this.descricaoAvaliacao = descricaoAvaliacao;
    }

    public String getNotaAvaliacao() {
        return notaAvaliacao;
    }

    public void setNotaAvaliacao(String notaAvaliacao) {
        this.notaAvaliacao = notaAvaliacao;
    }

    


}
