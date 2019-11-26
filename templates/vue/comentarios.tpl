{literal}



<div class="card card-outline-secondary my-4" id="vue-template-comentarios">
  <div class="card-header">
    <nav class="navbar navbar-expand">
 
      <ul class="navbar-nav mr-auto">
       <li class="nav-link"><h5>Comentarios del Producto</h5></li></ul>
       <ul class="navbar-nav my-2 my-lg-2">
       <li class="nav-link">Ordenar por:</li>
         <button class="btn btn-light btn mr-sm-2">Fecha</button></li>
         <button class="btn btn-light btn">Puntaje</button></li>
      </ul>
    </nav>
  </div>
  <div class="card-body" v-for="comentario in comentarios">
    <p>{{comentario.comentario}}</p>
    <h4>{{comentario.puntaje}}</h4>
    <small class="text-muted">Publicado por {{comentario.id_usuario}} el día {{comentario.fecha}}</small>
      <hr>
    <div>
      <button class="btn btn-secondary btn-sm" data-borrar="{$comentario->id_comentario}"
      v-on:click="borrar(comentario.id_comentario)">Borrar comentario</button>

    </div>
    <hr>
  </div>
  <div class="card-footer">
    <div class="form-group">
      <label>Ingrese comentario</label>
        <textarea class="form-control" name="comentario" rows="3"></textarea>
    </div>
    <div class="form-group">
      <label>Ingrese puntaje</label>
        <select class="form-control" name="puntaje" >
          <option selected value=5>&#9733; &#9733; &#9733; &#9733; &#9733; EXCELENTE</option>
          <option value=4>&#9733; &#9733; &#9733; &#9733; &#9734;  MUY BUENO</option>
          <option value=3>&#9733; &#9733; &#9733; &#9734; &#9734;  REGULAR</option>
          <option value=2>&#9733; &#9733; &#9734; &#9734; &#9734;  MALO</option>
          <option value=1>&#9733; &#9734; &#9734; &#9734; &#9734;  MUY MALO</option>
        </select>
    </div>
    <button class="btn btn-warning text-white"
    href="variedad/comentarios/agregar/{$variedad->id_variedad}">Publicar comentario</button>
  </div>

</body>        

        <!-- {if isset($smarty.session.USER_NAME)}
            {if ($smarty.session.USER_ADMIN)}
            {/if}  -->

{/literal}
