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
public class usuariosmodelo {

    private String Codigo, Usuario, Clave, Tipo, Estado, Personal, mensaje;
    Statement st;
    ResultSet rs;

    public String getUsuario() {
        return Usuario;
    }

    public void setUsuario(String Usuario) {
        this.Usuario = Usuario;
    }

    public String getClave() {
        return Clave;
    }

    public void setClave(String Clave) {
        this.Clave = Clave;
    }

    public String getTipo() {
        return Tipo;
    }

    public void setTipo(String Tipo) {
        this.Tipo = Tipo;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    public String getPersonal() {
        return Personal;
    }

    public void setPersonal(String Personal) {
        this.Personal = Personal;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    /*
    Se agrega los metodos getter and setter para obtemer o enviar valores 
    a las variables, se presiona clic derecho, insert code, y se selecciona
    getter and setter y solo se selecciona las variables
     */
    public String getCodigo() {
        return Codigo;
    }

    public void setCodigo(String Codigo) {
        this.Codigo = Codigo;
    }

    //se crean los metodos para cargar la tabla de la pagina CLIENTES.JSP
    public List listar() { // Método público que devuelve una lista de clientes.
        /*
            Se crea una nueva lista utilizando la implementación ArrayList 
            que contendrá objetos de tipo 'clientemodelo'(codigo, nombre, apellido, ci/ruc).    
         */
        ArrayList<usuariosmodelo> list = new ArrayList<>();
        // Se define una consulta SQL para seleccionar todos los registros de la tabla 'clientes'.
        String sql = "SELECT u.idusuarios, u.usu_nombre, u.usu_clave, u.usu_tipo, u.usu_estado,\n"
                + "       p.idpersonales\n"
                + "FROM usuarios u\n"
                + "INNER JOIN personales p ON u.personales_idpersonales = p.idpersonales;";

        try {
            //se abre y se prepara la conexion
            st = utilidades.conexion.sta(st);
            // Se ejecuta la consulta SQL y se obtiene un conjunto de resultados segun el sql
            rs = st.executeQuery(sql);
            // Se itera sobre cada fila del conjunto de resultados hasta que no haya resultados
            while (rs.next()) {
                //se realiza la instancia de la misma clase para contener los datos extraidos de la consulta
                usuariosmodelo modelo = new usuariosmodelo();
                //segun lo encontrado se va iterando y obteniendo los valores de cada fila su codigo, nombre, apellido y ruc
                modelo.setCodigo(rs.getString("idusuarios"));
                modelo.setUsuario(rs.getString("usu_nombre"));
                modelo.setClave(rs.getString("usu_clave"));
                modelo.setTipo(rs.getString("usu_tipo"));
                modelo.setEstado(rs.getString("usu_estado"));
                modelo.setPersonal(rs.getString("p.idpersonales"));

                // Se agrega el objeto 'clientemodelo' a la lista. para luego transportar a la tabla de la página cliente.jsp
                list.add(modelo);
            }

            st.close(); // Se cierra el Statement para liberar recursos.
            rs.close(); // Se cierra el conjunto de resultados para liberar recursos.

        } catch (SQLException ex) {
            Logger.getLogger(usuariosmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list; // Se devuelve la lista de objetos 'clientemodelo'. Que luego recibira la página clientes.jsp
    }

    //metodo para guardar
    public void guardar() throws SQLException {
        //se crea el sql para guardar

        String sql = "INSERT INTO usuarios (idusuarios,usu_nombre, usu_clave, usu_tipo, usu_estado, personales_idpersonales) \n"
                + "VALUES ('" + Codigo + "','" + Usuario + "','" + Clave + "','" + Tipo + "','" + Estado + "','" + Personal + "')";

        mensaje = "usuarios guardado con éxito";
        try {
            //se abre la conexion
            st = utilidades.conexion.sta(st);
            //se ejecutra el insert into
            st.executeUpdate(sql);
            //se cierra el statement para liberar recursos
            st.close();
            //retorna un mensaje para avisar al formulario que se guardo el cliente
            mensaje = "usuarios guardado con exito";
        } catch (SQLException ex) {
            Logger.getLogger(usuariosmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //para modificar
    //para modificar
    public List listarporid(String id) { // Método público que devuelve una lista de clientes filtrado por id
        /*
            Se crea una nueva lista utilizando la implementación ArrayList 
            que contendrá objetos de tipo 'clientemodelo'(codigo, nombre, apellido, ci/ruc).    
         */
        ArrayList<usuariosmodelo> list = new ArrayList<>();
        // Se define una consulta SQL para seleccionar todos los registros de la tabla 'clientes'.
        String sql = "select * from usuarios where idusuarios='"+id+"'";

        try {
            //se abre y se prepara la conexion
            st = utilidades.conexion.sta(st);
            // Se ejecuta la consulta SQL y se obtiene un conjunto de resultados segun el sql
            rs = st.executeQuery(sql);
            // Se itera sobre cada fila del conjunto de resultados hasta que no haya resultados
            while (rs.next()) {
                //se realiza la instancia de la misma clase para contener los datos extraidos de la consulta
                usuariosmodelo modelo = new usuariosmodelo();
                //segun lo encontrado se va iterando y obteniendo los valores de cada fila su codigo, nombre, apellido y ruc
                modelo.setCodigo(rs.getString("idusuarios"));
                modelo.setUsuario(rs.getString("usu_nombre"));
                modelo.setClave(rs.getString("usu_clave"));
                modelo.setTipo(rs.getString("usu_tipo"));
                modelo.setEstado(rs.getString("usu_estado"));
                modelo.setPersonal(rs.getString("personales_idpersonales"));

                // Se agrega el objeto 'clientemodelo' a la lista. para luego transportar a la tabla de la página cliente.jsp
                list.add(modelo);
            }

            st.close(); // Se cierra el Statement para liberar recursos.
            rs.close(); // Se cierra el conjunto de resultados para liberar recursos.

        } catch (SQLException ex) {
            Logger.getLogger(usuariosmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list; // Se devuelve la lista de objetos 'clientemodelo'. Que luego recibira la página clientes.jsp
    }

    public void modificar() {
        String sql = " UPDATE usuarios SET usu_nombre='" + Usuario + "', usu_clave='" + Clave +
                "', usu_tipo='" + Tipo + "',usu_estado='" + Estado + "',personales_idpersonales='"
                +Personal+"'  WHERE idusuarios='" + Codigo + "'";

        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
            mensaje = "MODIFICADO";
        } catch (SQLException ex) {
            Logger.getLogger(usuariosmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void eliminar(String id) {
        String sql = "delete from usuarios where idusuarios='" + id + "'";

        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException ex) {
            Logger.getLogger(usuariosmodelo.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
