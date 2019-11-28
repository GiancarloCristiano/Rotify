<?php

class ComentariosModel {
    private $db;
     
    public function __construct() {
       $this->db= $this->connect(); //abre conexión
    }
    
    function connect(){
        $db = new PDO('mysql:host=localhost;'.'dbname=db_rotify;charset=utf8', 'root', '');
        return $db;
    }

    
    public function getComentarios($id_variedad){
    $query = $this->db->prepare('SELECT comentario.*, usuario.nombre as nombre_usuario FROM comentario INNER JOIN usuario
     ON (comentario.id_usuario = usuario.id_usuario) WHERE comentario.id_variedad=?');
    $query->execute(array($id_variedad)); //ejecuto consulta
    $comentarios = $query->fetchAll(PDO::FETCH_OBJ); //me da la respuesta
    return $comentarios;
    }



    public function getComentariosRecientes($id_variedad){
        $query = $this->db ->prepare('SELECT comentario.*, usuario.nombre as nombre_usuario FROM comentario INNER JOIN usuario
        ON (comentario.id_usuario = usuario.id_usuario) WHERE comentario.id_variedad=? ORDER BY `comentario`.`fecha` DESC'); //preparo la consulta
        $query->execute(array($id_variedad)); //ejecuto consulta
        $comentarios = $query->fetchAll(PDO::FETCH_OBJ); //me da la respuesta
        return $comentarios;
       }
   
    public function getComentariosAntiguos($id_variedad){
        $query = $this->db ->prepare('SELECT comentario.*, usuario.nombre as nombre_usuario FROM comentario INNER JOIN usuario
        ON (comentario.id_usuario = usuario.id_usuario) WHERE comentario.id_variedad=? ORDER BY `comentario`.`fecha` ASC'); //preparo la consulta
        $query->execute(array($id_variedad)); //ejecuto consulta
        $comentarios = $query->fetchAll(PDO::FETCH_OBJ); //me da la respuesta
        return $comentarios;
    }

    public function getComentariosMejores($id_variedad){
        $query = $this->db ->prepare('SELECT comentario.*, usuario.nombre as nombre_usuario FROM comentario INNER JOIN usuario
        ON (comentario.id_usuario = usuario.id_usuario) WHERE comentario.id_variedad=? ORDER BY `comentario`.`puntaje` DESC'); //preparo la consulta
        $query->execute(array($id_variedad)); //ejecuto consulta
        $comentarios = $query->fetchAll(PDO::FETCH_OBJ); //me da la respuesta
        return $comentarios;
    }
 
    public function getComentariosPeores($id_variedad){
        $query = $this->db ->prepare('SELECT comentario.*, usuario.nombre as nombre_usuario FROM comentario INNER JOIN usuario
        ON (comentario.id_usuario = usuario.id_usuario) WHERE comentario.id_variedad=? ORDER BY `comentario`.`puntaje` ASC'); //preparo la consulta
        $query->execute(array($id_variedad)); //ejecuto consulta
        $comentarios = $query->fetchAll(PDO::FETCH_OBJ); //me da la respuesta
        return $comentarios;
    }




    public function insertarComentario($id_usuario, $id_variedad, $comentario, $puntaje){
    $sentencia = $this->db->prepare('INSERT INTO comentario (id_usuario, id_variedad, comentario, puntaje) VALUES(?,?,?,?)');
    $sentencia->execute(array($id_usuario, $id_variedad, $comentario, $puntaje));
    }


    public function borrarComentario($id_comentario){
        $query = $this->db->prepare('SELECT * FROM comentario WHERE id_comentario=?');
        $query->execute(array($id_comentario));
        $comentario = $query->fetch(PDO::FETCH_OBJ);
        if ($comentario != null) {
            $sentencia = $this->db->prepare('DELETE FROM comentario WHERE id_comentario=?');
            $sentencia->execute(array($id_comentario));
        }
        return $comentario;
    }

    public function getPromPuntaje($id_variedad){
        $query = $this->db ->prepare('SELECT AVG(puntaje) AS promedio FROM `comentario` WHERE id_variedad=?');
        $query->execute(array($id_variedad)); //ejecuto consulta
        $promedioPuntajes = $query->fetch(PDO::FETCH_OBJ); //me da la respuesta
        return $promedioPuntajes;
    }



}

?>