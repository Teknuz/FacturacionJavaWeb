<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Punto de Venta</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #eef2f3;
      padding: 20px;
    }
    h2 {
      text-align: center;
    }
    .formulario, .tabla, .resumen {
      max-width: 800px;
      margin: 20px auto;
      background: white;
      padding: 20px;
      border-radius: 10px;
    }
    input, select, button {
      padding: 8px;
      margin: 5px;
      font-size: 16px;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 10px;
    }
    th, td {
      padding: 8px;
      border-bottom: 1px solid #ccc;
      text-align: center;
    }
    .resumen {
      font-size: 18px;
    }
    .total {
      font-weight: bold;
      font-size: 20px;
    }
    .oculto {
      display: none;
    }
  </style>
</head>
<body>

  <h2>Punto de Venta</h2>

  <div class="formulario">
    <label for="codigo">Código / Nombre:</label>
    <input type="text" id="codigo" placeholder="Buscar o escanear..." autofocus>
    <label for="cantidad">Cantidad:</label>
    <input type="number" id="cantidad" min="1" value="1">
    <button onclick="agregarProducto()">Agregar</button>
  </div>

  <div class="tabla">
    <h3>Carrito</h3>
    <table id="tablaCarrito">
      <thead>
        <tr>
          <th>Producto</th>
          <th>Cantidad</th>
          <th>Precio Unitario</th>
          <th>Subtotal</th>
          <th>Eliminar</th>
        </tr>
      </thead>
      <tbody id="carritoBody"></tbody>
    </table>
  </div>

  <div class="resumen">
    <p class="total">Total: Gs. <span id="total">0</span></p>

    <label for="metodoPago">Método de pago:</label>
    <select id="metodoPago" onchange="mostrarCamposPago()">
      <option value="efectivo">Efectivo</option>
      <option value="tarjeta">Tarjeta</option>
    </select>

    <div id="campoEfectivo">
      <label for="pagado">Monto entregado:</label>
      <input type="number" id="pagado" oninput="calcularVuelto()">
      <p><strong>Vuelto:</strong> Gs. <span id="vuelto">0</span></p>
    </div>

    <label for="facturaNombre">A nombre de:</label>
    <input type="text" id="facturaNombre" placeholder="Nombre del cliente">

    <br>
    <button onclick="cobrar()">Cobrar</button>
  </div>

  <script>
    const productos = [
      { codigo: "001", nombre: "Shampoo", precio: 15000 },
      { codigo: "002", nombre: "Acondicionador", precio: 18000 },
      { codigo: "003", nombre: "Cera", precio: 12000 },
      { codigo: "004", nombre: "Tijera", precio: 25000 },
      { codigo: "005", nombre: "Gel", precio: 10000 }
    ];

    let carrito = [];

    function agregarProducto() {
      const codigoInput = document.getElementById("codigo").value.trim().toLowerCase();
      const cantidad = parseInt(document.getElementById("cantidad").value);

      if (!codigoInput || cantidad < 1) return;

      const producto = productos.find(p =>
        p.codigo === codigoInput || p.nombre.toLowerCase().includes(codigoInput)
      );

      if (!producto) {
        alert("Producto no encontrado");
        return;
      }

      const existente = carrito.find(p => p.codigo === producto.codigo);
      if (existente) {
        existente.cantidad += cantidad;
      } else {
        carrito.push({ ...producto, cantidad });
      }

      document.getElementById("codigo").value = "";
      document.getElementById("cantidad").value = 1;
      renderCarrito();
    }

    function eliminarProducto(index) {
      carrito.splice(index, 1);
      renderCarrito();
    }

    function renderCarrito() {
      const body = document.getElementById("carritoBody");
      body.innerHTML = "";
      let total = 0;

      carrito.forEach((item, index) => {
        const subtotal = item.precio * item.cantidad;
        total += subtotal;

        const row = document.createElement("tr");
        row.innerHTML = `
          <td>${item.nombre}</td>
          <td>${item.cantidad}</td>
          <td>Gs. ${item.precio.toLocaleString()}</td>
          <td>Gs. ${subtotal.toLocaleString()}</td>
          <td><button onclick="eliminarProducto(${index})">X</button></td>
        `;
        body.appendChild(row);
      });

      document.getElementById("total").textContent = total.toLocaleString();
      calcularVuelto();
    }

    function mostrarCamposPago() {
      const metodo = document.getElementById("metodoPago").value;
      const campoEfectivo = document.getElementById("campoEfectivo");

      if (metodo === "efectivo") {
        campoEfectivo.classList.remove("oculto");
      } else {
        campoEfectivo.classList.add("oculto");
        document.getElementById("vuelto").textContent = "0";
      }
    }

    function calcularVuelto() {
      const pagado = parseInt(document.getElementById("pagado").value) || 0;
      const total = carrito.reduce((sum, item) => sum + item.precio * item.cantidad, 0);
      const vuelto = pagado - total;
      document.getElementById("vuelto").textContent = vuelto > 0 ? vuelto.toLocaleString() : "0";
    }

    function cobrar() {
      const metodo = document.getElementById("metodoPago").value;
      const total = carrito.reduce((sum, item) => sum + item.precio * item.cantidad, 0);
      const pagado = parseInt(document.getElementById("pagado").value) || 0;
      const nombre = document.getElementById("facturaNombre").value.trim();

      if (carrito.length === 0) {
        alert("El carrito está vacío.");
        return;
      }

      if (!nombre) {
        alert("Debe indicar a nombre de quién es la factura.");
        return;
      }

      if (metodo === "efectivo" && pagado < total) {
        alert("El monto entregado no es suficiente.");
        return;
      }

      // Aquí podrías guardar en base de datos o imprimir
      alert(`Venta exitosa.\nMétodo: ${metodo}\nFactura a nombre de: ${nombre}`);
      
      // Limpiar
      carrito = [];
      renderCarrito();
      document.getElementById("pagado").value = "";
      document.getElementById("facturaNombre").value = "";
      document.getElementById("vuelto").textContent = "0";
    }

    // Inicial
    mostrarCamposPago();
  </script>

</body>
</html>
