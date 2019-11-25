{literal}



<div class="card card-outline-secondary my-4" id="vue-template-comentarios">
  <div class="card-header">
    Comentarios del Producto
  </div>
  <div class="card-body" v-for="comentario in comentarios">
    <p>{{comentario.comentario}}</p>
    <h4>{{comentario.puntaje}}</h4>
    <small class="text-muted">Publicado por {{comentario.id_usuario}} el día {{comentario.fecha}}</small>
      <hr>
    <div>
      <a class="btn btn-secondary btn-sm"
      href="variedad/comentarios/borrar/{$variedad->id_variedad}/{$comentario->id_comentario}">Borrar comentario</a>
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
    <a class="btn btn-warning text-white" href="variedad/comentarios/agregar/{$variedad->id_variedad}">Publicar comentario</a>
  </div>

</body>        

        <!-- {if isset($smarty.session.USER_NAME)}
            {if ($smarty.session.USER_ADMIN)}
            {/if}  -->

{/literal}
