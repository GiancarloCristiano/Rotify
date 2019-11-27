{literal}



<div class="card card-outline-secondary my-4" id="vue-template-comentarios">
  <div class="card-header">
    <div class="btn-toolbar justify-content-between" role="toolbar" aria-label="Toolbar with button groups">
      <h4>Comentarios del Producto</h4>
        <div class="btn-group-sm" role="group">
          <button id="btnGroupDrop1" type="button" class="btn btn-light dropdown-toggle"
          data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Ordenar por:
          </button>
          <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
            <a class="dropdown-item" href="variedad/detalle/1?sort=fecha&order=desc">Más reciente</a>
            <a class="dropdown-item" href="variedad/detalle/1?sort=fecha&order=asc">Más antiguo</a>
            <a class="dropdown-item" href="variedad/detalle/1?sort=puntaje&order=desc">Mejor puntaje</a>
            <a class="dropdown-item" href="variedad/detalle/1?sort=puntaje&order=asc">Peor puntaje</a>
          </div>
        </div>
    </div>
  </div>


  <div class="card-body" v-for="comentario in comentarios">
    <p>{{comentario.comentario}}</p>
    <h4>{{comentario.puntaje}}</h4>
    <small class="text-muted">Publicado por {{comentario.id_usuario}} el día {{comentario.fecha}}</small>
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
    <button type="submit" class="btn btn-warning text-white"
    href="variedad/comentarios/agregar/{$variedad->id_variedad}">Publicar comentario</button>
  </div>

   

        <!-- {if isset($smarty.session.USER_NAME)}
            {if ($smarty.session.USER_ADMIN)}
            {/if}  -->

{/literal}
