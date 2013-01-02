/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import forms.BLForm;
import forms.bean.BeanVin;
import java.sql.*;
import java.util.ArrayList;
import util.ConeccionMySql;

/**
 *
 * @author Mario
 */
public class GestionVin extends ConeccionMySql {

    Connection cn = null;
    Statement st = null;

    public ArrayList<Object> IngresaVin(BLForm f, Boolean transac, Connection tCn) {

        int mod = -99;
        ArrayList<Object> resultado = new ArrayList<Object>();
        PreparedStatement psInsertar = null;

        try {

            if (transac == false) { //si no es una transaccion busca una nueva conexion

                ArrayList<Object> resultad = new ArrayList<Object>();
                resultad = (ArrayList) getConection();

                if ((Boolean) resultad.get(0) == false) { // si no hubo error al obtener la conexion

                    cn = (Connection) resultad.get(1);

                } else { //si hubo error al obtener la conexion retorna el error para visualizar

                    resultado.add(true);
                    resultado.add(resultad.get(1));
                    return resultado;

                }

            } else { //si es una transaccion asigna la conexion utilizada

                cn = tCn;

            }

            psInsertar = cn.prepareStatement("insert into Vines (vin, referencia, codigo, factura, descripcion, valor_fob, color, huerfano, despachado, pedido, FMMI, FMMS, BLs_idBLs, susuarios_id, fecha_modificacion) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,now())", PreparedStatement.RETURN_GENERATED_KEYS);
            psInsertar.setString(1, f.getVin());
            psInsertar.setString(2, f.getReferencia());
            psInsertar.setString(3, f.getCodigo());
            psInsertar.setString(4, f.getFactura());
            psInsertar.setString(5, f.getDescripcion());
            psInsertar.setFloat(6, f.getValorFob());
            psInsertar.setInt(7, f.getColor());
            psInsertar.setBoolean(8, f.getHuerfano());
            psInsertar.setBoolean(9, f.getDespachado());
            psInsertar.setString(10, f.getPedido());
            psInsertar.setString(11, f.getFMMI());
            psInsertar.setString(12, f.getFMMS());
            psInsertar.setInt(13, f.getIdBLs());
            psInsertar.setInt(14, f.getIdUsu());
            psInsertar.executeUpdate(); // Se ejecuta la inserción.

            // Se obtiene la clave generada
            int claveGenerada = -1;
            ResultSet rs = psInsertar.getGeneratedKeys();
            while (rs.next()) {
                claveGenerada = rs.getInt(1);
            }
            mod = psInsertar.getUpdateCount();

            if (transac == false) { // si no es una transaccion cierra la conexion

                cn.close();

            }

            resultado.add(false); //si no hubo un error asigna false
            resultado.add(claveGenerada); // clave generada
            resultado.add(mod); // y el numero de registros consultados

        } catch (SQLException e) {

            resultado.add(true); //si hubo error asigna true
            resultado.add(e); //y asigna el error para retornar y visualizar

            if (cn != null) {
                cn.rollback();
                cn.close();
            }

        } finally {

            return resultado;

        }

    }
    private ArrayList<Object> GR_Vin;

