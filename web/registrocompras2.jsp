<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Compras</title>
</head>
<body>
    <h2>Registro de Compras</h2>
    <form action="guardarCompra.jsp" method="post">
        <label for="idCompra">ID de Compra:</label>
        <input type="text" id="idCompra" name="idCompra" required><br><br>
        
        <label for="fecha">Fecha:</label>
        <input type="date" id="fecha" name="fecha" required><br><br>
        
        <label for="condicionCompra">Condición de Compra:</label>
        <select id="condicionCompra" name="condicionCompra" required>
            <option value="Contado">Contado</option>
            <option value="Crédito">Crédito</option>
        </select><br><br>
        
        <label for="estado">Estado:</label>
        <select id="estado" name="estado" required>
            <option value="Pendiente">Pendiente</option>
            <option value="Procesado">Procesado</option>
            <option value="Cancelado">Cancelado</option>
        </select><br><br>
        
        <label for="usuario">Usuario:</label>
        <input type="text" id="usuario" name="usuario" required><br><br>
        
        <label for="productos">Productos:</label>
        <select id="productos" name="productos" required>
            <option value="Producto 1">Producto 1</option>
            <option value="Producto 2">Producto 2</option>
            <!-- Agrega más opciones según sea necesario -->
        </select><br><br>
        
        <label for="idProductos">ID de Productos:</label>
        <input type="text" id="idProductos" name="idProductos" required><br><br>
        
        <label for="proveedores">Proveedores:</label>
        <select id="proveedores" name="proveedores" required>
            <option value="Proveedor 1">Proveedor 1</option>
            <option value="Proveedor 2">Proveedor 2</option>
            <!-- Agrega más opciones según sea necesario -->
        </select><br><br>
        
        <input type="submit" value="Guardar">
    </form>
</body>
</html>
