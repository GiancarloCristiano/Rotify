<?php
class UserModel {

    private $db;

    public function __construct() {
        $this->db = new PDO('mysql:host=localhost;dbname=db_rotify;charset=utf8', 'root', '');
    }

    /**
     * Retorna un usuario según el username pasado.
     */
    public function getByUsername($username) {
        $query = $this->db->prepare('SELECT * FROM usuario WHERE nombre = ?');
        $query->execute(array($username));

        return $query->fetch(PDO::FETCH_OBJ);
    }


   


    public function signUpUser($nombre,$password) {

        $hash = password_hash($password, PASSWORD_DEFAULT);
        $sentencia = $this->db->prepare('INSERT INTO usuario(nombre,contraseña) VALUES(?,?)');
        $sentencia->execute(array($nombre,$hash));

       
    }


    

   

}
