<?php
require_once "./MVC/controlador/comidasController.php";
require_once "./MVC/controlador/variedadController.php";
require_once "./MVC/controlador/userController.php"; //importa el archivo que tiene la clase que vamos a usar
require_once "Router.php";

$action = $_GET["action"]; //
define("BASE_URL", 'http://' . $_SERVER["SERVER_NAME"] . ':' . $_SERVER["SERVER_PORT"] . dirname($_SERVER["PHP_SELF"]) . '/');
//define("BASE_URL", 'http://'.$_SERVER["db_a_pedido"].':'.$_SERVER["SERVER_PORT"].dirname($_SERVER["PHP_SELF"]).'/');

define("HOME", BASE_URL . '');
define("VARIEDAD", BASE_URL . 'variedad');
define("COMIDA", BASE_URL . 'comidas');
define("LOGIN", BASE_URL . 'login');




$r = new Router();


// rutas

//comidas
$r->addRoute("comidas", "GET", "ComidasControlador", "getComidas");
$r->addRoute("comida/editar/:ID_COMIDA", "POST", "ComidasControlador", "editarComida");
$r->addRoute("comida/editar/:ID_COMIDA", "GET", "ComidasControlador", "showEditarComida");
$r->addRoute("comida/borrar/:ID_COMIDA", "GET", "ComidasControlador", "borrarComida");
$r->addRoute("comida/insertar", "POST", "ComidasControlador", "insertarComida");
$r->addRoute("comida/insertar", "GET", "ComidasControlador", "ShowAddComida");
//usuario
$r->addRoute("logout", "GET", "LoginController", "logout");
$r->addRoute("login", "POST", "LoginController", "verifyUser");
$r->addRoute("login", "GET", "LoginController", "showLogin");
$r->addRoute("register", "POST", "LoginController", "signUpUser");
$r->addRoute("register", "GET", "LoginController", "showRegister");
//variedades
$r->addRoute("variedad", "GET", "variedadControlador", "getVariedades");
$r->addRoute("variedad/editar/:ID_VARIEDAD", "GET", "variedadControlador", "showEditarVariedad");
$r->addRoute("variedad/editar/:ID_VARIEDAD", "POST", "variedadControlador", "editarVariedad");
$r->addRoute("variedad/borrar/:ID_VARIEDAD", "GET", "variedadControlador", "borrarVariedad");
$r->addRoute("variedad/insertar", "GET", "variedadControlador", "ShowAddVariedad");
$r->addRoute("variedad/insertar", "POST", "variedadControlador", "insertarVariedad");


// //Ruta por defecto.
$r->setDefaultRoute("comidasControlador", "showHome");

//run
$r->route($_GET['action'], $_SERVER['REQUEST_METHOD']);

/*
$controller = new ComidasControlador(); //instancio al controlador de comidas

if($action == ''){
    $controller->getComidas(); //hacer el home (getHome)
}else{
    if (isset($action)){
        $partesURL = explode("/", $action);

        if($partesURL[0] == "comidas"){
            $controller->getComidas(); //busca la funcion getComidas en el controlador
        }
        elseif($partesURL[0] == "insertar") {
             $controller->insertarComida();
        }
        elseif($partesURL[0] == "editar") {
            $controller->editarComida ($partesURL[0]);
        }
        elseif($partesURL[0] == "borrar") {
            $controller->deleteComidas($partesURL[0]);
        }
    }
}
*/