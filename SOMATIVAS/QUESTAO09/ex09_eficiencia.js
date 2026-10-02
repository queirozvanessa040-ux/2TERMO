const entrada = require(`readline-sync`);

console.log("=== SISTEMA DE EFICIENCIA ===");

function calcularEficiencia(real, prevista) {
    return (real / prevista) * 100;
}

function classificarEficiencia(percentual) {
    if (percentual >= 90) {
        return "META ATINGIDA";
    } else if (percentual >= 70) {
        return "ATENCAO";
    } else {
        return "ABAIXO DA META";
    }
}

const prevista = entrada.questionFloat("Insira a producao prevista: ");
const real = entrada.questionFloat("Insira a producao real: ")
const percentual = calcularEficiencia(real, prevista);
const classificacao = classificarEficiencia(percentual);

console.log("\n--- RELATORIO DE EFICIENCIA ---");
console.log(`Producao Prevista: ${prevista}`);
console.log(`Producao Real: ${real}`);
console.log(`Eficiencia: ${percentual.toFixed(2)}%`);
console.log(`Classificacao: ${classificacao}`);