/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import modelos.Posicion;

/**
 *
 * @author mfaun
 */
public class PosicionDAO extends Conexion {
           public int registrar(Posicion p) throws SQLException{
        try{
            String sentencia ="Insert into posicion (nombre) values (?)";
            conectar();
            PreparedStatement ps = obtenerPS(sentencia);
            ps.setString(1, p.getNombre());
            return ps.executeUpdate();
        }catch(Exception e){
            return -1;
        }finally{
            desconectar();
        }
    }
    public int modificar(Posicion p) throws SQLException{
        try{
            String sentencia ="update posicion set nombre = ? where id = ?";
            conectar();
            PreparedStatement ps = obtenerPS(sentencia);
            ps.setString(1, p.getNombre());
            ps.setInt(2, p.getId());
            return ps.executeUpdate();
        }catch(Exception e){
            return -1;
        }finally{
            desconectar();
        }
    }
    public int eliminar(Posicion p) throws SQLException{
        try{
            String sentencia ="delete from posicion where id = ?";
            conectar();
            PreparedStatement ps = obtenerPS(sentencia);
            ps.setLong(1, p.getId());
            return ps.executeUpdate();
        }catch(Exception e){
            return -1;
        }finally{
            desconectar();
        }
    }
    public Posicion obtenerPosicion(int id) throws SQLException{
        String sentencia = "select * from posicion where id=?";
        try{
            conectar();
            PreparedStatement ps = obtenerPS(sentencia);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return (new Posicion(rs.getInt("id"),rs.getString("nombre")));
            }else{
                return null;
            }
        }catch(Exception e ){
            return null;
        }finally{
            desconectar();
        }
    }
    public ArrayList<Posicion> obtenerPosiciones() throws SQLException{
        try{
            String sentencia = "select * from posicion";
            conectar();
            PreparedStatement ps = obtenerPS(sentencia);
            ResultSet rs = ps.executeQuery();
            ArrayList<Posicion> lista = new ArrayList();
            while(rs.next()){
                lista.add(new Posicion(rs.getInt("id"),rs.getString("nombre")));
            }
            return lista;
        }catch(Exception e){
            return new ArrayList();
        }finally{
            desconectar();
        }
    }
}
