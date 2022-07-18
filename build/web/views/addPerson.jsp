<%-- 
    Document   : addPerson
    Created on : Jul 17, 2022, 12:00:07 PM
    Author     : Andres Coronel
--%>

<%@page import="java.util.List"%>
<%@page import="Models.Place"%>
<%@page import="ModelsDAO.PlaceDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    PlaceDAO pDAO = new PlaceDAO();
    List<Place> places = pDAO.list();
    
    String temp="";
    for (int i = 0; i < places.size(); i++) {
        temp += String.format("%s;",places.get(i).toJSON());
    }
%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar persona</title>
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
            <h1><a href="Control?action=index" class="btn btn-outline-secondary"><</a></h1>
            <h1>Agregar persona.</h1>
            
        </div>
 
            <form>
                
                <label for="id">Cédula de la persona:</label>
                <input type="text" name="id">
                <br>
                <label for="fn">Nombres:</label>
                <input type="text" name="fn">
                <br>
                <label for="ln">Apellidos:</label>
                <input type="text" name="ln">
                <br>
                <label for="dob">Fecha de nacimiento:</label>
                <input type="date" name="dob">
                <br>
                <label for="idPlace">Lugar de nacimiento:</label>
                <select name="idPlace" id="place">
               
                </select>

                <br>

                <label for="idAddress">Lugar de residencia:</label>
                <select name="idAddress" id="address">
              
                </select>
                <br>

               
                
                
                <label for="ph">Telefono: </label>
                <input type="text" name="ph">
                <br>

                <label for="email">Email: </label>
                <input type="text" name="email">
                <br>

                <label for="g">Genero: </label>
                <select name="g">
                    <option value="M">Masculino</option>
                    <option value="F">Femenino</option>
                </select>
                <br>

                <input type="submit" name="action" value="Agregar persona"/>
            </form>
            <input type="hidden" id="h1" value='<%=temp %>'/>
        </div>

    </body>
    
        <script>
       let data = document.getElementById("h1").value;
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
     
     
     function displayTree(node){
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
                
                 result += "<option value='"+node.children[i].id + "'>"+ spaces[node.children[i].type] + node.children[i].name + "</option>";

            }else{
                 result += displayTree(node.children[i]);
             }
         }
 
         return result;
     }
     
     let treeView = document.getElementById("place");
     let treeView2 = document.getElementById("address")
     
     treeView.innerHTML = displayTree(tree)
     treeView2.innerHTML = displayTree(tree)
     
 
     
     
    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

</html>
