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
public class cobromodelover {
    Statement st;
    ResultSet rs;
    
private String idcobro, fecha,estado,idcliente,aperturaid,apellido,nombrecompleto,monto;

    public String getMonto() {
        return monto;
    }

    public void setMonto(String monto) {
        this.monto = monto;
    }
    public String getNombrecompleto() {
        return nombrecompleto;
    }

    public void setNombrecompleto(String nombrecompleto) {
        this.nombrecompleto = nombrecompleto;
    }
    public String getApellido() {
        return apellido;
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
    ArrayList<cobromodelover> lista = new ArrayList<>();
    String sql="SELECT c.idcobros, c.cob_fecha, c.cob_estado, CONCAT(cl.cli_nombre, ' ', cl.cli_apellido) AS nombre_completo, c.aperturas_idaperturas\n" +
"FROM programacionv2024.cobros c\n" +
"INNER JOIN programacionv2024.clientes cl ON c.clientes_idclientes = cl.idclientes;";
    String sql2="select \n" +
"	c.idcobros,\n" +
"	c.cob_fecha,\n" +
"	c.cob_estado,\n" +
"	cli.idclientes,\n" +
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
"    c.cob_fecha ASC;";
        try {
            st = utilidades.conexion.sta(st);
            rs = st.executeQuery(sql2);
            while (rs.next()){
            cobromodelover modelo = new cobromodelover();
            modelo.setIdcobro(rs.getString(1));
            modelo.setFecha(rs.getString(2));
            modelo.setEstado(rs.getString(3));
            modelo.setIdcliente(rs.getString(4));
            modelo.setNombrecompleto(rs.getString(5));
            modelo.setMonto(rs.getString(6));
            modelo.setAperturaid(rs.getString(7));
            lista.add(modelo);
            }
            st.close();
            rs.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(cobromodelover.class.getName()).log(Level.SEVERE, null,ex);
        }
    return lista;
    }
    
  

   
}

