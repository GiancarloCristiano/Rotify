{include 'templates/header.tpl'}
<div>
  <h1 class="text-center">{$primertitulo}</h1>
</div>

<table class="table table-striped">
  <thead class="thead bg-warning text-white">
    <tr>
      <th scope="col">PLATO</th>
      {if isset($smarty.session.USER_NAME)}
      <th scope="col">ACCIONES</th>
      {/if}
    </tr>
  </thead>
  <tbody>
    {foreach from=$comidas item=comida}
    <tr>
      <td scope="row">{$comida->nombre}</td>
      <td>
        {if isset($smarty.session.USER_NAME)}
        <a class="btn btn-warning text-white" href="comida/editar/{$comida->id_comida}">EDITAR</a>
        <a class="btn btn-secondary" href="comida/borrar/{$comida->id_comida}">X</a>
        {/if}
      </td>
    </tr>
    {/foreach}
  </tbody>
</table>

{if isset($smarty.session.USER_NAME)}
<div>
<a class="btn btn-outline-warning" href="comida/insertar">AGREGAR COMIDA</a>
</div>
{/if}

</body>
{include 'templates/footer.tpl'}