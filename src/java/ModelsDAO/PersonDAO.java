/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModelsDAO;

import Config.Connector;
import Interfaces.InterfacesDAO;
import Models.Person;
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
public class PersonDAO implements InterfacesDAO{
    
    private final Connector conn = new Connector("localhost", "root", "", "dw_grupo3", "3306");
    private Person p = null;
    private ResultSet rs, rs2, rs3;
    private Place address = null;
    private Place placeBirth = null;
    private final PlaceDAO placeDAO = new PlaceDAO();
    
    public PersonDAO(){
        
    }

    
    @Override
    public List list() {
        ArrayList<Person> people = new ArrayList<>();
        String sql = "SELECT * FROM person";
    
        
        try {
            rs = this.makeQuery(sql);
            
            while (rs.next()) {
                placeBirth = placeDAO.getPlaceById(rs.getInt("idPlace"));
                address = placeDAO.getPlaceById(rs.getInt("idAddressPlace"));
                
                people.add(new Person(rs.getString("idPerson"), 
                                      placeBirth, 
                                      rs.getString("lastNamesPerson"), 
                                      rs.getString("firstNames"), 
                                      rs.getString("dobPerson"), 
                                      address, rs.getString("phonePerson"),
                                      rs.getString("emailPerson"),
                                      rs.getString("genderEmployee")));
                
            }
                    
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        
        return people;
    }

    public boolean add(Person p) {
         try {
            return this.makeUpdate(
                    String.format("INSERT INTO `person`(`idPerson`, "
                            + "`idPlace`, `lastNamesPerson`, `firstNames`, "
                            + "`dobPerson`, `idAddressPlace`, `phonePerson`, `emailPerson`, "
                            + "`genderEmployee`) VALUES "
                            + "('%s',%d,'%s','%s','%s',%d,'%s','%s','%s')", p.getIdPerson(), p.getPlaceOfBirth().getId(), p.getLastNames(), p.getFirstNames(), p.getDob(), p.getAddress().getId(),p.getPhone(),p.getEmail(), p.getGender())
            );
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return false;
    }

    
    public boolean delete(String id) {
        try {
            return this.makeUpdate(
                    String.format("DELETE FROM `person` WHERE idPerson=%s", id)
            );
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return false;
    }

    public boolean update(Person person) {
        try {
            return this.makeUpdate(String.format("UPDATE `person` "
                    + "SET `idPerson`='%s',"
                    + "`idPlace`=%d,"
                    + "`lastNamesPerson`='%s',"
                    + "`firstNames`='%s',"
                    + "`dobPerson`='%s',"
                    + "`idAddressPlace`=%d,"
                    + "`phonePerson`='%s',"
                    + "`emailPerson`='%s',"
                    + "`genderEmployee`='%s' "
                    + "WHERE idPerson=%s",person.getIdPerson(), person.getAddress().getId(), person.getLastNames(), person.getFirstNames(), person.getDob(), person.getAddress().getId(),person.getPhone(),person.getEmail(),person.getGender(), person.getIdPerson()));
           
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return false;
    }


    public Person getPersonById(String id){
        String sql = "SELECT * FROM person WHERE idPerson="+id;
        
        
        try {
            rs = this.makeQuery(sql);
            
            while (rs.next()) {
                rs2 = this.makeQuery("SELECT * FROM place WHERE idPlace="+rs.getInt("idPlace"));
                rs3 = this.makeQuery("SELECT * FROM place WHERE idPlace="+rs.getInt("idAddressPlace"));
                
                while(rs2.next()){
                    placeBirth = new Place(rs2.getInt("idPlace"),rs2.getInt("idPlaceParent"),rs2.getString("descriptionPlace"),rs2.getString("typePlace"));
                    break;
                }
                
                while(rs3.next()){
                    address = new Place(rs3.getInt("idPlace"),rs3.getInt("idPlaceParent"),rs3.getString("descriptionPlace"),rs3.getString("typePlace"));
                    break;
                }
                
                p = new Person(rs.getString("idPerson"), 
                                      placeBirth, 
                                      rs.getString("lastNamesPerson"), 
                                      rs.getString("firstNames"), 
                                      rs.getString("dobPerson"), 
                                      address, rs.getString("phonePerson"),
                                      rs.getString("emailPerson"),
                                      rs.getString("genderEmployee"));
                break;
                
            }
                    
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        
        return p;
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
