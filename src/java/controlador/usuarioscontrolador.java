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
import modelo.usuariosmodelo;

/**
 * Controlador para manejar las solicitudes relacionadas con usuarios.
 */
@WebServlet(name = "usuarioscontrolador", urlPatterns = {"/usuarioscontrolador"})
public class usuarioscontrolador extends HttpServlet {

    /**
     * Procesa las solicitudes para los métodos HTTP <code>GET</code> y <code>POST</code>.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException si ocurre un error específico del servlet
     * @throws IOException si ocurre un error de entrada/salida
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Código de procesamiento aquí si es necesario
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Maneja el método HTTP <code>POST</code>.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException si ocurre un error específico del servlet
     * @throws IOException si ocurre un error de entrada/salida
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = ""; // Para redireccionar páginas
        // Obtener el valor de la variable get 'accion'
        String action = request.getParameter("accion");

        // Verificar que 'action' no sea null
        if (action != null) {
            switch (action.toLowerCase()) {
                case "agregar":
                    usuariosmodelo modelo = new usuariosmodelo();
                    modelo.setCodigo(request.getParameter("txtcodigo"));
                    modelo.setUsuario(request.getParameter("txtusuario"));
                    modelo.setClave(request.getParameter("txtclave"));

                    // Captura los valores del formulario
                  
                    modelo.setPersonal(request.getParameter("txtusu"));

                    // Obtener el valor del parámetro y verificar si es null antes de usarlo
                    String tipo = request.getParameter("tipo");
                    String tipo2 = (tipo != null && tipo.equalsIgnoreCase("INVITADO")) ? "INVITADO" : "ADMINISTRADOR";
                    modelo.setTipo(tipo2);

                    // Verificar estado
                    String estado = request.getParameter("estado");
                    String estado2 = (estado != null && estado.equalsIgnoreCase("ACTIVO")) ? "ACTIVO" : "INACTIVO";
                    modelo.setEstado(estado2);

                    try {
                        modelo.guardar();
                    } catch (SQLException ex) {
                        Logger.getLogger(usuarioscontrolador.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    acceso = "usuarios.jsp";
                    break;

                case "editar":
                    usuariosmodelo modeloEdit = new usuariosmodelo();
                    modeloEdit.setCodigo(request.getParameter("txtcodigo"));
                     modeloEdit.setCodigo(request.getParameter("txtcodigo"));
                    modeloEdit.setUsuario(request.getParameter("txtusuario"));
                    modeloEdit.setClave(request.getParameter("txtclave"));

                    // Captura los valores del formulario
                  
                    modeloEdit.setPersonal(request.getParameter("txtusu"));

                    // Obtener el valor del parámetro y verificar si es null antes de usarlo
                    String tipoe = request.getParameter("tipo");
                    String tipo2e = (tipoe != null && tipoe.equalsIgnoreCase("INVITADO")) ? "INVITADO" : "ADMINISTRADOR";
                    modeloEdit.setTipo(tipo2e);

                    // Verificar estado
                    String estadoe = request.getParameter("estado");
                    String estado2e = (estadoe != null && estadoe.equalsIgnoreCase("ACTIVO")) ? "ACTIVO" : "INACTIVO";
                    modeloEdit.setEstado(estado2e);

                    modeloEdit.modificar();
                    
                    acceso = "usuarios.jsp";
                    break;

                case "delete":
                    usuariosmodelo modeloDelete = new usuariosmodelo();
                    modeloDelete.eliminar(request.getParameter("id"));
                    acceso = "usuarios.jsp";
                    break;

                case "informe":
                    acceso = "reportes/rptusu.jsp";
                    break;

                default:
                    acceso = "error.jsp"; // Página de error en caso de acción desconocida
                    break;
            }
        } else {
            // Manejo en caso de que 'action' sea null
            System.out.println("Acción no especificada.");
            acceso = "error.jsp"; // O una página de error apropiada
        }

        // Redireccionar a la página especificada
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    /**
     * Devuelve una breve descripción del servlet.
     *
     * @return una cadena que contiene la descripción del servlet
     */
    @Override
    public String getServletInfo() {
        return "Controlador de usuarios";
    }
}
