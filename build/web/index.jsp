

<%@page import="modelo.loginmodelo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>JSP Page</title>
    <style>
        body {
            background-image: url('img/fondo.jpg'); /* Cambia 'img/background.jpg' por la ruta de tu imagen de fondo */
            background-size:contain, cover;
            background-position: center;
            color: #fff;
        }
        .container {
            margin-top: 100px;
        }
        .card {
            background-color: rgba(0, 0, 0, 0.5); /* Ajusta el valor de '0.5' para cambiar la opacidad */
            color: #fff;
        }
        .form-sign {
            padding: 20px; /* Añade un poco de espacio interno al formulario */
        }
        .form-group label {
            color: #fff;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
    </style>
</head>
<body>
   
    <div class="container">
        <div class="card col-sm-10 mx-auto"> <!-- Utiliza 'mx-auto' para centrar el elemento horizontalmente -->
            <div class="card-body">
                <form class="form-sign" action="logincontrolador" method="post">       
                    <div class="form-group text-center">
                        <h3>Login</h3>
                        <img src="img/logo.png" alt="70" width="170"/><br>
                        <label>Bienvenido al Sistema</label>
                    </div>
                    <div class="form-group">
                        <label>Usuario: </label>
                        <input type="text" name="txtusuario" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Password: </label>
                        <input type="password" name="txtclave" class="form-control">
                    </div>
                    <input type="submit" name="accion" value="Ingresar" class="btn btn-primary btn-block">
                </form>
            </div>
        </div>
    </div>
    <% loginmodelo m = new loginmodelo();
       m = (loginmodelo) request.getAttribute("error");
       if (m !=null){
           out.print("USUARIO NO EXISTE");
       }
    %>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
<footer>
</footer>
</html>
