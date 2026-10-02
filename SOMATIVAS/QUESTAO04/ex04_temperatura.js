const entrada = require(`readline-sync`);

console.log("=== SISTEMA DE TEMPERATURA ===");

const tempMaquin = entrada.questionInt("Insira a temperatura da maquina: ");

console.log(`Temperatura informada: ${tempMaquin}°C`);

if (tempMaquin <= 60) {
    console.log("situacao NORMAL");
} else if (tempMaquin >= 61 && tempMaquin <= 80) {
    console.log("situacao ATENCAO");
} else {
    console.log("situacao CRÍTICA");
}