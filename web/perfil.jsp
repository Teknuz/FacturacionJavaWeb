<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Panel de Usuario</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .profile-pic {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border-radius: 50%;
            border: 3px solid #007bff;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h3>Panel de Usuario</h3>
    <div class="card">
        <div class="card-body">
            <form action="UsuarioControlador" method="post" enctype="multipart/form-data">
                <input type="hidden" name="accion" value="actualizarPerfil">
                <div class="row">
                    <div class="col-md-4 text-center">
                        <img src="${usuario.foto}" class="profile-pic mb-3" alt="Foto de perfil">
                        <div class="form-group">
                            <input type="file" name="foto" class="form-control-file">
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="form-group">
                            <label>Nombre de Usuario</label>
                            <input type="text" name="nombre" value="${usuario.nombre}" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Correo Electrónico</label>
                            <input type="email" name="correo" value="${usuario.correo}" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Contraseña Nueva (opcional)</label>
                            <input type="password" name="nuevaPassword" class="form-control">
                        </div>
                        <button type="submit" class="btn btn-primary">Actualizar Datos</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
