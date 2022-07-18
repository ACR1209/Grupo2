<%-- 
    Document   : add
    Created on : Jul 15, 2022, 12:09:58 PM
    Author     : Andres Coronel
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Models.Position"%>
<%@page import="java.util.List"%>
<%@page import="ModelsDAO.PositionDAO"%>
<%@page import="Models.Employee"%>
<%@page import="ModelsDAO.EmployeeDAO"%>
<%@page import="Models.Place"%>
<%@page import="ModelsDAO.PlaceDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int opt = Integer.parseInt(request.getParameter("opt"));
    int id = Integer.parseInt(request.getParameter("id"));
    EmployeeDAO eDAO = new EmployeeDAO();
    Employee manager = null;
    PositionDAO posDAO = new PositionDAO();
    List<Position> pos = posDAO.list();
    PlaceDAO pDAO = new PlaceDAO();
    Place parentPlace = null;
    String typeP = ""; 

    if(opt == 1){
        parentPlace = pDAO.getPlaceById(id);
        typeP = ""; 

        if(parentPlace.getType().equals("G")){
            typeP = "A";
        }else if(parentPlace.getType().equals("A")){
            typeP = "B";
        }else if(parentPlace.getType().equals("B")){
            typeP = "V";
        }else if(parentPlace.getType().equals("V")){
            typeP = "D";
        }
    }else{
 
        manager = eDAO.getEmployeeById(id);
        
    }
    
    

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

        <style>
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
    </head>
    <body>
        <div class="container p-3">
        <div class="title">
            <%
                if(opt == 1){
            %>
            <h1><a href="Control?action=addPlace" class="btn btn-outline-secondary"><</a></h1>
            <h1>Agregar lugar geografico.</h1>
            <%
                } else {
            %>
               <h1><a href="Control?action=addEmployee" class="btn btn-outline-secondary"><</a></h1>
               <h1>Agregar empleado.</h1>
            <%
                }
            %>
        
        </div>
        
        
        <form>
            <%
                switch(opt){
                    case 1:
            %>
                
            <label for="desc">Nombre lugar</label>
            <input type="text" name="desc"/>
            
            <input type="hidden" name="parentId" value="<%= parentPlace.getId() %>">
            <input type="hidden" name="type" value="<%= typeP %>"/>
            
            <input type="submit" name="action" value="Agregar lugar"/>
            
                
            <%
                break;
                    case 2:
            %>
            
            <label for="idPerson">Cédula empleado:</label>
            <input type="text" name="idPerson"/>
            <br>
            <label for="idPos">Cargo:</label>
            <select name="idPos">
                
            <%
                for(int i = 0; i < pos.size(); i++){
                    
                
            %>
            
            <option value="<%= pos.get(i).getId() %>" label="<%= pos.get(i).getName() %>">
            <%}%>
            </select>
            <br>

            <label for="entryDate">Fecha de inicio:</label>
            <input type="date" name="entryDate">
            <br>
            <input type="hidden" name="managerId" value="<%=manager.getEmployeeNumber() %>">
            <br>
            <input type="submit" name="action" value="Agregar empleado"/>
            
            
            <%
                    break;
                default:
                    break;
                }
            %>
        </form>
        </div>
    </body>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

</html>
