const elements = document.querySelectorAll('#ejer_list li')

elements.forEach(element => {
    element.addEventListener('mouseover', () => {
        element.textContent = 'Nazgûl';
        element.style.backgroundColor = 'black';
        element.style.color = 'white';
    })

});