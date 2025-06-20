<%@page import="modelo.facturacompramodelo"%>
<%@page import="modelo.proveedoresmodelo"%>
<%@page import="modelo.productosmodelo"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modelo.proveedoresmodelo"%>
<%@page import="modelo.modeloabrircaja"%>
<%@page import="modelo.facturaventamodelo"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Facturacion Compras</title>
          <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
     
        /* Estilos CSS para la página */
       body {
    background-color: #343a40;
   color: #fff;
 
}

            th {
                color: #7e7e7e;
                
            }
            td {
               color: #7e7e7e;
               
               
            }
.container3 {
    display: flex;
    justify-content: center;
    margin-top: 5px;
}

.container2 {
    display: flex;
    justify-content: center;
    margin-top: 5px;
}

.window, .window2, .window3 {
    border: 1px solid #ccc;
    margin: 10px;
    padding: 10px;
    
}

.window {
    width: 500px;
    height: 270px;
}

.window2 {
    width: 1020px;
    height: 100px;
    text-align: center;
}

.window3 {
    width: 1020px;
    height: 300px;
    overflow: auto;
}
.window5{
       width: 1020px;
    height: 200px;
    overflow: auto;
}
table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

th, td {
    padding: 8px;
    text-align: left;
    color: #fff;
}

  

button {
    margin: 5px;
    padding: 8px 16px;
    border: none;
    border-radius: 4px;
    background-color: #007bff;
    color: #fff;
    cursor: pointer;
}

button:hover {
    background-color: #0056b3;
}

/* Modal Styles */
.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
}

.modal-contenido {
    background-color: #343a40;
    margin: 5% auto;
    padding: 20px;
    border: 1px solid #888;
    width: auto;
    
    height: auto;
    overflow: auto;
    text-align: center;
}

.modal-contenido2 {
    background-color: #343a40;
    margin: 5% auto;
    padding: 20px;
    border: 1px solid #888;
    width: auto;
    
    height: auto;
    overflow: auto;
    text-align: center;
}


.cerrar {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
    cursor: pointer;
}

.cerrar:hover, .cerrar:focus {
    color: #fff;
}


    </style>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            modeloabrircaja verificar = new modeloabrircaja();
            Object a = sesion.getAttribute("idusuarios");
            verificar.setIdusuario((String) a);
            if (!verificar.validarcaja().equals("ABIERTA")) {
                request.setAttribute("validarcaja", "cerrada");
                request.getRequestDispatcher("../menuprincipal.jsp").forward(request, response);
            }
        %>
        <form action="facturacompracontrolador" method="post">
            <input type="hidden" name="lblcodigo" value="<%= sesion.getAttribute("codigo")%>">
            <div class="container3">
                <div class="window">
                    <table border="0">
                        <tbody>
                                                      <%
    facturacompramodelo facturaModelo = new facturacompramodelo();
    String ultimoNumeroFactura = facturaModelo.obtenerUltimoNumeroFactura();
    int nuevoNumeroFactura = Integer.parseInt(ultimoNumeroFactura) + 1;
