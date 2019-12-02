{include 'templates/header.tpl'}
<hr>
<div class="container">
  <h1 class="text-center">{$primertitulo}</h1>
</div>

<table class="table table-striped">
  <thead class="thead bg-warning text-white">
    <tr>
      <th scope="col">PLATO</th>
      {if isset($smarty.session.USER) && $smarty.session.USER_ADMIN}
      <th scope="col">ACCIONES</th>
      {/if}
    </tr>
  </thead>
  <tbody>
    {foreach from=$comidas item=comida}
    <tr>
      <td scope="row">{$comida->nombre}</td>
      {if isset($smarty.session.USER) && $smarty.session.USER_ADMIN}
        <td>
        <a class="btn btn-warning text-white" href="comida/editar/{$comida->id_comida}">EDITAR</a>
        <a class="btn btn-secondary" href="comida/borrar/{$comida->id_comida}">X</a>
      </td>
        {/if}
    </tr>
    {/foreach}
  </tbody>
</table>

{if isset($smarty.session.USER) && $smarty.session.USER_ADMIN}
<div class="text-center">
<a class="btn btn-outline-warning btn-lg" href="comida/insertar">AGREGAR COMIDA</a>
</div>
{/if}
<br>
<div class="container">
  <div class="row">
      <div class="col"><img class="img-fluid" src="img/Rotify_comidas_1.png"></div>
      <div class="col"><img class="img-fluid" src="img/Rotify_comidas_2.png"></div>
      <div class="col"><img class="img-fluid" src="img/Rotify_comidas_2_2.png"></div>
    </div>
    <br>
    <div class="row">
      <div class="col"><img class="img-fluid" src="img/Rotify_comidas_3.png"></div>
      <div class="col"><img class="img-fluid" src="img/Rotify_comidas_4.png"></div>
      <div class="col"><img class="img-fluid" src="img/Rotify_comidas_5.png"></div>
    </div>

</div>
<hr>









</body>
{include 'templates/footer.tpl'}