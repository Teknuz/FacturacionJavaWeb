<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>AGREGAR UN NUEVO CLIENTE</title>
    <!-- Incluir Bootstrap -->

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
    </style>
</head>
<body>
    <div class="container mt-4">
        <h1 class="mb-4">AGREGAR UN NUEVO CLIENTE</h1>
        <form action="../clientecontrolador" method="post">
            <div class="form-group">
                <label for="txtcodigo">CÓDIGO</label>
                <input type="text" class="form-control" id="txtcodigo" name="txtcodigo">
            </div>
            <div class="form-group">
                <label for="txtnombre">NOMBRE</label>
                <input type="text" class="form-control" id="txtnombre" name="txtnombre">
            </div>
            <div class="form-group">
                <label for="txtapellido">APELLIDO</label>
                <input type="text" class="form-control" id="txtapellido" name="txtapellido">
            </div>
            <div class="form-group">
                <label for="txtci">RUC/CI</label>
                <input type="text" class="form-control" id="txtci" name="txtci">
            </div>
            <div class="form-group">
                <label for="txttelefono">TELÉFONO</label>
                <input type="text" class="form-control" id="txttelefono" name="txttelefono">
            </div>
            <div class="form-group">
                <label for="txtciudad">CIUDAD</label>
                <input type="text" class="form-control" id="txtciudad" name="txtciudad">
            </div>
            <!-- Enviar la acción "Agregar" -->
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