    public ArrayList<Object> MostrarVin(int IdBLs, Boolean transac, Connection tCn) {

        ArrayList<Object> resultado = new ArrayList<Object>();
        PreparedStatement psSelectConClave = null;

        try {

            GR_Vin = new ArrayList<Object>();

            if (transac == false) { //si no es una transaccion busca una nueva conexion

                ArrayList<Object> resultad = new ArrayList<Object>();
                resultad = (ArrayList) getConection();

                if ((Boolean) resultad.get(0) == false) { // si no hubo error al obtener la conexion

                    cn = (Connection) resultad.get(1);

                } else { //si hubo error al obtener la conexion retorna el error para visualizar

                    resultado.add(true);
                    resultado.add(resultad.get(1));
                    return resultado;

                }

            } else { //si es una transaccion asigna la conexion utilizada

                cn = tCn;

            }

            psSelectConClave = cn.prepareStatement("SELECT idVines, vin, referencia, codigo, factura, descripcion, valor_fob, color, huerfano, despachado, pedido, FMMI, FMMS, BLs_idBLs FROM Vines WHERE BLs_idBLs = ?");
            psSelectConClave.setInt(1, IdBLs);
            ResultSet rs = psSelectConClave.executeQuery();

            BeanVin bu;
            while (rs.next()) {
                bu = new BeanVin();

                bu.setIdVines(rs.getObject("idVines"));
                bu.setVin(rs.getObject("vin"));
                bu.setReferencia(rs.getObject("referencia"));
                bu.setCodigo(rs.getObject("codigo"));
                bu.setFactura(rs.getObject("factura"));
                bu.setDescripcion(rs.getObject("descripcion"));
                bu.setValorFob(rs.getObject("valor_fob"));
                bu.setColor(rs.getObject("color"));
                bu.setHuerfano(rs.getObject("huerfano"));
                bu.setDespachado(rs.getObject("despachado"));
                bu.setPedido(rs.getObject("pedido"));
                bu.setFMMI(rs.getObject("FMMI"));
                bu.setFMMS(rs.getObject("FMMS"));
                bu.setIdBLs(rs.getObject("BLs_idBLs"));

                GR_Vin.add(bu);


            }

            if (transac == false) { // si no es una transaccion cierra la conexion

                cn.close();

            }

            resultado.add(false); //si no hubo un error asigna false
            resultado.add(GR_Vin); // y registros consultados

        } catch (SQLException e) {

            resultado.add(true); //si hubo error asigna true
            resultado.add(e); //y asigna el error para retornar y visualizar

            if (cn != null) {
                cn.rollback();
                cn.close();
            }

        } finally {

            return resultado;

        }

    }

//    public ArrayList<Object> MostrarBLOP(BLOpForm f, Boolean transac, Connection tCn) {
//
//        ArrayList<Object> resultado = new ArrayList<Object>();
//        PreparedStatement psSelectConClave = null;
//
//        try {
//
//            GR_BL = new ArrayList<Object>();
//
//            if (transac == false) { //si no es una transaccion busca una nueva conexion
//
//                ArrayList<Object> resultad = new ArrayList<Object>();
//                resultad = (ArrayList) getConection();
//
//                if ((Boolean) resultad.get(0) == false) { // si no hubo error al obtener la conexion
//
//                    cn = (Connection) resultad.get(1);
//
//                } else { //si hubo error al obtener la conexion retorna el error para visualizar
//
//                    resultado.add(true);
//                    resultado.add(resultad.get(1));
//                    return resultado;
//
//                }
//
//            } else { //si es una transaccion asigna la conexion utilizada
//
//                cn = tCn;
//
//            }
//
//            String query = "SELECT p.idBLs, p.BL, p.cliente, p.motonave, p.eta, p.lote, p.fmm ";
//            query += "FROM BLs p ";
//            String query2 = "";
//            if (f.getbBL().isEmpty() != true) {
//                query2 = "p.BL LIKE CONCAT('%',?,'%')";
//            }
//            if (f.getbCliente().isEmpty() != true) {
//                if (query2.isEmpty() != true) {
//                    query2 += "AND ";
//                }
//                query2 += "p.cliente LIKE CONCAT('%',?,'%')";
//            }
//            if (f.getbMotonave().isEmpty() != true) {
//                if (query2.isEmpty() != true) {
//                    query2 += "AND ";
//                }
//                query2 += "p.motonave LIKE CONCAT('%',?,'%')";
//            }
//            if (f.getbEtaDFecha().isEmpty() != true) {
//                if (query2.isEmpty() != true) {
//                    query2 += "AND ";
//                }
//                query2 += "p.eta >= ?";
//            }
//            if (f.getbEtaHFecha().isEmpty() != true) {
//                if (query2.isEmpty() != true) {
//                    query2 += "AND ";
//                }
//                query2 += "p.eta <= ?";
//            }
//            if (f.getbLote().isEmpty() != true) {
//                if (query2.isEmpty() != true) {
//                    query2 += "AND ";
//                }
//                query2 += "p.lote LIKE CONCAT('%',?,'%')";
//            }
//            if (f.getbFMM().isEmpty() != true) {
//                if (query2.isEmpty() != true) {
//                    query2 += "AND ";
//                }
//                query2 += "p.fmm LIKE CONCAT('%',?,'%')";
//            }
//            if (query2.isEmpty() != true) {
//                query += "WHERE " + query2;
//            }
//
//            psSelectConClave = cn.prepareStatement(query);
//            int i = 0;
//            if (f.getbBL().isEmpty() != true) {
//                i++;
//                psSelectConClave.setString(i, f.getbBL());
//            }
//            if (f.getbCliente().isEmpty() != true) {
//                i++;
//                psSelectConClave.setString(i, f.getbCliente());
//            }
//            if (f.getbMotonave().isEmpty() != true) {
//                i++;
//                psSelectConClave.setString(i, f.getbMotonave());
//            }
//            if (f.getbEtaDFecha().isEmpty() != true) {
//                java.sql.Timestamp momentoTimestamp;
//                if (f.getbEtaDHora().isEmpty() != true) {
//                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy h:mm a");
//                    Date dtf = sdf.parse(f.getbEtaDFecha() + " " + f.getbEtaDHora());
//                    momentoTimestamp = new java.sql.Timestamp(dtf.getTime());
//                } else {
//                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
//                    Date dtf = sdf.parse(f.getbEtaDFecha());
//                    momentoTimestamp = new java.sql.Timestamp(dtf.getTime());
//                }
//                i++;
//                psSelectConClave.setTimestamp(i, momentoTimestamp);
//            }
//            if (f.getbEtaHFecha().isEmpty() != true) {
//                java.sql.Timestamp momentoTimestamp;
//                if (f.getbEtaHHora().isEmpty() != true) {
//                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy h:mm a");
//                    Date dtf = sdf.parse(f.getbEtaHFecha() + " " + f.getbEtaHHora());
//                    momentoTimestamp = new java.sql.Timestamp(dtf.getTime());
//                } else {
//                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
//                    Date dtf = sdf.parse(f.getbEtaHFecha());
//                    momentoTimestamp = new java.sql.Timestamp(dtf.getTime());
//                }
//                i++;
//                psSelectConClave.setTimestamp(i, momentoTimestamp);
//            }
//            if (f.getbLote().isEmpty() != true) {
//                i++;
//                psSelectConClave.setString(i, f.getbLote());
//            }
//            if (f.getbFMM().isEmpty() != true) {
//                i++;
//                psSelectConClave.setString(i, f.getbFMM());
//            }
//            ResultSet rs = psSelectConClave.executeQuery();
//
//            BeanBL bu;
//            while (rs.next()) {
//
//                bu = new BeanBL();
//
//                bu.setIdBLs(rs.getObject("p.idBLs"));
//                bu.setBL(rs.getObject("p.BL"));
//                bu.setCliente(rs.getObject("p.cliente"));
//                bu.setMotonave(rs.getObject("p.motonave"));
//                Date dtt = (Date) rs.getObject("p.eta");
//                Calendar calendar = Calendar.getInstance();
//                calendar.setTime(dtt);
//                bu.setEtaFecha(String.valueOf(calendar.get(Calendar.DAY_OF_MONTH)) + "/" + String.valueOf(calendar.get(Calendar.MONTH) + 1) + "/" + String.valueOf(calendar.get(Calendar.YEAR)));
//                int hora24 = calendar.get(Calendar.HOUR_OF_DAY); //hora en formato 24hs
//                int minutos = calendar.get(Calendar.MINUTE);
//                String hh;
//                String h = "";
//                String h2 = "";
//                if (hora24 > 12) {
//                    hora24 = hora24 - 12;
//                    hh = "PM";
//                } else {
//                    hh = "AM";
//                }
//                if (hora24 < 10) {
//                    h = "0";
//                }
//                if (minutos < 10) {
//                    h2 = "0";
//                }
//                bu.setEtaHora(h + String.valueOf(hora24) + ":" + h2 + minutos + " " + hh);
//                bu.setLote(rs.getObject("p.lote"));
//                bu.setFMM(rs.getObject("p.FMM"));
//
//                GR_BL.add(bu);
//
//            }
//
//            if (transac == false) { // si no es una transaccion cierra la conexion
//
//                cn.close();
//
//            }
//
//            resultado.add(false); //si no hubo un error asigna false
//            resultado.add(GR_BL); // y registros consultados
//
//        } catch (SQLException e) {
//
//            resultado.add(true); //si hubo error asigna true
//            resultado.add(e); //y asigna el error para retornar y visualizar
//
//            if (cn != null) {
//                cn.rollback();
//                cn.close();
//            }
//
//        } finally {
//
//            return resultado;
//
//        }
//
//    }
    public ArrayList<Object> ModificaVin(BLForm f, Boolean transac, Connection tCn) {

        int mod = -99;
        ArrayList<Object> resultado = new ArrayList<Object>();
        PreparedStatement psUpdate = null;

        try {

            if (transac == false) { //si no es una transaccion busca una nueva conexion

                ArrayList<Object> resultad = new ArrayList<Object>();
                resultad = (ArrayList) getConection();

                if ((Boolean) resultad.get(0) == false) { // si no hubo error al obtener la conexion

                    cn = (Connection) resultad.get(1);

                } else { //si hubo error al obtener la conexion retorna el error para visualizar

                    resultado.add(true);
                    resultado.add(resultad.get(1));
                    return resultado;

                }

            } else { //si es una transaccion asigna la conexion utilizada

                cn = tCn;

            }

            String query = "UPDATE Vines SET vin = ?, referencia = ?, codigo = ?, factura = ?, descripcion = ?, valor_fob = ?, color = ?, huerfano = ?, despachado = ?, pedido = ?, FMMI = ?, FMMS = ?, susuarios_id=?, fecha_modificacion=now()";
            query += " WHERE BLs_idBLs = ? AND idVines = ?";
            psUpdate = cn.prepareStatement(query);
            psUpdate.setString(1, f.getVin());
            psUpdate.setString(2, f.getReferencia());
            psUpdate.setString(3, f.getCodigo());
            psUpdate.setString(4, f.getFactura());
            psUpdate.setString(5, f.getDescripcion());
            psUpdate.setFloat(6, f.getValorFob());
            psUpdate.setInt(7, f.getColor());
            psUpdate.setBoolean(8, f.getHuerfano());
            psUpdate.setBoolean(9, f.getDespachado());
            psUpdate.setString(10, f.getPedido());
            psUpdate.setString(11, f.getFMMI());
            psUpdate.setString(12, f.getFMMS());
            psUpdate.setInt(13, f.getIdUsu());
            psUpdate.setInt(14, f.getIdBLs());
            psUpdate.setInt(15, f.getIdVines());
            psUpdate.executeUpdate();

            mod = psUpdate.getUpdateCount();

            if (transac == false) { // si no es una transaccion cierra la conexion

                cn.close();

            }

            resultado.add(false); //si no hubo un error asigna false
            resultado.add(mod); // y el numero de registros consultados

        } catch (SQLException e) {

            resultado.add(true); //si hubo error asigna true
            resultado.add(e); //y asigna el error para retornar y visualizar

            if (cn != null) {
                cn.rollback();
                cn.close();
            }

        } finally {

            return resultado;

        }

    }

