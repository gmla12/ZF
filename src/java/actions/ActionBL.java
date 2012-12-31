/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package actions;

import forms.BLForm;
import java.sql.Connection;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.log.GestionAuditoria;
import modelo.GestionBL;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author Mario
 */
public class ActionBL extends Action {

    public ActionBL() {

        super();

    }

    public ActionForward execute(
            ActionMapping mapping,
            ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response)
            throws Exception {

        BLForm fo = (BLForm) form;
        GestionBL gr = new GestionBL();
        GestionAuditoria gA = new GestionAuditoria();
        HttpSession session = request.getSession();
        if (fo.getOp().equals("nuevo")) {

            request.setAttribute("getIdBLs", fo.getIdBLs());
            request.setAttribute("getBL", fo.getBL());
            request.setAttribute("getCliente", fo.getCliente());
            request.setAttribute("getMotonave", fo.getMotonave());
            request.setAttribute("getEtaFecha", fo.getEtaFecha());
            request.setAttribute("getEtaHora", fo.getEtaHora());
            request.setAttribute("getLote", fo.getLote());
            request.setAttribute("getFMM", fo.getFMM());

            ArrayList<Object> resultado = new ArrayList<Object>();
            Connection cn = null;
            resultado = gr.ObtenerConexion();
            if ((Boolean) resultado.get(0) == false) {

                cn = (Connection) resultado.get(1);
                ArrayList<Object> resultado1 = new ArrayList<Object>();
                resultado1 = gr.autoCommint(false, cn);
                if ((Boolean) resultado1.get(0) == false) {

                    ArrayList<Object> resultado2 = new ArrayList<Object>();
                    resultado2 = gr.IngresaBL(fo, true, cn);
                    if ((Boolean) resultado2.get(0) == false) {

                        fo.setIdBLs(Integer.valueOf(resultado2.get(1).toString()));

                        ArrayList<Object> resultado3 = new ArrayList<Object>();
                        resultado3 = gA.BuscarFormulario("bl", true, cn);
                        if ((Boolean) resultado3.get(0) == false) {

                            ArrayList<Object> resultado4 = new ArrayList<Object>();
                            String valor_nuevo = "id=" + fo.getIdBLs() + "&bl=" + fo.getBL() + "&cliente=" + fo.getCliente() + "&motonave=" + fo.getMotonave() + "&eta=" + fo.getEtaFecha() + " " + fo.getEtaHora() + "&lote=" + fo.getLote() + "&fmm=" + fo.getFMM() ;
                            resultado4 = gA.IngresaAuditoria("Nuevo", "", valor_nuevo, fo.getIdUsu(), Integer.valueOf(gA.getIdFormulario().toString()), String.valueOf(fo.getIdBLs()), true, cn);
                            if ((Boolean) resultado4.get(0) == false) {

                                ArrayList<Object> resultado5 = new ArrayList<Object>();
                                resultado5 = gr.commint(cn);
                                if ((Boolean) resultado5.get(0) == false) {

                                    ArrayList<Object> resultado6 = new ArrayList<Object>();
                                    resultado6 = gr.autoCommint(true, cn);
                                    if ((Boolean) resultado6.get(0) == false) {

                                        ArrayList<Object> resultado7 = new ArrayList<Object>();
                                        resultado7 = gr.MostrarBLFormulario(fo.getIdBLs(), false, null);
                                        if ((Boolean) resultado7.get(0) == false) {

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

                                            request.setAttribute("respuesta", "Registro ingresado correctamente.");
                                            System.out.println("Action Ingreso BL");
                                            return mapping.findForward("ok");

                                        } else {

                                            request.setAttribute("error", resultado7.get(1));
                                            return mapping.findForward("error");

                                        }

                                    } else {

                                        request.setAttribute("error", resultado6.get(1));
                                        return mapping.findForward("error");

                                    }

                                } else {

                                    request.setAttribute("error", resultado5.get(1));
                                    return mapping.findForward("error");

                                }

                            } else {

                                request.setAttribute("error", resultado4.get(1));
                                return mapping.findForward("error");

                            }

                        } else {

                            request.setAttribute("error", resultado3.get(1));
                            return mapping.findForward("error");

                        }

                    } else {

                        request.setAttribute("error", resultado2.get(1));
                        return mapping.findForward("error");

                    }

                } else {

                    request.setAttribute("error", resultado1.get(1));
                    return mapping.findForward("error");

                }

            } else {

                request.setAttribute("error", resultado.get(1));
                return mapping.findForward("error");

            }

        } else if (fo.getOp().equals("modificar")) {

            request.setAttribute("getIdBLs", fo.getIdBLs());
            request.setAttribute("getBL", fo.getBL());
            request.setAttribute("getCliente", fo.getCliente());
            request.setAttribute("getMotonave", fo.getMotonave());
            request.setAttribute("getEtaFecha", fo.getEtaFecha());
            request.setAttribute("getEtaHora", fo.getEtaHora());
            request.setAttribute("getLote", fo.getLote());
            request.setAttribute("getFMM", fo.getFMM());

            ArrayList<Object> resultado = new ArrayList<Object>();
            Connection cn = null;
            resultado = gr.ObtenerConexion();
            if ((Boolean) resultado.get(0) == false) {

                cn = (Connection) resultado.get(1);
                ArrayList<Object> resultado1 = new ArrayList<Object>();
                resultado1 = gr.autoCommint(false, cn);
                if ((Boolean) resultado1.get(0) == false) {

                    ArrayList<Object> resultado2 = new ArrayList<Object>();
                    resultado2 = gr.ModificaBL(fo, true, cn);
                    if ((Boolean) resultado2.get(0) == false) {

                        ArrayList<Object> resultado3 = new ArrayList<Object>();
                        resultado3 = gA.BuscarFormulario("bl", true, cn);
                        if ((Boolean) resultado3.get(0) == false) {

                            ArrayList<Object> resultado4 = new ArrayList<Object>();

                            //valida si hubo un cambio en algun campo
                            String NIdBLs = String.valueOf(fo.getIdBLs());
                            String NBL = fo.getBL();
                            String NCliente = fo.getCliente();
                            String NMotonave = fo.getMotonave();
                            String NEtaFecha = fo.getEtaFecha().toString();
                            String NEtaHora = fo.getEtaHora().toString();
                            String NLote = fo.getLote();
                            String NFMM = fo.getFMM();
                            String AIdBLs = session.getAttribute("getBLIdBLs").toString();
                            String ABL = session.getAttribute("getBLBL").toString();
                            String ACliente = session.getAttribute("getBLCliente").toString();
                            String AMotonave = session.getAttribute("getBLMotonave").toString();
                            String AEtaFecha = session.getAttribute("getBLEtaFecha").toString();
                            String AEtaHora = session.getAttribute("getBLEtaHora").toString();
                            String ALote = session.getAttribute("getBLLote").toString();
                            String AFMM = session.getAttribute("getBLFMM").toString();
                            String valor_anterior = "";
                            String valor_nuevo = "";
                            if (NIdBLs.equals(AIdBLs) == false) {
                                valor_nuevo = "id=" + NIdBLs;
                                valor_anterior = "id=" + AIdBLs;
                            }
                            if (NBL.equals(ABL) == false) {
                                if (!valor_nuevo.equals("")) {
                                    valor_nuevo = valor_nuevo + "&";
                                    valor_anterior = valor_anterior + "&";
                                }
                                valor_nuevo = valor_nuevo + "bl=" + NBL;
                                valor_anterior = valor_anterior + "bl=" + ABL;
                            }
                            if (NCliente.equals(ACliente) == false) {
                                if (!valor_nuevo.equals("")) {
                                    valor_nuevo = valor_nuevo + "&";
                                    valor_anterior = valor_anterior + "&";
                                }
                                valor_nuevo = valor_nuevo + "cliente=" + NCliente;
                                valor_anterior = valor_anterior + "ciente=" + ACliente;
                            }
                            if (NMotonave.equals(AMotonave) == false) {
                                if (!valor_nuevo.equals("")) {
                                    valor_nuevo = valor_nuevo + "&";
                                    valor_anterior = valor_anterior + "&";
                                }
                                valor_nuevo = valor_nuevo + "motonave=" + NMotonave;
                                valor_anterior = valor_anterior + "motonave=" + AMotonave;
                            }
                            if ((NEtaFecha.equals(AEtaFecha) == false) || (NEtaHora.equals(AEtaHora) == false)) {
                                if (!valor_nuevo.equals("")) {
                                    valor_nuevo = valor_nuevo + "&";
                                    valor_anterior = valor_anterior + "&";
                                }
                                valor_nuevo = valor_nuevo + "eta=" + NEtaFecha + " " + NEtaHora;
                                valor_anterior = valor_anterior + "eta=" + AEtaFecha + " " + AEtaHora;
                            }
                            if (NLote.equals(ALote) == false) {
                                if (!valor_nuevo.equals("")) {
                                    valor_nuevo = valor_nuevo + "&";
                                    valor_anterior = valor_anterior + "&";
                                }
                                valor_nuevo = valor_nuevo + "lote=" + NLote;
                                valor_anterior = valor_anterior + "lote=" + ALote;
                            }
                            if (NFMM.equals(AFMM) == false) {
                                if (!valor_nuevo.equals("")) {
                                    valor_nuevo = valor_nuevo + "&";
                                    valor_anterior = valor_anterior + "&";
                                }
                                valor_nuevo = valor_nuevo + "fmm=" + NFMM;
                                valor_anterior = valor_anterior + "fmm=" + AFMM;
                            }

                            resultado4 = gA.IngresaAuditoria("Modificar", valor_anterior, valor_nuevo, fo.getIdUsu(), Integer.valueOf(gA.getIdFormulario().toString()), String.valueOf(fo.getIdBLs()), true, cn);
                            if ((Boolean) resultado4.get(0) == false) {

                                ArrayList<Object> resultado5 = new ArrayList<Object>();
                                resultado5 = gr.commint(cn);
                                if ((Boolean) resultado5.get(0) == false) {

                                    ArrayList<Object> resultado6 = new ArrayList<Object>();
                                    resultado6 = gr.autoCommint(true, cn);
                                    if ((Boolean) resultado6.get(0) == false) {

                                        ArrayList<Object> resultado7 = new ArrayList<Object>();
                                        resultado7 = gr.MostrarBLFormulario(fo.getIdBLs(), false, null);
                                        if ((Boolean) resultado7.get(0) == false) {

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

                                            request.setAttribute("respuesta", "Registro modificado correctamente.");
                                            System.out.println("Action Modicar BL");
                                            return mapping.findForward("ok");

                                        } else {

                                            request.setAttribute("error", resultado7.get(1));
                                            return mapping.findForward("error");

                                        }

                                    } else {

                                        request.setAttribute("error", resultado6.get(1));
                                        return mapping.findForward("error");

                                    }

                                } else {

                                    request.setAttribute("error", resultado5.get(1));
                                    return mapping.findForward("error");

                                }

                            } else {

                                request.setAttribute("error", resultado4.get(1));
                                return mapping.findForward("error");

                            }

                        } else {

                            request.setAttribute("error", resultado3.get(1));
                            return mapping.findForward("error");

                        }

                    } else {

                        request.setAttribute("error", resultado2.get(1));
                        return mapping.findForward("error");

                    }

                } else {

                    request.setAttribute("error", resultado1.get(1));
                    return mapping.findForward("error");

                }

            } else {

                request.setAttribute("error", resultado.get(1));
                return mapping.findForward("error");

            }

        } else if (fo.getOp().equals("eliminar")) {

            request.setAttribute("getIdBLs", fo.getIdBLs());
            request.setAttribute("getBL", fo.getBL());
            request.setAttribute("getCliente", fo.getCliente());
            request.setAttribute("getMotonave", fo.getMotonave());
            request.setAttribute("getEtaFecha", fo.getEtaFecha());
            request.setAttribute("getEtaHora", fo.getEtaHora());
            request.setAttribute("getLote", fo.getLote());
            request.setAttribute("getFMM", fo.getFMM());
            request.setAttribute("getFechaModificacion", "");
            request.setAttribute("getNombreUsu", "");

            ArrayList<Object> resultado = new ArrayList<Object>();
            Connection cn = null;
            resultado = gr.ObtenerConexion();
            if ((Boolean) resultado.get(0) == false) {

                cn = (Connection) resultado.get(1);
                ArrayList<Object> resultado1 = new ArrayList<Object>();
                resultado1 = gr.autoCommint(false, cn);
                if ((Boolean) resultado1.get(0) == false) {

                    ArrayList<Object> resultado2 = new ArrayList<Object>();
                    resultado2 = gr.EliminaBL(fo, true, cn);
                    if ((Boolean) resultado2.get(0) == false) {

                        ArrayList<Object> resultado3 = new ArrayList<Object>();
                        resultado3 = gA.BuscarFormulario("bl", true, cn);
                        if ((Boolean) resultado3.get(0) == false) {

                            ArrayList<Object> resultado4 = new ArrayList<Object>();
                            String valor_anterior = "id=" + fo.getIdBLs() + "&bl=" + fo.getBL() + "&cliente=" + fo.getCliente() + "&motonave=" + fo.getMotonave() + "&eta=" + fo.getEtaFecha() + " " + fo.getEtaHora() + "&lote=" + fo.getLote() + "&fmm=" + fo.getFMM();
                            resultado4 = gA.IngresaAuditoria("Eliminar", valor_anterior, "", fo.getIdUsu(), Integer.valueOf(gA.getIdFormulario().toString()), String.valueOf(fo.getIdBLs()), true, cn);
                            if ((Boolean) resultado4.get(0) == false) {

                                ArrayList<Object> resultado5 = new ArrayList<Object>();
                                resultado5 = gr.commint(cn);
                                if ((Boolean) resultado5.get(0) == false) {

                                    ArrayList<Object> resultado6 = new ArrayList<Object>();
                                    resultado6 = gr.autoCommint(true, cn);
                                    if ((Boolean) resultado6.get(0) == false) {

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

                                        request.setAttribute("respuesta", "Registro eliminado correctamente.");
                                        System.out.println("Action Eliminar BL");

                                        return mapping.findForward("ok");

                                    } else {

                                        request.setAttribute("error", resultado6.get(1));
                                        return mapping.findForward("error");

                                    }

                                } else {

                                    request.setAttribute("error", resultado5.get(1));
                                    return mapping.findForward("error");

                                }

                            } else {

                                request.setAttribute("error", resultado4.get(1));
                                return mapping.findForward("error");

                            }

                        } else {

                            request.setAttribute("error", resultado3.get(1));
                            return mapping.findForward("error");

                        }

                    } else {

                        request.setAttribute("error", resultado2.get(1));
                        return mapping.findForward("error");

                    }

                } else {

                    request.setAttribute("error", resultado1.get(1));
                    return mapping.findForward("error");

                }

            } else {

                request.setAttribute("error", resultado.get(1));
                return mapping.findForward("error");

            }

        } else {

            request.setAttribute("getOp", "buscar");
            return mapping.findForward("atras");

        }

    }
}
