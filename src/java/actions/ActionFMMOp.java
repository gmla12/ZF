/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package actions;

import forms.FMMOpForm;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.GestionFMM;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author mario
 */
public class ActionFMMOp extends Action {

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
    public ActionFMMOp() {

        super();

    }

    public ActionForward execute(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response)
            throws Exception {

        FMMOpForm fo = (FMMOpForm) form;
        GestionFMM gr = new GestionFMM();
        HttpSession session = request.getSession();

        System.out.println("********************************************");
        System.out.println("*********  ActionOpFMM  **********");
        System.out.println("********************************************");
        request.setAttribute("respuesta", "");

        if (request.getAttribute("getOp") == "buscar") {
            fo.setOp("buscar");
            request.setAttribute("getOp", "buscar2");
        }

        if (fo.getOp() != null) {

            if (fo.getOp().equals("modificar")) {

                ArrayList<Object> resultado = new ArrayList<Object>();
                resultado = gr.MostrarFMMFormulario(Integer.parseInt(fo.getId()), false, null);
                if ((Boolean) resultado.get(0) == false) {

                    request.setAttribute("getIdFMMs", gr.getIdFMMs());
                    request.setAttribute("getFMM", gr.getFMM());
                    request.setAttribute("getCliente", gr.getCliente());
                    request.setAttribute("getPedido", gr.getPedido());
                    request.setAttribute("getLote", gr.getLote());
                    request.setAttribute("getFechaModificacion", gr.getFechaModificacion());
                    request.setAttribute("getNombreUsu", gr.getNombreUsu());
                    //para validar si se modifico un campo
                    session.setAttribute("getFMMIdFMMs", gr.getIdFMMs());
                    session.setAttribute("getFMMFMM", gr.getFMM());
                    session.setAttribute("getFMMCliente", gr.getCliente());
                    session.setAttribute("getFMMPedido", gr.getPedido());
                    session.setAttribute("getFMMLote", gr.getLote());

                    return mapping.findForward("modificar");

                } else {

                    request.setAttribute("error", resultado.get(1));
                    return mapping.findForward("error");

                }

            } else if (fo.getOp().equals("buscar")) {

                if (fo.getbCliente() == null) {
                    fo.setbFMM((String) session.getAttribute("getbFMM"));
                    fo.setbCliente((String) session.getAttribute("getbCliente"));
                    fo.setbPedido((String) session.getAttribute("getbPedido"));
                    fo.setbLote((String) session.getAttribute("getbLote"));
                }

                ArrayList<Object> resultado = new ArrayList<Object>();
                resultado = gr.MostrarFMMOP(fo, false, null);
                if ((Boolean) resultado.get(0) == false) {

                    session.setAttribute("getbFMM", fo.getbFMM());
                    session.setAttribute("getbCliente", fo.getbCliente());
                    session.setAttribute("getbPedido", fo.getbPedido());
                    session.setAttribute("getbLote", fo.getbLote());

                    session.setAttribute("GR_FMM", resultado.get(1));
                    return mapping.findForward("ok");

                } else {

                    request.setAttribute("error", resultado.get(1));
                    return mapping.findForward("error");

                }

            } else {

                request.setAttribute("getIdFMMs", "");
                request.setAttribute("getFMM", "");
                request.setAttribute("getCliente", "");
                request.setAttribute("getPedido", "");
                request.setAttribute("getLote", "");
                request.setAttribute("getNombreUsu", "");
                request.setAttribute("getFechaModificacion", "");

                return mapping.findForward("nuevo");

            }

        } else {

            session.setAttribute("getbFMM", "");
            session.setAttribute("getbCliente", "");
            session.setAttribute("getbPedido", "");
            session.setAttribute("getbLote", "");
            fo.setbFMM("");
            fo.setbCliente("");
            fo.setbPedido("");
            fo.setbLote("");

            ArrayList<Object> resultado = new ArrayList<Object>();
            resultado = gr.MostrarFMMOP(fo, false, null);
            if ((Boolean) resultado.get(0) == false) {

                session.setAttribute("GR_FMM", resultado.get(1));
                return mapping.findForward("ok");

            } else {

                request.setAttribute("error", resultado.get(1));
                return mapping.findForward("error");

            }

        }

    }
}
