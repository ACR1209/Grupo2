<%-- 
    Document   : list
    Created on : Jul 12, 2022, 8:10:05 PM
    Author     : Andres Coronel
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Models.*"%>
<%@page import="ModelsDAO.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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
        placesJSON += String.format("%s;",places.get(i).toJSONTable());
    }
        

    String employeesJSON="";
    for (int i = 0; i < employees.size(); i++) {
        employeesJSON += String.format("%s;",employees.get(i).toJSONTable());
    }
        

    String personJSON="";
    for (int i = 0; i < people.size(); i++) {
        personJSON += String.format("%s;",people.get(i).toJSONTable());
    }
       

    String positionJSON="";
    for (int i = 0; i < positions.size(); i++) {
        positionJSON += String.format("%s;",positions.get(i).toJSONTable());
    }
       
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar</title>
                            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

    </head>
    <body>
        <div class="container">
            <div class="title">
                <h1><a href="Control?action=index" class="btn btn-outline-secondary"><</a></h1>
                <h1>Listar</h1>
                
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
            </div>
            <select id="option" onchange="getData()">
                <option value="-1">Seleccione una opcion</option>
                <option value="1">Persona</option>
                <option value="2">Cargo</option>
                <option value="3">Empleado</option>
                <option value="4">Lugar</option>
            </select>
            
            <input type='text'  id='searchBar' onkeyup="filterTable()">
            
            <table id="data" class="table">
                
            </table>
            
            
            <input type="hidden" id="peopleJSON" value='<%= personJSON %>'/>
            <input type="hidden" id="positionsJSON" value='<%= positionJSON %>'/>
            <input type="hidden" id="employeesJSON" value='<%= employeesJSON %>'/>
            <input type="hidden" id="placesJSON" value='<%= placesJSON %>'/>
            
        </div>
        
        <script>
            
            function getData(){
                let sel = document.getElementById("option")
                let optionSelected = parseInt(sel.value)
                let data = ""
                switch(optionSelected){
                    case 1:
                        data = document.getElementById("peopleJSON").value;
                        data = data.substring(0,data.length - 1).split(";");
                        getTable(data, 1)
                        break;
                    case 2:
                        data = document.getElementById("positionsJSON").value;
                        data = data.substring(0,data.length - 1).split(";");
                        getTable(data, 2)
                        break;
                    case 3:
                        data = document.getElementById("employeesJSON").value;
                        data = data.substring(0,data.length - 1).split(";");
                        getTable(data, 3)
                        break;
                    case 4: 
                        data = document.getElementById("placesJSON").value;
                        data = data.substring(0,data.length - 1).split(";");
                        getTable(data, 4)
                        break;
                    default:
                        break;
                    
                      
                }
                
                function getTable(data, option){
                var table = document.getElementById("data");
                table.innerHTML = ""
                console.log(data)
                for(let index in data){
                    let current = JSON.parse(data[index]);


                    if(index == 0){
                        let header = table.createTHead();
                        let rowHeader = header.insertRow();
                        for (var key in current) {
                            if (current.hasOwnProperty(key)) {

                                let cellHeader = rowHeader.insertCell();
                                cellHeader.innerHTML  = key

                            }
                        }
                    }


                    let row = table.insertRow()
                    let cell
                    for(var key in current){
                        cell = row.insertCell()
                        cell.innerHTML = current[key]
                    }
                    
                    row.insertCell().innerHTML = "<a href='Control?action=edit&id=" + current["Código"] + "&opt=" + option+"' class='btn btn-secondary'>Editar</a> <a href='Control?action=delete&id=" + current["Código"] + "&opt=" + option + "' class='btn btn-danger'>Eliminar</a>"
                }

            }

            }
            
            
            
            
            
       function filterTable() {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("searchBar");
        filter = input.value.toUpperCase();
        table = document.getElementById("data");
        tr = table.getElementsByTagName("tr");
        for (i = 1; i < tr.length; i++) {
            tds = tr[i].getElementsByTagName("td");
            var matches = false;

            for (j = 0; j < tds.length; j++) {
                if (tds[j]) {
                    txtValue = tds[j].textContent || tds[j].innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        matches = true;
                    } 
                }
            }

            if(matches == true)
            {
                tr[i].style.display = "";
            }
             else {
                    tr[i].style.display = "none";
                }

            }
       }
  
  
        </script>
        
  
    </body>
    
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

</html>
