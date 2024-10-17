class Villano{
    constructor(nombre, plan){
        this.nombre = nombre;
        this.plan = plan;
    }

    cambiarPlan(nuevoplan){
        this.plan = nuevoplan
    }
}

const thanos = new Villano('thanos', 'Matar a la mitad de la población universal')

console.log(thanos.plan)
thanos.cambiarPlan('Volver a casa')
console.log(thanos.plan)