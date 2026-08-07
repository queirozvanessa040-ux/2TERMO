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