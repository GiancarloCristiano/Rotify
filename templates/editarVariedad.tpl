{include 'templates/header.tpl'}

<form action="" method="POST" class="col-md-4 offset-md-4 mt-4" enctype= "multipart/form-data">
 
    <div class="form-group">
      <h2>EDITAR VARIEDAD</h2>
      <img class="img-fluid" src={$variedad->imagen} alt="">
      </div>
      <div class="form-group">
      <label for="inputState">Categoría de comida</label>
      <select id="inputState" class="form-control" name="id_comida" value={$variedad->id_comida}>
       <option selected>{$variedad->nombre_comida}</option>
       {foreach from=$comidas item=comida}
        <option value={$comida->id_comida}>{$comida->nombre}</option>
        {/foreach}
      </select>
    </div>
       <div class="form-group">
       <label>Variedad</label>
        <input type="text" name="nombre" value="{$variedad->nombre}"  class="form-control" placeholder="Ingrese una variedad">
    </div>
       <div class="form-group">
       <label>Ingredientes</label>
       <textarea class="form-control" name="ingredientes" rows="3">{$variedad->ingredientes}</textarea>
       </div>

    <div class="form-group">
      <input type="file" name="imagen" class="form-control" placeholder="Ingrese una imagen" id="imageToUpload">
    </div>


    <div class=text-center>
    <button type="submit" class="btn btn-warning text-white">GUARDAR</button>
    <div>
</form>


{include 'templates/footer.tpl'}