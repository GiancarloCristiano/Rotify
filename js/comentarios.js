"use strict"
//  var StarRating = require('vue-star-rating');
// Vue.component('star-rating', VueStarRating.default);
// components: {
//     StarRating
//   }
let jsonUser = document.querySelector("#datos-usuario").value;
let jsloggedInUser = null;
if(jsonUser !== ''){
 jsloggedInUser = JSON.parse(jsonUser);

let nombreUser = jsloggedInUser.nombre;
console.log (nombreUser);
let adminUser = jsloggedInUser.admin;
console.log (adminUser);
}
else{
 jsloggedInUser = null;
let adminUser = false;
let nombreUser = '';
}



let comments = new Vue({
    el: "#vue-template-comentarios",
    data: {
        loading: false,
        comentarios: [],// es como el $this->smarty->assign("tareas", $tareas);
        loggedInUser: jsloggedInUser
    },
    methods: {
        borrar: function(id) {
            fetch('api/comentarios/' + id, {
                "method": "DELETE"
            })
            .then(r => r.json()).then(json => getComentarios()).catch(e => console.log(e));
        },
        agregar: function(){
            let nuevoComentario = {
                "id_usuario": jsloggedInUser.id_usuario,
                "comentario": document.querySelector('#formComentario').value,
                "puntaje": document.querySelector('#formPuntaje').value,
            };
            fetch('api/comentario/', {
                "method": "POST",
                "body": JSON.stringify(nuevoComentario)
            });
            //.then(r =>r.json()).then(json => getComentarios()).catch(e => console.log(e));
        }
    }
});



function getComentarios(){
    comments.loading = true;
    let id = document.querySelector('#main-variedad').dataset.variedad;
    fetch("http://localhost/Rotify/api/variedades/" + id + "/comentarios")
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