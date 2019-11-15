
{include 'templates/header.tpl'}

    <form method="POST" class="col-md-4 offset-md-4 mt-4">
        
        
        <h1>{$titulo}</h1>

        <div class="form-group">
            <label>Usuario (email)</label>
            <input type="text" name="username" class="form-control" placeholder="Ingrese usuario">
        </div>

        <div class="form-group">
            <label>Password</label>
            <input type="password" name="password" class="form-control" placeholder="Password">
        </div>

        {if $error}
        <div class="alert alert-danger" role="alert">
            {$error}
        </div>
        {/if}
        <button type="submit" class="btn btn-primary">Ingresar</button>

       
            <p>¿No tenés cuenta?</p>
            
            <a class="btn btn-warning" href="register">Registrarse</a>
         
    </form>

</div>
{* </body> *}
{include 'templates/footer.tpl'}
