{literal}



<div class="card card-outline-secondary my-4" id="vue-template-comentarios">
  <div class="card-header">
    <div class="btn-toolbar justify-content-between" role="toolbar" aria-label="Toolbar with button groups">
      <h4 v-if="comentarios">Comentarios del Producto</h4>
      <h4 v-else>No existen comentarios de este Producto</h4>
        <div class="btn-group-sm" role="group">
          <button id="btnGroupDrop1" type="button" class="btn btn-light dropdown-toggle"
          data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Ordenar por:
          </button>
          <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
            <a class="dropdown-item" id=>Más reciente</a>
            <a class="dropdown-item">Más antiguo</a>
            <a class="dropdown-item">Mejor puntaje</a>
            <a class="dropdown-item">Peor puntaje</a>
          </div>
        </div>
      </div>
    </div>

 

  <div class="card-body" v-for="comentario in comentarios" v-if="comentarios">
    <p>{{comentario.comentario}}</p>
    <h4>{{comentario.puntaje}}</h4>
    <small class="text-muted">Publicado por {{comentario.nombre_usuario}}. Fecha: {{comentario.fecha}}</small>
    <hr>
 
    <div v-if="loggedInUser && loggedInUser.admin==1">
      <button class="btn btn-secondary btn-sm" id="borrar-comentario"
      v-on:click="borrar(comentario.id_comentario)">Borrar comentario</button>
      <hr>
    </div>
  </div>

  <!--<div class="card-body" v-if="comentarios != null">
    <p>Aún no existen comentarios para este producto</p>
  </div> -->


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
