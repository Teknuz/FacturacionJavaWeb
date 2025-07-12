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
private String monto,Provnombre;

    public String getProvnombre() {
        return Provnombre;
    }

    public void setProvnombre(String Provnombre) {
        this.Provnombre = Provnombre;
    }


    public String getMonto() {
        return monto;
    }

    public void setMonto(String monto) {
        this.monto = monto;
    }
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
 

    public List listarpagos() {
    ArrayList<pagomodelover> lista = new ArrayList<>();
    String sql="select \n" +
"	p.idpagos,\n" +
"	p.pag_fecha,\n" +
"	p.pag_estado,\n" +
"	prov.prov_idproveedores,\n" +
"	concat(cli.cli_nombre,' ',cli.cli_apellido) AS nombre,\n" +
"	c.aperturas_idaperturas,\n" +
"    SUM(dc.monto) as total_monto\n" +
"from \n" +
"	cobros c\n" +
"join\n" +
"	clientes cli on c.clientes_idclientes = cli.idclientes\n" +
"left join\n" +
"	detallecobros dc on dc.cobros_idcobros = c.idcobros\n" +
"group by\n" +
"	c.idcobros, c.cob_fecha,c.cob_estado,nombre\n" +
"    order by\n" +
"    c.cob_fecha ASC;\n" +
"    ";
    String sql2="select \n" +
"	p.idpagos,\n" +
"	p.pag_fecha,\n" +
"	p.pag_estado,\n" +
"	prov.idproveedores,\n" +
"	prov.prov_nombre,\n" +
"	p.aper_idaperturas,\n" +
"    SUM(dp.monto) as total_monto\n" +
"from \n" +
"	pagos p\n" +
"join\n" +
"	proveedores prov on p.prov_idproveedores = prov.idproveedores\n" +
"left join\n" +
"	detallepagos dp on dp.pagos_idpagos = p.idpagos\n" +
"group by\n" +
"	p.idpagos, p.pag_fecha,p.pag_estado\n" +
"    order by\n" +
"    p.pag_fecha ASC;\n" +
"    ";
    
        try {
            st = utilidades.conexion.sta(st);
            rs = st.executeQuery(sql2);
            while (rs.next()){
            pagomodelover modelo = new pagomodelover();
            modelo.setIdpago(rs.getString(1));
            modelo.setFecha(rs.getString(2));
            modelo.setEstado(rs.getString(3));
            modelo.setIdproveedor(rs.getString(4));
            modelo.setProvnombre(rs.getString(5));
            modelo.setMonto(rs.getString(6));
            modelo.setAperturaid(rs.getString(7));
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

