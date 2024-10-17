const poder = {
    'Spiderman': 'Telaraña',
    'Superman': 'Volar',
    'Batman': 'Tecnología'
};

const seleccion = document.querySelector('#superheroes')

const poderParrafo = document.querySelector('#poder')

seleccion.addEventListener('change', () =>{
    const heroe = seleccion.value;
    poderParrafo.textContent = `Poder de ${heroe}:${poder[heroe]}`
})