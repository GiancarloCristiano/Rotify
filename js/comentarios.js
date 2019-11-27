"use strict"
//  var StarRating = require('vue-star-rating');
// Vue.component('star-rating', VueStarRating.default);
// components: {
//     StarRating
//   }
let loggedInUser = JSON.parse(document.getElementById("datos-usuario").value);


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
    })
    
    .catch(error => console.log(error));
}

getComentarios ();




/* async function borrarComentario() {
    let id = document.querySelector('#borrar-comentario').dataset.borrar; //cargamos el ID
     try {
        await   fetch("http://localhost/Rotify/api/comentarios/" + id //tomamos la URL junto con el ID
            {
                method: 'DELETE', //método para borrar
                mode: 'cors',
                headers: {
                    'Content-Type': 'application/json'
                }
            });
    }
    catch () {
        console.log();
    }
}

 */