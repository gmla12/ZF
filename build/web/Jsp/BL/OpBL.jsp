<%-- 
    Document   : OpBL
    Created on : 25-diciembre-2012, 22:23:34
    Author     : Gilberth
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri= "/WEB-INF/c.tld" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html:html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" href="css/ui.all.css" rel="stylesheet" />
        <link type="text/css" href="css/comun.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" media="screen" href="css/ui.jqgrid.css" />
        <link type="text/css" href="css/jquery-ui.css" rel="stylesheet" />
        <script type="text/javascript" src="Js/jquery-1.8.3.js"></script>
        <script type="text/javascript" src="Js/ui/ui.datepicker.js"></script>
        <script type="text/javascript" src="Js/ui/globalize.js"></script>
        <script type="text/javascript" src="Js/ui/jquery-ui.js"></script>
        <script src="Js/i18n/grid.locale-es.js" type="text/javascript"></script>
        <script src="Js/jquery.jqGrid.min.js" type="text/javascript"></script>
        <title>Opciones BLs</title>
        <%
            String usuario = "";
            HttpSession sesionOk = request.getSession();
            if (sesionOk.getAttribute("usuario") == null) {
        %>
        <jsp:forward page="/index.jsp">
            <jsp:param name="mensaje" value="Es obligatorio identificarse"/>
        </jsp:forward>
        <%    } else {
                usuario = String.valueOf(sesionOk.getAttribute("usuario"));
            }
        %>
        <%
            if (request.getAttribute("getOp") == "buscar") {
        %>
        <jsp:forward page="/OpBL.do">
            <jsp:param name="getOp" value="buscar"/>
        </jsp:forward>
        <%            }
        %>

        <script type="text/javascript">
            $(document).ready(function(){
                anchoPantalla = document.body.offsetWidth - 50;
            })

            $(function(){ 
                jQuery("#list4").jqGrid({
                    url:'Jsp/BL/getGriddahico.jsp?op=bus',
                    datatype: "json",
                    colNames:['ID', 'BL', 'Cliente', 'Motonave', 'Eta', 'Lote', 'FMM', 'Editar'],
                    colModel:[
                        {name:'idBLs',index:'idBLs', width:50, sortable:false},
                        {name:'BL',index:'BL', width:160, sortable:false},
                        {name:'cliente',index:'cliente', width:160, sortable:false},
                        {name:'motonave',index:'motonave', width:160, sortable:false},
                        {name:'eta',index:'eta', width:160, sortable:false},
                        {name:'lote',index:'lote', width:160, sortable:false},
                        {name:'FMM',index:'FMM', width:160, sortable:false},
                        {name:'editar',index:'editar', width:110, formatter:'showlink', sortable:false}
                    ],
                    pager: '#prowed1',
                    width: anchoPantalla,
                    height: "100%",
                    rowNum:10,
                    viewrecords: true,
                    caption: "Lista de BLs"
                }); 
                
                jQuery("#list4").jqGrid('navGrid',"#prowed1",{edit:false,add:false,del:false,search:false});
                
                $('input').filter('.datepicker').datepicker({
                    changeMonth: true,
                    changeYear: true,
                    showOn: "button",
                    buttonImage: "img/calendar.gif",
                    buttonImageOnly: true,
                    dateFormat: "dd/mm/yy"
                });
                
                $.widget( "ui.timespinner", $.ui.spinner, {
                    options: {
                        // seconds
                        step: 60 * 1000,
                        // hours
                        page: 60
                    },
 
                    _parse: function( value ) {
                        if ( typeof value === "string" ) {
                            // already a timestamp
                            if ( Number( value ) == value ) {
                                return Number( value );
                            }
                            return +Globalize.parseDate( value );
                        }
                        return value;
                    },
 
                    _format: function( value ) {
                        return Globalize.format( new Date(value), "t" );
                    }
                });
                
                $('input').filter('.spinner').timespinner();
            }); 
            
            function buscar(){
                var sw = true;
                var df = true, hf = true;
                //alert('afuera');
                if (document.forms[0].bEtaDHora.value != "") {
                    //alert('entro dh');
                    if (document.forms[0].bEtaDFecha.value == "") {
                        sw = false;
                        //alert('entro df');
                        df = false;
                    }
                }
                if (document.forms[0].bEtaHHora.value != "") {
                    //alert('entro hh');
                    if (document.forms[0].bEtaHFecha.value == "") {
                        sw = false;
                        //alert('entro hd');
                        hf = true;
                    }
                }
                if (sw == true){
                    //alert('entro sw');
                    document.forms[0].op.value="buscar";
                    document.forms[0].id.value="";
                    document.forms[0].submit();
                } else {
                    if (df == false && hf == false){
                        alert("Debe ingresar la fecha Desde y Hasta");
                    } else {
                        if (df == false){
                            alert("Debe ingresar la fecha Desde");
                        } else {
                            alert("Debe ingresar la fecha Hasta");
                        }
                    }
                }
            }
            
            function modifica(id){
                document.forms[0].op.value="modificar";
                document.forms[0].id.value=id;
                document.forms[0].submit();
            }

            function nuevo(){
                document.forms[0].op.value="nuevo";
                document.forms[0].id.value="";
                document.forms[0].submit();
            }

            function historico(){
                var emer = window.open('../ZF/Jsp/Log/Auditoria/Auditoria2.jsp?getOp=buscar&accion=eliminadas&formulario=BL&num=1','Auditoria','width=950,height=500,top=100%,left=100%,scrollbars=yes,resizable=yes');
                emer.focus();
            }
        </script>
    </head>
    <body  bgcolor="#EFFBFB">
        <html:form action="/OpBL.do" method="post">
            <input type="hidden" name="op" value=""> 
            <input type="hidden" name="id" value=""> 
            <fieldset>
                <legend>Consulta de BLs</legend>
                <table>
                    <tr>
                        <td>BL<input type="text" name="bBL" size="40" value="<%= session.getAttribute("getbBL")%>"/> </td>
                        <td>Cliente<input type="text" name="bCliente" size="40" value="<%= session.getAttribute("getbCliente")%>"/> </td>
                        <td><a class="boton" href="javascript:buscar()">Buscar</a></td>
                        <td><a class="boton" href="javascript:nuevo()">Nuevo</a></td>
                        <td><a class="boton" href="javascript:historico()">Historico Eliminados</a></td>
                    </tr>
                    <tr>
                        <td>Motonave<input type="text" name="bMotonave" size="40" value="<%= session.getAttribute("getbMotonave")%>"/> </td>
                        <td>Lote<input type="text" name="bLote" size="40" value="<%= session.getAttribute("getbLote")%>"/> </td>
                        <td colspan="2">FMM<input type="text" name="bFMM" size="40" value="<%= session.getAttribute("getbFMM")%>"/> </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            Eta Desde
                            <input type="text" name="bEtaDFecha" class="datepicker" size="20" value="<%= session.getAttribute("getbEtaDFecha")%>"/>
                            <input type="text" name="bEtaDHora" class="spinner" size="10" value="<%= session.getAttribute("getbEtaDHora")%>"/>
                        </td>
                        <td colspan="2">
                            Hasta
                            <input type="text" name="bEtaHFecha" class="datepicker" size="20" value="<%= session.getAttribute("getbEtaHFecha")%>"/>
                            <input type="text" name="bEtaHHora" class="spinner" size="10" value="<%= session.getAttribute("getbEtaHHora")%>"/>
                        </td>
                    </tr>
                </table>
            </fieldset>
            <fieldset>
                <legend>Listado de BLs</legend>
                <table>
                    <tr>
                        <td><table id="list4"></table></td>
                        <td><div id="prowed1"></div></td>
                    </tr>
                </table>
            </fieldset>
        </html:form>
    </body>
</html:html>
