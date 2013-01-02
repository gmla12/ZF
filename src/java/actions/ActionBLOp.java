/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package actions;

import forms.BLOpForm;
import forms.bean.BeanVin;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.GestionBL;
import modelo.GestionVin;
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
        GestionVin grVin = new GestionVin();
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

                    ArrayList<Object> resultado2 = new ArrayList<Object>();
                    resultado2 = grVin.MostrarVin(Integer.parseInt(fo.getId()), false, null);
                    if ((Boolean) resultado2.get(0) == false) {

                        session.setAttribute("CMB_Vin", resultado2.get(1));
                        int idVin = 0;

                        ArrayList<Object> CMB_Vin = new ArrayList<Object>();
                        CMB_Vin = (ArrayList) resultado2.get(1);
                        if (CMB_Vin.size() > 0) {

                            BeanVin buVin = new BeanVin();
                            buVin = (BeanVin) CMB_Vin.get(0);
                            idVin = (Integer) buVin.getIdVines();

                        }

                        ArrayList<Object> resultado3 = new ArrayList<Object>();
                        resultado3 = grVin.MostrarVinFormulario(Integer.parseInt(fo.getId()), idVin, false, null);
                        if ((Boolean) resultado3.get(0) == false) {

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
                            //vin
                            if (idVin != 0) {
                                request.setAttribute("getIdVines", grVin.getIdVines());
                                request.setAttribute("getVin", grVin.getVin());
                                request.setAttribute("getReferencia", grVin.getReferencia());
                                request.setAttribute("getCodigo", grVin.getCodigo());
                                request.setAttribute("getFactura", grVin.getFactura());
                                request.setAttribute("getDescripcion", grVin.getDescripcion());
                                request.setAttribute("getValorFob", grVin.getValorFob());
                                request.setAttribute("getColor", grVin.getColor());
                                request.setAttribute("getHuerfano", grVin.getHuerfano());
                                request.setAttribute("getDespachado", grVin.getDespachado());
                                request.setAttribute("getPedido", grVin.getPedido());
                                request.setAttribute("getFMMI", grVin.getFMMI());
                                request.setAttribute("getFMMS", grVin.getFMMS());
                                request.setAttribute("getFechaModificacion", grVin.getFechaModificacion());
                                request.setAttribute("getNombreUsu", grVin.getNombreUsu());
                                //para validar si se modifico un campo
                                session.setAttribute("getBLIdVines", grVin.getIdVines());
                                session.setAttribute("getBLVin", grVin.getVin());
                                session.setAttribute("getBLReferencia", grVin.getReferencia());
                                session.setAttribute("getBLCodigo", grVin.getCodigo());
                                session.setAttribute("getBLFactura", grVin.getFactura());
                                session.setAttribute("getBLDescripcion", grVin.getDescripcion());
                                session.setAttribute("getBLValorFob", grVin.getValorFob());
                                session.setAttribute("getBLColor", grVin.getColor());
                                session.setAttribute("getBLHuerfano", grVin.getHuerfano());
                                session.setAttribute("getBLDespachado", grVin.getDespachado());
                                session.setAttribute("getBLPedido", grVin.getPedido());
                                session.setAttribute("getBLFMMI", grVin.getFMMI());
                                session.setAttribute("getBLFMMS", grVin.getFMMS());
                            } else {
                                request.setAttribute("getIdVines", "");
                                request.setAttribute("getVin", "");
                                request.setAttribute("getReferencia", "");
                                request.setAttribute("getCodigo", "");
                                request.setAttribute("getFactura", "");
                                request.setAttribute("getDescripcion", "");
                                request.setAttribute("getValorFob", "");
                                request.setAttribute("getColor", "");
                                request.setAttribute("getHuerfano", "");
                                request.setAttribute("getDespachado", "");
                                request.setAttribute("getPedido", "");
                                request.setAttribute("getFMMI", "");
                                request.setAttribute("getFMMS", "");
                            }

                            return mapping.findForward("modificar");

                        } else {

                            request.setAttribute("error", resultado3.get(1));
                            return mapping.findForward("error");

                        }

                    } else {

                        request.setAttribute("error", resultado2.get(1));
                        return mapping.findForward("error");

                    }

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
