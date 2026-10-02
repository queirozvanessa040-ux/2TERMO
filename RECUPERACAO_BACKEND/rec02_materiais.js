const entrada = require(`readline-sync`);

console.log("=== SISTEMA Á COMPRAS DE MATERIAIS PARA MANUTENCAO ===");

const nome = entrada.question("Insira o nome da peca: ");
const qntd = entrada.questionInt("Insira a quantidade comprada: ");
const precoUnitario = entrada.questionFloat("Insira o preco unitario: ");

const totalCompra = precoUnitario * qntd;

console.log("--- RECIBO DA COMPRA ---");
console.log(`Peca: ${nome} (R$ ${precoUnitario.toFixed(2)})`);
console.log(`Quantidade desta mesma peca: ${qntd} ${nome}`);
console.log(`Total a pagar: R$ ${totalCompra.toFixed(2)}`);