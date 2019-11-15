    <?php
    require_once('libs/Smarty.class.php');
    class ComidasView
    {



        public function showHome()
        {
            session_start();
            $smarty = new Smarty();
            if (empty($_SESSION['USER_NAME'])) {
                $smarty->assign('usuario', null);
            } else {
                $smarty->assign('usuario', $_SESSION['USER_NAME']);
            }
            $smarty->assign('activeLink', "home");
            $smarty->assign('BASE_URL', BASE_URL);
            $smarty->display('../templates/home.tpl');
        }    //VER ESTE ERROR


        public function mostrarComidas($comidas, $titulo)
        {
            session_start();
            $smarty = new Smarty();
            if (empty($_SESSION['USER_NAME'])) {
                $smarty->assign('usuario', null);
            } else {
                $smarty->assign('usuario', $_SESSION['USER_NAME']);
            }
            $smarty->assign('primertitulo', $titulo);
            $smarty->assign('comidas', $comidas);
            $smarty->assign('activeLink', "comidas");
            $smarty->assign('BASE_URL', BASE_URL);
            $smarty->display('../templates/comidas.tpl');
        }

        public function getCategoriaNueva($comidas)
        {
            session_start();
            $smarty = new Smarty();
            if (empty($_SESSION['USER_NAME'])) {
                $smarty->assign('usuario', null);
            } else {
                $smarty->assign('usuario', $_SESSION['USER_NAME']);
            }
            $smarty->assign('comidas', $comidas);
            $smarty->display('../templates/comidas.tpl');
        }

        public function addComida($titulo)
        {
            session_start();
            $smarty = new Smarty();
            $smarty->assign('usuario', $_SESSION['USER_NAME']);
            $smarty->assign('titulo', $titulo);
            $smarty->assign('comida', COMIDA);
            $smarty->display('../templates/addComida.tpl');
        }

        public function editarComida($comida, $titulo)
        {
            session_start();
            $smarty = new Smarty();
            $smarty->assign('usuario', $_SESSION['USER_NAME']);
            $smarty->assign('comida', $comida);
            $smarty->assign('titulo', $titulo);
            $smarty->display('../templates/editarComida.tpl');
        }
    }
    ?>