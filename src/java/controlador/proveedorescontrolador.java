package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.clientemodelo;
import modelo.proveedoresmodelo;

/**
 *
 * @author user
 */
@WebServlet(name = "proveedorescontrolador", urlPatterns = {"/proveedorescontrolador"})
public class proveedorescontrolador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            //IMPORTANTE AQUI SE BORRA EL CONTENIDO
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";//para redireccionar paginas
        //obtener el valor de la variable get accion
        String action = request.getParameter("accion");
        //se verifica que accion se debe tomar segun lo presionado en la página clientes.jsp
        //si se presiono el boton agregar entonces la variable accion tendra valor Agregar y hará el insert
        if (action.equalsIgnoreCase("Agregar")) {
            //entra cuando se presiona el boton Agregar de la pagina insertar cliente
            proveedoresmodelo modelo = new proveedoresmodelo();
            modelo.setCodigo(request.getParameter("txtcodigo"));
            modelo.setNombre(request.getParameter("txtnombre"));
            modelo.setRuc(request.getParameter("txtruc"));
            
             modelo.setTelefono(request.getParameter("txttelefono"));
             modelo.setCorreo(request.getParameter("txtcorreo"));
              modelo.setCiudad(request.getParameter("txtusu"));
            try {
                modelo.guardar();
            } catch (SQLException ex) {
                Logger.getLogger(proveedorescontrolador.class.getName()).log(Level.SEVERE, null, ex);
            }
            //SE ESPECIFICA QUE PAGINA DEBE MOSTRAR EN LA VARIABLE ACCESO
            acceso = "proveedores.jsp";

        } else if (action.equalsIgnoreCase("Editar")) {
            //entra cuando se presiona el boton Modificar de la pagina clientes.jsp
            proveedoresmodelo modelo = new proveedoresmodelo();
            modelo.setCodigo(request.getParameter("txtcodigo"));
            modelo.setNombre(request.getParameter("txtnombre"));
            modelo.setRuc(request.getParameter("txtruc"));
            
             modelo.setTelefono(request.getParameter("txttelefono"));
             modelo.setCorreo(request.getParameter("txtcorreo"));
              modelo.setCiudad(request.getParameter("txtusu"));
            modelo.modificar();
            //SE ESPECIFICA QUE PAGINA DEBE MOSTRAR EN LA VARIABLE ACCESO
            acceso = "proveedores.jsp";
        } else if (action.equalsIgnoreCase("delete")) {
            proveedoresmodelo modelo = new proveedoresmodelo();
            modelo.eliminar(request.getParameter("id"));
            acceso = "proveedores.jsp";
        } else if (action.equalsIgnoreCase("informe")) {
            acceso ="reportes/rptprov.jsp";
        }

        //SE REDIRECCIONA LA PAGINA A MOSGTRAR DESPUES DEL INSERT
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
