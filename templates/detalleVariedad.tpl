{include 'templates/header.tpl'}



  <!-- Page Content -->
  <div id="main-variedad" class="container" data-variedad="{$variedad->id_variedad}">

    <div class="row justify-content-center">

        <div class="col-9">

          <div class="card mt-4">
            <img class="card-img-top img-fluid" src={$variedad->imagen} alt="">
            <div class="card-body">
              <h3 class="card-title">{$variedad->nombre_comida} de {$variedad->nombre}</h3>
              <p class="card-text">Ingredientes: {$variedad->ingredientes}</p>
              {include file='vue/promedioPuntaje.tpl'}
                es el puntaje promedio</p>
            </div>
          </div>
        </div>
        <!-- /.card -->

     {if isset($smarty.session.USER_NAME)}
          {if ($smarty.session.USER_ADMIN)}
            {include file='vue/comentariosAdmin.tpl'}
          {else}
            {include file='vue/comentariosUser.tpl'}
          {/if}
          {else} 
            {include file='vue/comentariosAnon.tpl'}
          {/if}


        
        <!-- /.card -->

    </div>
      <!-- /.col-lg-9 -->

  </div>

  <!-- /.container -->


  <!-- Bootstrap core JavaScript -->
               

  <script src="js/promedioPuntaje.js"></script>
  <script src="js/comentarios.js"></script>

</body>

{include 'templates/footer.tpl'}