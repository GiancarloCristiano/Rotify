<?php
require_once("./modelo/.modelo.php");
require_once("./api/json.view.php");

class comidasApiController {

    private $model;
    private $view;

    public function __construct() {
        $this->modelo = new comidasModel();
        $this->view = new JSONView();
    }

    // public function  getTasks($params = null) {
    //     $comidas = $this->comidasModel->getAll();
    //     $this->view->response($comidas, 200);
    // }

    public function getComidas($params = null) {
        $id = $params['id_comida'];
        
        $comida = $this->comidasModel->get($id);        
        if ($comida)
            $this->view->response($comida, 200);
        else
            $this->view->response("La comida con el id={$id} no existe", 404);
    } 
}