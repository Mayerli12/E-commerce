package com.productos.negocio;

import java.sql.ResultSet;
import java.sql.SQLException;
import com.productos.datos.Conexion;

public class Product {

    private int id;
    private int id_categoria;
    private String nombre;
    private int cantidad;
    private double precio;
    private String directorio;

    // Constructor vacío
    public Product() {}

    // Getters y setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getId_categoria() { return id_categoria; }
    public void setId_categoria(int id_categoria) { this.id_categoria = id_categoria; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public int getCantidad() { return cantidad; }
    public void setCantidad(int cantidad) { this.cantidad = cantidad; }

    public double getPrecio() { return precio; }
    public void setPrecio(double precio) { this.precio = precio; }

    public String getDirectorio() { return directorio; }
    public void setDirectorio(String directorio) { this.directorio = directorio; }

    // Método para consultar todos los productos
    public String consultarTodo() {
        String sql = "SELECT * FROM tb_producto ORDER BY id_pr";  // Consulta a la base de datos
        Conexion con = new Conexion();
        String tabla = "<table border='2'><tr><th>ID</th><th>Producto</th><th>Cantidad</th><th>Precio</th></tr>";
        ResultSet rs = con.consulta(sql);  // Ejecutar la consulta

        if (rs == null) {
            return "<p>Error al consultar los productos: ResultSet vacío.</p>";  // Verifica si no hay resultados
        }

        try {
            while (rs.next()) {
                tabla += "<tr><td>" + rs.getInt("id_pr") + "</td>"
                      + "<td>" + rs.getString("nombre_pr") + "</td>"
                      + "<td>" + rs.getInt("cantidad_pr") + "</td>"
                      + "<td>" + rs.getDouble("precio_pr") + "</td></tr>";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return "<p>Error SQL: " + e.getMessage() + "</p>";  
        }

        tabla += "</table>";
        return tabla;  
    }

    public String buscarProductoCategoria(int cat) {
        String sentencia = "SELECT nombre_pr, precio_pr FROM tb_producto WHERE id_cat = " + cat;  // Consulta por categoría
        Conexion con = new Conexion();
        ResultSet rs = con.consulta(sentencia);
        String resultado = "<table border='3'><tr><th>Nombre</th><th>Precio</th></tr>";

        if (rs == null) {
            return "<p>Error al buscar productos: ResultSet vacío.</p>";  // Verifica si no hay resultados
        }

        try {
            while (rs.next()) {
                resultado += "<tr><td>" + rs.getString("nombre_pr") + "</td>"
                          + "<td>" + rs.getDouble("precio_pr") + "</td></tr>";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return "<p>Error SQL: " + e.getMessage() + "</p>";  
        }

        resultado += "</table>";
        return resultado;  
    }

}