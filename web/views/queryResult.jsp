<%-- 
    Document   : queryResult
    Created on : Jul 13, 2022, 10:06:45 AM
    Author     : Andres Coronel
--%>

<%@page import="Models.*"%>
<%@page import="ModelsDAO.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    PersonDAO personDAO = new PersonDAO();
    EmployeeDAO employeeDAO = new EmployeeDAO();
    PlaceDAO placeDAO = new PlaceDAO();
    PositionDAO positionDAO = new PositionDAO();
    Person person = null;
    Employee employee = null;
    Employee manager = null;
    Place place = null;
    Place parent = null;
    Position position = null;
    
    int option = Integer.parseInt(request.getParameter("opt"));
    String query = request.getParameter("q");
    
    switch (option) {
            case 1:
                person = personDAO.getPersonById(query);
               
                break;
            case 2:
                employee = employeeDAO.getEmployeeById(Integer.parseInt(query));
                if(employee.getManagerNumber() != 0){
                    manager = employeeDAO.getEmployeeById(employee.getManagerNumber());
                }else{
                    manager = new Employee();
                }
                break;
            case 3:
                place = placeDAO.getPlaceById(Integer.parseInt(query));
                if(place.getParent() != 0){
                    parent = placeDAO.getPlaceById(place.getParent());
                }else{
                    parent = new Place();
                }
                break;
            case 4:
                position = positionDAO.getPositionById(Integer.parseInt(query));
                break;
            default:
                throw new AssertionError();
        }
    
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resultado Busqueda</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

    </head>
    
    <body>
        <div class="container p-3">
            
        <div class="container d-flex">
            <h1><a href="Control?action=search" class="btn btn-outline-secondary"><</a></h1>
            <h1>Resultado busqueda</h1>
                
        </div>
        
        <table class="table">
            <%switch(option){
                case 1:
                if(person != null){   
            %>
           
            <tr>
                <th>Cedula</th>
                <th>Apellidos</th>
                <th>Nombres</th>
                <th>Fecha de nacimiento</th>
                <th>Telefono</th>
                <th>Email</th>
                <th>Genero</th>
                <th>Lugar de nacimiento</th>
                <th>Lugar de residencia</th>
            </tr>
            
            <tr>
                <th><%= person.getIdPerson()%></th>
                <th><%= person.getLastNames()%></th>
                <th><%= person.getFirstNames()%></th>
                <th><%= person.getDob()%></th>
                <th><%= person.getPhone()%></th>
                <th><%= person.getEmail()%></th>
                <th><%= person.getGender()%></th>
                <th><%= person.getPlaceOfBirth().getDescription() %></th>
                <th><%= person.getAddress().getDescription() %></th>
            </tr>
            
            <%
                }else{
            %>
            
            <h1>Oops. No existe esa persona.</<h1>
            
            <%
                }
                break;
                case 2:
                   if(employee != null){ 
            %>
            
            <tr>
                <th>#</th>
                <th>Cedula</th>
                <th>Apellidos</th>
                <th>Nombres</th>
                <th>Fecha de nacimiento</th>
                <th>Telefono</th>
                <th>Email</th>
                <th>Genero</th>
                <th>Lugar de nacimiento</th>
                <th>Lugar de residencia</th>
                <th>Fecha de contratacion</th>
                <th># Jefe</th>
                <th>Apellidos Jefe</th>
                <th>Nombres Jefe</th>
            </tr>
            
            <tr>
                <th><%= employee.getEmployeeNumber() %></th>
                <th><%= employee.getIdPerson() %></th>
                <th><%= employee.getLastNames() %></th>
                <th><%= employee.getFirstNames() %></th>
                <th><%= employee.getDob()%></th>
                <th><%= employee.getPhone()%></th>
                <th><%= employee.getEmail()%></th>
                <th><%= employee.getGender()%></th>
                <th><%= employee.getPlaceOfBirth().getDescription() %></th>
                <th><%= employee.getAddress().getDescription() %></th>
                <th><%= employee.getEntryDate()%></th>
                <th><%= manager.getEmployeeNumber() %></th>
                <th><%= manager.getLastNames()%></th>
                <th><%= manager.getFirstNames()%></th>
            </tr>
            
            <%
                }else{
            %>
            
            <h1>Oops. No existe ese empleado.</<h1>
            
            <%
                }
                break;
            case 3:
                if(place != null){
            %>
                <tr>
                    <th>ID</th>
                    <th>Padre</th>
                    <th>Localizacion Geografica</th>
                    <th>Tipo</th>
                </tr>
                
                <tr>
                    <th><%= place.getId() %></th>
                    <th><%= parent.getDescription() %></th>
                    <th><%= place.getDescription() %></th>
                    <th><%= place.getType()%></th>
                </tr>
            <%
                }else{
            %>
            
            <h1>Oops. No existe ese lugar geografico.</<h1>
                    
            <%
                }
                break;
                case 4:
                if(position != null){
            %>    
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                </tr>
                
                <tr>
                    <th><%= position.getId() %></th>
                    <th><%= position.getName()%></th>
                </tr>
            <%
                }else{
            %>
            
            <h1>Oops. No existe ese puesto.</<h1>
            <%
                }
                break;
            default:
            %>
            <p>You shouldn't be here</p>
            <%}%>    
        </table>
        </div>       
  
    </body>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

</html>
