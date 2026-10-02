const entrada = require(`readline-sync`);

console.log("=== SISTEMA DE ATENDIMENTO ===");

let acumulador = 0;

for (let i = 1; i <= 6; i++) {
    const media = entrada.questionFloat(`Insira a media de Atendimento ${i}: `);
    acumulador += tempo;
}

const media = acumulador / 6;
console.log(`--- RESULTADO ---`);
console.log(`Soma de todas as medicoes: ${acumulador}`);
console.log(`Media final do tempo de Atendimento ${media.toFixed(2)}`);