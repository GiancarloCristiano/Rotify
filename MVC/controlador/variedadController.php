<?php

require_once "MVC/modelo/variedadModel.php";
require_once "MVC/modelo/comidasModel.php";
require_once "MVC/vista/variedadView.php";

class variedadControlador {
    private $variedadModel;
    private $comidasModel;
    private $variedadView;

               public function __construct() {
                $this->variedadModel = new variedadModel ();
                $this->comidasModel = new ComidasModel ();
                $this->variedadView = new variedadView ();
               }

    public function getVariedades(){
       $variedades = $this->variedadModel->getVariedades(); 
       $comidasFK = $this->comidasModel->getComidas();
       $titulo='VARIEDADES';
       $this->variedadView->mostrarVariedad($variedades,$titulo,$comidasFK);
    }	


    public function showAddVariedad() {
       $comidas =  $this->comidasModel->getComidas();
       $this->variedadView->AddVariedad($comidas);
    }


    public function showEditarVariedad($params = null){
       // $id_variedad = $_GET ["id_variedad"];
        $id_variedad = $params[':ID_VARIEDAD'];
        
        $variedad = $this->variedadModel->getVariedad($id_variedad);
        $comidas =  $this->comidasModel->getComidas();
        $this->variedadView->editarVariedad($comidas,$variedad);
    }

    public function insertarVariedad(){
        $id_comida = $_POST['id_comida'];
        $nombre = $_POST['nombre'];
        $ingredientes = $_POST['ingredientes'];
        if (
            $_FILES['imagen']['type'] == "image/jpg" || $_FILES['imagen']['type'] == "image/jpeg" ||
            $_FILES['imagen']['type'] == "image/png"
        ) {

            $this->variedadModel->insertarVariedad($id_comida, $nombre, $ingredientes, $_FILES['imagen']);
        }
        // if ((!empty($nombre)) && (!empty($ingredientes))) {

        //     $this->variedadModel->insertarVariedad($id_comida, $nombre, $ingredientes, $_FILES['imagen']);
        //     // header('Location: ' . VARIEDAD);
        // } else {

        //     echo '<script>alert("no se ha ingresado una variedad")</script>';
            header('Location: ' . VARIEDAD );

        }   
    
    
    public function editarVariedad($params = null){
        $id_variedad = $params[':ID_VARIEDAD'];
        $id_comida= $_POST ['id_comida'];
        $nombre = $_POST ['nombre'];
        $ingredientes = $_POST ['ingredientes'];
        if (
            $_FILES['imagen']['type'] == "image/jpg" || $_FILES['imagen']['type'] == "image/jpeg" ||
            $_FILES['imagen']['type'] == "image/png"
        ) {
            $this->variedadModel->editarVariedad($id_variedad,$id_comida, $nombre, $ingredientes, $_FILES['imagen']);
             header('Location: ' . VARIEDAD );
        }else{  
            echo '<script>alert("no se ha ingresado una variedad")</script>';
        }
    }
    
    public function borrarVariedad($params = null) {
        $id = $params[':ID_VARIEDAD'];
        $this->variedadModel->borrarVariedad($id);
        header('Location: ' . VARIEDAD );
    }
    
    public function checkFormato($titulo, $descripcion)
    {
        if (
            $_FILES['input_name']['type'] == "image/jpg" ||
            $_FILES['input_name']['type'] == "image/jpeg" || $_FILES['input_name']['type'] == "image/png"
        )
            $this->variedadmodel->saveTask($titulo, $descripcion,  $_FILES['input_name']['tmp_name']);
        else
            $this->variedadmodel->saveTask($titulo, $descripcion);
    
        }


    
        public function getVariedad($params = null){
            $id_variedad = $params[':ID_VARIEDAD'];
            $variedad = $this->variedadModel->getVariedad($id_variedad);
            
            $promedioPuntajes = $this->variedadModel->getPromPuntajes($id_variedad);
            $this->variedadView->mostrarDetalle($variedad, $promedioPuntajes);

            //$this->variedadView->mostrarDetalle($variedad);
        }	


    
}
?>