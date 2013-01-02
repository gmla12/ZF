/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import forms.BLForm;
import forms.BLOpForm;
import forms.bean.BeanBL;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import util.ConeccionMySql;

/**
 *
 * @author Mario
 */
public class GestionBL extends ConeccionMySql {

    Connection cn = null;
    Statement st = null;

    public ArrayList<Object> IngresaBL(BLForm f, Boolean transac, Connection tCn) {

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

            psInsertar = cn.prepareStatement("insert into BLs (bl, cliente, motonave, eta, lote, fmm, susuarios_id, fecha_modificacion) values (?,?,?,?,?,?,?,now())", PreparedStatement.RETURN_GENERATED_KEYS);
            psInsertar.setString(1, f.getBL());
            psInsertar.setString(2, f.getCliente());
            psInsertar.setString(3, f.getMotonave());
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy h:mm a");
            Date dtf = sdf.parse(f.getEtaFecha() + " " + f.getEtaHora());
            java.sql.Timestamp momentoTimestamp = new java.sql.Timestamp(dtf.getTime());
            psInsertar.setTimestamp(4, momentoTimestamp);
            psInsertar.setString(5, f.getLote());
            psInsertar.setString(6, f.getFMM());
            psInsertar.setInt(7, f.getIdUsu());
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
    private ArrayList<Object> GR_BL;

    public ArrayList<Object> MostrarBL(Boolean transac, Connection tCn) {

        ArrayList<Object> resultado = new ArrayList<Object>();
        PreparedStatement psSelectConClave = null;

        try {

            GR_BL = new ArrayList<Object>();

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

            psSelectConClave = cn.prepareStatement("SELECT p.idBLs, p.BL, p.cliente, p.motonave, p.eta, p.lote, p.fmm FROM BLs p");
            ResultSet rs = psSelectConClave.executeQuery();

            BeanBL bu;
            while (rs.next()) {
                bu = new BeanBL();

                bu.setIdBLs(rs.getObject("p.idBLs"));
                bu.setBL(rs.getObject("p.BL"));
                bu.setCliente(rs.getObject("p.cliente"));
                bu.setMotonave(rs.getObject("p.motonave"));
                Date dtt = (Date) rs.getObject("p.eta");
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(dtt);
                bu.setEtaFecha(String.valueOf(calendar.get(Calendar.DAY_OF_MONTH)) + "/" + String.valueOf(calendar.get(Calendar.MONTH) + 1) + "/" + String.valueOf(calendar.get(Calendar.YEAR)));
                int hora24 = calendar.get(Calendar.HOUR_OF_DAY); //hora en formato 24hs
                int minutos = calendar.get(Calendar.MINUTE);
                String hh;
                String h = "";
                String h2 = "";
                if (hora24 > 12) {
                    hora24 = hora24 - 12;
                    hh = "PM";
                } else {
                    hh = "AM";
                }
                if (hora24 < 10) {
                    h = "0";
                }
                if (minutos < 10) {
                    h2 = "0";
                }
                bu.setEtaHora(h + String.valueOf(hora24) + ":" + h2 + minutos + " " + hh);
                bu.setLote(rs.getObject("p.lote"));
                bu.setFMM(rs.getObject("p.fmm"));

                GR_BL.add(bu);


            }

            if (transac == false) { // si no es una transaccion cierra la conexion

                cn.close();

            }

            resultado.add(false); //si no hubo un error asigna false
            resultado.add(GR_BL); // y registros consultados

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

    public ArrayList<Object> MostrarBLOP(BLOpForm f, Boolean transac, Connection tCn) {

        ArrayList<Object> resultado = new ArrayList<Object>();
        PreparedStatement psSelectConClave = null;

        try {

            GR_BL = new ArrayList<Object>();

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

            String query = "SELECT p.idBLs, p.BL, p.cliente, p.motonave, p.eta, p.lote, p.fmm ";
            query += "FROM BLs p ";
            String query2 = "";
            if (f.getbBL().isEmpty() != true) {
                query2 = "p.BL LIKE CONCAT('%',?,'%')";
            }
            if (f.getbCliente().isEmpty() != true) {
                if (query2.isEmpty() != true) {
                    query2 += "AND ";
                }
                query2 += "p.cliente LIKE CONCAT('%',?,'%')";
            }
            if (f.getbMotonave().isEmpty() != true) {
                if (query2.isEmpty() != true) {
                    query2 += "AND ";
                }
                query2 += "p.motonave LIKE CONCAT('%',?,'%')";
            }
            if (f.getbEtaDFecha().isEmpty() != true) {
                if (query2.isEmpty() != true) {
                    query2 += "AND ";
                }
                query2 += "p.eta >= ?";
            }
            if (f.getbEtaHFecha().isEmpty() != true) {
                if (query2.isEmpty() != true) {
                    query2 += "AND ";
                }
                query2 += "p.eta <= ?";
            }
            if (f.getbLote().isEmpty() != true) {
                if (query2.isEmpty() != true) {
                    query2 += "AND ";
                }
                query2 += "p.lote LIKE CONCAT('%',?,'%')";
            }
            if (f.getbFMM().isEmpty() != true) {
                if (query2.isEmpty() != true) {
                    query2 += "AND ";
                }
                query2 += "p.fmm LIKE CONCAT('%',?,'%')";
            }
            if (query2.isEmpty() != true) {
                query += "WHERE " + query2;
            }

            psSelectConClave = cn.prepareStatement(query);
            int i = 0;
            if (f.getbBL().isEmpty() != true) {
                i++;
                psSelectConClave.setString(i, f.getbBL());
            }
            if (f.getbCliente().isEmpty() != true) {
                i++;
                psSelectConClave.setString(i, f.getbCliente());
            }
            if (f.getbMotonave().isEmpty() != true) {
                i++;
                psSelectConClave.setString(i, f.getbMotonave());
            }
            if (f.getbEtaDFecha().isEmpty() != true) {
                java.sql.Timestamp momentoTimestamp;
                if (f.getbEtaDHora().isEmpty() != true) {
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy h:mm a");
                    Date dtf = sdf.parse(f.getbEtaDFecha() + " " + f.getbEtaDHora());
                    momentoTimestamp = new java.sql.Timestamp(dtf.getTime());
                } else {
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    Date dtf = sdf.parse(f.getbEtaDFecha());
                    momentoTimestamp = new java.sql.Timestamp(dtf.getTime());
                }
                i++;
                psSelectConClave.setTimestamp(i, momentoTimestamp);
            }
            if (f.getbEtaHFecha().isEmpty() != true) {
                java.sql.Timestamp momentoTimestamp;
                if (f.getbEtaHHora().isEmpty() != true) {
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy h:mm a");
                    Date dtf = sdf.parse(f.getbEtaHFecha() + " " + f.getbEtaHHora());
                    momentoTimestamp = new java.sql.Timestamp(dtf.getTime());
                } else {
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    Date dtf = sdf.parse(f.getbEtaHFecha());
                    momentoTimestamp = new java.sql.Timestamp(dtf.getTime());
                }
                i++;
                psSelectConClave.setTimestamp(i, momentoTimestamp);
            }
            if (f.getbLote().isEmpty() != true) {
                i++;
                psSelectConClave.setString(i, f.getbLote());
            }
            if (f.getbFMM().isEmpty() != true) {
                i++;
                psSelectConClave.setString(i, f.getbFMM());
            }
            ResultSet rs = psSelectConClave.executeQuery();

            BeanBL bu;
            while (rs.next()) {

                bu = new BeanBL();

                bu.setIdBLs(rs.getObject("p.idBLs"));
                bu.setBL(rs.getObject("p.BL"));
                bu.setCliente(rs.getObject("p.cliente"));
                bu.setMotonave(rs.getObject("p.motonave"));
                Date dtt = (Date) rs.getObject("p.eta");
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(dtt);
                bu.setEtaFecha(String.valueOf(calendar.get(Calendar.DAY_OF_MONTH)) + "/" + String.valueOf(calendar.get(Calendar.MONTH) + 1) + "/" + String.valueOf(calendar.get(Calendar.YEAR)));
                int hora24 = calendar.get(Calendar.HOUR_OF_DAY); //hora en formato 24hs
                int minutos = calendar.get(Calendar.MINUTE);
                String hh;
                String h = "";
                String h2 = "";
                if (hora24 > 12) {
                    hora24 = hora24 - 12;
                    hh = "PM";
                } else {
                    hh = "AM";
                }
                if (hora24 < 10) {
                    h = "0";
                }
                if (minutos < 10) {
                    h2 = "0";
                }
                bu.setEtaHora(h + String.valueOf(hora24) + ":" + h2 + minutos + " " + hh);
                bu.setLote(rs.getObject("p.lote"));
                bu.setFMM(rs.getObject("p.FMM"));

                GR_BL.add(bu);

            }

            if (transac == false) { // si no es una transaccion cierra la conexion

                cn.close();

            }

            resultado.add(false); //si no hubo un error asigna false
            resultado.add(GR_BL); // y registros consultados

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

    public ArrayList<Object> ModificaBL(BLForm f, Boolean transac, Connection tCn) {

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

            String query = "UPDATE BLs SET cliente = ?, motonave = ?, eta = ?, lote = ?, fmm = ?, susuarios_id=?, fecha_modificacion=now()";
            query += " WHERE idBLs = ?";
            psUpdate = cn.prepareStatement(query);
            psUpdate.setString(1, f.getCliente());
            psUpdate.setString(2, f.getMotonave());
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy h:mm a");
            Date dtf = sdf.parse(f.getEtaFecha() + " " + f.getEtaHora());
            java.sql.Timestamp momentoTimestamp = new java.sql.Timestamp(dtf.getTime());
            psUpdate.setTimestamp(3, momentoTimestamp);
            psUpdate.setString(4, f.getLote());
            psUpdate.setString(5, f.getFMM());
            psUpdate.setInt(6, f.getIdUsu());
            psUpdate.setInt(7, f.getIdBLs());
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

    public ArrayList<Object> ModificaBLUsu(BLForm f, Boolean transac, Connection tCn) {

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

            String query = "UPDATE BLs SET susuarios_id=?, fecha_modificacion=now()";
            query += " WHERE idBLs = ?";
            psUpdate = cn.prepareStatement(query);
            psUpdate.setInt(1, f.getIdUsu());
            psUpdate.setInt(2, f.getIdBLs());
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

    public ArrayList<Object> EliminaBL(BLForm f, Boolean transac, Connection tCn) {

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

            psDelete = cn.prepareStatement("DELETE FROM BLs WHERE idBLs = ?");
            psDelete.setInt(1, f.getIdBLs());
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

    public ArrayList<Object> BuscarBL(Integer idBLs, Boolean transac, Connection tCn) {

        ArrayList<Object> resultado = new ArrayList<Object>();
        BeanBL bu;
        bu = new BeanBL();
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

            psSelectConClave = cn.prepareStatement("SELECT p.idBLs FROM BLs p WHERE p.idBLs = ?");
            psSelectConClave.setInt(1, idBLs);
            ResultSet rs = psSelectConClave.executeQuery();

            while (rs.next()) {
                bu = new BeanBL();

                bu.setIdBLs(rs.getObject("p.idBLs"));
                Integer p = (Integer) bu.getIdBLs();
                if (p.equals(idBLs)) {
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

    public ArrayList<Object> MostrarBLFormulario(Integer IdBLs, Boolean transac, Connection tCn) {

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

            psSelectConClave = cn.prepareStatement("SELECT p.idBLs, p.BL, p.cliente, p.motonave, p.eta, p.lote, p.FMM, p.susuarios_id, IF(e.primer_nombre <> NULL AND e.primer_apellido <> NULL, e.razon_Social, CONCAT(IF(e.primer_nombre <> NULL,'',CONCAT(e.primer_nombre,' ')), IF(e.segundo_nombre <> NULL,'',CONCAT(e.segundo_nombre,' ')), IF(e.primer_apellido <> NULL,'',CONCAT(e.primer_apellido,' ')), IF(e.segundo_apellido <> NULL,'',CONCAT(e.segundo_apellido,' ')))) as nombre_usu, p.fecha_modificacion FROM BLs p INNER JOIN susuarios r ON p.susuarios_id = r.id INNER JOIN entidades e ON r.id_tipo_documento = e.id_tipo_documento AND r.identificacion = e.identificacion WHERE p.idBLs = ?");
            psSelectConClave.setInt(1, IdBLs);
            ResultSet rs = psSelectConClave.executeQuery();

            BeanBL bu;
            while (rs.next()) {
                bu = new BeanBL();

                setIdBLs(rs.getObject("p.idBLs"));
                setBL(rs.getObject("p.BL"));
                setCliente(rs.getObject("p.cliente"));
                setMotonave(rs.getObject("p.motonave"));
                Date dtt = (Date) rs.getObject("p.eta");
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(dtt);
                setEtaFecha(String.valueOf(calendar.get(Calendar.DAY_OF_MONTH)) + "/" + String.valueOf(calendar.get(Calendar.MONTH) + 1) + "/" + String.valueOf(calendar.get(Calendar.YEAR)));
                int hora24 = calendar.get(Calendar.HOUR_OF_DAY); //hora en formato 24hs
                int minutos = calendar.get(Calendar.MINUTE);
                String hh;
                String h = "";
                String h2 = "";
                if (hora24 > 12) {
                    hora24 = hora24 - 12;
                    hh = "PM";
                } else {
                    hh = "AM";
                }
                if (hora24 < 10) {
                    h = "0";
                }
                if (minutos < 10) {
                    h2 = "0";
                }
                setEtaHora(h + String.valueOf(hora24) + ":" + h2 + minutos + " " + hh);
                setLote(rs.getObject("p.lote"));
                setFMM(rs.getObject("p.FMM"));
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
    private Object idBLs;
    private Object BL;
    private Object cliente;
    private Object motonave;
    private Object etaFecha;
    private Object etaHora;
    private Object lote;
    private Object FMM;
    private Object nombreUsu;
    private Object fechaModificacion;

    public Object getBL() {
        return BL;
    }

    public void setBL(Object BL) {
        this.BL = BL;
    }

    public Object getFMM() {
        return FMM;
    }

    public void setFMM(Object FMM) {
        this.FMM = FMM;
    }

    public Object getCliente() {
        return cliente;
    }

    public void setCliente(Object cliente) {
        this.cliente = cliente;
    }

    public Object getEtaFecha() {
        return etaFecha;
    }

    public void setEtaFecha(Object etaFecha) {
        this.etaFecha = etaFecha;
    }

    public Object getEtaHora() {
        return etaHora;
    }

    public void setEtaHora(Object etaHora) {
        this.etaHora = etaHora;
    }

    public Object getFechaModificacion() {
        return fechaModificacion;
    }

    public void setFechaModificacion(Object fechaModificacion) {
        this.fechaModificacion = fechaModificacion;
    }

    public Object getIdBLs() {
        return idBLs;
    }

    public void setIdBLs(Object idBLs) {
        this.idBLs = idBLs;
    }

    public Object getLote() {
        return lote;
    }

    public void setLote(Object lote) {
        this.lote = lote;
    }

    public Object getMotonave() {
        return motonave;
    }

    public void setMotonave(Object motonave) {
        this.motonave = motonave;
    }

    public Object getNombreUsu() {
        return nombreUsu;
    }

    public void setNombreUsu(Object nombreUsu) {
        this.nombreUsu = nombreUsu;
    }
}
