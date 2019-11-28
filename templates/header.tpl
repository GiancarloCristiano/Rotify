<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
    crossorigin="anonymous"></script>

  {* <link href="https://fonts.googleapis.com/css?family=Pacifico&display=swap" rel="stylesheet"> *}
  <base href={BASE_URL}>
  <link rel="icon" type="image/png" href="img/rotify_icon.png" />
  <title>Rotify</title>
  {* session_start(); *}
</head>

<body class="container">
     {if isset($smarty.session.USER)}
        <input type="hidden" id="datos-usuario" value='{json_encode($smarty.session.USER)}'>
        {if ($smarty.session.USER_ADMIN)}
        <input type="hidden" id="esAdmin" value='{$smarty.session.USER_ADMIN}'>
        {/if}
      {else}
      <input type="hidden" id="datos-usuario" value=''>
      {/if}
  

  <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #f0f0f0;">

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
        {if isset($activeLink) && ($activeLink == "home")}
        <li class="nav-item"> <a href=''> <img class="bg-light" src="img/rotify_logo_header.svg"
              style="border-radius: 100%;" /></a></li>
        {else}
        <li class="nav-item"> <a href=''> <img src="./img/rotify_logo_header.svg" /></a></li>
        {/if}
      </ul>
      
      <ul class="navbar-nav mr-auto">
        <li class="nav-item">
          {if isset($activeLink) && ($activeLink == "comidas")}
          <a class="nav-link text-warning" href="comidas">COMIDAS</a>
          {else}
          <a class="nav-link" href="comidas">COMIDAS</a>
          {/if}
        </li>
        <li class="nav-item">
          {if isset($activeLink) && ($activeLink == "variedad")}
          <a class="nav-link text-warning" href="variedad">VARIEDADES</a>
          {else}
          <a class="nav-link" href="variedad">VARIEDADES</a>
          {/if}
        </li>
      </ul>


      <ul class="navbar-nav my-2 my-lg-2">
        {if isset($smarty.session.USER_NAME)}
          <li class="nav-link disabled" name="">Bienvenid@ {$usuario}</li>
            {if ($smarty.session.USER_ADMIN)}
              <a class="btn btn-outline-warning mr-sm-2" href="usuarios">Administrar Usuarios</a>
            {/if}
          <a class="btn btn-warning text-white" href="logout">Salir</a>
        {else}
          <a class="btn btn-warning mr-sm-2 text-white" href="login">INICIAR SESIÓN</a>
          <a class="btn btn-outline-warning" href="register">REGISTRARSE</a>
        {/if}
      </ul>
    </div>
  </nav>