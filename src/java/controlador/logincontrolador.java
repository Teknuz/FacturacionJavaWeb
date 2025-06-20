/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import static com.lowagie.tools.BuildTutorial.action;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.loginmodelo;

/**
 *
 * @author User
 */
@WebServlet(name = "logincontrolador", urlPatterns = {"/logincontrolador"})
public class logincontrolador extends HttpServlet {

  

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet logincontrolador</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet logincontrolador at " + request.getContextPath() + "</h1>");
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
    HttpSession sesion = request.getSession();

    if (action.equalsIgnoreCase("Ingresar")) {
        loginmodelo m = new loginmodelo();
        m.setUsuario(request.getParameter("txtusuario"));
        m.setClave(request.getParameter("txtclave"));

        boolean aux = m.acceder();

        if (aux == false) {
            request.setAttribute("error", m);
            acceso = "index.jsp";
        } else {
            String tipo = m.validar(); // Asignar el valor de tipo
            sesion.setAttribute("sesion", "activo");
            sesion.setAttribute("usu_nombre", m.getUsuario());
            sesion.setAttribute("idusuarios", m.obtenerid());
            if (tipo != null) {
                if (tipo.equals("ADMINISTRADOR")) {
                    acceso = "menuprincipal.jsp";
                } else {
                    acceso = "menuinvitado.jsp";
                }
            }

            
        }
    }

    RequestDispatcher vista = request.getRequestDispatcher(acceso);
    vista.forward(request, response);
}


}
