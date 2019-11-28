<?php
require_once("./MVC/modelo/comentariosModel.php");
require_once("./MVC/modelo/userModel.php");
require_once("./api/json.view.php");

class comentariosApiController {

    private $comentariosModel;
    private $userModel;
    private $view;
    private $data;

    public function __construct() {
        $this->comentariosModel = new comentariosModel();
        $this->userModel = new userModel();
        $this->view = new JSONView();
        $this->data = file_get_contents("php://input"); 
    }

    function getData(){ 
        return json_decode($this->data); 
    }  



       public function getComentarios($params = null) {
            $id_variedad = $params[':id_variedad'];
            $comentarios = $this->comentariosModel->getComentarios($id_variedad);
                $this->view->response($comentarios, 200);
           }

        //     public function getComentariosMejores($params = null) {
        //     $id_variedad = $params[':id_variedad'];
        //     $comentarios = $this->comentariosModel->getComentariosMejores($id_variedad);
        //         $this->view->response($comentarios, 200);
        // }

        //     public function getComentariosPeores($params = null) {
        //     $id_variedad = $params[':id_variedad'];
        //     $comentarios = $this->comentariosModel->getComentariosPeores($id_variedad);
        //         $this->view->response($comentarios, 200);
        // }

        //     public function getComentariosRecientes($params = null) {
        //     $id_variedad = $params[':id_variedad'];
        //     $comentarios = $this->comentariosModel->getComentariosRecientes($id_variedad);
        //         $this->view->response($comentarios, 200);
        // }

        //     public function getComentariosAntiguos($params = null) {
        //     $id_variedad = $params[':id_variedad'];
        //     $comentarios = $this->comentariosModel->getComentariosAntiguos($id_variedad);
        //         $this->view->response($comentarios, 200);
        // }


        public function borrarComentario($params = null) {
            $id_comentario = $params[':id_comentario'];
            //$id_usuario = $params[':id_usuario'];
            //$usuario = $this->userModel->getByUserID($id_usuario);
            //if ($usuario->admin){
                $comentario = $this->comentariosModel->borrarComentario($id_comentario);        
                if ($comentario){
                    $this->view->response($comentario, 200);
                }else{
                    $this->view->response("El comentario de id={$id_comentario} no existe", 404);
                }
            //}else{
            //    $this->view->response("No tiene permisos para borrarlo", 401);
            //}
        } 


        public function insertarComentario($params = null){
            $id_variedad = $params[':id_variedad'];
            $comentario = $this->getData();
                $this->comentariosModel->insertarComentario($comentario->id_usuario, $id_variedad, $comentario->comentario, $comentario->puntaje);

        }

        public function getPromPuntaje($params = null){
            $id_variedad = $params[':id_variedad'];
            $promedioPuntajes = $this->comentariosModel->getPromPuntaje($id_variedad);
            if ($promedioPuntajes){
                $this->view->response($promedioPuntajes, 200);
            }else{
                $this->view->response(0, 404);
            }
        }
        

}
