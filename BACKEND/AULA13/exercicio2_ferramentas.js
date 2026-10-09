const fs = require(`fs`);
const entrada = require('readline.sync');

const ferramentas= [];

for (let i = 0; i < 4; i++) {
    console.log(`=== SISTEMA DE FERRAMENTARIA ===`)
    let nome = entrada.question("Insira o nome da ferramenta: ")
    let qntdInteiro = entrada.questionInt("Insira a quantidade desta ferramenta: ")
    let custoUnitario = entrada.questionFloat("Insira o custo unitario desta ferramenta:")
    ferramentas.push({
        nome: nome, 
        qntdInteiro: qntdInteiro, 
        custoUnitario: custoUnitario})
}

fs.writeFileSync('ferramentas', JSON.stringify(sensores, null, 2));

console.log("Relatorio 'ferramentas.json' gravado com sucesso. Verifique-o")

