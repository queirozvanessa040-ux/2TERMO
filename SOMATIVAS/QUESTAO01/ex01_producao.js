const entrada = require(`readline-sync`);


console.log(`=== SISTEMA DE PRODUCAO ===`);

const qntdpecas = 120;
const qntdturno = 8;
const total = qntdpecas * qntdturno;

console.log(`Quantidade de pecas produzidas por hora: ${qntdpecas}`);
console.log(`Quantidade de horas do turno: ${qntdturno}`);
console.log(`A producao total de pecas realizadas no turno foi: ${total} \n`);

console.log(`--- INFORMACAO ---`);
console.log(`A producao de pecas por hora foi ${qntdpecas}, com ${qntdturno} horas de turno e sendo seu total produzido ${total}`);