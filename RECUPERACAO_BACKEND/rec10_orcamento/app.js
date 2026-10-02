const entrada = require(`readline-sync`);

const { calcularMaoDeObra, calcularTotal, verificarGarantia } = require(`./funcoesOrcamento`);

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