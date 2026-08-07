// DESAFIO 01
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

// -----------------------------------------------------------------------

//DESAFIO 02
const entrada = require('readline-sync');

console.log("NOVIDADES ao RestauranteSmart!");
console.log("Apartir de contas a R$ 100 reais ou acima, será entregue 10% de desconto!")

const contacome = entrada.questionFloat("Qual o valor de sua conta:")
const descont = (contacome * 0.9)

if (contacome >=100) {
    console.log(`De acordo com nossos acordos aos descontos, sua conta passou de R$ 100! Receba o seu desconto de 10%, você pagara ${descont}`)
} else {
    console.log("Sua conta não passou do valor estabelicido, não haverá descontos. Como será sua forma de pagamento?")
}

// -----------------------------------------------------------------------

//DESAFIO 03
const entrada = require('readline-sync');

console.log("--- ALCOOL OU GASOLINA?! ---")
console.log("BEM-VINDO AO POSTOECONOMICO! AQUI OFERECEMOS O VALOR BENEfICO PARA O CLIENTE!!");

const alcool = entrada.questionFloat("Insira o valor do Alcool: ");
const gasolina = entrada.questionFloat("Insira o valor da Gasolina: ")
const valer = (alcool / gasolina)

if (valer >=0.7) {
    console.log(`O valor dado é ${valer}. Abasteca com ALCOOL...`)
} else {
    console.log(`O valor dado é ${valer}. Abasteca com GASOLINA...`)
}

//---------------------------------------------------------------------------

//DESAFIO04
const entrada = require('readline-sync');

console.log("!!BEM-VINDO A ESCOLA DE NATACAO!!");
console.log("Para isso devido aos nossos acordos de SEGURANÇA, devemos verificar as idades dos alunos!")

const alunos = entrada.questionInt("Insira a idade de seus alunos: ")

if (alunos <=5) {
    console.log("Infelizmente são muitos jovens para participar à Escola de Natacao! Volte quando atingirem idade o suficiente!")
} else if (alunos >= 5 && 10) {
    console.log("INFANTIL: Poderam participar! Venha se inscrever à Escola de Natacao!")
} else if (alunos >= 11 && 17) {
    console.log("JUVENIL: Poderam participar! Venha se inscrever à Escola de Natacao!")
} else if (alunos >= 18 && 60) {
    console.log("ADULTO: Poderam participar! Venha se inscrever à Escola de Natacao!")
} else if (alunos >= 60) {
    console.log("SENIOR: Poderam participar! Venha se inscrever à Escola de Natacao!")
} else {
    console.log("Pare de brincar com o sistema!!")
}

// --------------------------------------------------------------------

//DESAFIO 05
const entrada = require('readline-sync');

console.log("!!EMPRESTIMOS!!")

const rendam = entrada.questionFloat("Qual o valor de sua Renda Mensal? Insira aqui:")
const nome = entrada.keyInYNStrict("Seu nome esta limpo? ")

if (rendam >=2.000 && nome === true) {
    console.log("EMPRESTIMO NEGADO")
} else {
    console.log("EMPRESTIMO APROVADO!")
}