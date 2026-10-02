const entrada = require(`readline-sync`);

console.log("=== SISTEMA DE PRODUCAO");

const producaoCiclo = entrada.questionInt(`Insira quantos produtos são produzidos por ciclo: `);

for (let i = 1; i <= 12; i ++) {
    const acumulado = i * producaoCiclo;
    console.log(`Ciclo ${i}: ${acumulado} produtos`);
}