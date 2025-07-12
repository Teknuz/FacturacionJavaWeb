/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
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
 * @author Usuario
 */
public class facturacompramodelo {
    Statement st;
    ResultSet rs;
    
    private String idfacturacion;
    private String fecha;
    private String condicion;
    private String estado;
    private String idusuarios;
    private String idapertura;
    private String Proveedor;
    private String idventas;
    private String uv;

    public String getUv() {
        return uv;
    }

    public void setUv(String uv) {
        this.uv = uv;
    }
    

    public String getIdventas() {
        return idventas;
    }

    public void setIdventas(String idventas) {
        this.idventas = idventas;
    }
    
    

    public String getProveedor() {
        return Proveedor;
    }

    public void setProveedor(String Proveedor) {
        this.Proveedor = Proveedor;
    }

 

    public String getIdfacturacion() {
        return idfacturacion;
    }

    public void setIdfacturacion(String idfacturacion) {
        this.idfacturacion = idfacturacion;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getCondicion() {
        return condicion;
    }

    public void setCondicion(String condicion) {
        this.condicion = condicion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getIdusuarios() {
        return idusuarios;
    }

    public void setIdusuarios(String idusuarios) {
        this.idusuarios = idusuarios;
    }

    public String getIdapertura() {
        return idapertura;
    }

    public void setIdapertura(String idapertura) {
        this.idapertura = idapertura;
    }

    
    
    public List listarfacturas() {
    ArrayList<facturacompramodelo> lista = new ArrayList<>();
    String sql="SELECT \n" +
"    c.idcompras,\n" +
"    c.com_fecha,\n" +
"    c.com_condicion,\n" +
"    c.com_estado,\n" +
"    u.usu_nombre AS nombre_usuario,\n" +
"    p.prov_nombre AS nombre_proveedor,\n" +
"    c.aperturas_idaperturas\n" +
"FROM \n" +
"    compras c\n" +
"JOIN \n" +
"    usuarios u ON c.usuarios_idusuarios = u.idusuarios\n" +
"JOIN \n" +
"    proveedores p ON c.proveedores_idproveedores = p.idproveedores;";
    
        try {
            st = utilidades.conexion.sta(st);
            rs = st.executeQuery(sql);
            while (rs.next()){
            facturacompramodelo modelo = new facturacompramodelo();
            modelo.setIdfacturacion(rs.getString(1));
            modelo.setFecha(rs.getString(2));
            modelo.setCondicion(rs.getString(3));
            modelo.setEstado(rs.getString(4));
            modelo.setIdusuarios(rs.getString(5));
            modelo.setIdapertura(rs.getString(7));
            modelo.setProveedor(rs.getString(6));
            lista.add(modelo);
            }
            st.close();
            rs.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(facturacompramodelo.class.getName()).log(Level.SEVERE, null,ex);
        }
    return lista;
    }
    
    public void guardarfactura(){
    String sql = "insert into compras(idcompras, com_fecha, com_condicion,"
            + " com_estado, usuarios_idusuarios, proveedores_idproveedores, aperturas_idaperturas) "
            + " values ('"+ idfacturacion + "','"+ fecha + "','"+ condicion + "',"
            + "'" + estado + "','" + idusuarios + "','" + Proveedor + "','" +  idapertura + "')";
        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException ex) {
        Logger.getLogger(facturacompramodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void guardardetalle(String id, String idpro, String cantidad, String pre){
    String sql="insert into detallecompras(compras_idcompras,productos_idproductos,det_precio,det_cantidad) "
            +"values ('" + id + "','" + idpro + "','" + pre + "','" + cantidad + "')";
        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException ex) {
            Logger.getLogger(facturacompramodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public String obtenerTotal(String factura){
    String sql="select sum(det_cantidad*det_precio) as suma from detallecompras"
            + "where idcompras='" + factura + "'";
     String aux="";
     
        try {
           st = utilidades.conexion.sta(st);
           rs = st.executeQuery(sql);
            rs.next();  
            aux = rs.getString("suma");
        } catch (SQLException ex) {
            Logger.getLogger(facturacompramodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return aux;
    }
    
  public String obtenerUltimoNumeroFactura() {
    String sql = "SELECT MAX(idcompras) as ultimoNumero FROM compras";
    String ultimoNumero = "0";
    try {
        st = utilidades.conexion.sta(st);
        rs = st.executeQuery(sql);
        if (rs.next()) {
            ultimoNumero = rs.getString("ultimoNumero");
            if (ultimoNumero == null) {
                ultimoNumero = "0";
            }
        }
        st.close();
        rs.close();
    } catch (SQLException ex) {
        Logger.getLogger(facturacompramodelo.class.getName()).log(Level.SEVERE, null, ex);
    }
    return ultimoNumero;
}
}

