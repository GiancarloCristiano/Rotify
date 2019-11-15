<?php

require_once "MVC/modelo/comidasModel.php";
require_once "MVC/vista/comidasView.php";
require_once "MVC/vista/homeView.php";

class ComidasControlador {
    private $comidasModel;
    private $comidasView;



               public function __construct() {
                $this->comidasModel = new ComidasModel ();
                $this->comidasView = new ComidasView ();
               }

    public function showHome(){
        
        //$homeView = new HomeView ();

        $this->comidasView->showHome();
    }


    public function showAddComida() {
        $titulo = "Agregar Comida";
       $this->comidasView->AddComida($titulo);
    }

    public function showEditarComida($params = null){
        // $id_variedad = $_GET ["id_variedad"];
         $id_comida = $params[':ID_COMIDA']; 
         $titulo = "Editar Comida";
         $comida = $this->comidasModel->getComida($id_comida);
         $this->comidasView->editarComida($comida, $titulo);
     }
 


    public function getComidas(){
       
        $comidas = $this->comidasModel->getComidas(); //variable con el arreglo de comidas
      //  var_dump ($comidas[1].nombre);
       // echo $comidas[1].nombre;
       //echo $comidas[1]->nombre;
       //llamar a la  instancia de la vista y llamar a una metodo mostrar y pasarle como parametro la variable comidas que es un arreglo,
       //la funcion mostrar despues de va a conectar con smarty para mostrar todas las comidas en un html 
       $titulo='CATEGORIA COMIDAS';
       
       $this->comidasView->mostrarComidas($comidas,$titulo);
    }	

    public function insertarComida(){
        
        $nombre = $_POST ['nombre'];
        if (!empty($nombre)){
            $this->comidasModel->insertarComida($nombre);
            header('Location: ' . COMIDA);
            
        }else{
            echo '<script>alert("no se ha ingresado una categoría");
            window.location.href="../addComida"</script>';
            
            // header('Location: ' . COMIDA );
            
        }   
    }
    
    public function editarComida($params = null){
        $id = $params[':ID_COMIDA'];
        $nombre = $_POST ['nombre'];
        if (!empty($nombre)){
        $this->comidasModel->editarComida($id, $nombre);
        header('Location: ' . COMIDA );
        }else{  
            echo '<script>alert("no se ha ingresado una categoría")</script>';
            header('Location: ' . COMIDA );
        }
    }
    
    public function borrarComida($params = null) {
        $id = $params[':ID_COMIDA'];
        echo $id . "jj";
        $this->comidasModel->borrarComida($id);
        header('Location: ' . COMIDA );
    }
    

}
?>