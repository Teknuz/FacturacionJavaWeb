
package modelo;



import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
public class loginmodelo {
    
        private String usuario,clave;
        Statement st;
        ResultSet rs;

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }
        
         public boolean acceder() {
   boolean aux= false;
   
   String sql="select * from usuarios where usu_nombre='"+usuario+"'"
   +" and usu_clave ='"+clave+"'and usu_estado='ACTIVO'";
   try{
   st=utilidades.conexion.sta(st);
   rs=st.executeQuery(sql);
   rs.next();
   if(rs.getRow()==0){
   aux=false;
   }else{
   aux=true;
   }
   st.close();
   rs.close();
  
   } catch (SQLException ex){
    Logger.getLogger(loginmodelo.class.getName()).log(Level.SEVERE, null, ex);   
   }
            return aux;
   }
       public String validar(){
    
   String sql="select * from usuarios where usu_nombre='"+usuario+"'"
   +" and usu_clave='"+clave+"'and usu_estado='ACTIVO'";
   String tipo="";
   
  try{
  st=utilidades.conexion.sta(st);
  rs=st.executeQuery(sql);
  rs.next();
  if(rs.getRow()==0){
  tipo="error";
  }else{
  tipo= rs.getString("usu_tipo");
  }
  st.close();
  rs.close();
  } catch(SQLException ex){
  Logger.getLogger(loginmodelo.class.getName()).log(Level.SEVERE,null, ex);
  }
   return tipo;
   
   }   
       
    public String obtenerid() {
    String sql="Select * from usuarios where usu_nombre ='"+usuario+"' "+
            " and usu_clave='"+clave+"' and usu_estado='ACTIVO'";
    String id="";
    
    try{
    st= utilidades.conexion.sta(st);
    rs=st.executeQuery(sql);
    rs.next();
    if(rs.getRow()==0){
    id="error";
    }else{
    id= rs.getString("idusuarios");
    }
    st.close();
    rs.close();
    }catch (SQLException ex){
    Logger.getLogger(loginmodelo.class.getName()).log(Level.SEVERE, null, ex);
    }
    return id;
    }   

         
}
