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



/* function getTareas() {
    // inicia la carga
    app.loading = true;

    fetch("api/tareas")
    .then(response => response.json())
    .then(tareas => {
        app.tareas  = tareas;
        app.loading = false;
    })
    .catch(error => console.log(error));
}


getTareas();
 */