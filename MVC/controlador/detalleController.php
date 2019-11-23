<?php

require_once "MVC/modelo/variedadModel.php";
require_once "MVC/modelo/comidasModel.php";
require_once "MVC/modelo/detalleModel.php";
require_once "MVC/vista/detalleView.php";

class detalleControlador {
    private $variedadModel;
    private $comidasModel;
    private $detalleModel;
    private $detalleView;

    public function __construct() {
        $this->variedadModel = new variedadModel ();
        $this->comidasModel = new ComidasModel ();
        $this->variedadView = new variedadView ();
        $this->detalleView = new detalleView ();
        $this->detalleModel = new detalleModel ();
    }
    
    
    public function showDetalle($params = null){
        $id_variedad = $params[':ID_VARIEDAD'];
        $variedad = $this->variedadModel->getVariedad($id_variedad);
        $comidas =  $this->comidasModel->getComidas();
        $this->detalleView->showDetalle($comidas,$variedad);
    }

    }
    

}
?>