<?php

class JSONView {

    /**
     * Responde cualquier coleccion de objetos en formato JSON.
     */
    public function response($data, $status) {
        header("Content-Type: application/json");
        header("HTTP/1.1 {$status} " . $this->_requestStatus($status));
        echo json_encode($data);
    }

    /**
     * Asocia un mensaje a un codigo de respuesta.
     */
    private function _requestStatus($code){
        $status = array(
          200 => "OK",
          305 => "Empty response",
          401 => "User unauthorized",
          404 => "Not found",
          500 => "Error Interno del Servidor"
        );
        return (isset($status[$code]))? $status[$code] : $status[500];
      }
  
}