    public ArrayList<Object> EliminaVin(BLForm f, Boolean transac, Connection tCn) {

        int mod = -99;
        ArrayList<Object> resultado = new ArrayList<Object>();
        PreparedStatement psDelete = null;

        try {

            if (transac == false) { //si no es una transaccion busca una nueva conexion

                ArrayList<Object> resultad = new ArrayList<Object>();
                resultad = (ArrayList) getConection();

                if ((Boolean) resultad.get(0) == false) { // si no hubo error al obtener la conexion

                    cn = (Connection) resultad.get(1);

                } else { //si hubo error al obtener la conexion retorna el error para visualizar

                    resultado.add(true);
                    resultado.add(resultad.get(1));
                    return resultado;

                }

            } else { //si es una transaccion asigna la conexion utilizada

                cn = tCn;

            }

            psDelete = cn.prepareStatement("DELETE FROM Vines WHERE BLs_idBLs = ? AND idVines = ?");
            psDelete.setInt(1, f.getIdBLs());
            psDelete.setInt(2, f.getIdVines());
            psDelete.executeUpdate();

            mod = psDelete.getUpdateCount();

            if (transac == false) { // si no es una transaccion cierra la conexion

                cn.close();

            }

            resultado.add(false); //si no hubo un error asigna false
            resultado.add(mod); // y el numero de registros consultados

        } catch (SQLException e) {

            resultado.add(true); //si hubo error asigna true
            resultado.add(e); //y asigna el error para retornar y visualizar

            if (cn != null) {
                cn.rollback();
                cn.close();
            }

        } finally {

            return resultado;

        }

    }

