/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package forms.bean;

import java.io.Serializable;

/**
 *
 * @author mario
 */
public class BeanBL implements Serializable{

    private Object idBLs;
    private Object BL;
    private Object cliente;
    private Object motonave;
    private Object etaFecha;
    private Object etaHora;
    private Object lote;
    private Object FMM;

    public Object getBL() {
        return BL;
    }

    public void setBL(Object BL) {
        this.BL = BL;
    }

    public Object getFMM() {
        return FMM;
    }

    public void setFMM(Object FMM) {
        this.FMM = FMM;
    }

    public Object getCliente() {
        return cliente;
    }

    public void setCliente(Object cliente) {
        this.cliente = cliente;
    }

    public Object getEtaFecha() {
        return etaFecha;
    }

    public void setEtaFecha(Object etaFecha) {
        this.etaFecha = etaFecha;
    }

    public Object getEtaHora() {
        return etaHora;
    }

    public void setEtaHora(Object etaHora) {
        this.etaHora = etaHora;
    }

    public Object getIdBLs() {
        return idBLs;
    }

    public void setIdBLs(Object idBLs) {
        this.idBLs = idBLs;
    }

    public Object getLote() {
        return lote;
    }

    public void setLote(Object lote) {
        this.lote = lote;
    }

    public Object getMotonave() {
        return motonave;
    }

    public void setMotonave(Object motonave) {
        this.motonave = motonave;
    }

}
