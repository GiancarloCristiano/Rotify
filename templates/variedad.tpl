{include 'templates/header.tpl'}
<hr>
<div class="container">
  <h1 class="text-center">
    {$segundotitulo}
  </h1>
</div>


<table class="table table-striped  table-hover">
  <thead class="thead bg-warning text-white">
    <tr>
      <th scope="col">PLATO</th>
      <th scope="col">VARIEDAD</th>
      <th scope="col">IMAGEN</th>
      {if isset($smarty.session.USER_NAME)}
      <th scope="col">ACCIONES</th>
      {else}
      <th scope="col">INGREDIENTES</th>
      {/if}
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
    {foreach from= $variedades item=variedad}
    <tr>
      <td scope="row">{$variedad->nombre_comida}</td>
      <td scope="row">{$variedad->nombre}</td>
      <td scope="row "><img width=150px src="{$variedad->imagen}"></td>
      {* <td scope="row">{$promedioPuntaje} *}
      {* {include file='vue/promedioPuntaje.tpl'} *}
      
      

</td>


      {if isset($smarty.session.USER) && $smarty.session.USER_ADMIN}
      <td scope="row">
        <a class="btn btn-warning text-white" href="variedad/editar/{$variedad->id_variedad}">EDITAR</a>
        <a class="btn btn-secondary" href="variedad/borrar/{$variedad->id_variedad}">X</a>
      
      </td>
      {else}
      <td scope="row">{$variedad->ingredientes}</td>
      {/if}
      <td scope="row"><a class="btn btn-outline-warning" href="variedad/detalle/{$variedad->id_variedad}">VER MÁS</a>
      </td>
    </tr>
    {/foreach}
  </tbody>
</table>

{if isset($smarty.session.USER) && $smarty.session.USER_ADMIN}
<div class="text-center">
<a class="btn btn-outline-warning btn-lg" href="variedad/insertar">AGREGAR VARIEDAD</a>
</div>
{/if}
<hr>

  <!-- <script src="js/promedioPuntaje.js"></script>-->
</body>

{include 'templates/footer.tpl'}