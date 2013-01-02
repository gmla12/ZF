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
public class BeanVin implements Serializable {

    private Object idVines;
    private Object vin;
    private Object referencia;
    private Object codigo;
    private Object factura;
    private Object descripcion;
    private Object valorFob;
    private Object color;
    private Object huerfano;
    private Object despachado;
    private Object pedido;
    private Object FMMI;
    private Object FMMS;
    private Object idBLs;

    public Object getFMMI() {
        return FMMI;
    }

    public void setFMMI(Object FMMI) {
        this.FMMI = FMMI;
    }

    public Object getFMMS() {
        return FMMS;
    }

    public void setFMMS(Object FMMS) {
        this.FMMS = FMMS;
    }

    public Object getCodigo() {
        return codigo;
    }

    public void setCodigo(Object codigo) {
        this.codigo = codigo;
    }

    public Object getColor() {
        return color;
    }

    public void setColor(Object color) {
        this.color = color;
    }

    public Object getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(Object descripcion) {
        this.descripcion = descripcion;
    }

    public Object getDespachado() {
        return despachado;
    }

    public void setDespachado(Object despachado) {
        this.despachado = despachado;
    }

    public Object getFactura() {
        return factura;
    }

    public void setFactura(Object factura) {
        this.factura = factura;
    }

    public Object getHuerfano() {
        return huerfano;
    }

    public void setHuerfano(Object huerfano) {
        this.huerfano = huerfano;
    }

    public Object getIdBLs() {
        return idBLs;
    }

    public void setIdBLs(Object idBLs) {
        this.idBLs = idBLs;
    }

    public Object getIdVines() {
        return idVines;
    }

    public void setIdVines(Object idVines) {
        this.idVines = idVines;
    }

    public Object getPedido() {
        return pedido;
    }

    public void setPedido(Object pedido) {
        this.pedido = pedido;
    }

    public Object getReferencia() {
        return referencia;
    }

    public void setReferencia(Object referencia) {
        this.referencia = referencia;
    }

    public Object getValorFob() {
        return valorFob;
    }

    public void setValorFob(Object valorFob) {
        this.valorFob = valorFob;
    }

    public Object getVin() {
        return vin;
    }

    public void setVin(Object vin) {
        this.vin = vin;
    }
}
