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

   

        <!-- {if isset($smarty.session.USER_NAME)}
            {if ($smarty.session.USER_ADMIN)}
            {/if}  -->

{/literal}
