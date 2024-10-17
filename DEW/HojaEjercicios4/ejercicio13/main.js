const button = document.querySelector('#cambiar')
const image = document.querySelector('#img_batman')

button.addEventListener('click', () =>{
    if (image.style.display == 'none'){
        image.style.display = 'block';
    } else{
        image.style.display = 'none';
    }
})