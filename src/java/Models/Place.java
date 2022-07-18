/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;


/**
 *
 * @author Andres Coronel
 */
public class Place {
    private int id;
    private int parent;
    private String description;
    private String type;

    public Place(){
        this.description = "N/A";
    }
    

    public Place(int id, String description, String type) {
        this.id = id;
        this.parent = -1;
        this.description = description;
        this.type = type;
    }


    
    public Place(int id, int parent, String description, String type) {
        this.id = id;
        this.parent = parent;
        this.description = description;
        this.type = type;
    }

    
    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getParent() {
        return parent;
    }

    public void setParent(int parent) {
        this.parent = parent;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }    
    
    
    public String toJSON(){

        return String.format("{\"id\":%d, \"parent\":%d, \"name\":\"%s\",\"type\":\"%s\"}", this.getId(), this.getParent(), this.getDescription(),this.getType());
    }
    
    public String toJSONTable(){

        return String.format("{\"Código\":%d, \"Código Padre\":%d, \"Nombre\":\"%s\",\"Tipo\":\"%s\"}", this.getId(), this.getParent(), this.getDescription(),this.getType());
    }
}
