"use strict"
//  var StarRating = require('vue-star-rating');
// Vue.component('star-rating', VueStarRating.default);
// components: {
//     StarRating
//   }

let app = new Vue({
    el: "#vue-template-puntajepromedio",
    data: {
        loading: false,
        puntajePromedio: Number// es como el $this->smarty->assign("tareas", $tareas);
    }
});


function getPuntajePromedio(){
    app.loading = true;
    app.puntajePromedio=0;
    fetch("http://localhost/Rotify/api/comentarios/1/puntajeprom")
    .then(response => response.json())
    .then(data => {
        app.puntajePromedio  = Math.trunc(data.promedio);
        app.loading = true;
      
    })
    
    .catch(error => console.log(error));
}

getPuntajePromedio ();




/* Vue.component("rating", {
    props: {
      rating: {
        type: Number,
        default: 0,
      },
  
      max: {
        type: Number,
        default: 5,
      },
    },
    template: `
      <div class="rating">
        <template v-for="n in max">
          <i class="material-icons">
            {{ rating >= n ? 'star' : (rating > n - 1) ? 'star_half' : 'star_border' }}
          </i>
        </template>
      </div>
    `
  });
  
  new Vue({
    el: '#app'
  }); */