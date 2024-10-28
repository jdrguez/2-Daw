class Hechizo {
    constructor(nombre, poder) {
        this.nombre = nombre;
        this.poder = poder;
    }
}

class Mago {
    constructor(nombre, hechizo) {
        this.nombre = nombre;
        this.hechizo = hechizo;
    }

    invocarHechizo() {
        return this.hechizo.poder;
    }
}

function duelo(mago1, mago2) {
    const poderMago1 = mago1.invocarHechizo();
    const poderMago2 = mago2.invocarHechizo();

    if (poderMago1 > poderMago2) {
        return `${mago1.nombre} gana el duelo con el hechizo ${mago1.hechizo.nombre}`;
    } else if (poderMago2 > poderMago1) {
        return `${mago2.nombre} gana el duelo con el hechizo ${mago2.hechizo.nombre}`;
    } else {
        return 'El duelo termina en empate';
    }
}

const hechizo1 = new Hechizo('Rayo', 80);
const hechizo2 = new Hechizo('Bola de fuego', 90);

const mago1 = new Mago('Merlin', hechizo1);
const mago2 = new Mago('Agni', hechizo2);

const mensaje = document.querySelector('#mensaje')
const ganador = document.querySelector('#ganador')

ganador.addEventListener('click', () =>  {
    mensaje.textContent=`${duelo(mago1, mago2)}`

})



console.log(duelo(mago1, mago2));
