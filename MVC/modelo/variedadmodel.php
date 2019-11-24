<?php


class variedadModel
{
    private $db;


    public function __construct(){
        $this->db = $this->connect(); //abre conexión
    }

    function connect(){
        $db = new PDO('mysql:host=localhost;' . 'dbname=db_rotify;charset=utf8', 'root', '');
        return $db;
    }

    /* public function getVariedad($id_variedad){
        $query = $this->db->prepare('SELECT * FROM variedad WHERE id_variedad=?'); //preparo la consulta
        $query->execute(array($id_variedad)); //ejecuto consulta
        $variedad = $query->fetch(PDO::FETCH_OBJ); //me da la respuesta
        return $variedad;
    } */

    public function getVariedad($id_variedad){
        $query = $this->db->prepare('SELECT variedad.*, comida.nombre as nombre_comida FROM variedad INNER JOIN comida ON (variedad.id_comida = comida.id_comida) WHERE variedad.id_variedad=?'); //preparo la consulta
        $query->execute(array($id_variedad)); //ejecuto consulta
        $variedad = $query->fetch(PDO::FETCH_OBJ); //me da la respuesta
        return $variedad;
    }

    public function getVariedades(){
        $db_connection = $this->connect();
        //$query = $db_connection ->prepare( 'SELECT * FROM variedad'); //preparo la consulta
        $query = $db_connection->prepare('SELECT variedad.*, comida.nombre as nombre_comida FROM variedad INNER JOIN comida ON (variedad.id_comida = comida.id_comida)'); //preparo la consulta
        $ok = $query->execute(); //ejecuto consulta
        if (!$ok) var_dump($query->errorinfo()); //chequeo ejecucion
        $variedad = $query->fetchAll(PDO::FETCH_OBJ); //me da la respuesta

        return $variedad;
    }


    function mostrarVariedad(){
        $variedades = getVariedad();
        $html = "<ul>";
        foreach ($variedades as $variedad) {
            $html .= "<li> {$variedad->nombre} </li>";
            $html .= "<li> {$variedad->ingredientes} </li>";
            $html .= "<li> {$variedad->imagen} </li>";
        }
        $html .= "</ul>";
        echo $html;
    }

    public function insertarVariedad($id_comida, $nombre, $ingredientes, $imagen = null){
        $pathImg = null;
        if ($imagen)
            $pathImg = $this->moveFile($imagen);
        echo $pathImg;
        $sentencia = $this->db->prepare('INSERT INTO variedad(id_comida, nombre, ingredientes, imagen) VALUES(?,?,?,?)');
        $sentencia->execute(array($id_comida, $nombre, $ingredientes, $pathImg));
        return $this->db->lastInsertId();
    }

    public function moveFile($imagen){
        $filepath = "src/images/" . uniqid() . ".png"  /* . strtolower(pathinfo($_FILES['imagen']['tmp_name'], PATHINFO_EXTENSION))*/;
        move_uploaded_file($imagen['tmp_name'], $filepath);
        return $filepath;
    }

    // public function editarVariedad($id_variedad, $id_comida, $nombre, $ingredientes, $imagen = null){
    //     if ($imagen){
    //         $pathImg = null;
    //         $pathImg = $this->moveFile($imagen);
    //         echo $pathImg;
    //     $sentencia =  $this->db->prepare('UPDATE variedad SET id_comida=? ,nombre=? ,ingredientes=?, imagen=?   WHERE id_variedad=?');
    //     $sentencia->execute(array($id_comida, $nombre, $ingredientes, $pathImg, $id_variedad));
    //     }else{
    //         $sentencia =  $this->db->prepare('UPDATE variedad SET id_comida=? ,nombre=? ,ingredientes=?   WHERE id_variedad=?');
    //         $sentencia->execute(array($id_comida, $nombre, $ingredientes, $id_variedad));
    //     }
    // }


    public function editarVariedad($id_variedad, $id_comida, $nombre, $ingredientes){
        $sentencia =  $this->db->prepare('UPDATE variedad SET id_comida=? ,nombre=? ,ingredientes=?   WHERE id_variedad=?');
        $sentencia->execute(array($id_comida, $nombre, $ingredientes, $id_variedad));
    }



    public function borrarVariedad($id_variedad){
        $sentencia = $this->db->prepare('DELETE FROM variedad WHERE id_variedad=?');
        $sentencia->execute(array($id_variedad));
    }
}
