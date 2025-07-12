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
 * @author User
 */
public class pagomodelo {
    Statement st;
    ResultSet rs;
    private String codigo, fecha, estado, idproveedores, idapertura,condicion;
    private String monto;

    public String getMonto() {
        return monto;
    }

    public void setMonto(String monto) {
        this.monto = monto;
    }
    
    

    public String getCodigo() {
        return codigo;
    }

    public String getCondicion() {
        return condicion;
    }

    public void setCondicion(String condicion) {
        this.condicion = condicion;
    }
    

    public void setCodigo(String codigo) {
        this.codigo = codigo;
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

    public String getIdproveedores() {
        return idproveedores;
    }

    public void setIdproveedores(String idproveedores) {
        this.idproveedores = idproveedores;
    }

   
    public String getIdapertura() {
        return idapertura;
    }

    public void setIdapertura(String idapertura) {
        this.idapertura = idapertura;
    }
    
    
    public void guardarpago() {

        String sql = "insert into pagos(idpagos, pag_fecha, pag_estado, prov_idproveedores, aper_idaperturas) "
                + "values ('" + codigo + "','" + fecha + "','" + estado + "','" + idproveedores + "','" + idapertura + "')";
        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException ex) {
            Logger.getLogger(pagomodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void guardardetalle(String idcompra, String pago, String monto) {
        String sql = "insert into detallepagos(compras_idcompras,pagos_idpagos,monto) "
                + "values('" + idcompra + "','" + pago + "','" + monto + "')";
        try {
            st = utilidades.conexion.sta(st);
            st.executeUpdate(sql);
            st.close();
        } catch (SQLException ex) {
            Logger.getLogger(pagomodelo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public List<pagomodelo> obtenerPagosPendientes(String proveedorId) {
    List<pagomodelo> pagosPendientes = new ArrayList<>();
    String sql = "SELECT * FROM compras WHERE proveedores_idproveedores = '" + proveedorId + "' AND com_estado = 'PENDIENTE'";
    try {
        st = utilidades.conexion.sta(st);
        rs = st.executeQuery(sql);
        while (rs.next()) {
            pagomodelo compra = new pagomodelo();
            compra.setCodigo(rs.getString("idcompras"));
            compra.setEstado(rs.getString("com_estado"));
            compra.setCondicion(rs.getString("com_condicion"));
            
            // Calcular el monto total a partir del detalle de ventas
            String idCompra = rs.getString("idcompras");
            String detalleSql = "SELECT SUM(det_precio * det_cantidad) AS total_monto FROM detallecompras WHERE compras_idcompras = '" + idCompra + "'";
            Statement detalleSt = utilidades.conexion.sta(st);
            ResultSet detalleRs = detalleSt.executeQuery(detalleSql);
                if (detalleRs.next()) {
                    //se crea la variable monto en el modelo de la factura para guardar el monto obtenido del lsitado
                    compra.setMonto(detalleRs.getString("total_monto"));
                }
                detalleRs.close();
                detalleSt.close();
                pagosPendientes.add(compra);
            }

              rs.close();
        st.close();
        
      
    } catch (SQLException ex) {
        Logger.getLogger(pagomodelo.class.getName()).log(Level.SEVERE, null, ex);
    }
    return pagosPendientes;
}

       public String obtenerUltimoNumeroFacturaPago() {
    String sql = "SELECT MAX(idpagos) as ultimoNumero FROM pagos";
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
        Logger.getLogger(pagomodelo.class.getName()).log(Level.SEVERE, null, ex);
    }
    return ultimoNumero;
}
 

}

