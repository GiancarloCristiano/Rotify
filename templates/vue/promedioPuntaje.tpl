{literal}

<div class="text-disabled" id="vue-template-puntajepromedio">
  <div v-if="puntajePromedio">
    <p><span class="badge badge-pill badge-warning text-white">Puntaje promedio:</span></p>
      <h3 v-if="puntajePromedio == 1" class="text-warning">&#9733; &#9734; &#9734; &#9734; &#9734;</h3>
      <h3 v-if="puntajePromedio == 2" class="text-warning">&#9733; &#9733; &#9734; &#9734; &#9734;</h3>
      <h3 v-if="puntajePromedio == 3" class="text-warning">&#9733; &#9733; &#9733; &#9734; &#9734;</h3>
      <h3 v-if="puntajePromedio == 4" class="text-warning">&#9733; &#9733; &#9733; &#9733; &#9734;</h3>
      <h3 v-if="puntajePromedio == 5" class="text-warning">&#9733; &#9733; &#9733; &#9733; &#9733;</h3>
      <h6>{{puntajePromedio}}</h6>
  </div>
  <div v-else>
  <h5 style="color: rgb(175,175,175)">&#9734; &#9734; &#9734; &#9734; &#9734;</h5>
  </div>
</div>




{/literal}