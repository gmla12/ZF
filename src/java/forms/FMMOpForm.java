/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package forms;

import org.apache.struts.action.ActionForm;

/**
 *
 * @author mario
 */
public class FMMOpForm extends ActionForm{
    private String bFMM;
    private String bCliente;
    private String bPedido;
    private String bLote;
    private String op;
    private String id;

    public String getbCliente() {
        return bCliente;
    }

    public void setbCliente(String bCliente) {
        this.bCliente = bCliente;
    }

    public String getbFMM() {
        return bFMM;
    }

    public void setbFMM(String bFMM) {
        this.bFMM = bFMM;
    }

    public String getbLote() {
        return bLote;
    }

    public void setbLote(String bLote) {
        this.bLote = bLote;
    }

    public String getbPedido() {
        return bPedido;
    }

    public void setbPedido(String bPedido) {
        this.bPedido = bPedido;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getOp() {
        return op;
    }

    public void setOp(String op) {
        this.op = op;
    }

}
