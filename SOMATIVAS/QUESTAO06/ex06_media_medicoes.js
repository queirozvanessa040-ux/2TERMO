const entrada = require(`readline-sync`);

const entrada = require(`readline-sync`);
console.log("=== SISTEMA DE MEDICOES ===");

let acumulador = 0;

for (let i = 1; i <= 5; i++) {
    const medicao = entrada.questionFloat(`Insira a medicao ${i}: `);
    acumulador += medicao;
}

const media = acumulador / 5;
console.log(`--- RESULTADO ---`);
console.log(`Soma de todas as medicoes: ${acumulador}`);
console.log(`Media final das medicoes: ${media.toFixed(2)}`);