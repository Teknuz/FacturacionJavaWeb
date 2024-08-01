/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.modeloabrircaja;

/**
 *
 * @author Usuario
 */
public class pagomodelover {
    Statement st;
    ResultSet rs;
    
private String idcobro, fecha,estado,idcliente,aperturaid,apellido,idproveedor,idpago;

    public String getApellido() {
        return apellido;
    }

    public String getIdproveedor() {
        return idproveedor;
    }

    public void setIdproveedor(String idproveedor) {
        this.idproveedor = idproveedor;
    }

    public String getIdpago() {
        return idpago;
    }

    public void setIdpago(String idpago) {
        this.idpago = idpago;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getIdcobro() {
        return idcobro;
    }

    public String getAperturaid() {
        return aperturaid;
    }

    public void setAperturaid(String aperturaid) {
        this.aperturaid = aperturaid;
    }
    

    public void setIdcobro(String idcobro) {
        this.idcobro = idcobro;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(String idcliente) {
        this.idcliente = idcliente;
    }
 

    public List listarcobros() {
    ArrayList<pagomodelover> lista = new ArrayList<>();
    String sql="  SELECT \n" +
"    p.idpagos AS `Id Pagos`,\n" +
"    p.pag_fecha AS `Fecha Pago`,\n" +
"    p.pag_estado AS `Estado Pago`,\n" +
"    pro.prov_nombre AS `Proveedor`,\n" +
"    a.idaperturas AS `Id Apertura`\n" +
"FROM \n" +
"    pagos p\n" +
"    JOIN proveedores pro ON p.prov_idproveedores = pro.idproveedores\n" +
"    JOIN aperturas a ON p.aper_idaperturas = a.idaperturas\n" +
"ORDER BY \n" +
"    p.idpagos;;";
    
        try {
            st = utilidades.conexion.sta(st);
            rs = st.executeQuery(sql);
            while (rs.next()){
            pagomodelover modelo = new pagomodelover();
               modelo.setIdpago(rs.getString(1));
            modelo.setFecha(rs.getString(2));
            modelo.setEstado(rs.getString(3));
            modelo.setIdproveedor(rs.getString(4));
             modelo.setAperturaid(rs.getString(5));
            lista.add(modelo);
            }
            st.close();
            rs.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(pagomodelover.class.getName()).log(Level.SEVERE, null,ex);
        }
    return lista;
    }
    
  

   
}

