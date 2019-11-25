{include 'templates/header.tpl'}

<form method="POST" class="col-md-4 offset-md-4 mt-4">


    <h2>{$titulo}</h2>

    <div class="form-group">
        <label>E-mail de usuario</label>
        <input type="text" name="username" class="form-control" placeholder="ejemplo@email.com">
    </div>

    <div class="form-group">
        <label>Contraseña</label>
        <input type="password" name="password" class="form-control" placeholder="******">
    </div>

    {if $error}
    <div class="alert alert-danger" role="alert">
        {$error}
    </div>
    {/if}
    <button type="submit" class="btn btn-warning text-white">REGISTRARSE</button>




</form>

</div>
</body>
{include 'templates/footer.tpl'}