<%-- 
    Document   : index
    Created on : 20/09/2021, 22:26:55
    Author     : david
--%>
<%@page import="modelo.Marca" %>
<%@page import="modelo.Producto" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page import="java.util.HashMap" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <h1 align="center">Formulario Productos</h1>
        <div class="container p-3 my-3 bg-info text-white">
            <form action="sr_producto" method="post" class="form-group">
                <label for="lbl_producto"><br><b>Producto:</b></label>
                <input type="text" name="txt_producto" id="txt_producto" class="form-control" placeholder="Ejemplo: Arroz" required>
                <label for="lbl_marca"><br><b>Marca:</b></label>
                <select name="drop_marca" id="drop_marca" class="form-control">
                    <%
                        Marca marca = new Marca();
                        HashMap<String,String> drop = marca.drop_marca();
                        for(String i: drop.keySet()){
                            out.println("<option value='"+i+"'>"+drop.get(i)+"</option>");
                        }
                    %>
                </select>
                <label for="lbl_descripcion"><br><b>Descripcion:</b></label>
                <input type="text" name="txt_descripcion" id="txt_descripcion" class="form-control" placeholder="Ejemplo: Integral 500gr" required>
                <label for="lbl_precio_costo"><br><b>Precio costo:</b></label>
                <input type="number" step="0.01" name="txt_precio_costo" id="txt_precio_costo" class="form-control" placeholder="Ejemplo: 1.15" required>
                <label for="lbl_precio_venta"><br><b>Precio venta:</b></label>
                <input type="number" step="0.01" name="txt_precio_venta" id="txt_precio_venta" class="form-control" placeholder="Ejemplo: 3.45" required>
                <label for="lbl_existencia"><br><b>Existencia:</b></label>
                <input type="number" name="txt_existencia" id="txt_existencia" class="form-control" placeholder="Ejemplo: 150" required>
                <br>
                <button  name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-outline-dark btn-primary btn-block">Agregar</button>
            </form>
            <table class="table table-dark table-striped">
    <thead>
      <tr>
        <th>Poducto</th>
        <th>Marca</th>
        <th>Descripcion</th>
        <th>Precio costo</th>
        <th>Precio venta</th>
        <th>Existencia</th>
      </tr>
    </thead>
    <tbody id="tbl_producto">
      <%
      Producto producto = new Producto();
      DefaultTableModel tabla  = new DefaultTableModel();
      tabla = producto.leer();
      for(int t=0;t<tabla.getRowCount();t++){
          out.println("<tr data-id="+tabla.getValueAt(t,0)+" data-idm="+tabla.getValueAt(t,3)+">");
          out.println("<td>"+tabla.getValueAt(t,1)+"</td>");
          out.println("<td>"+tabla.getValueAt(t,2)+"</td>");
          out.println("<td>"+tabla.getValueAt(t,4)+"</td>");
          out.println("<td>"+tabla.getValueAt(t,5)+"</td>");
          out.println("<td>"+tabla.getValueAt(t,6)+"</td>");
          out.println("<td>"+tabla.getValueAt(t,7)+"</td>");
          out.println("</tr>");
      }
      %>
    </tbody>
  </table>    
        </div>
        
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
