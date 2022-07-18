/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModelsDAO;

import Config.Connector;
import Interfaces.InterfacesDAO;
import Models.Employee;
import Models.Person;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Andres Coronel
 */
public class EmployeeDAO implements InterfacesDAO{
    private final Connector conn = new Connector("localhost", "root", "", "dw_grupo3", "3306");
    private Employee e = null;
    private Person p = null;
    private ResultSet rs;
    private final PersonDAO personDAO = new PersonDAO();

    public EmployeeDAO(){
        
    }
    
    @Override
    public List list() {
        ArrayList<Employee> employees = new ArrayList<>();
        String sql = "SELECT * FROM employee";
    
        
        try {
            rs = this.makeQuery(sql);
            
            while (rs.next()) {
                p = personDAO.getPersonById(rs.getString("idPerson"));
                
                employees.add(new Employee(rs.getInt("idEmployee"),
                                           rs.getInt("idEmployeeManager"),
                                           rs.getString("entryEmployee"), 
                                           rs.getInt("idPosition"),
                                           p));
                
            }
                    
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        
        return employees;
    }
    
    public Employee getEmployeeByIdPerson(String id){
        String sql = "SELECT * FROM employee WHERE idPerson=" + id;
    
        
        try {
            rs = this.makeQuery(sql);
            
            while (rs.next()) {
                p = personDAO.getPersonById(rs.getString("idPerson"));
                
                e = new Employee(rs.getInt("idEmployee"),
                                 rs.getInt("idEmployeeManager"),
                                 rs.getString("entryEmployee"), 
                                 rs.getInt("idPosition"),
                                 p);
                break;
            }
                    
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        
        return e;
    }
    
    public Employee getEmployeeById(int id){
        String sql = "SELECT * FROM employee WHERE idEmployee=" + id;
    
        
        try {
            rs = this.makeQuery(sql);
            
            while (rs.next()) {
                p = personDAO.getPersonById(rs.getString("idPerson"));
                
                e = new Employee(rs.getInt("idEmployee"),
                                 rs.getInt("idEmployeeManager"),
                                 rs.getString("entryEmployee"), 
                                 rs.getInt("idPosition"),
                                 p);
                break;
            }
                    
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        
        return e;
    }

    public boolean update(Employee emp){
        System.out.println(emp.getEntryDate());
        try {
            return this.makeUpdate(String.format("UPDATE `employee` "
                    + "SET `idPosition`=%d,"
                    + "`idEmployee`=%d,"
                    + "`idPerson`='%s',"
                    + "`idEmployeeManager`=%d,"
                    + "`entryEmployee`='%s' "
                    + "WHERE idEmployee=%d", emp.getPosition(), emp.getEmployeeNumber(), emp.getIdPerson(), emp.getManagerNumber(),emp.getEntryDate(),emp.getEmployeeNumber()));
           
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return false;
    }
    
    
     public boolean add(Employee emp) {
         try {
             System.out.println(emp);
            return this.makeUpdate(
                    String.format("INSERT INTO `employee`"
                            + "(`idPosition`, `idPerson`, `idEmployeeManager`, `entryEmployee`) "
                            + "VALUES (%d,'%s',%d,'%s')", emp.getPosition(), emp.getIdPerson(), emp.getManagerNumber(), emp.getEntryDate())
            );
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return false;
    }
        
    public boolean delete(int id) {
        try {
            return this.makeUpdate(
                    String.format("DELETE FROM `person` WHERE idEmployee=%d", id)
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
