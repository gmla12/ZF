<%-- 
    Document   : FMM
    Created on : 24-diciembre-2012, 7:52:01
    Author     : Gilberth
--%>

<%@page import="forms.bean.BeanTipoDocumentoAut"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri= "/WEB-INF/c.tld" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html:html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FMMs</title>
        <link type="text/css" href="css/ui.all.css" rel="stylesheet" />
        <link type="text/css" href="css/comun.css" rel="stylesheet" />
        <script src="Js/jquery-1.7.2.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="Js/jquery.validate.js"></script>
        <script type="text/javascript" src="Js/ui/ui.datepicker.js"></script>
        <script type="text/javascript" src="Js/ui/ui.core.js"></script>
        <script src="Js/i18n/messages_es.js" type="text/javascript"></script>
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
        <script type="text/javascript">
            $(function() {
                //guardar
                $('#submit').click(function(e) {
                    e.preventDefault();
                    document.forms[0].idUsu.value=<%= session.getAttribute("idusu")%>
                    if(document.forms[0].idFMMs.value==""){
                        document.forms[0].op.value="nuevo";
                    }
                    else {
                        document.forms[0].op.value="modificar";
                    }
                    $("#forma").submit(); 
                }); 
                $("#forma").validate({
                    event: "blur",
                    rules : {
                        FMM : {
                            required : true,
                            minlength : 3,
                            maxlength : 50
                        },
                        cliente : {
                            required : true,
                            minlength : 3,
                            maxlength : 50
                        }
                    },
                    debug: false,
                    errorElement: "label",
                    submitHandler: function(form){
                        form.submit();
                        //alert('El formulario ha sido validado correctamente!');
                    }
                });

                $('input').filter('.datepicker').datepicker({
                    changeMonth: true,
                    changeYear: true,
                    showOn: "button",
                    buttonImage: "img/calendar.gif",
                    buttonImageOnly: true,
                    dateFormat: "dd/mm/yy"
                });
            });
                
            function nuevo(){
                document.forms[0].op.value="";
                document.forms[0].op2.value="";
                document.forms[0].idFMMs.value="";
                document.forms[0].FMM.value="";
                document.forms[0].cliente.value="";
                document.forms[0].pedido.value="";
                document.forms[0].lote.value="";
                document.getElementById('nombreUsu').innerHTML = "";
                document.getElementById('fechaModificacion').innerHTML = "";
            }

            function eliminar(){
                document.forms[0].op.value="eliminar";
                document.forms[0].idUsu.value=<%= session.getAttribute("idusu")%>
                document.forms[0].submit();
            }
            
            function atras(){
                document.forms[0].op.value="atras";
                document.forms[0].submit();
            }

            function historico(){
                var forma = document.forms[0];
                var emer = window.open('../ZF/Jsp/Log/Auditoria/Auditoria.jsp?getOp=buscar&accion=referencia&formulario=fmm&referencia='+'<%=request.getAttribute("getIdFMMs")%>','Auditoria','width=950,height=500,top=100%,left=100%,scrollbars=yes,resizable=yes');
                emer.focus();
            }
            
            function toggleLayer(whichLayer) {
                if (document.getElementById) {
                    // this is the way the standards work
                    var style2 = document.getElementById(whichLayer).style;
                    if(arguments.length == 2){
                        style2.display = arguments[1]==true?"inline":"none";
                        return;
                    }
                    if(style2.display.length == 0 || style2.display == "inline"){
                        style2.display = "none";
                    }
                    else{
                        style2.display = "inline";
                    }
                    //		style2.display = "none";
                } else if (document.all) {
                    // this is the way old msie versions work
                    var style2 = document.all[whichLayer].style;
                    if(arguments.length == 2){
                        style2.display = arguments[1]==true?"block":"";
                        return;
                    }
                    style2.display = style2.display? "":"block";
                } else if (document.layers) {
                    // this is the way nn4 works
                    var style2 = document.layers[whichLayer].style;
                    if(arguments.length == 2){
                        style2.display = arguments[1]==true?"block":"";
                        return;
                    }
                    style2.display = style2.display? "":"block";
                }
            }
        </script>

        <style type="text/css">
            .error-message, label.error {
                color: #ff0000;
                margin:0;
                display: inline;
                font-size: 1em !important;
                font-weight:lighter;
            }
            #el01 {
                padding:0
            }
        </style>
    </head>
    <body>
        <div id="stylized" class="myform">
            <html:form styleClass="forma" styleId="forma" action="/FMM" method="post">

                <input type="hidden" name="op" value=""> 
                <input type="hidden" name="op2" value="<%= String.valueOf(request.getAttribute("getOp2"))%>"> 
                <input type="hidden" name="idUsu" value=""> 
                <input type="hidden" name="idFMMs" value='<%= String.valueOf(request.getAttribute("getIdFMMs"))%>'> 

                <h1>FMMs</h1>
                <div>
                    <label for="txtFMM">FMM</label>
                    <% if (request.getAttribute("getIdFMMs") != "") {%> 
                    <html:text property="FMM" readonly="true" value='<%= String.valueOf(request.getAttribute("getFMM"))%>'></html:text>
                    <% } else {%> 
                    <html:text property="FMM" value='<%= String.valueOf(request.getAttribute("getFMM"))%>'></html:text>
                    <% }%> 
                </div>
                <div>
                    <label for="txtCliente">Cliente</label>
                    <html:text property="cliente" value='<%= String.valueOf(request.getAttribute("getCliente"))%>'></html:text>
                </div>
                <div>
                    <label for="txtPedido">Pedido</label>
                    <html:text property="pedido" value='<%= String.valueOf(request.getAttribute("getPedido"))%>'></html:text>
                </div>
                <div>
                    <label for="txtLote">Lote</label>
                    <html:text property="lote" value='<%= String.valueOf(request.getAttribute("getLote"))%>'></html:text>
                </div>
                <div>
                    <fieldset id="el01">
                        <legend>Items</legend>
                        <table>
                            <tr>
                                <td colspan="2">
                                    <input type="checkbox" name="todos" value="true"> Seleccionar Todos
                                </td>
                                <td rowspan="2">
                                    <fieldset id="el01">
                                        <table>
                                            <tr>
                                                <td>
                                                    <input type="checkbox" name="todos" value="true"> Seleccionar Todos
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <fieldset id="el01">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox" name="checkReferencia" value="true"> Referencia
                                                                </td>
                                                                <% if (request.getAttribute("getOp2") != "nuevo") {%> 
                                                                <td colspan="2"><html:text property="referencia" styleId="referencia" readonly="true" value='<%= String.valueOf(request.getAttribute("getReferencia"))%>'></html:text></td>
                                                                <% } else {%> 
                                                                <td colspan="2"><html:text property="referencia" styleId="referencia" value='<%= String.valueOf(request.getAttribute("getReferencia"))%>'></html:text></td>
                                                                <% }%> 
                                                                <td colspan="2">
                                                                    <input type="checkbox" name="checkPedido" value="true"> Pedido
                                                                </td>
                                                                <% if (request.getAttribute("getOp2") != "nuevo") {%> 
                                                                <td colspan="2"><html:text property="pedido" styleId="pedido" readonly="true" value='<%= String.valueOf(request.getAttribute("getPedido"))%>'></html:text></td>
                                                                <% } else {%> 
                                                                <td colspan="2"><html:text property="pedido" styleId="pedido" value='<%= String.valueOf(request.getAttribute("getPedido"))%>'></html:text></td>
                                                                <% }%> 
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox" name="checkDescripcion" value="true"> Descripcion
                                                                </td>
                                                                <% if (request.getAttribute("getOp2") != "nuevo") {%> 
                                                                <td colspan="2"><html:text property="descripcion" styleId="descripcion" readonly="true" value='<%= String.valueOf(request.getAttribute("getDescripcion"))%>'></html:text></td>
                                                                <% } else {%> 
                                                                <td colspan="2"><html:text property="referencia" styleId="referencia" value='<%= String.valueOf(request.getAttribute("getReferencia"))%>'></html:text></td>
                                                                <% }%> 
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox" name="checkClienteFinal" value="true"> Cliente Final
                                                                </td>
                                                                <% if (request.getAttribute("getOp2") != "nuevo") {%> 
                                                                <td colspan="2"><html:text property="clienteFinal" styleId="clienteFinal" readonly="true" value='<%= String.valueOf(request.getAttribute("getClienteFinal"))%>'></html:text></td>
                                                                <% } else {%> 
                                                                <td colspan="2"><html:text property="clienteFinal" styleId="clienteFinal" value='<%= String.valueOf(request.getAttribute("getClienteFinal"))%>'></html:text></td>
                                                                <% }%> 
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox" name="checkProveedor" value="true"> Proveedor
                                                                </td>
                                                                <% if (request.getAttribute("getOp2") != "nuevo") {%> 
                                                                <td colspan="2"><html:select property="idProveedor" styleId="idProveedor" size="1" style="width:240px;" disabled="true" value='<%= String.valueOf(request.getAttribute("getIdProveedor"))%>'>
                                                                        <c:forEach items="${CMB_PROVEEDOR}" var="cat">
                                                                            <html:option value="${cat.idProveedor}"><c:out value='${cat.nombre}'/></html:option>
                                                                        </c:forEach>
                                                                    </html:select></td>
                                                                    <% } else {%> 
                                                                <td colspan="2"><html:select property="idProveedor" styleId="idProveedor" size="1" style="width:240px;" value='<%= String.valueOf(request.getAttribute("getIdProveedor"))%>'>
                                                                        <html:option value=""><c:out value='[Seleccione]'/></html:option>
                                                                        <c:forEach items="${CMB_PROVEEDOR}" var="cat">
                                                                            <html:option value="${cat.idProveedor}"><c:out value='${cat.nombre}'/></html:option>
                                                                        </c:forEach>
                                                                    </html:select></td>
                                                                    <% }%>
                                                                <td colspan="2">
                                                                    <input type="checkbox" name="checFechaEstimadaArribo" value="true"> Fecha Estimada de Arribo
                                                                </td>
                                                                <% if (request.getAttribute("getOp2") != "nuevo") {%> 
                                                                <td colspan="2"><html:text property="fechaEstimadaArribo"  styleClass="datepicker" styleId="fechaEstimadaArribo" readonly="true" value='<%= String.valueOf(request.getAttribute("getFechaEstimadaArribo"))%>'></html:text></td>
                                                                <% } else {%> 
                                                                <td colspan="2"><html:text property="fechaEstimadaArribo" styleClass="datepicker" styleId="fechaEstimadaArribo" value='<%= String.valueOf(request.getAttribute("getFechaEstimadaArribo"))%>'></html:text></td>
                                                                <% }%>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox" name="checkFechaLlegada" value="true"> Fecha de Llegada
                                                                </td>
                                                                <% if (request.getAttribute("getOp2") != "nuevo") {%> 
                                                                <td colspan="2"><html:text property="fechaLlegada" styleClass="datepicker" styleId="fechaLlegada" readonly="true" value='<%= String.valueOf(request.getAttribute("getFechaLlegada"))%>'></html:text></td>
                                                                <% } else {%> 
                                                                <td colspan="2"><html:text property="fechaLlegada" styleClass="datepicker" styleId="fechaLlegada" value='<%= String.valueOf(request.getAttribute("getFechaLlegada"))%>'></html:text></td>
                                                                <% }%>
                                                                <td colspan="2">
                                                                    <input type="checkbox" name="checFechaDocumentos" value="true"> Fecha Documentos
                                                                </td>
                                                                <% if (request.getAttribute("getOp2") != "nuevo") {%> 
                                                                <td colspan="2"><html:text property="fechaDocumentos" styleClass="datepicker" styleId="fechaDocumentos" readonly="true" value='<%= String.valueOf(request.getAttribute("getFechaDocumentos"))%>'></html:text></td>
                                                                <% } else {%> 
                                                                <td colspan="2"><html:text property="fechaDocumentos" styleClass="datepicker" styleId="fechaDocumentos" value='<%= String.valueOf(request.getAttribute("getFechaDocumentos"))%>'></html:text></td>
                                                                <% }%>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox" name="checkFechaDocumentosOK" value="true"> Fecha de Documentos OK
                                                                </td>
                                                                <% if (request.getAttribute("getOp2") != "nuevo") {%> 
                                                                <td colspan="2"><html:text property="fechaDocumentosOK" styleClass="datepicker" styleId="fechaDocumentosOK" readonly="true" value='<%= String.valueOf(request.getAttribute("getFechaDocuemtnosOK"))%>'></html:text></td>
                                                                <% } else {%> 
                                                                <td colspan="2"><html:text property="fechaDocumentosOK" styleClass="datepicker" styleId="fechaDocumentosOK" value='<%= String.valueOf(request.getAttribute("getFechaDocuemtnosOK"))%>'></html:text></td>
                                                                <% }%>
                                                                <td colspan="2">
                                                                    <input type="checkbox" name="checFechaAceptacion" value="true"> Fecha de Aceptacion
                                                                </td>
                                                                <% if (request.getAttribute("getOp2") != "nuevo") {%> 
                                                                <td colspan="2"><html:text property="fechaAceptacion" styleClass="datepicker" styleId="fechaAceptacion" readonly="true" value='<%= String.valueOf(request.getAttribute("getFechaAceptacion"))%>'></html:text></td>
                                                                <% } else {%> 
                                                                <td colspan="2"><html:text property="fechaAceptacion" styleClass="datepicker" styleId="fechaAceptacion" value='<%= String.valueOf(request.getAttribute("getFechaAceptacion"))%>'></html:text></td>
                                                                <% }%>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox" name="checkFechaSolicitudAnticipo" value="true"> Fecha de Solicitud de Anticipo
                                                                </td>
                                                                <% if (request.getAttribute("getOp2") != "nuevo") {%> 
                                                                <td colspan="2"><html:text property="fechaSolicitudAnticipo" styleClass="datepicker" styleId="fechaSolicitudAnticipo" readonly="true" value='<%= String.valueOf(request.getAttribute("getFechaSolicitudAnticipo"))%>'></html:text></td>
                                                                <% } else {%> 
                                                                <td colspan="2"><html:text property="fechaSolicitudAnticipo" styleClass="datepicker" styleId="fechaSolicitudAnticipo" value='<%= String.valueOf(request.getAttribute("getFechaSolicitudAnticipo"))%>'></html:text></td>
                                                                <% }%>
                                                                <td colspan="2">
                                                                    <input type="checkbox" name="checFechaPagoTributo" value="true"> Fecha de Pago de Tributos
                                                                </td>
                                                                <% if (request.getAttribute("getOp2") != "nuevo") {%> 
                                                                <td colspan="2"><html:text property="fechaPagoTributo" styleClass="datepicker" styleId="fechaPagoTributo" readonly="true" value='<%= String.valueOf(request.getAttribute("getFechaPagoTributo"))%>'></html:text></td>
                                                                <% } else {%> 
                                                                <td colspan="2"><html:text property="fechaPagoTributo" styleClass="datepicker" styleId="fechaPagoTributo" value='<%= String.valueOf(request.getAttribute("getFechaPagoTributo"))%>'></html:text></td>
                                                                <% }%>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox" name="checkFechaLevante" value="true"> Fecha de Levante
                                                                </td>
                                                                <% if (request.getAttribute("getOp2") != "nuevo") {%> 
                                                                <td colspan="2"><html:text property="fechaLevante" styleClass="datepicker" styleId="fechaLevante" readonly="true" value='<%= String.valueOf(request.getAttribute("getFechaLevante"))%>'></html:text></td>
                                                                <% } else {%> 
                                                                <td colspan="2"><html:text property="fechaLevante" styleClass="datepicker" styleId="fechaLevante" value='<%= String.valueOf(request.getAttribute("getFechaLevante"))%>'></html:text></td>
                                                                <% }%>
                                                                <td colspan="2">
                                                                    <input type="checkbox" name="checFechaPoder" value="true"> Fecha del Poder
                                                                </td>
                                                                <% if (request.getAttribute("getOp2") != "nuevo") {%> 
                                                                <td colspan="2"><html:text property="fechaPoder" styleClass="datepicker" styleId="fechaPoder" readonly="true" value='<%= String.valueOf(request.getAttribute("getFechaPoder"))%>'></html:text></td>
                                                                <% } else {%> 
                                                                <td colspan="2"><html:text property="fechaPoder" styleClass="datepicker" styleId="fechaPoder" value='<%= String.valueOf(request.getAttribute("getFechaPoder"))%>'></html:text></td>
                                                                <% }%>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox" name="checkFechaEnvioDocumentos" value="true"> Fecha de Envio Documentos
                                                                </td>
                                                                <% if (request.getAttribute("getOp2") != "nuevo") {%> 
                                                                <td colspan="2"><html:text property="fechaEnvioDocumentos" styleClass="datepicker" styleId="fechaEnvioDocumentos" readonly="true" value='<%= String.valueOf(request.getAttribute("getFechaEnvioDocumentos"))%>'></html:text></td>
                                                                <% } else {%> 
                                                                <td colspan="2"><html:text property="fechaEnvioDocumentos" styleClass="datepicker" styleId="fechaEnvioDocumentos" value='<%= String.valueOf(request.getAttribute("getFechaEnvioDocumentos"))%>'></html:text></td>
                                                                <% }%>
                                                                <td colspan="2">
                                                                    <input type="checkbox" name="checFechaAutenticacion" value="true"> Fecha de Autenticacion
                                                                </td>
                                                                <% if (request.getAttribute("getOp2") != "nuevo") {%> 
                                                                <td colspan="2"><html:text property="fechaAutenticacion" styleClass="datepicker" styleId="fechaAutenticacion" readonly="true" value='<%= String.valueOf(request.getAttribute("getFechaAutenticacion"))%>'></html:text></td>
                                                                <% } else {%> 
                                                                <td colspan="2"><html:text property="fechaAutenticacion" styleClass="datepicker" styleId="fechaAutenticacion" value='<%= String.valueOf(request.getAttribute("getFechaAutenticacion"))%>'></html:text></td>
                                                                <% }%>
                                                            </tr> 
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox" name="checkFechaLiberacionBL" value="true"> Fecha de Liberacion BL
                                                                </td>
                                                                <% if (request.getAttribute("getOp2") != "nuevo") {%> 
                                                                <td colspan="2"><html:text property="fechaLiberacionBL" styleClass="datepicker" styleId="fechaLiberacionBL" readonly="true" value='<%= String.valueOf(request.getAttribute("getFechaLiberacionBL"))%>'></html:text></td>
                                                                <% } else {%> 
                                                                <td colspan="2"><html:text property="fechaLiberacionBL" styleClass="datepicker" styleId="fechaLiberacionBL" value='<%= String.valueOf(request.getAttribute("getFechaLiberacionBL"))%>'></html:text></td>
                                                                <% }%>
                                                                <td colspan="2">
                                                                    <input type="checkbox" name="checFechaPlanilla" value="true"> Fecha de Planilla
                                                                </td>
                                                                <% if (request.getAttribute("getOp2") != "nuevo") {%> 
                                                                <td colspan="2"><html:text property="fechaPlanilla" styleClass="datepicker" styleId="fechaPlanilla" readonly="true" value='<%= String.valueOf(request.getAttribute("getFechaPlanilla"))%>'></html:text></td>
                                                                <% } else {%> 
                                                                <td colspan="2"><html:text property="fechaPlanilla" styleClass="datepicker" styleId="fechaPlanilla" value='<%= String.valueOf(request.getAttribute("getFechaPlanilla"))%>'></html:text></td>
                                                                <% }%>
                                                            </tr> 
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox" name="checkFechaSOAT" value="true"> Fecha del SOAT
                                                                </td>
                                                                <% if (request.getAttribute("getOp2") != "nuevo") {%> 
                                                                <td colspan="2"><html:text property="fechaSOAT" styleClass="datepicker" styleId="fechaSOAT" readonly="true" value='<%= String.valueOf(request.getAttribute("getFechaSOAT"))%>'></html:text></td>
                                                                <% } else {%> 
                                                                <td colspan="2"><html:text property="fechaSOAT" styleClass="datepicker" styleId="fechaSOAT" value='<%= String.valueOf(request.getAttribute("getFechaSOAT"))%>'></html:text></td>
                                                                <% }%>
                                                                <td colspan="2">
                                                                    <input type="checkbox" name="checFechaTransitoLibre" value="true"> Fecha de Transito Libre
                                                                </td>
                                                                <% if (request.getAttribute("getOp2") != "nuevo") {%> 
                                                                <td colspan="2"><html:text property="fechaTransitoLibre" styleClass="datepicker" styleId="fechaTransitoLibre" readonly="true" value='<%= String.valueOf(request.getAttribute("getFechaTransitoLibre"))%>'></html:text></td>
                                                                <% } else {%> 
                                                                <td colspan="2"><html:text property="fechaTransitoLibre" styleClass="datepicker" styleId="fechaTransitoLibre" value='<%= String.valueOf(request.getAttribute("getFechaTransitoLibre"))%>'></html:text></td>
                                                                <% }%>
                                                            </tr> 
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox" name="checkFechaDespacho" value="true"> Fecha de Despacho
                                                                </td>
                                                                <% if (request.getAttribute("getOp2") != "nuevo") {%> 
                                                                <td colspan="2"><html:text property="fechaDespacho" styleClass="datepicker" styleId="fechaDespacho" readonly="true" value='<%= String.valueOf(request.getAttribute("getFechaDespacho"))%>'></html:text></td>
                                                                <% } else {%> 
                                                                <td colspan="2"><html:text property="fechaDespacho" styleClass="datepicker" styleId="fechaDespacho" value='<%= String.valueOf(request.getAttribute("getFechaDespacho"))%>'></html:text></td>
                                                                <% }%>
                                                                <td colspan="2">
                                                                    <input type="checkbox" name="checFechaEntregaFacturacion" value="true"> Fecha de Entrega a Facturacion
                                                                </td>
                                                                <% if (request.getAttribute("getOp2") != "nuevo") {%> 
                                                                <td colspan="2"><html:text property="fechaEntregaFacturacion" styleClass="datepicker" styleId="fechaEntregaFacturacion" readonly="true" value='<%= String.valueOf(request.getAttribute("getFechaEntregaFacturacion"))%>'></html:text></td>
                                                                <% } else {%> 
                                                                <td colspan="2"><html:text property="fechaEntregaFacturacion" styleClass="datepicker" styleId="fechaEntregaFacturacion" value='<%= String.valueOf(request.getAttribute("getFechaEntregaFacturacion"))%>'></html:text></td>
                                                                <% }%>
                                                            </tr> 
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox" name="checkFechaFacturacion" value="true"> Fecha de Facturacion
                                                                </td>
                                                                <% if (request.getAttribute("getOp2") != "nuevo") {%> 
                                                                <td colspan="2"><html:text property="fechaFacturacion" styleClass="datepicker" styleId="fechaFacturacion" readonly="true" value='<%= String.valueOf(request.getAttribute("getFechaFacturacion"))%>'></html:text></td>
                                                                <% } else {%> 
                                                                <td colspan="2"><html:text property="fechaFacturacion" styleClass="datepicker" styleId="fechaFacturacion" value='<%= String.valueOf(request.getAttribute("getFechaFacturacion"))%>'></html:text></td>
                                                                <% }%>
                                                                <td colspan="2">
                                                                    <input type="checkbox" name="checNumeroFactura" value="true"> Numero de Factura
                                                                </td>
                                                                <% if (request.getAttribute("getOp2") != "nuevo") {%> 
                                                                <td colspan="2"><html:text property="numeroFactura" styleId="numeroFactura" readonly="true" value='<%= String.valueOf(request.getAttribute("getNumeroFactura"))%>'></html:text></td>
                                                                <% } else {%> 
                                                                <td colspan="2"><html:text property="numeroFactura" styleId="numeroFactura" value='<%= String.valueOf(request.getAttribute("getNumeroFactura"))%>'></html:text></td>
                                                                <% }%>
                                                            </tr> 
                                                            <tr>
                                                                <td class="text">Comentarios</td>
                                                            </tr>
                                                            <tr>
                                                                <% if (request.getAttribute("getOp2") != "nuevo") {%> 
                                                                <td colspan="2"><html:textarea property="comentarios" styleId="comentarios" readonly="true" value='<%= String.valueOf(request.getAttribute("getComentarios"))%>'></html:textarea></td>
                                                                <% } else {%> 
                                                                <td colspan="2"><html:textarea property="comentarios" styleId="comentarios" value='<%= String.valueOf(request.getAttribute("getComentarios"))%>'></html:textarea></td>
                                                                <% }%> 
                                                            </tr>
                                                            <tr>
                                                                <td colspan="3"><a class="boton" href="javascript:nuevoItem();">Nuevo</a> <a class="boton" id="submit2" href="javascript:guardarItem();">Guardar</a> <% if (request.getAttribute("getOp2") != "nuevo") {%> <a class="boton" href="javascript:eliminarItem();">Eliminar</a> <% }%></td>
                                                            </tr>
                                                        </table>
                                                    </fieldset>
                                                </td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div style="overflow: auto; width: 300px; height: 150px; border: 1px solid #336699">
                                        <input type="checkbox" name="languages" value="English"> English<br>
                                        <input type="checkbox" name="languages" value="Hindi"> Hindi<br>
                                        <input type="checkbox" name="languages" value="Italian"> Italian<br>
                                        <input type="checkbox" name="languages" value="Chinese"> Chinese<br>
                                        <input type="checkbox" name="languages" value="Japanese"> Japanese<br>
                                        <input type="checkbox" name="languages" value="German"> German<br>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="text">Observaciones</td>
                                <td colspan="2"><html:textarea property="observaciones" styleId="observaciones" value='<%= String.valueOf(request.getAttribute("getObservaciones"))%>'></html:textarea></td>
                                </tr>
                            </table>
                        </fieldset>
                    </div>
                    <div>
                        <fieldset>
                            <legend>
                                [<a class="linkin" href="javascript:toggleLayer('auditoria')">
                                    Auditoría
                                </a>]
                            </legend>
                            <div id="auditoria" style="display: none;">
                                <label for="txtUsu">Usuario: </label><strong><div id="nombreUsu"><%= String.valueOf(request.getAttribute("getNombreUsu"))%></div></strong>
                            <label for="txtFechaModificacion">Fecha de Modificación: </label><strong><div id="fechaModificacion"><%= String.valueOf(request.getAttribute("getFechaModificacion"))%></div></strong>
                            <div><br>
                            </div>
                            <div><a class="boton" href="javascript:historico();">Historico</a>
                            </div>
                        </div>
                    </fieldset>
                    <div><br>
                    </div>
                    <div>
                        <a class="boton" href="javascript:nuevo();">Nuevo</a> <a class="boton" id="submit" href="javascript:guardar();">Guardar</a> <% if (request.getAttribute("getIdFMMs") != "") {%> <a class="boton" href="javascript:eliminar();">Eliminar</a> <% }%> <a class="boton" href="javascript:atras();">Volver</a>
                    </div>
                    <%
                        if (request.getAttribute("respuesta") != "") {
                    %>
                    <div><br>
                    </div>
                    <div>
                        <%= String.valueOf(request.getAttribute("respuesta"))%>
                    </div>
                    <%  }
                    %>
                </html:form>
            </div>
    </body>
</html:html>
