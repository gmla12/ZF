/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package forms;

import org.apache.struts.action.ActionForm;

/**
 *
 * @author Mario
 */
public class FMMForm extends ActionForm{
    private int idFMMs;
    private String FMM;
    private String cliente;
    private String lote;
    private String pedido;
    private Integer idUsu;
    private String op;
    private String op2;

    public Integer getIdUsu() {
        return idUsu;
    }

    public void setIdUsu(Integer idUsu) {
        this.idUsu = idUsu;
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

    public int getIdFMMs() {
        return idFMMs;
    }

    public void setIdFMMs(int idFMMs) {
        this.idFMMs = idFMMs;
    }

    public String getLote() {
        return lote;
    }

    public void setLote(String lote) {
        this.lote = lote;
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

    public String getPedido() {
        return pedido;
    }

    public void setPedido(String pedido) {
        this.pedido = pedido;
    }

}
