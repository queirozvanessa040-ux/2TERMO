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