%>
                    <tr>
                        <td>N° FACTURA</td>
                        <td><input type="text" class="form-control" name="txtnumero" value="<%= nuevoNumeroFactura %>" readonly></td>
                    </tr>
                            <tr>
                                <td>CONDICIÓN</td>
                                <td>
                                    <select name="condicion">
                                        <option selected="selected" value="contado" >Contado</option>
                                        <option value="credito">Crédito</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>FECHA</td>
                                <td><input type="text" id="txtfecha" name="txtfechafac" readonly></td>
                            </tr>
                            <tr>
                                <td>ESTADO</td>
                                <td><input type="text" name="txtestado" value="PENDIENTE" readonly></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="window">
                    <table border="0">
                        <tbody>
  
                            <tr>
                                <td>CODIGO</td>
                                <td><input type="text" name="txtcodigoprov" id="txtcodigoprov" readonly></td>
                                <td><button class="btn btn-success mb-2" type="button" name="btnbuscarprov" onclick="mostrarModal()">
                                        BUSCAR</button></td>
                            </tr>
                            <tr>
                                <td>NOMBRE</td>
                                <td><input type="text" name="txtnombre" id="txtnombre" readonly></td>
                            </tr>
                            <tr>
                                <td>RUC</td>
                                <td><input type="text" name="txtruc" id="txtruc" readonly></td>
                            </tr>
                            <tr>
                                <td>TELEFONO</td>
                                <td><input type="text" name="txttelefono" id="txttelefono" readonly></td>
                                    <%
                                        modeloabrircaja mf = new modeloabrircaja();
                                        mf.setIdusuario((String) sesion.getAttribute("idusuarios"));
                                    %>
                                <td>
                                    <input type="hidden" name="txtaper" id="txtaper" 
                                           value="<%= mf.obtenerultimapertura()%>" readonly>
                                    <input type="hidden" name="txtusu" id="txtusu" 
                                           value="<%= sesion.getAttribute("idusuarios")%>" readonly>
                                </td>
                              <tr>
                                <td>Correo</td>
                                <td><input type="text" name="txtcorreo" id="txtcorreo" readonly></td>
                           
                            </tr>
                        </tbody>
                    </table>
                    <!-- modal buscador proveeedor-->
                    <div id="miModal" class="modal">
                        <div class="modal-contenido">
                            <label>BUSCADOR DE PROVEEDORES</label>
                            <span class="cerrar" onclick="cerrarModal()">&times;</span>
                            <table border="1" id="mitabla">
                                <thead>
                                    <tr>
                                        <th>CODIGO</th>
                                        <th>NOMBRE</th>
                                        <th>RUC</th>
                                        <th>TELEFONO</th>
                                        <th>CORREO</th>
                                        <th>ACCION</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        proveedoresmodelo modelo = new proveedoresmodelo();
                                        List<proveedoresmodelo> list = modelo.listar();
                                        Iterator<proveedoresmodelo> iter = list.iterator();
                                        proveedoresmodelo m = null;
                                        while (iter.hasNext()) {
                                            m = iter.next();
                                    %>
                                    <tr>
                                        <td><span class="dato-input"><%= m.getCodigo()%></span></td>
                                        <td><span class="dato-input"><%= m.getNombre()%></span></td>
                                        <td><span class="dato-input"><%= m.getRuc()%></span></td>
                                        <td><span class="dato-input"><%= m.getTelefono()%></span></td>
                                        <td><span class="dato-input"><%= m.getCorreo()%></span></td>

                                        <td><button class="btn btn-success mb-2" type="button" onclick="obtenerFilaProv(this)">
                                                SELECCIONAR</button></td>
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container3">
                <div class="window2">
                    <table border="0" class="table2">
                        <tbody>
                            <tr>
                                <td>CODIGO</td>
                                <td><input type="text" name="txtcodprod" id="txtcodpro" disabled>
                                    <input type="text" name="txtiva" id="txtiva" hidden>
                                    <input type="text" name="txtprecio" id="txtprecio" hidden>
                                </td>
                                <td><button type="button" class="btn btn-success mb-2" onclick="mostrarModalp()">BUSCAR</button></td>
                                <td><label id="txtnombrepro"></label></td>
                                <td>CANTIDAD</td>
                                <td><input type="number" name="txtcantidad" id="txtcantidad"></td>
                                <td><button type="button" class="btn btn-success mb-2" onclick="cargarproducto()">AGREGAR</button></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- modal para producto -->
            <div id="miModalp" class="modal">
                <div class="modal-contenido2">
                    <label>BUSCADOR DE PRODUCTOS</label>
                    <span class="cerrar" onclick="cerrarModalp()">&times;</span>
                    <table border="1">
                        <thead>
                            <tr>
                                <th>CODIGO</th>
                                <th>NOMBRE</th>
                                <th>STOCK</th>
                                <th>COSTO</th>
                                <th>PRECIO</th>
                                <th>MINIMO</th>
                                <th>IVA</th>
                                <th>CATEGORIA</th>
                                <th>ACCION</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                productosmodelo modelop = new productosmodelo();
                                List<productosmodelo> listp = modelop.listarporcategoria1();
                                Iterator<productosmodelo> iterp = listp.iterator();
                                productosmodelo mp = null;
                                while (iterp.hasNext()) {
                                    mp = iterp.next();
                            %>
                            <tr>
                                <td><span class="dato-input"><%= mp.getCodigo()%></span></td>
                                <td><span class="dato-input"><%= mp.getNombre()%></span></td>
                                <td><span class="dato-input"><%= mp.getStock()%></span></td>
                                <td><span class="dato-input"><%= mp.getCosto()%></span></td>
                                <td><span class="dato-input"><%= mp.getPrecio()%></span></td>
                                <td><span class="dato-input"><%= mp.getStockmin()%></span></td>
                                <td><span class="dato-input"><%= mp.getIva()%></span></td>
                                <td><span class="dato-input"><%= mp.getCategoria()%></span></td>
                                
                                <td><button type="button" class="btn btn-success mb-2" onclick="moverFila(this)">SELECCIONAR</button></td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="container3">
                <div class="window3">
                    <table border="1" class="table2" id="tablafactura">
                        <thead>
                            <tr>
                                <th>CODIGO</th>
                                <th>CANTIDAD</th>
                                <th>DESCRIPCION</th>
                                <th>P.U.</th>
                                <th>EXENTA</th>
                                <th>5%</th>
                                <th>10%</th>
                                <th>ACCION</th>
                            </tr>
                        </thead>
                        <tbody id="tablaCuerpo">
                            
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="container3">
                <div class="window2">
                    <button type="submit" class="btn btn-success mb-2" name="accion" value="guardarcompra">GUARDAR</button>
                </div>
            </div>
        </form>
        <script>
            var fechaActual = new Date();
            var dia = fechaActual.getDate();
            var mes = fechaActual.getMonth() + 1;
            var año = fechaActual.getFullYear();
            if (mes <= 9) {
                mes = "0" + mes;
            }
            var fechaFormateada = año + "-" + mes + "-" + dia;
            document.getElementById("txtfecha").value = fechaFormateada.toString();

            function mostrarModal() {
                event.preventDefault();
                document.getElementById("miModal").style.display = "block";
            }

           
            function mostrarModalp() {
                event.preventDefault();
                document.getElementById("miModalp").style.display = "block";
            }

            function cerrarModalp() {
                event.preventDefault();
                document.getElementById("miModalp").style.display = "none";
            }
            function cerrarModal() {
                event.preventDefault();
                document.getElementById("miModal").style.display = "none";
            }
            function obtenerFilaProv(boton) {
                event.preventDefault(); // Evitar la acción predeterminada del botón

                var fila = boton.parentNode.parentNode;
                var celdas = fila.getElementsByTagName("td");
                var datosFila = [];

                for (var i = 0; i < celdas.length - 1; i++) {
                    var valor = celdas[i].querySelector(".dato-input").textContent;
                    datosFila.push(valor);
// var valor2 = valor ? valor.textContent : "nada";
// datosFila.push(valor);
                }

// Asignar los datos a los inputs correspondientes
                document.getElementById("txtcodigoprov").value = datosFila[0];
                document.getElementById("txtnombre").value = datosFila[1];
                document.getElementById("txtruc").value = datosFila[2];
                document.getElementById("txttelefono").value = datosFila[3];
                document.getElementById("txtcorreo").value = datosFila[4];


// Cerrar el modal
                cerrarModal();
            }
            function moverFila(boton) {
                event.preventDefault(); // Evitar la acción predeterminada del botón
                var fila = boton.parentNode.parentNode;
                var celdas = fila.getElementsByTagName("td");
                var datosFila = [];

                for (var i = 0; i < celdas.length - 1; i++) {
                    var valor = celdas[i].querySelector(".dato-input").textContent;
                    datosFila.push(valor);
                }

// Asignar los datos a los inputs correspondientes
                document.getElementById("txtcodpro").value = datosFila[0];
                document.getElementById("txtnombrepro").textContent = datosFila[1];
                document.getElementById("txtiva").value = datosFila[6];
                document.getElementById("txtprecio").value = datosFila[4];
                cerrarModalp();
                var input = document.getElementById("txtcantidad");
                input.focus();
            }
            function cargarproducto() {
                event.preventDefault(); // Evitar la acción predeterminada del botón

                var codigo = document.getElementById("txtcodpro").value;
                var nombre = document.getElementById("txtnombrepro").textContent;
                var cantidad = document.getElementById("txtcantidad").value;
                var precio = document.getElementById("txtprecio").value;
                var iva = document.getElementById("txtiva").value;
                if (iva == "0") {
                    var exenta = cantidad * precio;
                } else {
                    var exenta = "";
                }
                if (iva == "10") {
                    var diez = cantidad * precio;
                } else {
                    var diez = "";
                }
                if (iva == "5") {
                    var cinco = cantidad * precio;
                } else {
                    var cinco = "";
                }
                var cuerpoTabla = document.getElementById("tablaCuerpo");
                var fila = document.createElement("tr");

                var celdaCodigo = document.createElement("td");
                var inputCodigo = document.createElement("input");
                inputCodigo.type = "text";
                inputCodigo.value = codigo;
                inputCodigo.name = "codigo[]"; // Asignar el atributo name con el valor "codigo[]"
                inputCodigo.classList.add("form-control-plaintext");
                inputCodigo.readOnly = true;
                celdaCodigo.appendChild(inputCodigo);
                fila.appendChild(celdaCodigo);

                var celdaCantidad = document.createElement("td");
                var inputCantidad = document.createElement("input");
                inputCantidad.type = "text";
                inputCantidad.value = cantidad;
                inputCantidad.name = "cantidad[]"; // Asignar el atributo name con el valor "codigo[]"
                inputCantidad.classList.add("form-control-plaintext");
                inputCantidad.readOnly = true;
                celdaCantidad.appendChild(inputCantidad);
                fila.appendChild(celdaCantidad);

                var celdaNombre = document.createElement("td");
                var textoNombre = document.createTextNode(nombre);
                celdaNombre.appendChild(textoNombre);
                fila.appendChild(celdaNombre);


                var celdaPrecio = document.createElement("td");
                var inputPrecio = document.createElement("input");
                inputPrecio.type = "text";
                inputPrecio.value = precio;
                inputPrecio.name = "precio[]"; // Asignar el atributo name con el valor "codigo[]"
                inputPrecio.classList.add("form-control-plaintext");
                inputPrecio.readOnly = true;
                celdaPrecio.appendChild(inputPrecio);
                fila.appendChild(celdaPrecio);

                var celdaExenta = document.createElement("td");
                var textoExenta = document.createTextNode(exenta);
                celdaExenta.appendChild(textoExenta);
                fila.appendChild(celdaExenta);


                var celdaCinco = document.createElement("td");
                var textoCinco = document.createTextNode(cinco);
                celdaCinco.appendChild(textoCinco);
                fila.appendChild(celdaCinco);

                var celdaDiez = document.createElement("td");
                var textoDiez = document.createTextNode(diez);
                celdaDiez.appendChild(textoDiez);
                fila.appendChild(celdaDiez);

                var celdaBoton = document.createElement("td");
                var boton = document.createElement("button");
                boton.textContent = "Eliminar";
                boton.classList.add("btn", "btn-warning");
                boton.id = "eliminar";
                boton.addEventListener("click", function () {
                    var fila = this.parentNode.parentNode; 

                    fila.remove();
                });
                celdaBoton.appendChild(boton);
                fila.appendChild(celdaBoton);

                cuerpoTabla.appendChild(fila);
            }
        </script>
    </body>
</html>
