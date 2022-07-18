/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import ModelsDAO.PositionDAO;

/**
 *
 * @author Andres Coronel
 */
public class Employee extends Person{
    private final PositionDAO posDAO = new PositionDAO();
    private int employeeNumber;
    private int managerNumber;
    private String entryDate;
    private int position;

    public Employee(int employeeNumber, int managerNumber, String entryDate, int position, String idPerson, Place placeOfBirth, String lastNames, String firstNames, String dob, Place address, String phone, String email, String gender) {
        super(idPerson, placeOfBirth, lastNames, firstNames, dob, address, phone, email, gender);
        this.employeeNumber = employeeNumber;
        this.managerNumber = managerNumber;
        this.entryDate = entryDate;
        this.position = position;
    }
   
    public Employee(){
        super();
        this.employeeNumber = 0;
        this.setFirstNames("N/A");
        this.setLastNames("N/A");
    }
    
    public Employee(int employeeNumber, int managerNumber, String entryDate, int position, Person p) {
        super(p.getIdPerson(), 
                p.getPlaceOfBirth(), 
                p.getLastNames(), 
                p.getFirstNames(), 
                p.getDob(), 
                p.getAddress(), 
                p.getPhone(), 
                p.getEmail(), 
                p.getGender());
        this.employeeNumber = employeeNumber;
        this.managerNumber = managerNumber;
        this.entryDate = entryDate;
        this.position = position;
    }
    
    @Override
    public void setGender(String gender) {
        super.setGender(gender); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    public String getGender() {
        return super.getGender(); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    public void setEmail(String email) {
        super.setEmail(email); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    public String getEmail() {
        return super.getEmail(); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    public void setPhone(String phone) {
        super.setPhone(phone); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    public String getPhone() {
        return super.getPhone(); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    public void setAddress(Place address) {
        super.setAddress(address); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    public Place getAddress() {
        return super.getAddress(); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    public void setDob(String dob) {
        super.setDob(dob); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    public String getDob() {
        return super.getDob(); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    public void setFirstNames(String firstNames) {
        super.setFirstNames(firstNames); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    public String getFirstNames() {
        return super.getFirstNames(); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    public void setLastNames(String lastNames) {
        super.setLastNames(lastNames); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    public String getLastNames() {
        return super.getLastNames(); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    public void setPlaceOfBirth(Place placeOfBirth) {
        super.setPlaceOfBirth(placeOfBirth); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    public Place getPlaceOfBirth() {
        return super.getPlaceOfBirth(); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    public void setIdPerson(String idPerson) {
        super.setIdPerson(idPerson); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    public String getIdPerson() {
        return super.getIdPerson(); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    public int getEmployeeNumber() {
        return employeeNumber;
    }

    public void setEmployeeNumber(int employeeNumber) {
        this.employeeNumber = employeeNumber;
    }

    public int getManagerNumber() {
        return managerNumber;
    }

    public void setManagerNumber(int managerNumber) {
        this.managerNumber = managerNumber;
    }

    public String getEntryDate() {
        return entryDate;
    }

    public void setEntryDate(String entryDate) {
        this.entryDate = entryDate;
    }

    public int getPosition() {
        return position;
    }

    public void setPosition(int position) {
        this.position = position;
    }
    
    
    public String toJSON(){
        return String.format("{\"id\":%d, \"parent\":%d, \"name\":\"%s\",\"entryDate\":\"%s\", \"position\":\"%s\"}", this.getEmployeeNumber(), this.getManagerNumber(),this.getEmployeeNumber() + " - " + this.getFirstNames() + " " + this.getLastNames(), this.getEntryDate(), this.posDAO.getPositionById(this.position).getName());
    }
    
    public String toJSONTable(){
        return String.format("{\"Código\":%d, \"Código Gerente\":%d, \"Nombre\":\"%s\",\"Fecha de inicio\":\"%s\", \"Cargo\":\"%s\"}", this.getEmployeeNumber(), this.getManagerNumber(),this.getEmployeeNumber() + " - " + this.getFirstNames() + " " + this.getLastNames(), this.getEntryDate(), this.posDAO.getPositionById(this.position).getName());
    }
}
