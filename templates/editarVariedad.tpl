{include 'templates/header_form.tpl'}

<form action="" method="POST" class="col-md-4 offset-md-4 mt-4">
 
    <div class="form-group">
      <label for="inputState">comidas</label>
      <select id="inputState" class="form-control" name="id_comida" value={$variedad->id_comida}>
       {foreach from=$comidas item=comida}
        <option value={$comida->id_comida}>{$comida->nombre}</option>
        {/foreach}
      </select>
    </div>
    
       <div class="form-group">
        <input type="text" name="nombre" value={$variedad->nombre}  class="form-control" placeholder="Ingrese una variedad">
    </div>
       <div class="form-group">
        <input type="textarea" name="ingredientes" value={$variedad->ingredientes} class="form-control" placeholder="Ingrese ingredientes">
    </div>
    <button type="submit" class="btn btn-warning text-white">GUARDAR</button>
</form>


{include 'templates/footer.tpl'}