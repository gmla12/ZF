<%-- 
    Document   : BL
    Created on : 24-diciembre-2012, 7:52:01
    Author     : Gilberth
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri= "/WEB-INF/c.tld" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html:html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BLs</title>
        <link type="text/css" href="css/ui.all.css" rel="stylesheet" />
        <link type="text/css" href="css/comun.css" rel="stylesheet" />
        <link type="text/css" href="css/jquery-ui.css" rel="stylesheet" />
        <script type="text/javascript" src="Js/jquery-1.8.3.js"></script>
        <script type="text/javascript" src="Js/ui/ui.datepicker.js"></script>
        <script type="text/javascript" src="Js/ui/globalize.js"></script>
        <script type="text/javascript" src="Js/ui/jquery-ui.js"></script>
        <script type="text/javascript" src="Js/jquery.validate.js"></script>
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
                    var sw = true;
                    var f = true;
                    //alert('afuera');
                    if (document.forms[0].etaHora.value != "") {
                        //alert('entro dh');
                        if (document.forms[0].etaFecha.value == "") {
                            sw = false;
                            //alert('entro df');
                            f = false;
                        }
                    }
                    if (sw == true){
                        //alert('entro sw');
                        document.forms[0].idUsu.value=<%= session.getAttribute("idusu")%>
                        if(document.forms[0].idBLs.value==""){
                            document.forms[0].op.value="nuevo";
                        }
                        else {
                            document.forms[0].op.value="modificar";
                        }
                        $("#forma").submit(); 
                    } else {
                        if (f == false){
                            alert("Debe ingresar la fecha del Eta");
                        }
                    }
                }); 
                $('#submitVin').click(function(e) {
                    e.preventDefault();
                    document.forms[0].idUsu.value=<%= session.getAttribute("idusu")%>
                    if(document.forms[0].idVines.value==""){
                        document.forms[0].op.value="nuevoVin";
                    }
                    else {
                        document.forms[0].op.value="modificarVin";
                    }
                    $("#forma").submit(); 
                }); 
                $("#forma").validate({
                    event: "blur",
                    rules : {
                        BL : {
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
                $( "#spinner" ).timespinner();
            });
                
            function nuevo(){
                document.forms[0].op.value="";
                document.forms[0].op2.value="";
                document.forms[0].idBLs.value="";
                document.forms[0].BL.value="";
                document.forms[0].BL.readOnly=false;
                document.forms[0].cliente.value="";
                document.forms[0].motonave.value="";
                document.forms[0].etaFecha.value="";
                document.forms[0].etaHora.value="";
                document.forms[0].lote.value="";
                document.forms[0].FMM.value="";
                document.getElementById('nombreUsu').innerHTML = "";
                document.getElementById('fechaModificacion').innerHTML = "";
                document.getElementById('divVines').style.display="none";
                document.getElementById('eliminar').style.display="none";
                document.getElementById('eliminarVin').style.display="none";
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

            function consultaVin(id){
                document.forms[0].op.value="consultaVin";
                document.forms[0].idUsu.value=<%= session.getAttribute("idusu")%>
                document.forms[0].op2.value=id;
                $("#forma").submit(); 
            }
            
            function nuevoVin(){
                document.forms[0].op2.value="";
                document.forms[0].idVines.value="";
                document.forms[0].vin.value="";
                document.forms[0].vin.readOnly=false;
                document.forms[0].referencia.value="";
                document.forms[0].codigo.value="";
                document.forms[0].factura.value="";
                document.forms[0].descripcion.value="";
                document.forms[0].valorFob.value="";
                document.forms[0].color.value="";
                document.forms[0].huerfano.value="";
                document.forms[0].despachado.value="";
                document.forms[0].pedido.value="";
                document.forms[0].FMMI.value="";
                document.forms[0].FMMS.value="";
                document.getElementById('eliminarVin').style.display="none";
            }

            function eliminarVin(){
                document.forms[0].op.value="eliminarVin";
                document.forms[0].idUsu.value=<%= session.getAttribute("idusu")%>
                document.forms[0].submit();
            }
            
            function historico(){
                var forma = document.forms[0];
                var emer = window.open('../ZF/Jsp/Log/Auditoria/Auditoria.jsp?getOp=buscar&accion=referencia&formulario=bl&referencia='+'<%=request.getAttribute("getIdBLs")%>','Auditoria','width=950,height=500,top=100%,left=100%,scrollbars=yes,resizable=yes');
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
            <html:form styleClass="forma" styleId="forma" action="/BL" method="post">

                <input type="hidden" name="op" value=""> 
                <input type="hidden" name="op2" value="<%= String.valueOf(request.getAttribute("getOp2"))%>"> 
                <input type="hidden" name="idUsu" value=""> 
                <input type="hidden" name="idBLs" value='<%= String.valueOf(request.getAttribute("getIdBLs"))%>'> 

                <h1>FMMs</h1>
                <div>
                    <label class="texto" for="txtBL">BL</label>
                    <% if (request.getAttribute("getIdBLs") != "") {%> 
                    <html:text property="BL" readonly="true" value='<%= String.valueOf(request.getAttribute("getBL"))%>'></html:text>
                    <% } else {%> 
                    <html:text property="BL" value='<%= String.valueOf(request.getAttribute("getBL"))%>'></html:text>
                    <% }%> 
                    <label class="texto" for="txtCliente">Cliente</label>
                    <html:text property="cliente" value='<%= String.valueOf(request.getAttribute("getCliente"))%>'></html:text>
                </div>
                <div>
                    <label class="texto" for="txtMotonave">Motonave</label>
                    <html:text property="motonave" value='<%= String.valueOf(request.getAttribute("getMotonave"))%>'></html:text>
                    <label class="texto" for="txtEta">Eta</label>
                    <html:text property="etaFecha" styleClass="datepicker" value='<%= String.valueOf(request.getAttribute("getEtaFecha"))%>'></html:text>
                    <html:text property="etaHora" styleId="spinner" value='<%= String.valueOf(request.getAttribute("getEtaHora"))%>'></html:text>
                </div>
                <div>
                    <label class="texto" for="txtLote">Lote</label>
                    <html:text property="lote" value='<%= String.valueOf(request.getAttribute("getLote"))%>'></html:text>
                    <label class="texto" for="txtFMM">FMM</label>
                    <html:text property="FMM" value='<%= String.valueOf(request.getAttribute("getFMM"))%>'></html:text>
                </div>
                <% if (request.getAttribute("getIdBLs") != "") {%> 
                <div id="divVines">
                    <fieldset id="el01">
                        <input type="hidden" name="idVines" value='<%= String.valueOf(request.getAttribute("getIdVines"))%>'> 
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
                                                                <td colspan="2"><html:text property="referencia" styleId="referencia" value='<%= String.valueOf(request.getAttribute("getReferencia"))%>'></html:text></td>
                                                                <td colspan="2">
                                                                    <input type="checkbox" name="checkVin" value="true"> Vin
                                                                </td>
                                                                <% if (request.getAttribute("getIdVines") != "") {%> 
                                                                <td colspan="2"><html:text property="vin" styleId="vin" readonly="true" value='<%= String.valueOf(request.getAttribute("getVin"))%>'></html:text></td>
                                                                <% } else {%> 
                                                                <td colspan="2"><html:text property="vin" styleId="vin" value='<%= String.valueOf(request.getAttribute("getVin"))%>'></html:text></td>
                                                                <% }%> 
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox" name="checkCodigo" value="true"> Codigo
                                                                </td>
                                                                <td colspan="2"><html:text property="codigo" styleId="codigo" value='<%= String.valueOf(request.getAttribute("getCodigo"))%>'></html:text></td>
                                                                <td>
                                                                    <input type="checkbox" name="checkPedido" value="true"> Pedido
                                                                </td>
                                                                <td colspan="2"><html:text property="pedido" styleId="pedido" value='<%= String.valueOf(request.getAttribute("getPedido"))%>'></html:text></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox" name="checkFactura" value="true"> Factura
                                                                </td>
                                                                <td colspan="2"><html:text property="factura" styleId="factura" value='<%= String.valueOf(request.getAttribute("getFactura"))%>'></html:text></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox" name="checkDescripcion" value="true"> Descripcion
                                                                </td>
                                                                <td colspan="2"><html:text property="descripcion" styleId="descripcion" value='<%= String.valueOf(request.getAttribute("getDescripcion"))%>'></html:text></td>
                                                                <td colspan="2">
                                                                    <input type="checkbox" name="checValorFob" value="true"> Valor Fob
                                                                </td>
                                                                <td colspan="2"><html:text property="valorFob" styleId="valorFob" value='<%= String.valueOf(request.getAttribute("getValorFob"))%>'></html:text></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox" name="checkColor" value="true"> Color
                                                                </td>
                                                                <td colspan="2"><html:text property="color" styleId="color" value='<%= String.valueOf(request.getAttribute("getColor"))%>'></html:text></td>
                                                                <td colspan="2">
                                                                    <input type="checkbox" name="checUltimoEvento" value="true"> Ultimo Evento
                                                                </td>
                                                                <td colspan="2"><html:text property="ultimoEvento" styleId="ultimoEvento" value='<%= String.valueOf(request.getAttribute("getUltimoEvento"))%>'></html:text></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox" name="checkHuerfano" value="true"> Huerfano
                                                                </td>
                                                                <td colspan="2"><html:text property="huerfano" styleId="huerfano" value='<%= String.valueOf(request.getAttribute("getHuerfano"))%>'></html:text></td>
                                                                <td colspan="2">
                                                                    <input type="checkbox" name="checkExisteEvento" value="true"> Existe Evento
                                                                </td>
                                                                <td colspan="2"><html:text property="existeEvento" styleId="existeEvento" value='<%= String.valueOf(request.getAttribute("getExisteEvento"))%>'></html:text></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox" name="checkDespachado" value="true"> Despachado
                                                                </td>
                                                                <td colspan="2"><html:text property="despachado" styleId="despachado" value='<%= String.valueOf(request.getAttribute("getDespachado"))%>'></html:text></td>
                                                                <td colspan="2">
                                                                    <input type="checkbox" name="checkHablador" value="true"> Hablador
                                                                </td>
                                                                <td colspan="2"><html:text property="hablador" styleId="hablador" value='<%= String.valueOf(request.getAttribute("getHablador"))%>'></html:text></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox" name="checkFMMI" value="true"> FMM Ingreso
                                                                </td>
                                                                <td colspan="2"><html:text property="FMMI" styleId="FMMI" value='<%= String.valueOf(request.getAttribute("getFMMI"))%>'></html:text></td>
                                                                <td colspan="2">
                                                                    <input type="checkbox" name="checkFMMS" value="true"> FMM Salida
                                                                </td>
                                                                <td colspan="2"><html:text property="FMMS" styleId="FMMS" value='<%= String.valueOf(request.getAttribute("getFMMS"))%>'></html:text></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="text">Comentarios</td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2"><html:textarea property="comentarios" styleId="comentarios" value='<%= String.valueOf(request.getAttribute("getComentarios"))%>'></html:textarea></td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="3"><a class="boton" href="javascript:nuevoVin();">Nuevo</a> <a class="boton" id="submitVin" href="javascript:guardarVin();">Guardar</a> <% if (request.getAttribute("getOp2") != "nuevo") {%> <div id="eliminarVin" style="display:inline"><a class="boton" href="javascript:eliminarVin();">Eliminar</a></div> <% }%></td>
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
                                        <c:forEach items="${CMB_Vin}" var="cat">
                                            <input type="checkbox" name="vines" value="${cat.idVines}"> <a href="javascript:consultaVin(${cat.idVines});">${cat.vin}</a><br>
                                        </c:forEach>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </div>
                <% }%> 
                <div>
                    <label class="texto" for="txtObservaciones">Observaciones</label>
                    <html:textarea property="observaciones" styleId="observaciones" value='<%= String.valueOf(request.getAttribute("getObservaciones"))%>'></html:textarea>
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
                        <a class="boton" href="javascript:nuevo();">Nuevo</a> <a class="boton" id="submit" href="javascript:guardar();">Guardar</a> <% if (request.getAttribute("getIdBLs") != "") {%> <div id="eliminarVin" style="display:inline"><a id="eliminar" class="boton" href="javascript:eliminar();">Eliminar</a></div> <% }%> <a class="boton" href="javascript:atras();">Volver</a>
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
