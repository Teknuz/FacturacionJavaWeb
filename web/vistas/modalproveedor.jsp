<%@page import="modelo.proveedoresmodelo"%>
<%@page import="java.util.List"%>
<%
    List<proveedoresmodelo> proveedores = proveedoresmodelo.list(); // Asegúrate de tener este método en el modelo
%>

<!-- Modal -->
<div class="modal fade" id="modalProveedor" tabindex="-1" role="dialog" aria-labelledby="modalProveedorLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Seleccionar Proveedor</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table class="table table-bordered table-hover">
          <thead>
            <tr>
              <th>Código</th>
              <th>Nombre</th>
              <th>Acción</th>
            </tr>
          </thead>
          <tbody>
            <%
              for (proveedoresmodelo prov : proveedores) {
            %>
              <tr>
                <td><%= prov.getCodigo()%></td>
                <td><%= prov.getNombre() %></td>
                <td>
                  <button type="button" class="btn btn-sm btn-success" onclick="seleccionarProveedor('<%= prov.getCodigo()%>', '<%= prov.getNombre() %>')">Seleccionar</button>
                </td>
              </tr>
            <%
              }
            %>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
