// Criando a "máquina" de calcular media
//function calcularMedia(n1, n2) {
//    return (n1 + n2) / 2;
//}

// Usando a máquina
//const resultado = calcularMedia(10, 8);
//const resultado1 = calcularMedia(25, 45);
//console.log(`A media calculada foi: ${resultado}`);
//console.log(`A 2º media calculada foi: ${resultado1}`);

// ----------------------------------------------------------------------

const entrada = require('readline-sync');

const n1 = entrada.questionFloat("Insira a primeira nota: ");
const n2 = entrada.questionFloat("Insira a segunda nota: ");

function calcularMedia(n1, n2) {
    return (n1 + n2) / 2;
}

// Usando a máquina
const resultado = calcularMedia(n1, n2);
console.log(`A média calculada foi: ${resultado}`);