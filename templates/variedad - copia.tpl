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
      <th scope="col">INGREDIENTES</th>
      {if isset($smarty.session.USER_NAME)}
      <th scope="col">ACCIONES</th>
      {/if}
    </tr>
  </thead>
  <tbody>
    {foreach from= $variedades item=variedad}
    <tr>
      <td scope="row">{$variedad->nombre_comida}</td>
      <td scope="row"> {$variedad->nombre}</td>
      <td scope="row">{$variedad->ingredientes}</td>
      {if isset($smarty.session.USER_NAME)}
      <td>
        <a class="btn btn-warning text-white" href="variedad/editar/{$variedad->id_variedad}">EDITAR</a>
        <a class="btn btn-secondary" href="variedad/borrar/{$variedad->id_variedad}">X</a>
      </td>
      {/if}
    </tr>
    {/foreach}
  </tbody>
</table>

{if isset($smarty.session.USER_NAME)}
<div>
<a class="btn btn-outline-warning" href="variedad/insertar">AGREGAR VARIEDAD</a>
</div>
{/if}

</body>

{include 'templates/footer.tpl'}