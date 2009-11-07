package Entidade.Painel;

public class Processo {

    private int codigo;
    private int codigoColaborador;
    private int codigoAnimal;
    private int codigoTipoProcesso;
    private int codigoFormaEnvio;
    private String nomeProcesso;
    private String dataProcesso;
    private String dataCadastro;
    private boolean status;

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public int getCodigoAnimal() {
        return codigoAnimal;
    }

    public void setCodigoAnimal(int codigoAnimal) {
        this.codigoAnimal = codigoAnimal;
    }

    public int getCodigoColaborador() {
        return codigoColaborador;
    }

    public void setCodigoColaborador(int codigoColaborador) {
        this.codigoColaborador = codigoColaborador;
    }

    public int getCodigoFormaEnvio() {
        return codigoFormaEnvio;
    }

    public void setCodigoFormaEnvio(int codigoFormaEnvio) {
        this.codigoFormaEnvio = codigoFormaEnvio;
    }

    public int getCodigoTipoProcesso() {
        return codigoTipoProcesso;
    }

    public void setCodigoTipoProcesso(int codigoTipoProcesso) {
        this.codigoTipoProcesso = codigoTipoProcesso;
    }

    public String getDataCadastro() {
        return dataCadastro;
    }

    public void setDataCadastro(String dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

    public String getDataProcesso() {
        return dataProcesso;
    }

    public void setDataProcesso(String dataProcesso) {
        this.dataProcesso = dataProcesso;
    }

    public String getNomeProcesso() {
        return nomeProcesso;
    }

    public void setNomeProcesso(String nomeProcesso) {
        this.nomeProcesso = nomeProcesso;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }



}
