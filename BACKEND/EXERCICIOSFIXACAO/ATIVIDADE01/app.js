const entrada = require(`readline-sync`);
const cambio = require(`./conversor`);

console.log(`=== CASA DE CAMBIO ===`);
const dolar = entrada.questionFloat("Insira o valor exportado: ");
const real = cambio.calcularConvDol(dolar);

console.log(`--- EXPORTACAO CONCLUIDA ---`)
console.log(`O valor em dolar entregue foi: ${dolar.toFixed(2)}`);
console.log(`Sob a exportacao o valor em Reais retornara: ${real.toFixed(2)}`);