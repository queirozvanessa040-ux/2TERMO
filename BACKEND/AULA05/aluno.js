const entrada = require("readline-sync");

console.log("---- !! LABORATÓRIO ESCOLAR !! ----");
console.log(
    "Para ter acesso ao laboratório é preciso atender às regras:\n" +
    "1 - Idade mínima de 16 anos\n" +
    "2 - Possuir autorização\n" +
    "3 - Estar acompanhado por um professor"
);

const idade = entrada.questionInt("Qual e a sua idade: ");
const autorizacao = entrada.keyInYNStrict("Voce possui autorizacao? ");
const acprof = entrada.keyInYNStrict("Esta acompanhado por um professor? ");

if ((idade >= 16 && autorizacao === true) || acprof === true) {
    console.log("ACESSO LIBERADO");
} else {
    console.log("ACESSO NEGADO");
}