    public ArrayList<Object> BuscarVines(Integer idBLs, Integer idVines, Boolean transac, Connection tCn) {

        ArrayList<Object> resultado = new ArrayList<Object>();
        BeanVin bu;
        bu = new BeanVin();
        boolean encontro = false;
        PreparedStatement psSelectConClave = null;

        try {

            if (transac == false) { //si no es una transaccion busca una nueva conexion

                ArrayList<Object> resultad = new ArrayList<Object>();
                resultad = (ArrayList) getConection();

                if ((Boolean) resultad.get(0) == false) { // si no hubo error al obtener la conexion

                    cn = (Connection) resultad.get(1);

                } else { //si hubo error al obtener la conexion retorna el error para visualizar

                    resultado.add(true);
                    resultado.add(resultad.get(1));
                    return resultado;

                }

            } else { //si es una transaccion asigna la conexion utilizada

                cn = tCn;

            }

            psSelectConClave = cn.prepareStatement("SELECT p.BLs_idBLs, p.idVines FROM Vines p WHERE p.BLs_idBLs = ? AND p.idVines = ?");
            psSelectConClave.setInt(1, idBLs);
            psSelectConClave.setInt(2, idVines);
            ResultSet rs = psSelectConClave.executeQuery();

            while (rs.next()) {
                bu = new BeanVin();

                bu.setIdBLs(rs.getObject("p.BLs_idBLs"));
                bu.setIdVines(rs.getObject("p.idVines"));
                Integer p = (Integer) bu.getIdBLs();
                Integer p2 = (Integer) bu.getIdVines();
                if (p.equals(idBLs) && p2.equals(idVines)) {
                    encontro = true;
                }


            }

            if (transac == false) { // si no es una transaccion cierra la conexion

                cn.close();

            }

            resultado.add(false); //si no hubo un error asigna false
            resultado.add(encontro); // y registros consultados

        } catch (Exception e) {

            resultado.add(true); //si hubo error asigna true
            resultado.add(e); //y asigna el error para retornar y visualizar

            if (cn != null) {
                cn.rollback();
                cn.close();
            }

        } finally {

            return resultado;

        }

    }

