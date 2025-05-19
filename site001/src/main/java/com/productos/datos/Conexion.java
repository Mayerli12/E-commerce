package com.productos.datos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    private String driver = "org.postgresql.Driver";
    private String user = "postgres";
    private String pwd = "admin";
    private String cadena = "jdbc:postgresql://localhost:5432/bd_productos";
    private Connection con;

    public Conexion() {
        try {
            Class.forName(driver); // Cargar el driver
            con = DriverManager.getConnection(cadena, user, pwd);
            System.out.println("✅ Conexión exitosa a PostgreSQL.");
        } catch (Exception e) {
            System.out.println("❌ Error al conectar: " + e.getMessage());
            con = null;
        }
    }

    public Connection getConexion() {
        return con;
    }

    public java.sql.ResultSet consulta(String consulta) {
        try {
            return getConexion().createStatement().executeQuery(consulta);
        } catch (Exception e) {
            System.out.println("❌ Error en consulta: " + e.getMessage());
            return null;
        }
    }
}
