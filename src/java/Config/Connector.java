/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Config;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Andres Coronel
 */
public class Connector {
    private Connection con;
    private String conString;
    private String username;
    private String password;
    
    public Connector(String host, String username, String password, String dbName, String port){
        this.conString = String.format("jdbc:mysql://%s:%s/%s", host, port, dbName);
        this.username = username;
        this.password = password;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(this.conString, this.username, this.password);
        }catch(Exception e){
            System.out.println("Error"+e);
        }
    }

    public Connection getCon() {
        return con;
    }

    public void setCon(Connection con) {
        this.con = con;
    }

    public String getConString() {
        return conString;
    }

    public void setConString(String host, String dbName, String port) {
        this.conString = String.format("jdbc:mysql://%s:%s/%s", host, port, dbName);
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(this.getConString(), this.getUsername(), this.getPassword());
        }catch(Exception e){
            System.out.println("Error"+e);
        }
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(this.getConString(), this.getUsername(), this.getPassword());
        }catch(Exception e){
            System.out.println("Error"+e);
        }
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(this.getConString(), this.getUsername(), this.getPassword());
        }catch(Exception e){
            System.out.println("Error"+e);
        }
    }
    
    
}
