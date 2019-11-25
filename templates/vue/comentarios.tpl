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
        </div>
            <div class="card-footer">
            <a class="btn btn-warning text-white" href="variedad/comentarios/agregar/{$variedad->id_variedad}"> Publicar un comentario</a>
        </div>
        </div>


{/literal}
