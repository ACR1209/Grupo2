<%-- 
    Document   : addPlace
    Created on : Jul 13, 2022, 6:59:15 PM
    Author     : Andres Coronel
--%>

<%@page import="Models.Employee"%>
<%@page import="ModelsDAO.EmployeeDAO"%>
<%@page import="ModelsDAO.PlaceDAO"%>
<%@page import="Models.Place"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    EmployeeDAO employeeDAO = new EmployeeDAO();
    List<Employee> employees = employeeDAO.list();
    String temp="";
    for (int i = 0; i < employees.size(); i++) {
        temp += String.format("%s;",employees.get(i).toJSON());
    }
    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar empleado</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

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
        
        
    </head>
    <body>
        <div class="container p-3">
        <div class="title">
            <h1><a href="Control?action=index" class="btn btn-outline-secondary"><</a></h1>
            <h1>Agregar empleado.</h1>
                
        </div>
        
        <ul id="tree-view">
            
        </ul>
        
        <div id="test">
            
        </div>
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
            nodes[row.id] = {id: row.id, name: row.name, children: [], entryDate: row.entryDate, position: row.position};
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
     
     console.log(tree)
     
     function displayTree(node, opt){
         result = "<li class='node'><span class='caret'>" + node.name + "</span><a href='Control?action=add&opt=" + opt + "&id=" + node.id + "' class='edit'>+</a><ul class='nested'>";
         for (var i = 0; i < node.children.length; i++) {
             if(node.children[i].children.length === 0){
                 
                 if(node.children[i].type === "D"){
                     result += "<li class='node'>" + node.children[i].name + "</li>";
                     continue;
                 }
                 result += "<li class='node'>" + node.children[i].name + "<a href='Control?action=add&opt=" + opt + "&id=" + node.children[i].id + "' class='edit'>+</a></li>";

            }else{
                 result += displayTree(node.children[i], opt);
             }
         }
         
         result += `</ul></li>`
         return result;
     }
     
     let treeView = document.getElementById("tree-view");
     
     treeView.innerHTML = displayTree(tree, 2)
     
     
     var toggler = document.getElementsByClassName("caret");
        var i;

        for (i = 0; i < toggler.length; i++) {
          toggler[i].addEventListener("click", function() {
            this.parentElement.querySelector(".nested").classList.toggle("active");
            this.classList.toggle("caret-down");
          });
        }
        
 
     
     
    </script>
    
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

</html>
