"use strict"

let jsonUser = document.querySelector("#datos-usuario").value;
let jsloggedInUser = null;
if(jsonUser !== ''){
    jsloggedInUser = JSON.parse(jsonUser);

    let nombreUser = jsloggedInUser.nombre;
    console.log (nombreUser);
    let adminUser = jsloggedInUser.admin;
    console.log (adminUser);
}else{
    jsloggedInUser = null;
    let adminUser = false;
    let nombreUser = '';
    console.log (adminUser);
    console.log (nombreUser);
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