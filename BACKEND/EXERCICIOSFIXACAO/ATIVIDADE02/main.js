// const geo = require(`geometria`);
// const lado = 1 = 10;

// console.log(calcularAreaQuadrado(1));

// -------------------------------------------

const entrada = require(`readline-sync`);
const AreaQuadrada = require(`./geometria`);

const lado = entrada.questionFloat("Insira a Area: ");

console.log(`O resultado desta Area é ${calcularAreaQuadrada(lado).toFixed(2)}`);