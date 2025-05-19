package com.productos.negocio;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.productos.datos.Conexion;

public class categoria {

    // Método que genera un combo 
    public String mostrarCategoria() {
        String combo = "<select name=cmbCategoria>";  // Inicia el combo 
        String sql = "SELECT * FROM tb_categoria";  // Consulta SQL para obtener todas las categorías
        ResultSet rs = null;
        Conexion con = new Conexion();  // Se crea una instancia de la clase Conexion para la conexión a la BD
        try {
            rs = con.consulta(sql);  
            while (rs.next()) {
                // Se recorre el ResultSet y se agrega cada categoría al combo
                combo += "<option value=" + rs.getInt(1) + ">" + rs.getString(2) + "</option>";
            }
            combo += "</select>";  
        } catch (SQLException e) {
            
            System.out.print(e.getMessage());
        }
        return combo;  
    }
}
