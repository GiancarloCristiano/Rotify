<?php

        require_once('libs/Smarty.class.php');
        class HomeView {
        



        public function showHome (){
            session_start();
            $smarty = new Smarty();
            $smarty->assign('usuario', $_SESSION['USER_NAME'] );
            $smarty->assign('activeLink',"home");
            $smarty->display('../templates/home.tpl');
        
        }	

    }
?>