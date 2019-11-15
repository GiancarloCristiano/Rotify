<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <title>Rotify</title>
    <base href={'$BASE_URL'} >
        {* session_start(); *}
</head>

<body class="container">

<nav class="navbar navbar-expand-lg navbar-light bg-light">

 
       <ul class="navbar-nav mr-auto">
        <style> .Rotify {
        font-family: 'Pacifico', cursive;
        font-size:2em;
        }</style>
       <li class="nav-item text-warning font-weight-bold Rotify">Rotify</li>
       </ul>
    <ul class="navbar-nav my-2 my-lg-2">
              {if isset($smarty.session.USER_NAME)}  
              <a class="nav-link" name="">{$usuario}</a>
              <a class="btn btn-warning mr-sm-2" href="logout">Salir</a>
              {else}
               <a class="btn btn-warning mr-sm-2" href="login">INICIAR SESIÓN</a>
               <a class="btn btn-outline-warning" href="register">REGISTRARSE</a>
              {/if}
    </ul>
  </div>
</nav>