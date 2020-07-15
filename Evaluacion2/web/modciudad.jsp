<%-- 
    Document   : modciudad
    Created on : 14/07/2020, 12:26:29 PM
    Author     : mfaun
--%>

<%@page import="dao.CiudadDAO"%>
<%@page import="modelos.Ciudad"%>
<%@page import="modelos.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar ciudad</title>
    </head>
    <body>
            <center>
        <h1>Modificar ciudad</h1>
            <% if(session.getAttribute("usuario")!= null){
             Usuario u = (Usuario) session.getAttribute("usuario");
            %>
        <%}else{response.sendRedirect("index.jsp?msj=acceso denegado");}%>
        
        <a href="Salir"><input type="button" value="Cerrar Sesion"/></a>
        <h2>Menu de navegacion</h2>
        <menu>
            <a href="intranet.jsp">
            <menuitem >Inicio</menuitem>
            </a> |
            <a href="jugadores.jsp">
            <menuitem >Jugadores</menuitem>
            </a> | 
            <a href="equipos.jsp">
            <menuitem >Equipos</menuitem>
            </a> | 
            <a href="estadios.jsp">
            <menuitem >Estadios</menuitem>
            </a> | 
            <a href="divisiones.jsp">
            <menuitem >Divisiones</menuitem>
            </a> | 
            <a href="posiciones.jsp">
            <menuitem >Posiciones</menuitem>
            </a> | 
            <a href="ciudades.jsp">
            <menuitem >Ciudades</menuitem>
            </a>
        </menu>
        
                <% if(request.getParameter("id")!=null){
            Ciudad c = new CiudadDAO().obtenerCiudad(Integer.parseInt(request.getParameter("id")));
            %>
        <form action="ControladorCiudad" method="post">
            <table>
                <tr>
                    <td>ID</td>
                    <td><input type="number" name="id" readonly="true" value="<%= c.getId() %>" /></td>
                </tr>
                <tr>
                    <td>Nombre</td>
                    <td><input type="text" name="nombre" value="<%= c.getNombre() %>"/></td>
                </tr>
                    <td><input type="reset" value="Limpiar"/></td>
                    <td><input type="submit" value="Modificar"/></td>
                
                </tr>
            </table>
                <input type="hidden" name="accion" value="3"/>
        </form>
        <% }%>
                        <% if(request.getParameter("msj")!= null){%>
        <h4><%= request.getParameter("msj") %></h4>
        <%}%>
            </center>
    </body>
</html>
