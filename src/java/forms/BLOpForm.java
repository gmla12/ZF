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
public class BLOpForm extends ActionForm{
    private String bBL;
    private String bCliente;
    private String bMotonave;
    private String bEtaDFecha;
    private String bEtaDHora;
    private String bEtaHFecha;
    private String bEtaHHora;
    private String bLote;
    private String bFMM;
    private String op;
    private String id;

    public String getbBL() {
        return bBL;
    }

    public void setbBL(String bBL) {
        this.bBL = bBL;
    }

    public String getbCliente() {
        return bCliente;
    }

    public void setbCliente(String bCliente) {
        this.bCliente = bCliente;
    }

    public String getbEtaDFecha() {
        return bEtaDFecha;
    }

    public void setbEtaDFecha(String bEtaDFecha) {
        this.bEtaDFecha = bEtaDFecha;
    }

    public String getbEtaDHora() {
        return bEtaDHora;
    }

    public void setbEtaDHora(String bEtaDHora) {
        this.bEtaDHora = bEtaDHora;
    }

    public String getbEtaHFecha() {
        return bEtaHFecha;
    }

    public void setbEtaHFecha(String bEtaHFecha) {
        this.bEtaHFecha = bEtaHFecha;
    }

    public String getbEtaHHora() {
        return bEtaHHora;
    }

    public void setbEtaHHora(String bEtaHHora) {
        this.bEtaHHora = bEtaHHora;
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

    public String getbMotonave() {
        return bMotonave;
    }

    public void setbMotonave(String bMotonave) {
        this.bMotonave = bMotonave;
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
