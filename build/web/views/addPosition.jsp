<%-- 
    Document   : addPosition
    Created on : Jul 17, 2022, 12:00:15 PM
    Author     : Andres Coronel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar cargo</title>
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
            <h1>Agregar cargo.</h1>
        </div>
        
        <form>
            <label for="name">Nombre del cargo:</label>
            <input type="text" name="name">
            <br>
            
            <input type="submit" name="action" value="Agregar cargo"/>
        </form>
                </div>

    </body>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

</html>
