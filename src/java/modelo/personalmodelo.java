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
public class personalmodelo {

    private String codigo, nombre, apellido, ci, mensaje, telefono, ciudad;
    Statement st;
    ResultSet rs;

    public String getTelefono() {
        return telefono;
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
        ArrayList<personalmodelo> list = new ArrayList<>();
        // Se define una consulta SQL para seleccionar todos los registros de la tabla 'clientes'.
        String sql = "Select * from personales";

        try {
            //se abre y se prepara la conexion
            st = utilidades.conexion.sta(st);
            // Se ejecuta la consulta SQL y se obtiene un conjunto de resultados segun el sql
            rs = st.executeQuery(sql);
            // Se itera sobre cada fila del conjunto de resultados hasta que no haya resultados
            while (rs.next()) {
                //se realiza la instancia de la misma clase para contener los datos extraidos de la consulta
                personalmodelo modelo = new personalmodelo();
                //segun lo encontrado se va iterando y obteniendo los valores de cada fila su codigo, nombre, apellido y ruc
                modelo.setCodigo(rs.getString("idpersonales"));
                modelo.setNombre(rs.getString("per_nombre"));
                modelo.setApellido(rs.getString("per_apellido"));
                modelo.setCi(rs.getString("per_ci"));
                modelo.setTelefono(rs.getString("per_telefono"));
                

                // Se agrega el objeto 'clientemodelo' a la lista. para luego transportar a la tabla de la página cliente.jsp
                list.add(modelo);
            }

            st.close(); // Se cierra el Statement para liberar recursos.
            rs.close(); // Se cierra el conjunto de resultados para liberar recursos.

        } catch (SQLException ex) {
            Logger.getLogger(personalmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list; // Se devuelve la lista de objetos 'clientemodelo'. Que luego recibira la página clientes.jsp
    }

    //metodo para guardar
    public void guardar() throws SQLException {
        //se crea el sql para guardar
     
String sql = "INSERT INTO personales (idpersonales, per_nombre, per_apellido, per_ci, per_telefono) "
        + "VALUES ('" + codigo + "','" + nombre + "','" + apellido + "','" + ci + "','" + telefono + "')";

 
    mensaje = "personal guardado con éxito";
        try {
            //se abre la conexion
            st = utilidades.conexion.sta(st);
            //se ejecutra el insert into
            st.executeUpdate(sql);
            //se cierra el statement para liberar recursos
            st.close();
            //retorna un mensaje para avisar al formulario que se guardo el cliente
            mensaje = "personal guardado con exito";
        } catch (SQLException ex) {
            Logger.getLogger(personalmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //para modificar
    //para modificar
    public List listarporid(String id) { // Método público que devuelve una lista de clientes filtrado por id
        /*
            Se crea una nueva lista utilizando la implementación ArrayList 
            que contendrá objetos de tipo 'clientemodelo'(codigo, nombre, apellido, ci/ruc).    
         */
        ArrayList<personalmodelo> list = new ArrayList<>();
        // Se define una consulta SQL para seleccionar todos los registros de la tabla 'clientes'.
        String sql = "select * from personales where idpersonales ='" + id + "'";

        try {
            //se abre y se prepara la conexion
            st = utilidades.conexion.sta(st);
            // Se ejecuta la consulta SQL y se obtiene un conjunto de resultados segun el sql
            rs = st.executeQuery(sql);
            // Se itera sobre cada fila del conjunto de resultados hasta que no haya resultados
            while (rs.next()) {
                //se realiza la instancia de la misma clase para contener los datos extraidos de la consulta
                personalmodelo modelo = new personalmodelo();
                //segun lo encontrado se va iterando y obteniendo los valores de cada fila su codigo, nombre, apellido y ruc
                modelo.setCodigo(rs.getString("idpersonales"));
                modelo.setNombre(rs.getString("per_nombre"));
                modelo.setApellido(rs.getString("per_apellido"));
                modelo.setCi(rs.getString("per_ci"));
                 modelo.setTelefono(rs.getString("per_telefono"));
                  
                  
                // Se agrega el objeto 'clientemodelo' a la lista. para luego transportar a la tabla de la página cliente.jsp
                list.add(modelo);
            }

            st.close(); // Se cierra el Statement para liberar recursos.
            rs.close(); // Se cierra el conjunto de resultados para liberar recursos.

        } catch (SQLException ex) {
            Logger.getLogger(personalmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list; // Se devuelve la lista de objetos 'clientemodelo'. Que luego recibira la página clientes.jsp
    }

    public void modificar() {
        String sql =" UPDATE personales SET per_nombre='" + nombre + "', per_apellido='" + apellido + "', per_ci='" +ci + "',per_telefono='" +telefono + "'  WHERE idpersonales='" + codigo+  "'";

        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
            mensaje = "MODIFICADO";
        } catch (SQLException ex) {
            Logger.getLogger(personalmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void eliminar(String id) {
        String sql = "delete from personales where idpersonales='" + id + "'";

        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException ex) {
            Logger.getLogger(personalmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
