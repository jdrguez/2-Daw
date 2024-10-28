const oscuridad = document.querySelector('#ladoOscuro')
const fuerza = document.querySelector('#ladoFuerza')
const body = document.querySelector('body')
oscuridad.addEventListener('click', () =>{
    body.style.backgroundColor='black'
})
fuerza.addEventListener('click', () =>{
    body.style.backgroundColor='yellow'
})