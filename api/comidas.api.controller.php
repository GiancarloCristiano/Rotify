<?php
require_once("./MVC/modelo/comidasModel.php");
require_once("./api/json.view.php");

class comidasApiController {

    private $comidasModel;
    private $view;

    public function __construct() {
        $this->comidasModel = new comidasModel();
        $this->view = new JSONView();
    }


    public function getComida($params = null) {
        $id = $params[':id_comida'];
        echo "hgvhj";
        $comida = $this->comidasModel->getComida($id);        
        if ($comida)
            $this->view->response($comida, 200);
        else
            $this->view->response("La comida con el id={$id} no existe", 404);
    } 

    public function getComidas($params = null) {
        $comidas = $this->comidasModel->getComidas();        
        if ($comidas)
            $this->view->response($comidas, 200);
        else
            $this->view->response("La comida no existe", 404);
    } 
}