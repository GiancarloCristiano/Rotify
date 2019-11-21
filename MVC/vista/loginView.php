<?php
require_once('libs/Smarty.class.php');

class LoginView
{

    private $smarty;

    public function __construct()
    {
        $this->smarty = new Smarty();
        $this->smarty->assign('basehref', BASE_URL);
    }

    public function showLogin($error = null)
    {
        session_start();
        // $this->smarty->assign('usuario', $_SESSION['USER_NAME'] );
        $this->smarty->assign('titulo', 'Iniciar Sesión');
        $this->smarty->assign('error', $error);
        $this->smarty->display('templates/login.tpl');
    }


    public function showRegister($error = null)
    {
        session_start();
        // var_dump( $_SESSION['USER_NAME']);
        // die();
        // $this->smarty->assign('usuario', $_SESSION['USER_NAME']);

        $this->smarty->assign('titulo', 'Registrarse');
        $this->smarty->assign('error', $error);
        $this->smarty->display('templates/register.tpl');
    }

    // public function showUser($usuario = null) {
    //     session_start();
    //     $this->smarty->assign('usuario', $_SESSION['USER_NAME']); 
    //     $this->smarty->display('templates/header.tpl');
    // }

}