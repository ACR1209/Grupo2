/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModelsDAO;

import Config.Connector;
import Interfaces.InterfacesDAO;
import Models.Position;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Andres Coronel
 */
public class PositionDAO implements InterfacesDAO{

    private final Connector conn = new Connector("localhost", "root", "", "dw_grupo3", "3306");
    private Position pos = null;
    private ResultSet rs;
    
    @Override
    public List list() {
        ArrayList<Position> positions = new ArrayList<>();
        String sql = "SELECT * FROM position";
    
        
        try {
            rs = this.makeQuery(sql);
            
            while (rs.next()) {
           
                positions.add(new Position(rs.getInt("idPosition"), rs.getString("namePosition")));
                
            }
                    
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        
        return positions;
    }
    
    public Position getPositionById(int id){
        String sql = "SELECT * FROM position WHERE idPosition=" + id;
    
        try {
            rs = this.makeQuery(sql);
            
            while (rs.next()) {
           
                pos = (new Position(rs.getInt("idPosition"), rs.getString("namePosition")));
                
            }
                    
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        
        return pos;
    }
    
    public boolean update(Position position){
        try {
            return this.makeUpdate(String.format("UPDATE `position` "
                    + "SET `idPosition`=%d,"
                    + "`namePosition`='%s' "
                    + "WHERE idPosition=%d", position.getId(), position.getName(), position.getId()));
           
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return false;
    }
    
    
     public boolean add(Position position) {
         try {
            return this.makeUpdate(
                    String.format("INSERT INTO `position`(`namePosition`) "
                            + "VALUES ('%s')", position.getName())
            );
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return false;
    }
        
    public boolean delete(int id) {
        try {
            return this.makeUpdate(
                    String.format("DELETE FROM `position` WHERE idPosition=%d", id)
            );
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return false;
    }
    

    @Override
    public ResultSet makeQuery(String sql) {
        Connection connection;
        PreparedStatement preparedStatement;
        ResultSet resultSet = null;
        try {
            connection = conn.getCon();
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
                       
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        
        return resultSet;
    }

    @Override
    public boolean makeUpdate(String sql) {
        Connection connection;
        PreparedStatement preparedStatement;
        try {
            connection = conn.getCon();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.executeUpdate();
            
            return true;
             
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        
        return false;
    }
    
}
