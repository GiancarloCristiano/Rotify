{include 'templates/header_form.tpl'}

<form action='' method="POST" class="col-md-4 offset-md-4 mt-4">
    <div class="form-group">
        <h2>{$titulo}</h2>
    </div>
    <div class="form-group">
        <input type="text" name="nombre" class="form-control" placeholder="Ingrese comida">
    </div>
        <button type="submit" class="btn btn-warning text-white">AGREGAR</button>
</form>


</body>
{include 'templates/footer.tpl'}