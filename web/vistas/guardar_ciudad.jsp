<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <!-- Tema oscuro de Bootstrap -->
          <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-color: #343a40;
            color: #fff;
        }
        .container {
            margin-top: 50px;
        }
        h1 {
            color: #fff;
        }
        input[type="text"] {
            background-color: #495057;
            border: none;
            color: #fff;
            margin-bottom: 10px;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 8px 16px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
    </head>
    <body>
        <div class="container">
            <h1 class="mt-4 mb-4">AGREGAR CIUDAD</h1>
            <form action="../ciudadcontrolador" method="post">
                <div class="form-group">
                    <h1>CODIGO</h1> <input type="text" class="form-control" name="txtcodigo">
                </div>
                <div class="form-group">
                    <h1>NOMBRE</h1> <input type="text" class="form-control" name="txtnombre">
                </div>
                <br>
                <!-- MUY IMPORTANTE ENVIAR UNA VARIABLE MAS POR POST EN ESTE CASO SE ENVIA CON LOS TXT LA VARIABLE accion = "Agregar" PARA QUE DE ESA FORMA EL CONTROLADOR PUEDA SABER QUE EL USUARIO QUIERE AGREGAR Y NO MODIFICAR O ELIMINAR -->
                <button type="submit" class="btn btn-primary" name="accion" value="Agregar">Agregar</button>
                  <button type="button" class="btn btn-secondary" onclick="window.history.back();" name="cancelar">Cancelar</button>
            </form>
        </div>

        <!-- Bootstrap JS y jQuery (opcional, pero requerido para ciertas funcionalidades de Bootstrap) -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
