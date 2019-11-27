{include 'templates/header.tpl'}
<div class="container">
  <h1 class="text-center">{$primertitulo}</h1>
</div>

<table class="table table-striped">
  <thead class="thead bg-warning text-white">
    <tr>
      <th scope="col">PLATO</th>
      {if ($smarty.session.USER_ADMIN)}
      <th scope="col">ACCIONES</th>
      {/if}
    </tr>
  </thead>
  <tbody>
    {foreach from=$comidas item=comida}
    <tr>
      <td scope="row">{$comida->nombre}</td>
      {if ($smarty.session.USER_ADMIN)}
        <td>
        <a class="btn btn-warning text-white" href="comida/editar/{$comida->id_comida}">EDITAR</a>
        <a class="btn btn-secondary" href="comida/borrar/{$comida->id_comida}">X</a>
      </td>
        {/if}
    </tr>
    {/foreach}
  </tbody>
</table>

{if isset($smarty.session.USER_NAME)}
<div class="text-center">
<a class="btn btn-outline-warning btn-lg" href="comida/insertar">AGREGAR COMIDA</a>
</div>
{/if}

</body>
{include 'templates/footer.tpl'}