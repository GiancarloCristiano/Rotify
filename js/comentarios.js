"use strict"

let jsonUser = document.querySelector("#datos-usuario").value;
let jsloggedInUser = null;
if(jsonUser !== ''){
    jsloggedInUser = JSON.parse(jsonUser);
}else{
    jsloggedInUser = null;
}

let comments = new Vue({
    el: "#vue-template-comentarios",
    data: {
        loading: false,
        comentarios: [],// es como el $this->smarty->assign("tareas", $tareas);
        loggedInUser: jsloggedInUser,
    },
    methods: {
        borrar: function(id) {
            fetch('api/comentarios/' + id, {
                "method": "DELETE"
            })
            .then(r => r.json()).then(json => getComentarios()).catch(e => console.log(e));
        },
        agregar: function(){
            let id_variedad=document.querySelector('#main-variedad').dataset.variedad;
            let nuevoComentario = {
                "id_usuario": jsloggedInUser.id_usuario,
                "comentario": document.querySelector('#formComentario').value,
                "puntaje": document.querySelector('#formPuntaje').value,
            };
            let url='api/comentario/'+id_variedad;
            fetch(url, {
                "method": "POST",
                "body": JSON.stringify(nuevoComentario)
            })
            .then(r => getComentarios()).catch(e => console.log(e));
        },
        getOrderReciente: function(){
             let id = document.querySelector('#main-variedad').dataset.variedad;
             fetch("http://localhost/Rotify/api/variedades/" + id + "/comentarios?sort=fecha&order=desc")
             .then(response => response.json())
             .then(data => {
                 comments.comentarios  = data;
                 comments.loading = true;
             })
             .catch(error => console.log(error));
        },
        getOrderAntiguo: function(){
             let id = document.querySelector('#main-variedad').dataset.variedad;
             fetch("http://localhost/Rotify/api/variedades/" + id + "/comentarios?sort=fecha&order=asc")
             .then(response => response.json())
             .then(data => {
                 comments.comentarios  = data;
                 comments.loading = true;
             })
             .catch(error => console.log(error));
        },
        getOrderMejores: function(){
             let id = document.querySelector('#main-variedad').dataset.variedad;
             fetch("http://localhost/Rotify/api/variedades/" + id + "/comentarios?sort=puntaje&order=desc")
             .then(response => response.json())
             .then(data => {
                 comments.comentarios  = data;
                 comments.loading = true;
             })
             .catch(error => console.log(error));
        },
        getOrderPeores: function(){
             let id = document.querySelector('#main-variedad').dataset.variedad;
             fetch("http://localhost/Rotify/api/variedades/" + id + "/comentarios?sort=puntaje&order=asc")
            .then(response => response.json())
             .then(data => {
                 comments.comentarios  = data;
                 comments.loading = true;
             })
             .catch(error => console.log(error));
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