// Desafio 1: O Verificador de Aposentadoria (Lógica e Decisão)
// Objetivo: Praticar cálculos, if/else e operadores lógicos.
// Enunciado: Crie um programa que peça o nome, a idade e o
// tempo de contribuição de um trabalhador. A regra para se
// aposentar é:
// - Ter pelo menos 65 anos de idade.
// - OU ter pelo menos 30 anos de contribuição. Exiba uma
// mensagem dizendo se o trabalhador já pode se aposentar ou
// não.

const entrada = require(`readline-sync`);

console.log("=== !!BEM-VINDO A APOSENTADORIA!! ===");
const nome = entrada.question("Insira o seu nome: ");
const idade = entrada.questionInt("Insira a sua idade: ");
const tmpcontrib = entrada.question("Insira o seu tempo de contribuicao: ");

console.log("Este sistema foi feito para APOSENTADORIA. \n A seguinte regra é composta por uma das regras dependendo de sua situacao: \n 1 - Ter pelo menos 65 de idade \n 2 - Ter 30 anos de contribuicao")
if (idade >=65 || tmpcontrib >=30 ) {
    console.log("ACESSO LIBERADO PARA APOSENTADORIA")
} else {
    console.log(`ACESSO NEGADO PARA APOSENTADORIA`) }