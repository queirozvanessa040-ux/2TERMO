const entrada = require(`readline-sync`);

console.log("=== SISTEMA DE COMPRAS ===");

const nome = entrada.question("Insira o nome do seu produto: ");
const qntd = entrada.questionInt("Insira a quantidade deste produto comprado: ");
const precoUnitario = entrada.questionFloat("Insira o valor unitario: ");

const total = precoUnitario * qntd;

console.log("--- RECIBO DA COMPRA ---");
console.log(`Produto: ${nome} (R$ ${precoUnitario.toFixed(2)})`);
console.log(`Quantidade deste mesmo produto: ${qntd}`);
console.log(`Total a pagar: R$ ${total.toFixed(2)}`);