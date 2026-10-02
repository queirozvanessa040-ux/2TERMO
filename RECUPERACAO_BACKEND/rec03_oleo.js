const entrada = require(`readline-sync`);

console.log("=== SISTEMA DE VERIFICAO ===");

const nivelOleo = entrada.questionFloat("Insira o nivel de oleo: ");

if (nivelOleo >= 40 && nivelOleo <= 80) {
    console.log("NIVEL NOMRAL");
} else {
    console.log("INSPECAO NECESSSARIA");
}

console.log(`Valor recebido: ${nivelOleo}`);