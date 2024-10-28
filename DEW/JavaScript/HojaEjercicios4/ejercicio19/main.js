const frodo = document.querySelector('#anilloFrodo')
const mensaje = document.querySelector('#mensaje')

frodo.addEventListener('click', () =>{
    mensaje.textContent = 'Has elegido correctamente'
})