package com.productos.negocio;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import com.productos.datos.Conexion;

public class Pagina {

    private int id;
    private String nombre;
    private int perfil;
    private String correo;
    private String clave;

    // Getters y setters
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public int getPerfil() { return perfil; }
    public void setPerfil(int perfil) { this.perfil = perfil; }

    public String getCorreo() { return correo; }
    public void setCorreo(String correo) { this.correo = correo; }

    public String getClave() { return clave; }
    public void setClave(String clave) { this.clave = clave; }

    public String mostrarMenu(Integer nperfil)
    {
    String menu="";
    String sql="SELECT * FROM tb_pagina pag, tb_perfil per, "
    + "tb_perfilpagina pper " +
    "WHERE pag.id_pag=pper.id_pag AND pper.id_per=per.id_per "
    + "AND pper.id_per= "+nperfil;
    Conexion con = new Conexion();
    ResultSet rs=null;
    try
    {
    rs=con.consulta(sql);
    while(rs.next())
    {
    	menu += "<a href='" + rs.getString(3) + "' accesskey='" + rs.getInt(1) + "'>" + rs.getString(2) + "</a><br/>";


    }
    }
    catch(SQLException e)
    {
    System.out.print(e.getMessage());
    }
    return menu;
    }
}
