class Superman{
    constructor(element){
        this.element = element
    }

    volar(){
        this.element.style.bottom = '500px'
    }
}

const superman = new Superman(document.getElementById('superman'))

document.querySelector('#volar').addEventListener('click', () => {
    superman.volar()
})