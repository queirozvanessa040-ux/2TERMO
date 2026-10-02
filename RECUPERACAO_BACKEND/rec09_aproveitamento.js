const entrada = require(`readline-sync`);

console.log("=== SISTEMA DE MATERIA-PRIMA ===");

function calcularMateriaPrim(util, total) {
    return (util / total) * 100;
}

function classificarEficiencia(percentual) {
    if (percentual >= 90) {
        return "EXCELENTE";
    } else if (percentual >= 75) {
        return "ADEQUADO";
    } else {
        return "REVISAR PROCESSO";
    }
}

const total = entrada.questionFloat("Insira a producao prevista: ");
const util = entrada.questionFloat("Insira a producao real: ");

const percentual = calcularMateriaPrim(util, total);
const classificacao = classificarEficiencia(percentual);

console.log("\n--- RELATORIO ---");
console.log(`Producao Prevista: ${total}`);
console.log(`Producao Real: ${util}`);
console.log(`Eficiencia: ${percentual.toFixed(2)}%`);
console.log(`Classificacao: ${classificacao}`);