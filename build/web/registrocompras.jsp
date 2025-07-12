<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <form action="../productoscontrolador" method="post">
    <title>Registro de Compras</title>
<main>
    
</main>>
</head>
<body>
    <h2>Registro de Compras</h2>
    <form action="guardarCompra.jsp" method="post">
        <label for="idCompra">ID de Compra:</label>
        <input type="text" id="idCompra" name="idCompra" ><br><br>
        
        <label for="fecha">Fecha:</label>
        <input type="date" id="fecha" name="fecha" ><br><br>
          
         <label for="estado">Condicion de Compra:</label>
        <select id="estado" name="estado" >
            <option value="Contado">Contado</option>
            <option value="Credito">Credito</option>
    </select><br><br>
        <label for="estado">Estado:</label>
        <select id="estado" name="estado" >
            <option value="Pendiente">Activo</option>
            <option value="Procesado">Pendiente</option>
            <option value="Cancelado">Cancelado</option>
        </select><br><br>
       
        <label for="usuario">Usuario:</label>
        <input type="text" id="usuario" name="usuario" ><br><br>
        
        
        
        <label for="productos">Productos:</label>
        <input type="text" id="productos" name="productos" > <li><a href="productos.jsp">Buscar Productos</a></li><br><br>
        
        

         

        
  
        
        <input type="submit" value="Añadir">
        <input type="submit" value="Borrar">
        <input type="submit" value="Guardar">
    </form>
</body>
</html>
