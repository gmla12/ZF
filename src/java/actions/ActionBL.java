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
import modelo.GestionVin;
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
        GestionVin grVin = new GestionVin();
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
                            String valor_nuevo = "id=" + fo.getIdBLs() + "&bl=" + fo.getBL() + "&cliente=" + fo.getCliente() + "&motonave=" + fo.getMotonave() + "&eta=" + fo.getEtaFecha() + " " + fo.getEtaHora() + "&lote=" + fo.getLote() + "&fmm=" + fo.getFMM();
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
                                            //vin
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
            request.setAttribute("getIdVines", fo.getIdVines());
            request.setAttribute("getVin", fo.getVin());
            request.setAttribute("getReferencia", fo.getReferencia());
            request.setAttribute("getCodigo", fo.getCodigo());
            request.setAttribute("getFactura", fo.getFactura());
            request.setAttribute("getDescripcion", fo.getDescripcion());
            request.setAttribute("getValorFob", fo.getValorFob());
            request.setAttribute("getColor", fo.getColor());
            request.setAttribute("getHuerfano", fo.getHuerfano());
            request.setAttribute("getDespachado", fo.getDespachado());
            request.setAttribute("getPedido", fo.getPedido());
            request.setAttribute("getFMMI", fo.getFMMI());
            request.setAttribute("getFMMS", fo.getFMMS());

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
                            String NEta = fo.getEtaFecha().toString() + " " + fo.getEtaHora().toString();
                            String NLote = fo.getLote();
                            String NFMM = fo.getFMM();
                            String AIdBLs = session.getAttribute("getBLIdBLs").toString();
                            String ABL = session.getAttribute("getBLBL").toString();
                            String ACliente = session.getAttribute("getBLCliente").toString();
                            String AMotonave = session.getAttribute("getBLMotonave").toString();
                            String AEta = session.getAttribute("getBLEtaFecha").toString() + " " + session.getAttribute("getBLEtaHora").toString();
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
                            if (NEta.equals(AEta) == false) {
                                if (!valor_nuevo.equals("")) {
                                    valor_nuevo = valor_nuevo + "&";
                                    valor_anterior = valor_anterior + "&";
                                }
                                valor_nuevo = valor_nuevo + "eta=" + NEta;
                                valor_anterior = valor_anterior + "eta=" + AEta;
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

        } else if (fo.getOp().equals("nuevoVin")) {

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
            resultado = grVin.ObtenerConexion();
            if ((Boolean) resultado.get(0) == false) {

                cn = (Connection) resultado.get(1);
                ArrayList<Object> resultado1 = new ArrayList<Object>();
                resultado1 = grVin.autoCommint(false, cn);
                if ((Boolean) resultado1.get(0) == false) {

                    ArrayList<Object> resultado2 = new ArrayList<Object>();
                    resultado2 = grVin.IngresaVin(fo, true, cn);
                    if ((Boolean) resultado2.get(0) == false) {

                        fo.setIdVines(Integer.valueOf(resultado2.get(1).toString()));

                        ArrayList<Object> resultado3 = new ArrayList<Object>();
                        resultado3 = gr.ModificaBLUsu(fo, true, cn);
                        if ((Boolean) resultado3.get(0) == false) {

                            ArrayList<Object> resultado4 = new ArrayList<Object>();
                            resultado4 = gA.BuscarFormulario("bl", true, cn);
                            if ((Boolean) resultado4.get(0) == false) {

                                ArrayList<Object> resultado5 = new ArrayList<Object>();
                                String valor_nuevo = "id=" + fo.getIdBLs() + "&bl=" + fo.getBL() + "&idVin=" + fo.getIdVines() + "&vin=" + fo.getVin() + "&referencia=" + fo.getReferencia() + "&codigo=" + fo.getCodigo();
                                valor_nuevo = valor_nuevo + "&factura=" + fo.getFactura() + "&descripcion=" + fo.getDescripcion() + "&valorFob=" + fo.getValorFob() + "&color=" + fo.getColor() + "&huerfano=" + fo.getHuerfano();
                                valor_nuevo = valor_nuevo + "&despachado=" + fo.getDespachado() + "&pedido=" + fo.getPedido() + "&fmmi=" + fo.getFMMI() + "&fmms=" + fo.getFMMS();
                                resultado5 = gA.IngresaAuditoria("Nuevo Vin", "", valor_nuevo, fo.getIdUsu(), Integer.valueOf(gA.getIdFormulario().toString()), String.valueOf(fo.getIdBLs()), true, cn);
                                if ((Boolean) resultado5.get(0) == false) {

                                    ArrayList<Object> resultado6 = new ArrayList<Object>();
                                    resultado6 = grVin.commint(cn);
                                    if ((Boolean) resultado6.get(0) == false) {

                                        ArrayList<Object> resultado7 = new ArrayList<Object>();
                                        resultado7 = grVin.autoCommint(true, cn);
                                        if ((Boolean) resultado7.get(0) == false) {

                                            ArrayList<Object> resultado8 = new ArrayList<Object>();
                                            resultado8 = grVin.MostrarVinFormulario(fo.getIdBLs(), fo.getIdVines(), false, null);
                                            if ((Boolean) resultado8.get(0) == false) {

                                                ArrayList<Object> resultado9 = new ArrayList<Object>();
                                                resultado9 = grVin.MostrarVin(fo.getIdBLs(), false, null);
                                                if ((Boolean) resultado9.get(0) == false) {

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

                                                    session.setAttribute("CMB_Vin", resultado9.get(1));

                                                    request.setAttribute("respuesta", "Registro ingresado correctamente.");
                                                    System.out.println("Action Ingreso BL Vin");
                                                    return mapping.findForward("ok");

                                                } else {

                                                    request.setAttribute("error", resultado9.get(1));
                                                    return mapping.findForward("error");

                                                }

                                            } else {

                                                request.setAttribute("error", resultado8.get(1));
                                                return mapping.findForward("error");

                                            }

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

        } else if (fo.getOp().equals("consultaVin")) {

            request.setAttribute("getIdBLs", fo.getIdBLs());
            request.setAttribute("getBL", fo.getBL());
            request.setAttribute("getCliente", fo.getCliente());
            request.setAttribute("getMotonave", fo.getMotonave());
            request.setAttribute("getEtaFecha", fo.getEtaFecha());
            request.setAttribute("getEtaHora", fo.getEtaHora());
            request.setAttribute("getLote", fo.getLote());
            request.setAttribute("getFMM", fo.getFMM());

            ArrayList<Object> resultado = new ArrayList<Object>();
            resultado = grVin.MostrarVinFormulario(fo.getIdBLs(), Integer.parseInt(fo.getOp2()), false, null);
            if ((Boolean) resultado.get(0) == false) {

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

                request.setAttribute("respuesta", "");
                return mapping.findForward("ok");

            } else {

                request.setAttribute("error", resultado.get(1));
                return mapping.findForward("error");

            }

        } else if (fo.getOp().equals("modificarVin")) {

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
            resultado = grVin.ObtenerConexion();
            if ((Boolean) resultado.get(0) == false) {

                cn = (Connection) resultado.get(1);
                ArrayList<Object> resultado1 = new ArrayList<Object>();
                resultado1 = grVin.autoCommint(false, cn);
                if ((Boolean) resultado1.get(0) == false) {

                    ArrayList<Object> resultado2 = new ArrayList<Object>();
                    resultado2 = grVin.ModificaVin(fo, true, cn);
                    if ((Boolean) resultado2.get(0) == false) {

                        ArrayList<Object> resultado3 = new ArrayList<Object>();
                        resultado3 = gr.ModificaBLUsu(fo, true, cn);
                        if ((Boolean) resultado3.get(0) == false) {

                            ArrayList<Object> resultado4 = new ArrayList<Object>();
                            resultado4 = gA.BuscarFormulario("bl", true, cn);
                            if ((Boolean) resultado4.get(0) == false) {

                                ArrayList<Object> resultado5 = new ArrayList<Object>();
                                //valida si hubo un cambio en algun campo
                                String NIdBLs = String.valueOf(fo.getIdBLs());
                                String NBL = fo.getBL();
                                String NIdVin = String.valueOf(fo.getIdVines());
                                String NVin = fo.getVin();
                                String NReferencia = fo.getReferencia();
                                String NCodigo = fo.getCodigo();
                                String NFactura = fo.getFactura();
                                String NDescripcion = fo.getDescripcion();
                                String NValorFob = String.valueOf(fo.getValorFob());
                                String NColor = String.valueOf(fo.getColor());
                                String NHuerfano = String.valueOf(fo.getHuerfano());
                                String NDespachado = String.valueOf(fo.getDespachado());
                                String NPedido = fo.getPedido();
                                String NFMMI = fo.getFMMI();
                                String NFMMS = fo.getFMMS();
                                String AIdBLs = session.getAttribute("getBLIdBLs").toString();
                                String ABL = session.getAttribute("getBLBL").toString();
                                String AIdVin = session.getAttribute("getBLIdVines").toString();
                                String AVin = session.getAttribute("getBLVin").toString();
                                String AReferencia = session.getAttribute("getBLReferencia").toString();
                                String ACodigo = session.getAttribute("getBLCodigo").toString();
                                String AFactura = session.getAttribute("getBLFactura").toString();
                                String ADescripcion = session.getAttribute("getBLDescripcion").toString();
                                String AValorFob = session.getAttribute("getBLValorFob").toString();
                                String AColor = session.getAttribute("getBLColor").toString();
                                String AHuerfano = session.getAttribute("getBLHuerfano").toString();
                                String ADespachado = session.getAttribute("getBLDespachado").toString();
                                String APedido = session.getAttribute("getBLPedido").toString();
                                String AFMMI = session.getAttribute("getBLFMMI").toString();
                                String AFMMS = session.getAttribute("getBLFMMS").toString();
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
                                if (NIdVin.equals(AIdVin) == false) {
                                    if (!valor_nuevo.equals("")) {
                                        valor_nuevo = valor_nuevo + "&";
                                        valor_anterior = valor_anterior + "&";
                                    }
                                    valor_nuevo = valor_nuevo + "idVin=" + NIdVin;
                                    valor_anterior = valor_anterior + "idVin=" + AIdVin;
                                }
                                if (NVin.equals(AVin) == false) {
                                    if (!valor_nuevo.equals("")) {
                                        valor_nuevo = valor_nuevo + "&";
                                        valor_anterior = valor_anterior + "&";
                                    }
                                    valor_nuevo = valor_nuevo + "vin=" + NVin;
                                    valor_anterior = valor_anterior + "vin=" + AVin;
                                }
                                if (NReferencia.equals(AReferencia) == false) {
                                    if (!valor_nuevo.equals("")) {
                                        valor_nuevo = valor_nuevo + "&";
                                        valor_anterior = valor_anterior + "&";
                                    }
                                    valor_nuevo = valor_nuevo + "referencia=" + NReferencia;
                                    valor_anterior = valor_anterior + "referencia=" + AReferencia;
                                }
                                if (NCodigo.equals(ACodigo) == false) {
                                    if (!valor_nuevo.equals("")) {
                                        valor_nuevo = valor_nuevo + "&";
                                        valor_anterior = valor_anterior + "&";
                                    }
                                    valor_nuevo = valor_nuevo + "codigo=" + NCodigo;
                                    valor_anterior = valor_anterior + "codigo=" + ACodigo;
                                }
                                if (NFactura.equals(AFactura) == false) {
                                    if (!valor_nuevo.equals("")) {
                                        valor_nuevo = valor_nuevo + "&";
                                        valor_anterior = valor_anterior + "&";
                                    }
                                    valor_nuevo = valor_nuevo + "factura=" + NFactura;
                                    valor_anterior = valor_anterior + "factura=" + AFactura;
                                }
                                if (NDescripcion.equals(ADescripcion) == false) {
                                    if (!valor_nuevo.equals("")) {
                                        valor_nuevo = valor_nuevo + "&";
                                        valor_anterior = valor_anterior + "&";
                                    }
                                    valor_nuevo = valor_nuevo + "descripcion=" + NDescripcion;
                                    valor_anterior = valor_anterior + "descripcion=" + ADescripcion;
                                }
                                if (NValorFob.equals(AValorFob) == false) {
                                    if (!valor_nuevo.equals("")) {
                                        valor_nuevo = valor_nuevo + "&";
                                        valor_anterior = valor_anterior + "&";
                                    }
                                    valor_nuevo = valor_nuevo + "valorFob=" + NValorFob;
                                    valor_anterior = valor_anterior + "valorFob=" + AValorFob;
                                }
                                if (NColor.equals(AColor) == false) {
                                    if (!valor_nuevo.equals("")) {
                                        valor_nuevo = valor_nuevo + "&";
                                        valor_anterior = valor_anterior + "&";
                                    }
                                    valor_nuevo = valor_nuevo + "color=" + NColor;
                                    valor_anterior = valor_anterior + "color=" + AColor;
                                }
                                if (NHuerfano.equals(AHuerfano) == false) {
                                    if (!valor_nuevo.equals("")) {
                                        valor_nuevo = valor_nuevo + "&";
                                        valor_anterior = valor_anterior + "&";
                                    }
                                    valor_nuevo = valor_nuevo + "huerfano=" + NHuerfano;
                                    valor_anterior = valor_anterior + "huerfano=" + AHuerfano;
                                }
                                if (NDespachado.equals(ADespachado) == false) {
                                    if (!valor_nuevo.equals("")) {
                                        valor_nuevo = valor_nuevo + "&";
                                        valor_anterior = valor_anterior + "&";
                                    }
                                    valor_nuevo = valor_nuevo + "despachado=" + NDespachado;
                                    valor_anterior = valor_anterior + "despachado=" + ADespachado;
                                }
                                if (NPedido.equals(APedido) == false) {
                                    if (!valor_nuevo.equals("")) {
                                        valor_nuevo = valor_nuevo + "&";
                                        valor_anterior = valor_anterior + "&";
                                    }
                                    valor_nuevo = valor_nuevo + "pedido=" + NPedido;
                                    valor_anterior = valor_anterior + "pedido=" + APedido;
                                }
                                if (NFMMI.equals(AFMMI) == false) {
                                    if (!valor_nuevo.equals("")) {
                                        valor_nuevo = valor_nuevo + "&";
                                        valor_anterior = valor_anterior + "&";
                                    }
                                    valor_nuevo = valor_nuevo + "fmmi=" + NFMMI;
                                    valor_anterior = valor_anterior + "fmmi=" + AFMMI;
                                }
                                if (NFMMS.equals(AFMMS) == false) {
                                    if (!valor_nuevo.equals("")) {
                                        valor_nuevo = valor_nuevo + "&";
                                        valor_anterior = valor_anterior + "&";
                                    }
                                    valor_nuevo = valor_nuevo + "fmms=" + NFMMS;
                                    valor_anterior = valor_anterior + "fmms=" + AFMMS;
                                }

                                resultado5 = gA.IngresaAuditoria("Modificar Vin", valor_anterior, valor_nuevo, fo.getIdUsu(), Integer.valueOf(gA.getIdFormulario().toString()), String.valueOf(fo.getIdBLs()), true, cn);
                                if ((Boolean) resultado5.get(0) == false) {

                                    ArrayList<Object> resultado6 = new ArrayList<Object>();
                                    resultado6 = grVin.commint(cn);
                                    if ((Boolean) resultado6.get(0) == false) {

                                        ArrayList<Object> resultado7 = new ArrayList<Object>();
                                        resultado7 = grVin.autoCommint(true, cn);
                                        if ((Boolean) resultado7.get(0) == false) {

                                            ArrayList<Object> resultado8 = new ArrayList<Object>();
                                            resultado8 = grVin.MostrarVinFormulario(fo.getIdBLs(), fo.getIdVines(), false, null);
                                            if ((Boolean) resultado8.get(0) == false) {

                                                ArrayList<Object> resultado9 = new ArrayList<Object>();
                                                resultado9 = grVin.MostrarVin(fo.getIdBLs(), false, null);
                                                if ((Boolean) resultado9.get(0) == false) {

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

                                                    session.setAttribute("CMB_Vin", resultado9.get(1));

                                                    request.setAttribute("respuesta", "Registro modificado correctamente.");
                                                    System.out.println("Action Modificacion BL Vin");
                                                    return mapping.findForward("ok");

                                                } else {

                                                    request.setAttribute("error", resultado9.get(1));
                                                    return mapping.findForward("error");

                                                }

                                            } else {

                                                request.setAttribute("error", resultado8.get(1));
                                                return mapping.findForward("error");

                                            }

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

        } else if (fo.getOp().equals("eliminarVin")) {

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
            resultado = grVin.ObtenerConexion();
            if ((Boolean) resultado.get(0) == false) {

                cn = (Connection) resultado.get(1);
                ArrayList<Object> resultado1 = new ArrayList<Object>();
                resultado1 = grVin.autoCommint(false, cn);
                if ((Boolean) resultado1.get(0) == false) {

                    ArrayList<Object> resultado2 = new ArrayList<Object>();
                    resultado2 = grVin.EliminaVin(fo, true, cn);
                    if ((Boolean) resultado2.get(0) == false) {

                        ArrayList<Object> resultado3 = new ArrayList<Object>();
                        resultado3 = gr.ModificaBLUsu(fo, true, cn);
                        if ((Boolean) resultado3.get(0) == false) {

                            ArrayList<Object> resultado4 = new ArrayList<Object>();
                            resultado4 = gA.BuscarFormulario("bl", true, cn);
                            if ((Boolean) resultado4.get(0) == false) {

                                ArrayList<Object> resultado5 = new ArrayList<Object>();
                                String valor_anterior = "id=" + fo.getIdBLs() + "&bl=" + fo.getBL() + "&idVin=" + fo.getIdVines() + "&vin=" + fo.getVin() + "&referencia=" + fo.getReferencia() + "&codigo=" + fo.getCodigo();
                                valor_anterior = valor_anterior + "&factura=" + fo.getFactura() + "&descripcion=" + fo.getDescripcion() + "&valorFob=" + fo.getValorFob() + "&color=" + fo.getColor() + "&huerfano=" + fo.getHuerfano();
                                valor_anterior = valor_anterior + "&despachado=" + fo.getDespachado() + "&pedido=" + fo.getPedido() + "&fmmi=" + fo.getFMMI() + "&fmms=" + fo.getFMMS();
                                resultado5 = gA.IngresaAuditoria("Eliminar Vin", valor_anterior, "", fo.getIdUsu(), Integer.valueOf(gA.getIdFormulario().toString()), String.valueOf(fo.getIdBLs()), true, cn);
                                if ((Boolean) resultado5.get(0) == false) {

                                    ArrayList<Object> resultado6 = new ArrayList<Object>();
                                    resultado6 = grVin.commint(cn);
                                    if ((Boolean) resultado6.get(0) == false) {

                                        ArrayList<Object> resultado7 = new ArrayList<Object>();
                                        resultado7 = grVin.autoCommint(true, cn);
                                        if ((Boolean) resultado7.get(0) == false) {

                                            ArrayList<Object> resultado8 = new ArrayList<Object>();
                                            resultado8 = grVin.MostrarVin(fo.getIdBLs(), false, null);
                                            if ((Boolean) resultado8.get(0) == false) {

                                                ArrayList<Object> resultado9 = new ArrayList<Object>();
                                                resultado9 = gr.MostrarBLFormulario(fo.getIdBLs(), false, null);
                                                if ((Boolean) resultado.get(0) == false) {

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
                                                    request.setAttribute("getFechaModificacion", gr.getNombreUsu());
                                                    request.setAttribute("getNombreUsu", gr.getFechaModificacion());
                                                    //para validar si se modifico un campo
                                                    session.setAttribute("getBLIdVines", "");
                                                    session.setAttribute("getBLVin", "");
                                                    session.setAttribute("getBLReferencia", "");
                                                    session.setAttribute("getBLCodigo", "");
                                                    session.setAttribute("getBLFactura", "");
                                                    session.setAttribute("getBLDescripcion", "");
                                                    session.setAttribute("getBLValorFob", "");
                                                    session.setAttribute("getBLColor", "");
                                                    session.setAttribute("getBLHuerfano", "");
                                                    session.setAttribute("getBLDespachado", "");
                                                    session.setAttribute("getBLPedido", "");
                                                    session.setAttribute("getBLFMMI", "");
                                                    session.setAttribute("getBLFMMS", "");

                                                    session.setAttribute("CMB_Vin", resultado8.get(1));

                                                    request.setAttribute("respuesta", "Registro eliminado correctamente.");
                                                    System.out.println("Action Eliminar BL Vin");

                                                    return mapping.findForward("ok");

                                                } else {

                                                    request.setAttribute("error", resultado9.get(1));
                                                    return mapping.findForward("error");

                                                }

                                            } else {

                                                request.setAttribute("error", resultado8.get(1));
                                                return mapping.findForward("error");

                                            }

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

        } else {

            request.setAttribute("getOp", "buscar");
            return mapping.findForward("atras");

        }

    }
}
