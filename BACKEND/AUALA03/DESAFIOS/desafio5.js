const entrada = require('readline-sync');

console.log("!!EMPRESTIMOS!!")

const rendam = entrada.questionFloat("Qual o valor de sua Renda Mensal? Insira aqui:")
const nome = entrada.keyInYNStrict("Seu nome esta limpo? ")

if (rendam >=2.000 && nome === true) {
    console.log("EMPRESTIMO NEGADO")
} else {
    console.log("EMPRESTIMO APROVADO!")
}