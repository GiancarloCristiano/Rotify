<?php
    require_once('Router.php');
    require_once('./api/comidas.api.controller.php');
    require_once('./api/comentario.api.controller.php');
    
    // CONSTANTES PARA RUTEO
    define("BASE_URL", 'http://'.$_SERVER["SERVER_NAME"].':'.$_SERVER["SERVER_PORT"].dirname($_SERVER["PHP_SELF"]).'/');

    $router = new Router();

    // rutas
    $router->addRoute("/comidas", "GET", "comidasApiController", "getComidas");
    $router->addRoute("/comidas/:id_comida", "GET", "comidasApiController", "getComidas");
    $router->addRoute("/comentarios/:id_variedad/", "GET", "comentariosApiController", "getComentarios");
    // $router->addRoute("/comentarios/:id_variedad/?sort=puntaje&order=asc", "GET", "comentariosApiController", "getComentarios");
    $router->addRoute("/comentarios/:id_variedad/insertar/", "POST", "comentariosApiController", "insertarComentario");
    $router->addRoute("/comentarios/borrar/:id_usuario/:id_comentario/", "DELETE", "comentariosApiController", "borrarComentario");
    $router->addRoute("/comentarios/:id_variedad/puntajeprom/", "GET", "comentariosApiController", "getPromPuntaje");



    //run
    $router->route($_GET['resource'], $_SERVER['REQUEST_METHOD']); 
