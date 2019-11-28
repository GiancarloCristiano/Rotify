{literal}



<div class="card card-outline-secondary my-4" id="vue-template-comentarios">
  <div class="card-header">
    <div class="btn-toolbar justify-content-between" role="toolbar" aria-label="Toolbar with button groups">
      <h4>Comentarios del Producto <span class="badge badge-pill badge-warning text-white">8</h4>
        <div class="btn-group-sm" role="group">
          <button id="btnGroupDrop1" type="button" class="btn btn-light dropdown-toggle"
          data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Ordenar por:
          </button>
          <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
            <button class="dropdown-item" v-on:click="getOrderReciente()">Más reciente</button>
            <button class="dropdown-item" v-on:click="getOrderAntiguo()">Más antiguo</button>
            <button class="dropdown-item" v-on:click="getOrderMejores()">Mejor puntaje</button>
            <button class="dropdown-item" v-on:click="getOrderPeores()">Peor puntaje</button>
          </div>
        </div>
      </div>
    </div>

 

  <div class="card-body" v-for="comentario in comentarios" v-if="comentarios">
    <div class="btn-toolbar justify-content-between">
      <div>
        <h5>{{comentario.comentario}}</h5>
        <small class="text-muted">Publicado por {{comentario.nombre_usuario}}. Fecha: {{comentario.fecha}}</small>
      </div>

      <div>
        <h5 v-if="comentario.puntaje == 1" class="text-warning">&#9733; &#9734; &#9734; &#9734; &#9734;</h5>
        <h5 v-if="comentario.puntaje == 2" class="text-warning">&#9733; &#9733; &#9734; &#9734; &#9734;</h5>
        <h5 v-if="comentario.puntaje == 3" class="text-warning">&#9733; &#9733; &#9733; &#9734; &#9734;</h5>
        <h5 v-if="comentario.puntaje == 4" class="text-warning">&#9733; &#9733; &#9733; &#9733; &#9734;</h5>
        <h5 v-if="comentario.puntaje == 5" class="text-warning">&#9733; &#9733; &#9733; &#9733; &#9733;</h5>
        <p class="text-right"><span class="badge badge-pill badge-secondary text-white">{{comentario.puntaje}}</span></p>
      </div>
    </div>
    <hr>
 
      <div v-if="loggedInUser && loggedInUser.admin==1">
        <button class="btn btn-secondary btn-sm" id="borrar-comentario"
        v-on:click="borrar(comentario.id_comentario)">Borrar comentario</button>
        <hr>
      </div>
  </div>

  <div class="card-body" v-else>
    <p>Aún no existen comentarios para este producto</p>
  </div>


    <div class="card-footer" v-if="loggedInUser">
      <div class="form-group">
        <label>Ingrese comentario</label>
          <textarea class="form-control" name="comentario" rows="3" id="formComentario">
          </textarea>
      </div>
      <div class="form-group">
       <label>Ingrese puntaje</label>
         <select class="form-control" name="puntaje" id="formPuntaje">
           <option selected value=5>&#9733; &#9733; &#9733; &#9733; &#9733; EXCELENTE</option>
           <option value=4>&#9733; &#9733; &#9733; &#9733; &#9734;  MUY BUENO</option>
           <option value=3>&#9733; &#9733; &#9733; &#9734; &#9734;  REGULAR</option>
           <option value=2>&#9733; &#9733; &#9734; &#9734; &#9734;  MALO</option>
           <option value=1>&#9733; &#9734; &#9734; &#9734; &#9734;  MUY MALO</option>
          </select>
      </div>
      <button type="submit" class="btn btn-warning text-white" id="agregarComentario"
       v-on:click="agregar()">Publicar comentario</button>
    </div>
   
{/literal}
