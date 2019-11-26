"use strict"
//  var StarRating = require('vue-star-rating');
// Vue.component('star-rating', VueStarRating.default);
// components: {
//     StarRating
//   }
let comments = new Vue({
    el: "#vue-template-comentarios",
    data: {
        loading: false,
        comentarios: []// es como el $this->smarty->assign("tareas", $tareas);
    },
    methods: {
        borrar: function(id) {
            alert(id);
        }
    }
});

function getComentarios(){
    comments.loading = true;
    let id = document.querySelector('#main-variedad').dataset.variedad;
    fetch("http://localhost/Rotify/api/comentarios/" + id)
    .then(response => response.json())
    .then(data => {
        comments.comentarios  = data;
        comments.loading = true;
        console.log(comments.comentarios);
    })
    
    .catch(error => console.log(error));
}

getComentarios ();



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