    public ArrayList<Object> MostrarVinFormulario(Integer IdBLs, Integer IdVines, Boolean transac, Connection tCn) {

        ArrayList<Object> resultado = new ArrayList<Object>();
        PreparedStatement psSelectConClave = null;

        try {

            if (transac == false) { //si no es una transaccion busca una nueva conexion

                ArrayList<Object> resultad = new ArrayList<Object>();
                resultad = (ArrayList) getConection();

                if ((Boolean) resultad.get(0) == false) { // si no hubo error al obtener la conexion

                    cn = (Connection) resultad.get(1);

                } else { //si hubo error al obtener la conexion retorna el error para visualizar

                    resultado.add(true);
                    resultado.add(resultad.get(1));
                    return resultado;

                }

            } else { //si es una transaccion asigna la conexion utilizada

                cn = tCn;

            }

            psSelectConClave = cn.prepareStatement("SELECT p.idVines, p.vin, p.referencia, p.codigo, p.factura, p.descripcion, p.valor_fob, p.color, p.huerfano, p.despachado, p.pedido, p.FMMI, p.FMMS, p.BLs_idBLs, p.susuarios_id, IF(e.primer_nombre <> NULL AND e.primer_apellido <> NULL, e.razon_Social, CONCAT(IF(e.primer_nombre <> NULL,'',CONCAT(e.primer_nombre,' ')), IF(e.segundo_nombre <> NULL,'',CONCAT(e.segundo_nombre,' ')), IF(e.primer_apellido <> NULL,'',CONCAT(e.primer_apellido,' ')), IF(e.segundo_apellido <> NULL,'',CONCAT(e.segundo_apellido,' ')))) as nombre_usu, p.fecha_modificacion FROM Vines p INNER JOIN susuarios r ON p.susuarios_id = r.id INNER JOIN entidades e ON r.id_tipo_documento = e.id_tipo_documento AND r.identificacion = e.identificacion WHERE BLs_idBLs = ? AND idVines = ?");
            psSelectConClave.setInt(1, IdBLs);
            psSelectConClave.setInt(2, IdVines);
            ResultSet rs = psSelectConClave.executeQuery();

            BeanVin bu;
            while (rs.next()) {
                bu = new BeanVin();

                setIdVines(rs.getObject("p.idVines"));
                setVin(rs.getObject("p.Vin"));
                setReferencia(rs.getObject("p.referencia"));
                setCodigo(rs.getObject("p.codigo"));
                setFactura(rs.getObject("p.factura"));
                setDescripcion(rs.getObject("p.descripcion"));
                setValorFob(rs.getObject("p.valor_fob"));
                setColor(rs.getObject("p.color"));
                setHuerfano(rs.getObject("p.huerfano"));
                setDespachado(rs.getObject("p.despachado"));
                setPedido(rs.getObject("p.pedido"));
                setFMMI(rs.getObject("p.FMMI"));
                setFMMS(rs.getObject("p.FMMS"));
                setIdBLs(rs.getObject("p.BLs_idBLs"));
                setNombreUsu(rs.getObject("nombre_usu"));
                setFechaModificacion(rs.getObject("p.fecha_modificacion"));

            }

            if (transac == false) { // si no es una transaccion cierra la conexion

                cn.close();

            }

            resultado.add(false); //si no hubo un error asigna false

        } catch (SQLException e) {

            resultado.add(true); //si hubo error asigna true
            resultado.add(e); //y asigna el error para retornar y visualizar

            if (cn != null) {
                cn.rollback();
                cn.close();
            }

        } finally {

            return resultado;

        }

    }

