{* {include 'templates/header.tpl'} *}
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <title>A Pedido</title>
    <base href={'$BASE_URL'} >
        {* session_start(); *}
</head>





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
    <button type="submit" class="btn btn-warning">GUARDAR</button>
</form>


{include 'templates/footer.tpl'}