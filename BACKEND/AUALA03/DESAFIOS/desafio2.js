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