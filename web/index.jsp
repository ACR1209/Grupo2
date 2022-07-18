<%-- 
    Document   : index
    Created on : Jul 12, 2022, 6:13:38 PM
    Author     : Andres Coronel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema empresa: grupo 2</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

    </head>
    <body>
        <div class="container d-flex flex-column justify-content-center align-items-center w-100 h-100">
        <h1>Bienvenido al sistema de empresa del grupo 2</h1>
        <div class="container p-3 d-flex  justify-content-between">
        
        <a href="Control?action=addPlace" class="btn btn-primary">Agregar lugar geografico</a>
        <br>
        <a href="Control?action=search" class="btn btn-primary">Buscar por clave primaria</a>
        <br>
        <a href="Control?action=list" class="btn btn-primary">Listar y editar</a>
        <br>
        <a href="Control?action=addEmployee"class="btn btn-primary">Agregar empleado</a>
        <br>
        <a href="Control?action=addPerson"class="btn btn-primary">Agregar persona</a>
        <br>
        <a href="Control?action=addPosition" class="btn btn-primary">Agregar cargo</a>
        
        </div>
        </div>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

</html>
