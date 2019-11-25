<?php
include_once('./MVC/vista/loginView.php');
include_once('./MVC/modelo/userModel.php');
include_once('./helpers/authHelper.php');




class LoginController
{

    private $loginView;
    private $userModel;
    private $authHelper;

    public function __construct()
    {
        $this->loginView = new LoginView();
        $this->userModel = new UserModel();
        $this->authHelper = new AuthHelper();
    }

    public function showLogin()
    {
        $this->loginView->showLogin();
    }


    public function showRegister()
    {
        $this->loginView->showRegister();
    }


    public function verifyUser()
    {
        $username = $_POST['username'];
        $password = $_POST['password'];
        $user = $this->userModel->getByUsername($username);
        //$hash = password_hash($password, md5);
    
        // encontró un user con el username que mandó, y tiene la misma contraseña
        if (!empty($user) && password_verify($password, $user->contraseña)) {
            $this->authHelper->login($user);
            session_start();
            //$_SESSION('USER_ID') = $user->id_usuario;
            $_SESSION['USER_NAME'] = $user->nombre;
            $_SESSION['USER_ADMIN'] = $user->admin;


            header('Location:' . HOME);
        } else {
            $this->loginView->showLogin("Login incorrecto");
        }
    }


  /*   public function signUpUser()
    {
        $username = $_POST['username'];
        $password = $_POST['password'];
        //controlar que el usuario no exista
        $this->userModel->signUpUser($username, $password);
        header('Location:' . LOGIN);
    } */

    public function signUpUser()
    {
        $username = $_POST['username'];
        $password = $_POST['password'];
        //controlar que el usuario no exista
        $this->userModel->signUpUser($username, $password);
        if (!empty($user) && password_verify($password, $user->contraseña)) {
            $this->authHelper->login($user);
            session_start();
            $_SESSION['USER_NAME'] = $user->nombre;
            $_SESSION['USER_ADMIN'] = $user->admin;
            header('Location:' . HOME);
        } else {
            $this->loginView->showLogin("Login incorrecto");
        }
    }

    

    public function logout()
    {
        $this->authHelper->logout();
        header('Location: ' . HOME);
    }

    public function getUsuario()
    {
        $username = $_GET['username'];
        $this->userModel->getByUsername($username);

        $this->loginView->showUser($username);
    }


    public function getUsuarios(){
        $usuarios = $this->userModel->getUsuarios();
        $usuarios = $this->loginView->showUsuarios($usuarios);
    }

    public function borrarUsuario($params = null) {
        $id_usuario = $params[':ID_USUARIO'];
        $this->userModel->borrarUsuario($id_usuario);
    }

    public function toggleAdmin($params = null){
        $id_usuario = $params[':ID_USUARIO'];
        $admin = $params[':ADMIN'];
        $this->userModel->toggleAdmin($id_usuario, $admin);
    }
    

}