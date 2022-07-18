<%-- 
    Document   : search.js
    Created on : Jul 12, 2022, 6:13:57 PM
    Author     : Andres Coronel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buscar</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

    </head>
    <body>
        <div class="container p-3">            
            <div class="container d-flex">
            <h1><a href="Control?action=index" class="btn btn-outline-secondary"><</a></h1>
            <h1>Buscar</h1>
                
        </div>
            <form class="form" action="Control">
                
                <label for="opt">Buscar</label>
                <select name="opt">
                    <option value="1">Persona</option>
                    <option value="2">Empleado</option>
                    <option value="3">Lugar Geografico</option>
                    <option value="4">Puesto</option>
                </select>

                <label for="q">Parámetro:</label>
                <input type="text" name="q">  

                <input type="submit" class="btn btn-success mb-3 w-2" name="action" value="Buscar">
            </form>
            
            <div>
               
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

    </body>
</html>
