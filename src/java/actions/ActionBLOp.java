/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package actions;

import forms.BLOpForm;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.GestionBL;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author mario
 */
public class ActionBLOp extends Action {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public ActionBLOp() {

        super();

    }

    public ActionForward execute(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response)
            throws Exception {

        BLOpForm fo = (BLOpForm) form;
        GestionBL gr = new GestionBL();
        HttpSession session = request.getSession();

        System.out.println("********************************************");
        System.out.println("*********  ActionOpBL  **********");
        System.out.println("********************************************");
        request.setAttribute("respuesta", "");

        if (request.getAttribute("getOp") == "buscar") {
            fo.setOp("buscar");
            request.setAttribute("getOp", "buscar2");
        }

        if (fo.getOp() != null) {

            if (fo.getOp().equals("modificar")) {

                ArrayList<Object> resultado = new ArrayList<Object>();
                resultado = gr.MostrarBLFormulario(Integer.parseInt(fo.getId()), false, null);
                if ((Boolean) resultado.get(0) == false) {

                    request.setAttribute("getIdBLs", gr.getIdBLs());
                    request.setAttribute("getBL", gr.getBL());
                    request.setAttribute("getCliente", gr.getCliente());
                    request.setAttribute("getMotonave", gr.getMotonave());
                    request.setAttribute("getEtaFecha", gr.getEtaFecha());
                    request.setAttribute("getEtaHora", gr.getEtaHora());
                    request.setAttribute("getLote", gr.getLote());
                    request.setAttribute("getFMM", gr.getFMM());
                    request.setAttribute("getFechaModificacion", gr.getFechaModificacion());
                    request.setAttribute("getNombreUsu", gr.getNombreUsu());
                    //para validar si se modifico un campo
                    session.setAttribute("getBLIdBLs", gr.getIdBLs());
                    session.setAttribute("getBLBL", gr.getBL());
                    session.setAttribute("getBLCliente", gr.getCliente());
                    session.setAttribute("getBLMotonave", gr.getMotonave());
                    session.setAttribute("getBLEtaFecha", gr.getEtaFecha());
                    session.setAttribute("getBLEtaHora", gr.getEtaHora());
                    session.setAttribute("getBLLote", gr.getLote());
                    session.setAttribute("getBLFMM", gr.getFMM());

                    return mapping.findForward("modificar");

                } else {

                    request.setAttribute("error", resultado.get(1));
                    return mapping.findForward("error");

                }

            } else if (fo.getOp().equals("buscar")) {

                if (fo.getbCliente() == null) {
                    fo.setbBL((String) session.getAttribute("getbBL"));
                    fo.setbCliente((String) session.getAttribute("getbCliente"));
                    fo.setbMotonave((String) session.getAttribute("getbMotonave"));
                    fo.setbEtaDFecha((String) session.getAttribute("getbEtaDFecha"));
                    fo.setbEtaDHora((String) session.getAttribute("getbEtaDHora"));
                    fo.setbEtaHFecha((String) session.getAttribute("getbEtaHFecha"));
                    fo.setbEtaHHora((String) session.getAttribute("getbEtaHHora"));
                    fo.setbLote((String) session.getAttribute("getbLote"));
                    fo.setbFMM((String) session.getAttribute("getbFMM"));
                }

                ArrayList<Object> resultado = new ArrayList<Object>();
                resultado = gr.MostrarBLOP(fo, false, null);
                if ((Boolean) resultado.get(0) == false) {

                    session.setAttribute("getbBL", fo.getbBL());
                    session.setAttribute("getbCliente", fo.getbCliente());
                    session.setAttribute("getbMotonave", fo.getbMotonave());
                    session.setAttribute("getbEtaDFecha", fo.getbEtaDFecha());
                    session.setAttribute("getbEtaDHora", fo.getbEtaDHora());
                    session.setAttribute("getbEtaHFecha", fo.getbEtaHFecha());
                    session.setAttribute("getbEtaHHora", fo.getbEtaHHora());
                    session.setAttribute("getbLote", fo.getbLote());
                    session.setAttribute("getbFMM", fo.getbFMM());

                    session.setAttribute("GR_BL", resultado.get(1));
                    return mapping.findForward("ok");

                } else {

                    request.setAttribute("error", resultado.get(1));
                    return mapping.findForward("error");

                }

            } else {

                request.setAttribute("getIdBLs", "");
                request.setAttribute("getBL", "");
                request.setAttribute("getCliente", "");
                request.setAttribute("getMotonave", "");
                request.setAttribute("getEtaFecha", "");
                request.setAttribute("getEtaHora", "");
                request.setAttribute("getLote", "");
                request.setAttribute("getFMM", "");
                request.setAttribute("getNombreUsu", "");
                request.setAttribute("getFechaModificacion", "");

                return mapping.findForward("nuevo");

            }

        } else {

            session.setAttribute("getbBL", "");
            session.setAttribute("getbCliente", "");
            session.setAttribute("getbMotonave", "");
            session.setAttribute("getbEtaDFecha", "");
            session.setAttribute("getbEtaDHora", "");
            session.setAttribute("getbEtaHFecha", "");
            session.setAttribute("getbEtaHHora", "");
            session.setAttribute("getbLote", "");
            session.setAttribute("getbFMM", "");
            fo.setbBL("");
            fo.setbCliente("");
            fo.setbMotonave("");
            fo.setbEtaDFecha("");
            fo.setbEtaDHora("");
            fo.setbEtaHFecha("");
            fo.setbEtaHHora("");
            fo.setbLote("");
            fo.setbFMM("");

            ArrayList<Object> resultado = new ArrayList<Object>();
            resultado = gr.MostrarBLOP(fo, false, null);
            if ((Boolean) resultado.get(0) == false) {

                session.setAttribute("GR_BL", resultado.get(1));
                return mapping.findForward("ok");

            } else {

                request.setAttribute("error", resultado.get(1));
                return mapping.findForward("error");

            }

        }

    }
}
