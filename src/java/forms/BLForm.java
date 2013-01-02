/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package forms;

import java.sql.Date;
import org.apache.struts.action.ActionForm;

/**
 *
 * @author Mario
 */
public class BLForm extends ActionForm {

    private int idBLs;
    private String BL;
    private String cliente;
    private String motonave;
    private String etaFecha;
    private String etaHora;
    private String lote;
    private String FMM;
    private Integer idUsu;
    private Integer idVines;
    private String Vin;
    private String Referencia;
    private String Codigo;
    private String Factura;
    private String Descripcion;
    private Float ValorFob;
    private Integer Color;
    private Boolean Huerfano;
    private Boolean Despachado;
    private String Pedido;
    private String FMMI;
    private String FMMS;
    private String op;
    private String op2;

    public String getBL() {
        return BL;
    }

    public void setBL(String BL) {
        this.BL = BL;
    }

    public String getFMM() {
        return FMM;
    }

    public void setFMM(String FMM) {
        this.FMM = FMM;
    }

    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public String getEtaFecha() {
        return etaFecha;
    }

    public void setEtaFecha(String etaFecha) {
        this.etaFecha = etaFecha;
    }

    public String getEtaHora() {
        return etaHora;
    }

    public void setEtaHora(String etaHora) {
        this.etaHora = etaHora;
    }

    public int getIdBLs() {
        return idBLs;
    }

    public void setIdBLs(int idBLs) {
        this.idBLs = idBLs;
    }

    public Integer getIdUsu() {
        return idUsu;
    }

    public void setIdUsu(Integer idUsu) {
        this.idUsu = idUsu;
    }

    public String getLote() {
        return lote;
    }

    public void setLote(String lote) {
        this.lote = lote;
    }

    public String getMotonave() {
        return motonave;
    }

    public void setMotonave(String motonave) {
        this.motonave = motonave;
    }

    public String getOp() {
        return op;
    }

    public void setOp(String op) {
        this.op = op;
    }

    public String getOp2() {
        return op2;
    }

    public void setOp2(String op2) {
        this.op2 = op2;
    }

    public String getCodigo() {
        return Codigo;
    }

    public void setCodigo(String Codigo) {
        this.Codigo = Codigo;
    }

    public Integer getColor() {
        return Color;
    }

    public void setColor(Integer Color) {
        this.Color = Color;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public Boolean getDespachado() {
        return Despachado;
    }

    public void setDespachado(Boolean Despachado) {
        this.Despachado = Despachado;
    }

    public String getFMMI() {
        return FMMI;
    }

    public void setFMMI(String FMMI) {
        this.FMMI = FMMI;
    }

    public String getFMMS() {
        return FMMS;
    }

    public void setFMMS(String FMMS) {
        this.FMMS = FMMS;
    }

    public String getFactura() {
        return Factura;
    }

    public void setFactura(String Factura) {
        this.Factura = Factura;
    }

    public Boolean getHuerfano() {
        return Huerfano;
    }

    public void setHuerfano(Boolean Huerfano) {
        this.Huerfano = Huerfano;
    }

    public String getReferencia() {
        return Referencia;
    }

    public void setReferencia(String Referencia) {
        this.Referencia = Referencia;
    }

    public Float getValorFob() {
        return ValorFob;
    }

    public void setValorFob(Float ValorFob) {
        this.ValorFob = ValorFob;
    }

    public String getVin() {
        return Vin;
    }

    public void setVin(String Vin) {
        this.Vin = Vin;
    }

    public String getPedido() {
        return Pedido;
    }

    public void setPedido(String Pedido) {
        this.Pedido = Pedido;
    }

    public Integer getIdVines() {
        return idVines;
    }

    public void setIdVines(Integer idVines) {
        this.idVines = idVines;
    }
}
