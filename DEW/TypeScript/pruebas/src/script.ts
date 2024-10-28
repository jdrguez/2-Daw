 
 
 
 // Ejercicio D1S1.1.1
 $(function(){
    let msg:string  = 'Es un lenguaje que el da tipado estricto a js'
    $('#output1').text(`${msg}`)

    

   interface Freddy{
      nombre:string
      edad:number
      pesadilla: string
   }


   // Ejercicio D1S1.1.2   
   const villano: Freddy = {
      nombre: "Freddy",
      edad: 65,
      pesadilla: "hola"
   }

   $('#output2').text(`{
      nombre: ${villano.nombre}, 
      edad: ${villano.edad}, 
      pesadilla: ${villano.pesadilla}
   }`
   )

   // Ejercicio D1S2.1.1

   function atacar(arma:string){
      return  $('#output3').text(`Freddy ataca con el arma ${arma}`)
   }

   atacar('cuchillo')


   // Ejercicio D1S2.1.2

   function saltar(metros:number, metros_referencia:number = 5){
      return $('#output4').text(`Freddy salta ${metros} metros / Freddy salta ${metros_referencia}`)
   }

   saltar(10)

   // Ejercicio D1S2.2.1


   class Pesadilla {
      name:string;
      constructor(name:string) {
         this.name = name.toUpperCase()
      }

      gritar(){
         return $('#output5').text(`${this.name} está aquí`)
      }
   }


   const pesadilla: Pesadilla = new Pesadilla('aguacate')

   pesadilla.gritar()

   
   // Ejercicio D1S2.2.2

   class Pesadilla2 {
      name:string;
      gritar = ():void =>{$('#output6').text(`${this.name} está aquí`)}
      constructor(name:string) {
         this.name = name.toUpperCase()
      }

   }

   const pesadilla2: Pesadilla2 = new Pesadilla2('tronco')

   pesadilla2.gritar()

 })

