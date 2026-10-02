const entrada = require(`readline-sync`);

console.log("=== SISTEMA DE QUALIDADE ===");

const pecaPes = entrada.questionFloat("Insira o peso desta peca (em gramas): ");

if (pecaPes >= 95 && pecaPes <= 105) {
    console.log("PEÇA APROVADA");
} else {
    console.log("PEÇA REPROVADA");
}

console.log(`Peso informado: ${pecaPes}g`);