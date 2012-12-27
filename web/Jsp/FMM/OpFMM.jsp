<%-- 
    Document   : OpFMM
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
        <script src="Js/jquery-1.7.2.min.js" type="text/javascript"></script>
        <script src="Js/i18n/grid.locale-es.js" type="text/javascript"></script>
        <script src="Js/jquery.jqGrid.min.js" type="text/javascript"></script>
        <title>Opciones FMMs</title>
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
        <jsp:forward page="/OpFMM.do">
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
                    url:'Jsp/FMM/getGriddahico.jsp?op=bus',
                    datatype: "json",
                    colNames:['ID', 'FMM', 'Cliente', 'Pedido', 'Lote', 'Editar'],
                    colModel:[
                        {name:'idFMMs',index:'idFMMs', width:50, sortable:false},
                        {name:'FMM',index:'FMM', width:160, sortable:false},
                        {name:'cliente',index:'cliente', width:160, sortable:false},
                        {name:'pedido',index:'pedido', width:160, sortable:false},
                        {name:'lote',index:'lote', width:160, sortable:false},
                        {name:'editar',index:'editar', width:110, formatter:'showlink', sortable:false}
                    ],
                    pager: '#prowed1',
                    width: anchoPantalla,
                    height: "100%",
                    rowNum:10,
                    viewrecords: true,
                    caption: "Lista de FMMs"
                }); 
                jQuery("#list4").jqGrid('navGrid',"#prowed1",{edit:false,add:false,del:false,search:false});
            }); 
            
            function buscar(){
                document.forms[0].op.value="buscar";
                document.forms[0].id.value="";
                document.forms[0].submit();
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
                var forma = document.forms[0];
                var emer = window.open('../ZF/Jsp/Log/Auditoria/Auditoria2.jsp?getOp=buscar&accion=eliminadas&formulario=fmm&num=1','Auditoria','width=950,height=500,top=100%,left=100%,scrollbars=yes,resizable=yes');
                emer.focus();
            }
        </script>
    </head>
    <body  bgcolor="#EFFBFB">
        <html:form action="/OpFMM.do" method="post">
            <input type="hidden" name="op" value=""> 
            <input type="hidden" name="id" value=""> 
            <fieldset>
                <legend>Consulta de FMMs</legend>
                <table>
                    <tr>
                        <td>FMM<input type="text" name="bFMM" size="40" value="<%= session.getAttribute("getbFMM")%>"/> </td>
                        <td>Cliente<input type="text" name="bCliente" size="40" value="<%= session.getAttribute("getbCliente")%>"/> </td>
                        <td><a class="boton" href="javascript:buscar()">Buscar</a></td>
                        <td><a class="boton" href="javascript:nuevo()">Nuevo</a></td>
                        <td><a class="boton" href="javascript:historico()">Historico Eliminados</a></td>
                    </tr>
                    <tr>
                        <td>Pedido<input type="text" name="bPedido" size="40" value="<%= session.getAttribute("getbPedido")%>"/> </td>
                        <td>Lote<input type="text" name="bLote" size="40" value="<%= session.getAttribute("getbLote")%>"/> </td>
                    </tr>
                </table>
            </fieldset>
            <fieldset>
                <legend>Listado de FMMs</legend>
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
