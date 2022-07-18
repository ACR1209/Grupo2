/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModelsDAO;

import Config.Connector;
import Interfaces.InterfacesDAO;
import Models.Place;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Andres Coronel
 */
public class PlaceDAO implements InterfacesDAO {
    
    private final Connector conn = new Connector("localhost", "root", "", "dw_grupo3", "3306");
    private Place place = null;
    private ResultSet rs;
    
    public PlaceDAO(){
        
    }
    
    @Override
    public List list() {
        ArrayList<Place> places = new ArrayList<>();
        String sql = "SELECT * FROM place";
        
        try {
            rs = this.makeQuery(sql);
            
            while (rs.next()) {
                places.add(new Place(rs.getInt("idPlace"),rs.getInt("idPlaceParent"), rs.getString("descriptionPlace"),rs.getString("typePlace")));
            }
                    
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        
        return places;
    }
    
    public Place getPlaceById(int id){
        String sql = "SELECT * FROM place WHERE idPlace=" + id;
    
        try {
            rs = this.makeQuery(sql);
            
            while (rs.next()) {
           
                place = (new Place(rs.getInt("idPlace"),rs.getInt("idPlaceParent"), rs.getString("descriptionPlace"),rs.getString("typePlace")));
                
            }
                    
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        
        return place;
    }
    
    public boolean update(Place place){
        try {
            return this.makeUpdate(String.format("UPDATE `place` "
                    + "SET `idPlace`=%d,"
                    + "`idPlaceParent`=%d,"
                    + "`descriptionPlace`='%s',"
                    + "`typePlace`='%s' "
                    + "WHERE idPlace=%d", place.getId(), place.getParent(), place.getDescription(), place.getType(), place.getId()));
           
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return false;
    }
    
    
     public boolean add(Place place) {
         try {
            return this.makeUpdate(
                    String.format("INSERT INTO `place`( `idPlaceParent`, `descriptionPlace`, `typePlace`) "
                            + "VALUES (%d,'%s','%s')", place.getParent(), place.getDescription(), place.getType() )
            );
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return false;
    }
        
    public boolean delete(int id) {
        try {
            return this.makeUpdate(
                    String.format("DELETE FROM `place` WHERE idPlace=%d", id)
            );
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return false;
    }
    
    public List getChildrenPlaces(int id){
        ArrayList<Place> places = new ArrayList<>();
        String sql = "SELECT * FROM place WHERE idPlaceParent=" + id;
        
        try {
            rs = this.makeQuery(sql);
            
            while (rs.next()) {
                places.add(new Place(rs.getInt("idPlace"),rs.getInt("idPlaceParent"), rs.getString("descriptionPlace"),rs.getString("typePlace")));
            }
                    
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        
        return places;
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
