const entrada = require("readline-sync");

function calcularMaoDeObra(horas) {
    return horas * 80;
}

function calcularTotal(valorPecas, horas) {
    const maoDeObra = calcularMaoDeObra(horas);
    return valorPecas + maoDeObra;
}

function verificarGarantia(meses) {
    if (meses <= 6) {
        return "EM GARANTIA";
    } else {
        return "FORA DA GARANTIA";
    }
}

console.log("=== SISTEMA DE MANUTENÇÃO E GARANTIA ===");

const valorPecas = entrada.questionFloat("Insira o valor das pecas: ");
const horas = entrada.questionFloat("Insira a quantidade de horas trabalhadas: ");
const meses = entrada.questionInt("Insira o tempo de uso do equipamento (em meses): ");

const valorMaoDeObra = calcularMaoDeObra(horas);
const valorTotal = calcularTotal(valorPecas, horas);
const statusGarantia = verificarGarantia(meses);

console.log("\n--- RESUMO DO SERVIÇO ---");
console.log(`Mão de obra: R$ ${valorMaoDeObra.toFixed(2)}`);
console.log(`Valor Total: R$ ${valorTotal.toFixed(2)}`);
console.log(`Status da Garantia: ${statusGarantia}`);

module.exports = {
    calcularMaoDeObra,
    calcularTotal,
    verificarGarantia
};