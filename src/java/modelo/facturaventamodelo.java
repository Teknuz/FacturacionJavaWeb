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
import modelo.modeloabrircaja;

/**
 *
 * @author Usuario
 */
public class facturaventamodelo {
    Statement st;
    ResultSet rs;
    
    private String idfacturacion;
    private String fecha;
    private String condicion;
    private String estado;
    private String idusuarios;
    private String idapertura;
    private String cliente;
    
private String monto;

    public String getMonto() {
        return monto;
    }

    public void setMonto(String monto) {
        this.monto = monto;
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

    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }
    
    public List listarfacturas() {
    ArrayList<facturaventamodelo> lista = new ArrayList<>();
    String sql="select * from ventas";
    
        try {
            st = utilidades.conexion.sta(st);
            rs = st.executeQuery(sql);
            while (rs.next()){
            facturaventamodelo modelo = new facturaventamodelo();
            modelo.setIdfacturacion(rs.getString(1));
            modelo.setFecha(rs.getString(2));
            modelo.setCondicion(rs.getString(3));
            modelo.setEstado(rs.getString(4));
            modelo.setIdusuarios(rs.getString(5));
            modelo.setIdapertura(rs.getString(7));
            modelo.setCliente(rs.getString(6));
            lista.add(modelo);
            }
            st.close();
            rs.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(facturaventamodelo.class.getName()).log(Level.SEVERE, null,ex);
        }
    return lista;
    }
    
    public void guardarfactura(){
    String sql = "insert into ventas(idventas, ven_fecha, ven_condicion,"
            + " ven_estado, usuarios_idusuarios, clientes_idclientes, aperturas_idaperturas) "
            + " values ('"+ idfacturacion + "','"+ fecha + "','"+ condicion + "',"
            + "'" + estado + "','" + idusuarios + "','" + cliente + "','" +  idapertura + "')";
        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException ex) {
        Logger.getLogger(facturaventamodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void guardardetalle(String id, String idpro, String cantidad, String pre){
    String sql="insert into detalleventas(ventas_idventas,productos_idproductos,det_precio,det_cantidad) "
            +"values ('" + id + "','" + idpro + "','" + pre + "','" + cantidad + "')";
        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException ex) {
            Logger.getLogger(facturaventamodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public String obtenerTotal(String factura){
    String sql="select sum(det_cantidad*det_precio) as suma from detalleventas"
            + "where idventas='" + factura + "'";
     String aux="";
     
        try {
           st = utilidades.conexion.sta(st);
           rs = st.executeQuery(sql);
            rs.next();  
            aux = rs.getString("suma");
        } catch (SQLException ex) {
            Logger.getLogger(facturaventamodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return aux;
    }
   
}

