/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interfaces;

import java.sql.ResultSet;
import java.util.List;

/**
 *
 * @author Andres Coronel
 */
public interface InterfacesDAO {
    public List list();
    public ResultSet makeQuery(String sql);
    public boolean makeUpdate(String sql);
}
