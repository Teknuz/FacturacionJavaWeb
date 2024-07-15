<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>AGREGAR UN NUEVO PRODUCTO</title>
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <style>
            /* Estilos personalizados */
            body {
                background-color: #343a40;
                color: #fff;
            }
            .container {
                margin-top: 50px;
            }
            th {
                color: #fff;
            }
            td {
                color: #adb5bd;
            }
            .btn {
                margin-right: 5px;
            }
        </style>
</head>
<body>
    <div class="container mt-4">
        <h1>AGREGAR UN NUEVO PRODUCTO</h1>
        <!-- 
        Se crea el formulario con un boton de tipo submit que enviara la peticion 
        al controlador del cliente que en breve se estará creando en el tutorial
        se utiliza el metodo post para pasar los valores correspondientes
        -->
        <form action="../productoscontrolador" method="post">
            
            <div class="form-group">
                <label for="txtcodigo">CÓDIGO</label>
                <input type="text" class="form-control" id="txtcodigo" name="txtcodigo">
            </div>
            <div class="form-group">
                <label for="txtnombre">NOMBRE</label>
                <input type="text" class="form-control" id="txtnombre" name="txtnombre">
            </div>
            <div class="form-group">
                <label for="txtcosto">COSTO</label>
                <input type="text" class="form-control" id="txtcosto" name="txtcosto">
            </div>
            <div class="form-group">
                <label for="txtprecio">PRECIO</label>
                <input type="text" class="form-control" id="txtprecio" name="txtprecio">
            </div>
            <div class="form-group">
                <label for="txtiva">IVA</label>
                <input type="text" class="form-control" id="txtiva" name="txtiva">
            </div>
            <div class="form-group">
                <label for="txtstock">STOCK</label>
                <input type="text" class="form-control" id="txtstock" name="txtstock">
            </div>
            <div class="form-group">
                <label for="txtstockmin">STOCK MINIMO</label>
                <input type="text" class="form-control" id="txtstockmin" name="txtstockmin">
            </div>
            <div class="form-group">
                <label for="txtproveedorid">ID PROVEEDOR</label>
                <input type="text" class="form-control" id="txtproveedorid" name="txtproveedorid">
            </div>
            
            <br>
            <!-- 
            MUY IMPORTANTE ENVIAR UNA VARIABLE MAS POR POST EN ESTE CASO 
            SE ENVIA CON LOS TXT LA VARIABLE accion = "Agregar"
            PARA QUE DE ESA FORMA EL CONTROLADOR PUEDA SABER QUE EL USUARIO 
            QUIERE AGREGAR Y NO MODIFICAR O ELIMINAR
            -->
            <button type="submit" class="btn btn-primary" name="accion" value="Agregar">Agregar</button>
              <button type="button" class="btn btn-secondary" onclick="window.history.back();" name="cancelar">Cancelar</button>
           
        </form>
    </div>
    <!-- Scripts de Bootstrap (jQuery y Popper.js son requeridos para Bootstrap) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
