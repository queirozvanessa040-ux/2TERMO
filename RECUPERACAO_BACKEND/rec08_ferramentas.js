const entrada = require(`readline-sync`)

console.log("=== SISTEMA DE FERRAMENTAS ===");

const controlFerram = [   ];

for (let i = 0; i < 4; i++) {
    const nome = entrada.question("Insira seu nome: ");
    const qntd = entrada.questionInt("Insira a quantidade: ");
    const estoqueMinimo = entrada.questionInt("Insira o estoque minimo: ");
        controlFerram.push({nome, qntd, estoqueMinimo});
}

for (let i = 0; i < controlFerram.length; i++) {
    if (controlFerram[i].qntd <= controlFerram[i].estoqueMinimo) {
        console.log(`Ferramenta: ${controlFerram[i].nome} - REPOR`);
    } else {
        console.log(`Ferramenta: ${controlFerram[i].nome} - ESTOQUE SUFICIENTE`);
    }
}

console.log("=== INFORMAÇÃO DA FERRAMENTA");
console.log(`Ferramenta: ${item.nome} | Qtd: ${item.qntd} | Mín: ${item.estoqueMinimo}`);