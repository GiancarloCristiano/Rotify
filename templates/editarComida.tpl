{include 'templates/header_form.tpl'}
<h1>{$titulo}</h1>
<form action="" method="POST" class="col-md-4 offset-md-4 mt-4">
    <div class="form-group">
        <input type="text" name="nombre" value={$comida->nombre} class="form-control" placeholder="Ingrese comida" >
    </div>
    <button type="submit" class="btn btn-warning text-white">GUARDAR</button>
</form>


</body>
{include 'templates/footer.tpl'}