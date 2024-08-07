package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.facturacompramodelo;

/**
 *
 * @author User
 */
@WebServlet(name = "facturacompracontrolador", urlPatterns = {"/facturacompracontrolador"})
public class facturacompracontrolador extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet facturaventacontrolador</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet facturaventacontrolador at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        
          facturacompramodelo f = new facturacompramodelo();
       
       
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
       String acceso = "";
        String action = request.getParameter("accion");
        String print = request.getParameter("imprimir");
        if (action != null) {
            if (action.equalsIgnoreCase("home")) {
                acceso = "index.jsp";
            } else {
                if (action.equalsIgnoreCase("add")) {
                    acceso = "vistas/guardarcompra.jsp";
                } else {
                    if (action.equalsIgnoreCase("guardarcompra")) {
                        facturacompramodelo modelo = new facturacompramodelo();
                        modelo.setIdfacturacion(request.getParameter("txtnumero"));
                        modelo.setFecha(request.getParameter("txtfechafac"));
                        modelo.setCondicion(request.getParameter("condicion"));
                        modelo.setEstado(request.getParameter("txtestado"));
                        modelo.setIdusuarios(request.getParameter("txtusu"));
                        modelo.setIdapertura(request.getParameter("txtaper"));
                        modelo.setProveedor(request.getParameter("txtcodigoprov"));
                        String condicion = request.getParameter("condicion");
                 String estado = condicion.equalsIgnoreCase("contado") ? "PAGADO" : "PENDIENTE";
                 modelo.setEstado(estado);
                        modelo.guardarfactura();
                        String[] codigos = request.getParameterValues("codigo[]");
                        String[] cantidades = request.getParameterValues("cantidad[]");
                        String[] preciosUnitarios = request.getParameterValues("precio[]");

                        // Iterar sobre los arrays para procesar los datos
                        for (int i = 0; i < codigos.length; i++) {
                            String codigo = codigos[i];
                            String cantidad = cantidades[i];
                            String precioUnitario = preciosUnitarios[i];
                            modelo.guardardetalle(request.getParameter("txtnumero"), 
                                    codigo, cantidad, precioUnitario);
                        }
                        acceso = "facturacompra.jsp";
                    } else {
                        if (action.equalsIgnoreCase("imprimirfactura")) {
                            request.setAttribute("param", request.getParameter("txtnumero"));
                            acceso = "reportes/rptfactura.jsp";
                        }
                    }
                }
            }
        }
//        if (print != null) {
//            
//            request.setAttribute("param", print);
//            numero n = new numero();
//            modelofactura m = new modelofactura();
//            
//            request.setAttribute("letras", n.convertirLetras(Integer.parseInt(m.obtenerTotal(print))));
//            acceso = "reportes/rptfactura.jsp";
//        }
        if (!acceso.equals("")) {
            RequestDispatcher vista = request.getRequestDispatcher(acceso);
            vista.forward(request, response);
        }
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
