<%-- 
    Document   : rptclientes
    Created on : 24 abr 2024, 1:38:12
    Author     : jasdasdasdd
--%>

<%@page import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.Connection"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="utilidades.conexion"%>
<%@page contentType="application/pdf"%>
<%
    String dirPath = "/rpt";
    String realPath = this.getServletContext().getRealPath(dirPath);
  
    String facturaId = request.getAttribute("factura").toString();
    String jasperReport = "compras.jasper";
    JasperPrint print = null;
    Connection conn = null;
    try {
        conn = utilidades.conexion.EnLace(conn);
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("factura", facturaId);
        print = JasperFillManager.fillReport(realPath + "/" + jasperReport, parameters, conn);
        response.setContentType("application/pdf");
        JasperExportManager.exportReportToPdfStream(print, response.getOutputStream());
        response.getOutputStream().flush();
        response.getOutputStream().close();
    } catch (Exception ex) {
        ex.printStackTrace();
    } finally {
        if (conn != null) {
            conn.close();
        }
    }
%>

