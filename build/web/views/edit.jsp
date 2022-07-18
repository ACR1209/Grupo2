<%-- 
    Document   : edit
    Created on : Jul 17, 2022, 2:51:45 PM
    Author     : Andres Coronel
--%>

<%@page import="java.util.List"%>
<%@page import="Models.*"%>
<%@page import="ModelsDAO.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    PersonDAO personDAO = new PersonDAO();
    List<Person> people = personDAO.list();
    PlaceDAO placeDAO = new PlaceDAO();
    List<Place> places = placeDAO.list();
    PositionDAO positionDAO = new PositionDAO();
    List<Position> positions = positionDAO.list();
    EmployeeDAO employeeDAO = new EmployeeDAO();
    List<Employee> employees = employeeDAO.list();
    

    String placesJSON="";
    for (int i = 0; i < places.size(); i++) {
        placesJSON += String.format("%s;",places.get(i).toJSON());
    }
        

    String employeesJSON="";
    for (int i = 0; i < employees.size(); i++) {
        employeesJSON += String.format("%s;",employees.get(i).toJSON());
    }
      
      
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar</title>
        
                           <style>
        /* Remove default bullets */
        ul, #treeView {
          list-style-type: none;
        }

        /* Remove margins and padding from the parent ul */
        #treeView {
          margin: 0;
          padding: 0;
        }

        /* Style the caret/arrow */
        .caret {
          cursor: pointer;
          
        }

        /* Create the caret/arrow with a unicode, and style it */
        .caret::before {
          content: "\25B6";
          color: black;
          display: inline-block;
          margin-right: 6px;
        }

        /* Rotate the caret/arrow icon when clicked on (using JavaScript) */
        .caret-down::before {
          transform: rotate(90deg);
        }

        /* Hide the nested list */
        .nested {
          display: none;
        }

        /* Show the nested list when the user clicks on the caret/arrow (with JavaScript) */
        .active {
          display: block;
        }
        
        .edit{
            margin-left: 10px;
        }
        
        .title{
            display: flex;
        }

        
         a, a:hover, a:focus, a:active {
            text-decoration: none;
            color: grey;
            margin-right: 10px;
            font-weight: 900; 
       }
       </style>
       
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

    </head>
    <body>
        <div class="container p-3">
            
        <div class="title">
                <h1><a href="Control?action=list" class="btn btn-outline-secondary"><</a></h1>
                <h1>Editar</h1>
        </div>
       
            
        <%
            int option = Integer.parseInt(request.getParameter("opt"));
            String id = request.getParameter("id");
            Person person = null;
            Employee employee = null;
            Place place = null;
            Position position = null;

            switch (option) {
                    case 1:
                         person = personDAO.getPersonById(id);
                         if(person != null){
                        %>
 
            <form>
                
                
                <input type="hidden" name="id" value="<%= person.getIdPerson() %>">
                <br>
                <label for="fn">Nombres:</label>
                <input type="text" name="fn" value="<%= person.getFirstNames()%>" >
                <br>
                <label for="ln">Apellidos:</label>
                <input type="text" name="ln" value="<%= person.getLastNames()%>">
                <br>
                <label for="dob">Fecha de nacimiento:</label>
                <input type="date" name="dob" value="<%= person.getDob()%>">
                <br>
                <label for="idPlace">Lugar de nacimiento:</label>
                <select name="idP" id="place" >
               
                </select>

                <br>

                <label for="idAddress">Lugar de residencia:</label>
                <select name="idA" id="address" >
                    
                    
                </select>
                <br>

               
                
                
                <label for="ph">Telefono: </label>
                <input type="text" name="ph" value="<%= person.getPhone()%>">
                <br>

                <label for="email">Email: </label>
                <input type="text" name="email" value="<%= person.getEmail()%>" >
                <br>

                <label for="g">Genero: </label>
                <select name="g" value="<%= person.getGender()%>">
                    <option value="M">Masculino</option>
                    <option value="F">Femenino</option>
                </select>
                <br>

                <input type="submit" name="action" value="Editar persona"/>
            </form>
            
             
                        <%
                            }
                        break;
                    case 2:
                        position = positionDAO.getPositionById(Integer.parseInt(id));
                        if(position != null){
                        
                    %>
                    <form>
                    <input type="hidden" name="idPos" value="<%= position.getId() %>" readonly>
                        
                    <label for="name">Nombre del cargo:</label>
                    <input type="text" name="name" value='<%= position.getName() %>'>

                    <br>
                    <input type="submit" name="action" value="Editar cargo"/>
                    <br>




                    </form>
                    <%
                        }
                        break;
                    case 3:
                        employee = employeeDAO.getEmployeeById(Integer.parseInt(id));
                        if(employee != null){

                        %>
                        <form>
                        
                        <label for="idPos">Cargo:</label>
            <select name="idPos">
                
            <%
                for(int i = 0; i < positions.size(); i++){
                    String selected = "";
                    
                    if(positions.get(i).getId() == employee.getPosition()){ 
                        
                    selected="selected";}

            %>
            
            <option value="<%= positions.get(i).getId() %>" label="<%= positions.get(i).getName() %>" <%=selected%> >
            <%}%>
            </select>

            <label for="entryDate">Fecha de inicio:</label>
            <input type="date" name="entryDate" value="<%=employee.getEntryDate()%>">
            <input type="hidden" name="managerId" value="<%=employee.getManagerNumber() %>">
            <input type="hidden" name="idPerson" value="<%=employee.getIdPerson()%>">
            <input type="hidden" name="id" value="<%=employee.getEmployeeNumber()%>">
            <input type="submit" name="action" value="Editar empleado"/>
                        
                        </form>
                        
                        <%
                        }
                        break;
                    case 4:
                        place = placeDAO.getPlaceById(Integer.parseInt(id));
                        
                        if(place != null){
                        %>
                        
                        <form>
                            <label for="desc">Nombre lugar</label>
                        <input type="text" name="desc" value='<%= place.getDescription() %>'/>

                        <input type="hidden" name="parentId" value="<%= place.getParent() %>">
                        <input type="hidden" name="id" value="<%= place.getId()%>">
                        <input type="hidden" name="type" value="<%= place.getType() %>"/>

                        <input type="submit" name="action" value="Editar lugar"/>
                        </form>
                        
                        
                        <%
                        }
                        break;
                    default:
                        throw new AssertionError();
                }
        %>
        
         <input type="hidden" id="h3" value='<%= employeesJSON %>'/>
         <input type="hidden" id="h4" value='<%= placesJSON %>'/>
                 </div>

    </body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

    
           <script>
       let data = document.getElementById("h4").value;
       data = data.substring(0,data.length - 1).split(";");
       let places = [];
       
       for (var i = 0; i < data.length; i++) {   
           places.push(JSON.parse(data[i]));
       }
       
    
        function toTree(data) {
        var childrenById = {}; // of the form id: [child-ids]
        var nodes = {};        // of the form id: {name: children: }
        var i, row;
        var root;
        // first pass: build child arrays and initial node array
        for (i=0; i<data.length; i++) {
            row = data[i];
            nodes[row.id] = {id: row.id, name: row.name, children: [], type: row.type};
            if (row.parent == 0) { // assume 0 is used to mark the root's "parent"
                root = row.id; 
            } else if (childrenById[row.parent] === undefined) {
               childrenById[row.parent] = [row.id];
            } else {
               childrenById[row.parent].push(row.id);
            }
        }
        // second pass: build tree, using the awesome power of recursion!
        function expand(id) {
            if (childrenById[id] !== undefined) {
                for (var i=0; i < childrenById[id].length; i ++) {
                    var childId = childrenById[id][i];
                    nodes[id].children.push(expand(childId));
                }
            }
            return nodes[id];
        }
        return expand(root);
     }
     
     tree = toTree(places);
     
     
     function displayTree(node, selected){
         let spaces = {
             "G": "",
             "A": "&#160;&#160;&#160;",
             "B": "&#160;&#160;&#160;&#160;&#160;&#160;",
             "V": "&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;",
             "D": "&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;",
         }
   
         result = "<option value='"+node.id + "'>"+ spaces[node.type] + node.name + "</option>";
         for (var i = 0; i < node.children.length; i++) {
             if(node.children[i].children.length === 0){
                 console.log(node.children[i].id, selected )
                if(node.children[i].id == selected){
                    result += "<option value='"+node.children[i].id + "' selected>"+ spaces[node.children[i].type] + node.children[i].name + "</option>";

                }else{
                    result += "<option value='"+node.children[i].id + "'>"+ spaces[node.children[i].type] + node.children[i].name + "</option>";
                }

            }else{
                 result += displayTree(node.children[i]);
             }
         }
 
         return result;
     }
     
     let treeView = document.getElementById("place");
     let treeView2 = document.getElementById("address")
     
     treeView.innerHTML = displayTree(tree, <%= person.getPlaceOfBirth().getId() %>)
     treeView2.innerHTML = displayTree(tree, <%= person.getAddress().getId()%>)
     
 
     
     
    </script>
</html>
