{include 'templates/header.tpl'}

<div class="container">
  <h1 class="text-center">
    {$segundotitulo}
  </h1>
</div>


<table class="table table-striped">
  <thead class="thead bg-warning text-white">
    <tr>
      <th scope="col">PLATO</th>
      <th scope="col">VARIEDAD</th>
      <th scope="col">IMAGEN</th>
      <th scope="col">INGREDIENTES</th>
      <th scope="col">PUNTAJE PROMEDIO</th>
      <th scope="col"></th>
      {if isset($smarty.session.USER_NAME)}
      <th scope="col">ACCIONES</th>
      {/if}
    </tr>
  </thead>
  <tbody>
    {foreach from= $variedades item=variedad}
    <tr>
      <td scope="row">{$variedad->nombre_comida}</td>
      <td scope="row">{$variedad->nombre}</td>
      <td scope="row"><img width=150px src="{$variedad->imagen}"></td>
      <td scope="row">{$variedad->ingredientes}</td>
      <td scope="row">
      {include file='vue/promedioPuntaje.tpl'}
      </td>
      <td scope="row"><a class="btn btn-outline-warning" href="variedad/detalle/{$variedad->id_variedad}">VER MÁS</a>
      {if isset($smarty.session.USER_NAME)}
      <td scope="row">
        <a class="btn btn-warning text-white" href="variedad/editar/{$variedad->id_variedad}">EDITAR</a>
        <a class="btn btn-secondary" href="variedad/borrar/{$variedad->id_variedad}">X</a>
      </td>
      {/if}
    </tr>
    {/foreach}
  </tbody>
</table>

{if isset($smarty.session.USER_NAME)}
<div class="text-center">
<a class="btn btn-outline-warning btn-lg" href="variedad/insertar">AGREGAR VARIEDAD</a>
</div>
{/if}

  <script src="js/promedioPuntaje.js"></script>
</body>

{include 'templates/footer.tpl'}