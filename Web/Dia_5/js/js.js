var a;
var b;

a = 5;
b = 2

//Pruebas de muestreo de las variables
console.log(a);
console.log(b);
//Operaciones básicas
console.log(a + b);
console.log(a - b);
console.log(a * b);
console.log(a / b);
console.log( a ^ b);
//Corrimiento de bytes
console.log( a << 1);
//Errores de división generados a la fuerza
console.log(a / 0);
console.log(0 / 0);
//Pruebas de operadores lógicos

document.write(1!=true);
document.write(1==true);
document.write(1===true);
document.write("<br><br><br>");

document.write(1==true && 0==false);
document.write(1 == true || 0 == true);
document.write(1 === true || 0 === true);

//Cuadros de mensajes mas comunes

//Aviso de alarte
alert("Hola");
//Confirmación sí/no
confirm("Pregunta");
//
prompt("Texto", "ssaas");


//Arreglos
var arr = [1,2,3,4,5];
var arr2 = [];
	arr2.push("Uno");
	arr2.push("Dos");
	arr2.push("Tres");
	arr2.push("Cuatro");
	arr2.push("Cinco");

//Mosntrnado arreglos
console.log(arr);
console.log(arr2);

console.log(arr.join());
console.log(arr2.join());

console.log(arr);
console.log(arr2);

console.log(arr.length);
console.log(arr2.length);

//Otras formas para hacer arreglos

equipos = new Array("E1","E1", 45,45);
console.log(equipos[2]+5 );
console.log(equipos[2] + equipos[3]);

arreglo = new Array ("Inter1","Inter2");
equipos[4] = arreglo;
	console.log(equipos[4]);


//FUNCIONAL
///////////////////////
function sumar(a,b){ //
	return (a+b);    //
					 //////Importante	
}                    //
///////////////////////

console.log("Funcion suma: " + sumar(5,4));
//Sentencias de control y sentencias de repeticion son iguales



//POO
function Persona(edad){
	this.edad = edad;

	this.saludar = function(){
		alert ("<br>Tu edad es : " + this.edad + "anios");
	}
}

var luis = new Persona(20);

document.write("Tu edad es: " + luis.edad);


