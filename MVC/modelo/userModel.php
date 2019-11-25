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

    public function getByUserID($id_usuario) {
        $query = $this->db->prepare('SELECT * FROM usuario WHERE id_usuario = ?');
        $query->execute(array($id_usuario));
        return $query->fetch(PDO::FETCH_OBJ);
    }



       public function signUpUser($nombre,$password) {

        $hash = password_hash($password, PASSWORD_DEFAULT);
        $sentencia = $this->db->prepare('INSERT INTO usuario(nombre,contraseña) VALUES(?,?)');
        $sentencia->execute(array($nombre,$hash));

       
    }


    public function getUsuarios() {
        $query = $this->db->prepare('SELECT * FROM usuario');
        $query->execute(array());
        $usuarios = $query->fetchAll(PDO::FETCH_OBJ);
        return $usuarios;
    }

    public function borrarUsuario($id_usuario){
        $sentencia = $this->db->prepare('DELETE FROM usuario WHERE id_usuario=?');
        $sentencia->execute(array($id_usuario));
        header('Location: ' . USUARIOS );
    }

    public function toggleAdmin($id_usuario, $admin){
        $sentencia =  $this->db->prepare("UPDATE usuario SET admin=?   WHERE id_usuario=?");
        $sentencia->execute(array(!$admin, $id_usuario));
        header('Location: ' . USUARIOS );
    }



}
