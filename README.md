# 🧾 Sistema de Facturación Java Web

Este es un sistema de facturación desarrollado con Java EE, JSP, Servlets, MySQL y Bootstrap. Permite la gestión de clientes, productos, ventas y cierres de caja de forma sencilla y adaptable para negocios pequeños y medianos.

---

## 🚀 Características principales

- Gestión de clientes y productos
- Carga de ventas
- Facturación automática con impresión lista
- Control de caja: apertura, cierre
- Interfaz limpia y responsiva con Bootstrap
- Modal para selección rápida de clientes/proveedores
- Base de datos relacional y normalizada

---

## 🖼 Capturas de pantalla

### Inicio de sesión
![Login](assets/img/login.png)

### Panel principal / Dashboard
![Dashboard](assets/img/dashboard.png)

### Gestión de productos
![Productos](assets/img/productos.png)

### Formulario de venta
![Venta](assets/img/venta.png)

### Modal de clientes
![Clientes Modal](assets/img/clientes-modal.png)

### Factura generada
![Factura](assets/img/factura.png)

---

## ⚙️ Requisitos

- Java 8 o superior
- Apache Tomcat 9+
- MySQL 5.7 o superior
- IDE recomendado: NetBeans o IntelliJ IDEA
- Navegador web moderno

---

## 🛠 Cómo ejecutar el proyecto localmente

1. **Clona el repositorio**
   ```bash
   git clone https://github.com/Teknuz/FacturacionJavaWeb.git
2. **Importa el proyecto en tu IDE**
-Abre NetBeans o IntelliJ IDEA.
-Importa el proyecto como aplicación web (Java Web / Maven).

3. **Crea la base de datos**
-En MySQL, crea una base de datos llamada programacionv2024.
-Importa el archivo programacionv2024.sql ubicado en la carpeta /bd.

4.**Configura la conexión**
-Edita la clase Conexion.java ubicada en src/conexion/Conexion.java.
-Asegúrate de ingresar correctamente el usuario, contraseña y nombre de tu base de datos.

5.**Despliega en Apache Tomcat**
-Compila el proyecto.
-Corre el servidor Tomcat.
Accede desde tu navegador en:
http://localhost:8080/FacturacionJavaWeb/index.jsp


FacturacionJavaWeb/
├── bd/
│   └── programacionv2024.sql
├── src/
│   ├── controlador/
│   ├── modelo/
│   ├── utilidades/
│   ├── librerias/
│   └── ...
├── web/
│   ├── vistas/
│   ├── css/
│   ├── js/
│   ├── reportes/
│   ├── img/
│   ├── rpt/
│   └── ...
├── assets/
│   └── img/ ← (Capturas de pantalla)
├── README.md
└── ...

👨‍💻 Autor
José Gómez


