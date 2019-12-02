{if isset($smarty.session.USER) && $smarty.session.USER_ADMIN}

{include 'templates/header.tpl'}
<form action="" method="POST" class="col-md-4 offset-md-4 mt-4" enctype= "multipart/form-data">
    <div class="form-group">
    <h2>AGREGAR VARIEDAD</h2>
      <label for="inputState">Seleccione el plato</label>
      <select id="inputState" class="form-control" name="id_comida" >
       {foreach from=$comidas item=comida}
        <option value={$comida->id_comida}>{$comida->nombre}</option>
        {/foreach}
      </select>
    </div>
  
 

    
    <div class="form-group">
      <input type="text" name="nombre" class="form-control" placeholder="Ingrese una variedad">
    </div>
    <div class="form-group">
      <textarea class="form-control" name="ingredientes" rows="3" placeholder="Ingrese ingredientes"></textarea>
    </div>
    <div class="form-group">
      <input type="file" name="imagen" class="form-control" placeholder="Ingrese una imagen" id="imageToUpload">
    </div>
    <button type="submit" class="btn btn-warning text-white">AGREGAR</button>
</form>

</body>
{include 'templates/footer.tpl'}

{else}
{include 'templates/home.tpl'}

{/if}
