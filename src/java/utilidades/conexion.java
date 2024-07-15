package utilidades;
//se importan las librerias necesarias para la conexion
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
/**
 *
 * @author User
 */
public class conexion {
    static Connection conn = null;
    static Statement st = null;
    static String  bd = "programacionv2024";
    static String usuario = "root";
    static String clave = "";
    static String  url = "jdbc:mysql://localhost:3306/"+bd;
   
 
    
    public static Connection EnLace(Connection conn) throws SQLException{
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, usuario, clave);
            System.out.print("Conexion Exitosa");
        }catch(ClassNotFoundException | SQLException ex){
            System.out.print("Error clase no encontrada" + ex);
        
        }
        return conn;
    }
        //Creamos un metodo para devolver Statement (ejecutar sentencia SQL)
    public static Statement sta(Statement st) throws SQLException{
        conn = EnLace(conn);
        st = conn.createStatement();
        return st;
    }
}
