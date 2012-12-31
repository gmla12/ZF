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
public class BLForm extends ActionForm{
    private int idBLs;
    private String BL;
    private String cliente;
    private String motonave;
    private String etaFecha;
    private String etaHora;
    private String lote;
    private String FMM;
    private Integer idUsu;
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

}
