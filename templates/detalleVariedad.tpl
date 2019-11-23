{include 'templates/header.tpl'}



  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <div class="col-lg-9">

        <div class="card mt-4">
          <img class="card-img-top img-fluid" src={$variedad->imagen} alt="">
          <div class="card-body">
            <h3 class="card-title">de {$variedad->nombre}</h3>
            <p class="card-text">Ingredientes: {$variedad->ingredientes}</p>
            <span class="text-warning">&#9733; &#9733; &#9733; &#9733; &#9734;</span>
            4.0 stars
          </div>
        </div>
        <!-- /.card -->

        <div class="card card-outline-secondary my-4">
          <div class="card-header">
            Product Reviews
          </div>
          <div class="card-body">
<!--             <p>{$comentarios->comentario}</p>
            <small class="text-muted">Publicado por {$comentarios->nombre} el día {$comentarios->fecha}</small>
            <hr> -->
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
            <small class="text-muted">Posted by Anonymous on 3/1/17</small>
            <hr>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
            <small class="text-muted">Posted by Anonymous on 3/1/17</small>
            <hr>
            <a class="btn btn-outline-warning" href="variedad/comentarios/agregar/{$variedad->id_variedad}"> Publicar un comentario</a>
          </div>
        </div>
        <!-- /.card -->

      </div>
      <!-- /.col-lg-9 -->

    </div>

  </div>
  <!-- /.container -->


  <!-- Bootstrap core JavaScript -->


</body>

{include 'templates/footer.tpl'}