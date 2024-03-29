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
                    <label class="texto" for="txtFMM">FMM</label>
                    <% if (request.getAttribute("getIdFMMs") != "") {%> 
                    <html:text property="FMM" readonly="true" value='<%= String.valueOf(request.getAttribute("getFMM"))%>'></html:text>
                    <% } else {%> 
                    <html:text property="FMM" value='<%= String.valueOf(request.getAttribute("getFMM"))%>'></html:text>
                    <% }%> 
                    <label class="texto" for="txtCliente">Cliente</label>
                    <html:text property="cliente" value='<%= String.valueOf(request.getAttribute("getCliente"))%>'></html:text>
                    </div>
                    <div>
                        <label class="texto" for="txtPedido">Pedido</label>
                    <html:text property="pedido" value='<%= String.valueOf(request.getAttribute("getPedido"))%>'></html:text>
                        <label class="texto" for="txtLote">Lote</label>
                    <html:text property="lote" value='<%= String.valueOf(request.getAttribute("getLote"))%>'></html:text>
                    </div>
                    <div>
                        <label class="texto" for="txtBL">BL</label>
                    <html:text property="bl" value='<%= String.valueOf(request.getAttribute("getBL"))%>'></html:text>
                        <label class="texto" for="txtMotonave">Motonave</label>
                    <html:text property="motonave" value='<%= String.valueOf(request.getAttribute("getMotonave"))%>'></html:text>
                        <label class="texto" for="txtEta">Eta</label>
                    <html:text property="eta" styleClass="datepicker" value='<%= String.valueOf(request.getAttribute("getEta"))%>'></html:text>
                    </div>
                    <div>
                        <fieldset id="el01">
                            <legend>VLs</legend>
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
                                                                    <input type="checkbox" name="checkVin" value="true"> Vin
                                                                </td>
                                                                <% if (request.getAttribute("getOp2") != "nuevo") {%> 
                                                                <td colspan="2"><html:text property="vin" styleId="vin" readonly="true" value='<%= String.valueOf(request.getAttribute("getVin"))%>'></html:text></td>
                                                                <% } else {%> 
                                                                <td colspan="2"><html:text property="vin" styleId="vin" value='<%= String.valueOf(request.getAttribute("getVin"))%>'></html:text></td>
                                                                <% }%> 
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox" name="checkDescripcion" value="true"> Codigo
                                                                </td>
                                                                <% if (request.getAttribute("getOp2") != "nuevo") {%> 
                                                                <td colspan="2"><html:text property="codigo" styleId="codigo" readonly="true" value='<%= String.valueOf(request.getAttribute("getCodigo"))%>'></html:text></td>
                                                                <% } else {%> 
                                                                <td colspan="2"><html:text property="codigo" styleId="codigo" value='<%= String.valueOf(request.getAttribute("getCodigo"))%>'></html:text></td>
                                                                <% }%> 
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox" name="checkFactura" value="true"> Factura
                                                                </td>
                                                                <% if (request.getAttribute("getOp2") != "nuevo") {%> 
                                                                <td colspan="2"><html:text property="factura" styleId="factura" readonly="true" value='<%= String.valueOf(request.getAttribute("getFactura"))%>'></html:text></td>
                                                                <% } else {%> 
                                                                <td colspan="2"><html:text property="factura" styleId="factura" value='<%= String.valueOf(request.getAttribute("getFactura"))%>'></html:text></td>
                                                                <% }%> 
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox" name="checkDescripcion" value="true"> Descripcion
                                                                </td>
                                                                <% if (request.getAttribute("getOp2") != "nuevo") {%> 
                                                                <td colspan="2"><html:text property="descripcion" styleId="descripcion" readonly="true" value='<%= String.valueOf(request.getAttribute("getDescripcion"))%>'></html:text></td>
                                                                <% } else {%> 
                                                                <td colspan="2"><html:text property="descripcion" styleId="descripcion" value='<%= String.valueOf(request.getAttribute("getDescripcion"))%>'></html:text></td>
                                                                <% }%>
                                                                <td colspan="2">
                                                                    <input type="checkbox" name="checValorFob" value="true"> Valor Fob
                                                                </td>
                                                                <% if (request.getAttribute("getOp2") != "nuevo") {%> 
                                                                <td colspan="2"><html:text property="valorFob" styleId="valorFob" readonly="true" value='<%= String.valueOf(request.getAttribute("getValorFob"))%>'></html:text></td>
                                                                <% } else {%> 
                                                                <td colspan="2"><html:text property="valorFob" styleId="valorFob" value='<%= String.valueOf(request.getAttribute("getValorFob"))%>'></html:text></td>
                                                                <% }%>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox" name="checkColor" value="true"> Color
                                                                </td>
                                                                <% if (request.getAttribute("getOp2") != "nuevo") {%> 
                                                                <td colspan="2"><html:text property="fechaColor" styleId="fechaColor" readonly="true" value='<%= String.valueOf(request.getAttribute("getColor"))%>'></html:text></td>
                                                                <% } else {%> 
                                                                <td colspan="2"><html:text property="fechaColor" styleId="fechaColor" value='<%= String.valueOf(request.getAttribute("getColor"))%>'></html:text></td>
                                                                <% }%>
                                                                <td colspan="2">
                                                                    <input type="checkbox" name="checUltimoEvento" value="true"> Ultimo Evento
                                                                </td>
                                                                <% if (request.getAttribute("getOp2") != "nuevo") {%> 
                                                                <td colspan="2"><html:text property="ultimoEvento" styleId="ultimoEvento" readonly="true" value='<%= String.valueOf(request.getAttribute("getUltimoEvento"))%>'></html:text></td>
                                                                <% } else {%> 
                                                                <td colspan="2"><html:text property="ultimoEvento" styleId="ultimoEvento" value='<%= String.valueOf(request.getAttribute("getUltimoEvento"))%>'></html:text></td>
                                                                <% }%>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox" name="checkHuerfano" value="true"> Huerfano
                                                                </td>
                                                                <% if (request.getAttribute("getOp2") != "nuevo") {%> 
                                                                <td colspan="2"><html:text property="huerfano" styleId="huerfano" readonly="true" value='<%= String.valueOf(request.getAttribute("getHuerfano"))%>'></html:text></td>
                                                                <% } else {%> 
                                                                <td colspan="2"><html:text property="huerfano" styleId="huerfano" value='<%= String.valueOf(request.getAttribute("getHuerfano"))%>'></html:text></td>
                                                                <% }%>
                                                                <td colspan="2">
                                                                    <input type="checkbox" name="checkExisteEvento" value="true"> Existe Evento
                                                                </td>
                                                                <% if (request.getAttribute("getOp2") != "nuevo") {%> 
                                                                <td colspan="2"><html:text property="existeEvento" styleId="existeEvento" readonly="true" value='<%= String.valueOf(request.getAttribute("getExisteEvento"))%>'></html:text></td>
                                                                <% } else {%> 
                                                                <td colspan="2"><html:text property="existeEvento" styleId="existeEvento" value='<%= String.valueOf(request.getAttribute("getExisteEvento"))%>'></html:text></td>
                                                                <% }%>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox" name="checkDespachado" value="true"> Despachado
                                                                </td>
                                                                <% if (request.getAttribute("getOp2") != "nuevo") {%> 
                                                                <td colspan="2"><html:text property="despachado" styleId="despachado" readonly="true" value='<%= String.valueOf(request.getAttribute("getDespachado"))%>'></html:text></td>
                                                                <% } else {%> 
                                                                <td colspan="2"><html:text property="despachado" styleId="despachado" value='<%= String.valueOf(request.getAttribute("getDespachado"))%>'></html:text></td>
                                                                <% }%>
                                                                <td colspan="2">
                                                                    <input type="checkbox" name="checkHablador" value="true"> Hablador
                                                                </td>
                                                                <% if (request.getAttribute("getOp2") != "nuevo") {%> 
                                                                <td colspan="2"><html:text property="hablador" styleId="hablador" readonly="true" value='<%= String.valueOf(request.getAttribute("getHablador"))%>'></html:text></td>
                                                                <% } else {%> 
                                                                <td colspan="2"><html:text property="hablador" styleId="hablador" value='<%= String.valueOf(request.getAttribute("getHablador"))%>'></html:text></td>
                                                                <% }%>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox" name="checkFMMI" value="true"> FMM Ingreso
                                                                </td>
                                                                <% if (request.getAttribute("getOp2") != "nuevo") {%> 
                                                                <td colspan="2"><html:text property="FMMI" styleId="FMMI" readonly="true" value='<%= String.valueOf(request.getAttribute("getFMMI"))%>'></html:text></td>
                                                                <% } else {%> 
                                                                <td colspan="2"><html:text property="FMMI" styleId="FMMI" value='<%= String.valueOf(request.getAttribute("getFMMI"))%>'></html:text></td>
                                                                <% }%>
                                                                <td colspan="2">
                                                                    <input type="checkbox" name="checkFMMS" value="true"> FMM Salida
                                                                </td>
                                                                <% if (request.getAttribute("getOp2") != "nuevo") {%> 
                                                                <td colspan="2"><html:text property="FMMS" styleId="FMMS" readonly="true" value='<%= String.valueOf(request.getAttribute("getFMMS"))%>'></html:text></td>
                                                                <% } else {%> 
                                                                <td colspan="2"><html:text property="FMMS" styleId="FMMS" value='<%= String.valueOf(request.getAttribute("getFMMS"))%>'></html:text></td>
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
                                        <c:forEach items="${CMB_VINES}" var="cat">
                                            <input type="checkbox" name="vines" value="${cat.idVines}"> ${cat.referencia}<br>
                                        </c:forEach>
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
