const entrada = require('readline-sync');

console.log("---- !VERIFICACAO DE VOTACAO! ----");

const nome = entrada.question("Insira seu nome: ");
const anonasc = entrada.questionInt("Insira seu Ano de Nascimento: ");
const total = 2026 - anonasc;

if (total >=16) {
    console.log("Parabens! Você está APROVADO para participar de Eleicoes! VOTE CERTO!")
} else {
    console.log("Você não tem idade o suficiente para votar! Volte quando fizer idade minima!")
}