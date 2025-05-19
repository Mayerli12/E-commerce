package com.productos.negocio;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.SQLException;


import com.productos.datos.Conexion;

public class Usuario {
    private String correo;
    private String clave;
    private int perfil;
    private String nombre;
    private String cedula;
    private int estado; // Esto es opcional, dependiendo de tu tabla de estados

    // Getter y Setter para correo
    public String getCorreo() {
        return correo;
    }
    public void setCorreo(String correo) {
        this.correo = correo;
    }

    // Getter y Setter para clave
    public String getClave() {
        return clave;
    }
    public void setClave(String clave) {
        this.clave = clave;
    }

    // Getter y Setter para perfil
    public int getPerfil() {
        return perfil;
    }
    public void setPerfil(int perfil) {
        this.perfil = perfil;
    }

    // Getter y Setter para nombre
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    // Getter y Setter para cédula
    public String getCedula() {
        return cedula;
    }
    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    // Getter y Setter para estado
    public int getEstado() {
        return estado;
    }
    public void setEstado(int estado) {
        this.estado = estado;
    }

    // Método para registrar un nuevo cliente
    public String ingresarCliente() {
        String result = "";
        Conexion con = new Conexion();
        PreparedStatement pr = null;
        String sql = "INSERT INTO tb_usuario (id_per, id_est, nombre_us, cedula_us, correo_us, clave_us) VALUES (?, ?, ?, ?, ?, ?)";
        
        try {
            pr = con.getConexion().prepareStatement(sql);
            pr.setInt(1, 2); // Asumimos que el perfil 2 es para "Cliente"
            pr.setInt(2, this.getEstado()); // Se puede cambiar dependiendo del estado
            pr.setString(3, this.getNombre());
            pr.setString(4, this.getCedula());
            pr.setString(5, this.getCorreo());
            pr.setString(6, this.getClave());

            if (pr.executeUpdate() == 1) {
                result = "Inserción correcta";
            } else {
                result = "Error en inserción";
            }
        } catch (Exception ex) {
            result = ex.getMessage();
            System.out.print(result);
        } finally {
            try {
                pr.close();
                con.getConexion().close();
            } catch (Exception ex) {
                System.out.print(ex.getMessage());
            }
        }
        return result;
    }
    public boolean verificarUsuario(String correo, String clave) {
        boolean existe = false;
        Conexion con = new Conexion();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "SELECT nombre_us, id_per FROM tb_usuario WHERE correo_us=? AND clave_us=?";

        try {
            ps = con.getConexion().prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, clave);
            rs = ps.executeQuery();

            if (rs.next()) {
                this.nombre = rs.getString("nombre_us");
                this.perfil = rs.getInt("id_per");
                existe = true;
            }

        } catch (Exception e) {
            System.out.println("Error en verificarUsuario: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                con.getConexion().close();
            } catch (Exception ex) {
                System.out.println("Error al cerrar conexión: " + ex.getMessage());
            }
        }

        return existe;
    }

    public String registrarUsuario(String nombre, String correo, int perfil, String estadoCivil) {
        String result = "";
        Conexion con = new Conexion();
        PreparedStatement pr = null;
        String sql = "INSERT INTO tb_usuario (id_per, id_est, nombre_us, correo_us, clave_us, estado_civil) VALUES (?, ?, ?, ?, ?, ?)";

        try {
            pr = con.getConexion().prepareStatement(sql);
            pr.setInt(1, perfil); // Asignar perfil
            pr.setInt(2, 1); // Asumir estado 1, puedes ajustarlo según tu lógica
            pr.setString(3, nombre);
            pr.setString(4, correo);
            pr.setString(5, "654321"); // Clave por defecto
            pr.setString(6, estadoCivil); // Aquí se establece el estado civil

            if (pr.executeUpdate() == 1) {
                result = "Usuario registrado correctamente";
            } else {
                result = "Error en la inserción";
            }
        } catch (Exception ex) {
            result = ex.getMessage();
            System.out.print(result);
        } finally {
            try {
                pr.close();
                con.getConexion().close();
            } catch (Exception ex) {
                System.out.print(ex.getMessage());
            }
        }
        return result;
    }

 // Método para verificar la clave actual del usuario
    public boolean verificarClave(String correo, String claveActual) {
        boolean esValida = false;
        Conexion con = new Conexion();
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        // Consulta para obtener la clave guardada en la base de datos
        String sql = "SELECT clave_us FROM tb_usuario WHERE correo_us=?";
        
        try {
            ps = con.getConexion().prepareStatement(sql);
            ps.setString(1, correo);  // Buscar por correo
            rs = ps.executeQuery();
            
            // Si el usuario existe, se verifica la clave
            if (rs.next()) {
                String claveGuardada = rs.getString("clave_us");
                
                // Verificamos si la clave ingresada por el usuario coincide con la almacenada en la base de datos
                if (claveGuardada.equals(claveActual)) {
                    esValida = true;
                }
            }
        } catch (Exception e) {
            System.out.println("Error al verificar la clave: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                con.getConexion().close();
            } catch (Exception ex) {
                System.out.println("Error al cerrar la conexión: " + ex.getMessage());
            }
        }
        
        return esValida;
    }

 // Método para cambiar la clave de un usuario (empleado)
    public boolean cambiarClave(String correo, String nuevaClave, String repetirClave) {
        boolean cambioExitoso = false;
        
        // Verificar que las claves coincidan
        if (!nuevaClave.equals(repetirClave)) {
            System.out.println("Las claves no coinciden.");
            return false;  // Si las claves no coinciden, no realizamos el cambio
        }
        
        // Verificar que el usuario tenga el perfil de empleado
        if (this.perfil != 1) {  // Asumimos que el perfil 1 es el de "Empleado"
            System.out.println("Solo los empleados pueden cambiar su clave.");
            return false;
        }
        
        Conexion con = new Conexion();
        PreparedStatement ps = null;
        String sql = "UPDATE tb_usuario SET clave_us=? WHERE correo_us=?";
        
        try {
            // Establecemos la nueva clave en la base de datos
            ps = con.getConexion().prepareStatement(sql);
            ps.setString(1, nuevaClave);
            ps.setString(2, correo);
            
            if (ps.executeUpdate() == 1) {
                cambioExitoso = true;  // Si se actualiza correctamente
            }
        } catch (Exception e) {
            System.out.println("Error al cambiar la clave: " + e.getMessage());
        } finally {
            try {
                if (ps != null) ps.close();
                con.getConexion().close();
            } catch (Exception ex) {
                System.out.println("Error al cerrar la conexión: " + ex.getMessage());
            }
        }
        
        return cambioExitoso;
    }

    
}
