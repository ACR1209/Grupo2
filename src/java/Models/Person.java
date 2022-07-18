/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Andres Coronel
 */
public class Person {
    private String idPerson;
    private Place placeOfBirth;
    private String lastNames;
    private String firstNames;
    private String dob;
    private Place address;
    private String phone;
    private String email;
    private String gender;

    public Person(String idPerson, Place placeOfBirth, String lastNames, String firstNames, String dob, Place address, String phone, String email, String gender) {
        this.idPerson = idPerson;
        this.placeOfBirth = placeOfBirth;
        this.lastNames = lastNames;
        this.firstNames = firstNames;
        this.dob = dob;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.gender = gender;
    }
    
    public Person(){
        
    }
    
    public String getIdPerson() {
        return idPerson;
    }

    public void setIdPerson(String idPerson) {
        this.idPerson = idPerson;
    }

    public Place getPlaceOfBirth() {
        return placeOfBirth;
    }

    public void setPlaceOfBirth(Place placeOfBirth) {
        this.placeOfBirth = placeOfBirth;
    }

    public String getLastNames() {
        return lastNames;
    }

    public void setLastNames(String lastNames) {
        this.lastNames = lastNames;
    }

    public String getFirstNames() {
        return firstNames;
    }

    public void setFirstNames(String firstNames) {
        this.firstNames = firstNames;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public Place getAddress() {
        return address;
    }

    public void setAddress(Place address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    @Override
    public String toString() {
        return "Person{" + "idPerson=" + idPerson + ", placeOfBirth=" + placeOfBirth + ", lastNames=" + lastNames + ", firstNames=" + firstNames + ", dob=" + dob + ", address=" + address + ", phone=" + phone + ", email=" + email + ", gender=" + gender + '}';
    }
    
    public String toJSONTable(){
        return String.format("{\"Código\":\"%s\","
                + "\"Lugar de nacimiento\":\"%s\","
                + "\"Apellidos\":\"%s\","
                + "\"Nombres\":\"%s\","
                + "\"Fecha de nacimiento\":\"%s\","
                + "\"Dirección\":\"%s\","
                + "\"Email\":\"%s\","
                + "\"Telefono\":\"%s\","
                + "\"Género\":\"%s\"}", 
                this.getIdPerson(), 
                this.getPlaceOfBirth().getDescription(),
                this.getLastNames(),
                this.getFirstNames(),
                this.getDob(),
                this.getAddress().getDescription(),
                this.getEmail(),
                this.getPhone(),
                this.getGender());
    }
    
}