    public ArrayList<Object> commint(Connection tCn) {

        ArrayList<Object> resultado = new ArrayList<Object>();

        try {

            tCn.commit();
            resultado.add(false); //si no hubo un error asigna false

        } catch (SQLException e) {

            resultado.add(true); //si hubo error asigna true
            resultado.add(e); //y asigna el error para retornar y visualizar

            if (cn != null) {
                cn.rollback();
                cn.close();
            }

        } finally {

            return resultado;

        }

    }

    public ArrayList<Object> autoCommint(boolean valor, Connection tCn) {

        ArrayList<Object> resultado = new ArrayList<Object>();

        try {

            tCn.setAutoCommit(valor);
            resultado.add(false); //si no hubo un error asigna false

        } catch (SQLException e) {

            resultado.add(true); //si hubo error asigna true
            resultado.add(e); //y asigna el error para retornar y visualizar

        } finally {

            return resultado;

        }

    }

    public ArrayList<Object> rollback(Connection tCn) {

        ArrayList<Object> resultado = new ArrayList<Object>();

        try {

            tCn.rollback();
            resultado.add(false); //si no hubo un error asigna false

        } catch (SQLException e) {

            resultado.add(true); //si hubo error asigna true
            resultado.add(e); //y asigna el error para retornar y visualizar

        } finally {

            return resultado;

        }

    }

