{include 'templates/header.tpl'}
{if isset($smarty.session.USER_ADMIN)}

<div class="container">
  <h1 class="text-center">
    Administrar Usuarios
  </h1>
</div>


<table class="table table-striped">
  <thead class="thead bg-warning text-white">
    <tr>
      <th scope="col">USUARIO</th>
      <th scope="col">¿ADMIN?</th>
      <th scope="col">ACCIONES</th>
    </tr>
  </thead>
  <tbody>
    {foreach from= $usuarios item=usuario}
    <tr>
      <td scope="row">{$usuario->nombre}</td>
      <td scope="row">
      {if ($usuario->admin)}SI
      {else}NO
      {/if}
      </td>
      <td scope="row">
      {if ($usuario->admin)}
        <a class="btn btn-secondary text-white" href="usuarios/admin/{$usuario->id_usuario}/{$usuario->admin}">Quitar Admin.</a>
        {else}<a class="btn btn-warning text-white" href="usuarios/admin/{$usuario->id_usuario}/{$usuario->admin}">Hacer Admin.</a>
        {/if}
        <a class="btn btn-secondary" href="usuarios/borrar/{$usuario->id_usuario}">X</a>
      </td>
    </tr>
    {/foreach}
  </tbody>
</table>

</body>
{/if}
{include 'templates/footer.tpl'}