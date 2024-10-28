"use strict";
// Ejercicio D1S1.1.1
$(function () {
    var msg = 'Es un lenguaje que el da tipado estricto a js';
    $('#output1').text("".concat(msg));
    // Ejercicio D1S1.1.2   
    var villano = {
        nombre: "Freddy",
        edad: 65,
        pesadilla: "hola"
    };
    $('#output2').text("{\n      nombre: ".concat(villano.nombre, ", \n      edad: ").concat(villano.edad, ", \n      pesadilla: ").concat(villano.pesadilla, "\n   }"));
    // Ejercicio D1S2.1.1
    function atacar(arma) {
        return $('#output3').text("Freddy ataca con el arma ".concat(arma));
    }
    atacar('cuchillo');
    // Ejercicio D1S2.1.2
    function saltar(metros, metros_referencia) {
        if (metros_referencia === void 0) { metros_referencia = 5; }
        return $('#output4').text("Freddy salta ".concat(metros, " metros / Freddy salta ").concat(metros_referencia));
    }
    saltar(10);
    // Ejercicio D1S2.2.1
    var Pesadilla = /** @class */ (function () {
        function Pesadilla(name) {
            this.name = name.toUpperCase();
        }
        Pesadilla.prototype.gritar = function () {
            return $('#output5').text("".concat(this.name, " est\u00E1 aqu\u00ED"));
        };
        return Pesadilla;
    }());
    var pesadilla = new Pesadilla('aguacate');
    pesadilla.gritar();
    // Ejercicio D1S2.2.2
    var Pesadilla2 = /** @class */ (function () {
        function Pesadilla2(name) {
            var _this = this;
            this.gritar = function () { $('#output6').text("".concat(_this.name, " est\u00E1 aqu\u00ED")); };
            this.name = name.toUpperCase();
        }
        return Pesadilla2;
    }());
    var pesadilla2 = new Pesadilla2('tronco');
    pesadilla2.gritar();
});