    public ArrayList<Object> ObtenerConexion() {

        ArrayList<Object> resultado = new ArrayList<Object>();

        try {

            ArrayList<Object> resultad = new ArrayList<Object>();
            resultad = (ArrayList) getConection();

            if ((Boolean) resultad.get(0) == false) { // si no hubo error al obtener la conexion

                cn = (Connection) resultad.get(1);
                resultado.add(false); //si no hubo un error asigna false
                resultado.add(cn); // y se envia la nueva conexion

            } else { //si hubo error al obtener la conexion retorna el error para visualizar

                resultado.add(true);
                resultado.add(resultad.get(1));
                return resultado;

            }

        } catch (Exception e) {

            resultado.add(true); //si hubo error asigna true
            resultado.add(e); //y asigna el error para retornar y visualizar

        } finally {

            return resultado;

        }

    }
//    private ArrayList<Object> GR_USUARIOS2;
//
//    public ArrayList<Object> MostrarUsuarios2(String aux, String aux2) {
//        try {
//            GR_USUARIOS2 = new ArrayList<Object>();
//            cn = getConection();
//
//            String query = "SELECT p.idUsuarios, p.tipoDocumentacion, p.documento, p.nombre1, p.nombre2, p.apellido1, ";
//            query += "p.apellido2, p.foto ";
//            query += "FROM usuarios p, cargo c ";
//            query += "WHERE p.id_cargo = c.id_cargo ";
//            if (aux.equals("nombre")) {
//                query += " AND p.nombres = '" + aux2 + "'";
//            } else if (aux.equals("cargo")) {
//                query += " AND p.id_cargo='" + aux2 + "'";
//            }
//
//            System.out.println("***********************************************");
//            System.out.println("*****       Cargando grilla  GR_USUARIOS  *****");
//            System.out.println("***********************************************");
//
//            System.out.println(query);
//            st = cn.createStatement();
//            ResultSet rs = st.executeQuery(query);
//
//            BeanUsuarios bu;
//            while (rs.next()) {
//                bu = new BeanUsuarios();
//
//                bu.setIdUsuarios(rs.getObject("p.idUsuarios"));
//                bu.setTipoDocumentacion(rs.getObject("p.tipoDocumentacion"));
//                bu.setDocumento(rs.getObject("p.documento"));
//                bu.setNombre1(rs.getObject("p.nombre1"));
//                bu.setNombre2(rs.getObject("p.nombre2"));
//                bu.setApellido1(rs.getObject("p.apellido1"));
//                bu.setApellido2(rs.getObject("p.apellido2"));
//                bu.setFoto(rs.getObject("p.foto"));
//
//                GR_USUARIOS2.add(bu);
//
//            }
//
//            st.close();
//            cn.close();
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//        }
//        return GR_USUARIOS2;
//    }
//}
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
    private Object nombreUsu;
    private Object fechaModificacion;

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

    public Object getFechaModificacion() {
        return fechaModificacion;
    }

    public void setFechaModificacion(Object fechaModificacion) {
        this.fechaModificacion = fechaModificacion;
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

    public Object getNombreUsu() {
        return nombreUsu;
    }

    public void setNombreUsu(Object nombreUsu) {
        this.nombreUsu = nombreUsu;
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
