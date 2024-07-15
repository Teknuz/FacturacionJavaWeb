package modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author user
 */
public class productosmodelo {

    private String codigo, nombre, apellido, ci, mensaje, telefono, ciudad,costo,precio,stock,stockmin,proveedornombre,proveedorid;
    private String minimo,iva;
    Statement st;
    ResultSet rs;

    public String getMinimo() {
        return minimo;
    }

    public void setMinimo(String minimo) {
        this.minimo = minimo;
    }

    public String getIva() {
        return iva;
    }

    public void setIva(String iva) {
        this.iva = iva;
    }

    
    public String getProveedornombre() {
        return proveedornombre;
    }

    public void setProveedornombre(String proveedornombre) {
        this.proveedornombre = proveedornombre;
    }

    public String getProveedorid() {
        return proveedorid;
    }

    public void setProveedorid(String proveedorid) {
        this.proveedorid = proveedorid;
    }

    public String getTelefono() {
        return telefono;
    }

    public String getCosto() {
        return costo;
    }

    public void setCosto(String costo) {
        this.costo = costo;
    }

    public String getPrecio() {
        return precio;
    }

    public void setPrecio(String precio) {
        this.precio = precio;
    }

    public String getStock() {
        return stock;
    }

    public void setStock(String stock) {
        this.stock = stock;
    }

    public String getStockmin() {
        return stockmin;
    }

    public void setStockmin(String stockmin) {
        this.stockmin = stockmin;
    }

 

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCiudad() {
        return ciudad;
    }

    /*
    Se agrega los metodos getter and setter para obtemer o enviar valores 
    a las variables, se presiona clic derecho, insert code, y se selecciona
    getter and setter y solo se selecciona las variables
     */
    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCi() {
        return ci;
    }

    public void setCi(String ci) {
        this.ci = ci;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    //se crean los metodos para cargar la tabla de la pagina CLIENTES.JSP
    public List listar() { // Método público que devuelve una lista de clientes.
        /*
            Se crea una nueva lista utilizando la implementación ArrayList 
            que contendrá objetos de tipo 'clientemodelo'(codigo, nombre, apellido, ci/ruc).    
         */
        ArrayList<productosmodelo> list = new ArrayList<>();
        // Se define una consulta SQL para seleccionar todos los registros de la tabla 'clientes'.
        String sql = "select * from productos";

        try {
            //se abre y se prepara la conexion
            st = utilidades.conexion.sta(st);
            // Se ejecuta la consulta SQL y se obtiene un conjunto de resultados segun el sql
            rs = st.executeQuery(sql);
            // Se itera sobre cada fila del conjunto de resultados hasta que no haya resultados
            while (rs.next()) {
                //se realiza la instancia de la misma clase para contener los datos extraidos de la consulta
                productosmodelo modelo = new productosmodelo();
                //segun lo encontrado se va iterando y obteniendo los valores de cada fila su codigo, nombre, apellido y ruc
                modelo.setCodigo(rs.getString("idproductos"));
                modelo.setNombre(rs.getString("pro_nombre"));
                modelo.setCosto(rs.getString("pro_costo"));
                modelo.setPrecio(rs.getString("pro_precio"));
                modelo.setStock(rs.getString("pro_stock"));
                modelo.setStockmin(rs.getString("pro_min"));
                 modelo.setProveedorid(rs.getString("proveedores_idproveedores"));
                 modelo.setIva(rs.getString("pro_iva"));
               

                // Se agrega el objeto 'clientemodelo' a la lista. para luego transportar a la tabla de la página cliente.jsp
                list.add(modelo);
            }

            st.close(); // Se cierra el Statement para liberar recursos.
            rs.close(); // Se cierra el conjunto de resultados para liberar recursos.

        } catch (SQLException ex) {
            Logger.getLogger(clientemodelo.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list; // Se devuelve la lista de objetos 'clientemodelo'. Que luego recibira la página clientes.jsp
    }

    //metodo para guardar
    public void guardar() throws SQLException {
        //se crea el sql para guardar
     String sql=" INSERT INTO productos(idproductos,pro_nombre, pro_costo, pro_precio, pro_stock, pro_min,proveedores_idproveedores,pro_iva)"+
"VALUES ('" + codigo + "','" + nombre + "','" + costo + "','" + precio + "','" + stock + "','" + stockmin + "','" + proveedorid + "','" + iva + "')";

 
    mensaje = "Cliente guardado con éxito";
        try {
            //se abre la conexion
            st = utilidades.conexion.sta(st);
            //se ejecutra el insert into
            st.executeUpdate(sql);
            //se cierra el statement para liberar recursos
            st.close();
            //retorna un mensaje para avisar al formulario que se guardo el cliente
            mensaje = "producto guardado con exito";
        } catch (SQLException ex) {
            Logger.getLogger(productosmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //para modificar
    //para modificar
    public List listarporid(String id) { // Método público que devuelve una lista de clientes filtrado por id
        /*
            Se crea una nueva lista utilizando la implementación ArrayList 
            que contendrá objetos de tipo 'clientemodelo'(codigo, nombre, apellido, ci/ruc).    
         */
        ArrayList<productosmodelo> list = new ArrayList<>();
        // Se define una consulta SQL para seleccionar todos los registros de la tabla 'clientes'.
        String sql = "select * from productos where idproductos ='" + id + "'";

        try {
            //se abre y se prepara la conexion
            st = utilidades.conexion.sta(st);
            // Se ejecuta la consulta SQL y se obtiene un conjunto de resultados segun el sql
            rs = st.executeQuery(sql);
            // Se itera sobre cada fila del conjunto de resultados hasta que no haya resultados
            while (rs.next()) {
                //se realiza la instancia de la misma clase para contener los datos extraidos de la consulta
                productosmodelo modelo = new productosmodelo();
                //segun lo encontrado se va iterando y obteniendo los valores de cada fila su codigo, nombre, apellido y ruc
               
                   modelo.setCodigo(rs.getString("idproductos"));
                modelo.setNombre(rs.getString("pro_nombre"));
                modelo.setCosto(rs.getString("pro_costo"));
                modelo.setPrecio(rs.getString("pro_precio"));
                modelo.setIva(rs.getString("pro_iva"));
                modelo.setStock(rs.getString("pro_stock"));
                modelo.setStockmin(rs.getString("pro_min"));
                 modelo.setProveedorid(rs.getString("proveedores_idproveedores"));
                // Se agrega el objeto 'clientemodelo' a la lista. para luego transportar a la tabla de la página cliente.jsp
                list.add(modelo);
            }

            st.close(); // Se cierra el Statement para liberar recursos.
            rs.close(); // Se cierra el conjunto de resultados para liberar recursos.

        } catch (SQLException ex) {
            Logger.getLogger(productosmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list; // Se devuelve la lista de objetos 'clientemodelo'. Que luego recibira la página clientes.jsp
    }

    public void modificar() {
        String sql =" UPDATE productos SET pro_nombre='" + nombre + "', pro_costo='" + costo + "', pro_precio='" +precio + "',pro_stock='" +stock + "' ,pro_min='" +stockmin +"',proveedores_idproveedores= '"+ proveedorid + "', pro_iva= '" + iva + "' WHERE idproductos = '" + codigo+  "'";

        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
            mensaje = "MODIFICADO";
        } catch (SQLException ex) {
            Logger.getLogger(productosmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void eliminar(String id) {
        String sql = "delete from productos where idproductos='" + id + "'";

        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException ex) {
            Logger.getLogger(productosmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
