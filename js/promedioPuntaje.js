"use strict"

let app = new Vue({
    el: "#vue-template-puntajepromedio",
    data: {
        puntajePromedio: Number// es como el $this->smarty->assign("tareas", $tareas);
    }
});


function getPuntajePromedio(){
    app.loading = true;
    app.puntajePromedio=0;
    let id = document.querySelector('#main-variedad').dataset.variedad;
    fetch("http://localhost/Rotify/api/comentarios/" + id + "/puntajeprom")
    .then(response => response.json())
    .then(data => {
        app.puntajePromedio  = Math.round(data.promedio);
      
    })
    
    .catch(error => console.log(error));
}

getPuntajePromedio ();