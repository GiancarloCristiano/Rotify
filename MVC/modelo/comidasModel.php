

<?php


class ComidasModel {

    
    private $db;
    
    
    public function __construct() {
       $this->db= $this->connect(); //abre conexión
    }
    
    function connect(){
        $db = new PDO('mysql:host=localhost;'.'dbname=db_rotify;charset=utf8', 'root', '');
        return $db;
    }

    public function getComida($id_comida){
        $query = $this->db->prepare( 'SELECT * FROM comida WHERE id_comida=?'); //preparo la consulta
        $query->execute(array($id_comida)); //ejecuto consulta
        $comida = $query->fetch(PDO::FETCH_OBJ); //me da la respuesta
        return $comida;
    }	
    function getComidas(){
   
        $query = $this->db ->prepare( 'SELECT * FROM comida'); //preparo la consulta
        $ok = $query->execute(); //ejecuto consulta
        if (!$ok) var_dump ($query -> errorinfo()); //chequeo ejecucion
        $comidas = $query->fetchAll(PDO::FETCH_OBJ); //me da la respuesta
        
        return $comidas;
    }


    function mostrarComidas() {
        $comidas = getComidas();
        $html = "<ul>";
        foreach ($comidas as $comida) {
            $html .="<li> {$comida->nombre} </li>";
        }
        $html.="</ul>";
        echo $html;
    }

    public function insertarComida($nombre){
        
        $sentencia = $this->db->prepare('INSERT INTO comida(nombre) VALUES(?)');
        $sentencia->execute(array($nombre));
        
    }

    public function editarComida($id_comida,$nombre){
        $sentencia =  $this->db->prepare('UPDATE comida SET nombre=? WHERE id_comida=?');
        $sentencia->execute(array($nombre, $id_comida));
    }

    public function borrarComida($id_comida){
        $sentencia = $this->db->prepare('DELETE FROM comida WHERE id_comida=?');
        $sentencia->execute(array($id_comida));
    }
}
?>