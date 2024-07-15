/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import modelo.pagomodelo;

/**
 *
 * @author Usuario
 */
@WebServlet(name = "pagocontrolador", urlPatterns = {"/pagocontrolador"})
public class pagocontrolador extends HttpServlet {

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
        processRequest(request, response);
        String acceso = "";
        String action = request.getParameter("accion");

        if (action != null) {
            if (action.equalsIgnoreCase("home")) {
                acceso = "index.jsp";
            } else if (action.equalsIgnoreCase("add")) {
                acceso = "vistas/guardarpago.jsp";
            } else if (action.equalsIgnoreCase("guardarpago")) {
                pagomodelo modelo = new pagomodelo();
                modelo.setCodigo(request.getParameter("txtcodigo"));
                modelo.setFecha(request.getParameter("txtfecha"));
                modelo.setEstado("COBRADO");
          
                modelo.setIdproveedores(request.getParameter("txtcodigoprov"));
                modelo.setIdapertura(request.getParameter("txtaper"));
                modelo.guardarpago();

                // Obtener los IDs de las facturas seleccionadas
                String[] comprasSeleccionadas = request.getParameterValues("comprasSeleccionadas");

                if (comprasSeleccionadas != null) {
                    for (String compraId : comprasSeleccionadas) {
                        // Obtener el monto correspondiente a la factura seleccionada
                        String monto = request.getParameter("monto_" + compraId);
                        // Guardar el detalle del cobro
                        modelo.guardardetalle(compraId,request.getParameter("txtcodigo"), monto);
                    }
                }
                acceso = "pagos.jsp";
            } else if (action.equalsIgnoreCase("buscarPagosPendientes")) {
                String proveedorId = request.getParameter("proveedorId");
                pagomodelo modelo = new pagomodelo();
                List<pagomodelo> pagosPendientes = modelo.obtenerPagosPendientes(proveedorId);

                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                for (pagomodelo compra : pagosPendientes) {
                    out.println("<tr>");
                    out.println("<td><span class='dato-input'>" + compra.getCodigo()+ "</span></td>");
                    out.println("<td><span class='dato-input'>" + compra.getEstado() + "</span></td>");
                    out.println("<td><span class='dato-input'>" + compra.getCondicion() + "</span></td>");
                    out.println("<td><input type='text' name='monto_" + compra.getCodigo()+ "' value='" + compra.getMonto() + "'></td>");
                    out.println("<td><input type='checkbox' name='comprasSeleccionados' value='" + compra.getCodigo() + "'></td>");
                    out.println("</tr>");
                }
                return;
            } else if (action.equalsIgnoreCase("informe")) {
                acceso = "reportes/rptpagos.jsp";
            }
        }

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
