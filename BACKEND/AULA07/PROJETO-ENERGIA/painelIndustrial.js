const entrada = require(`readline-sync`);

const projetoenergia = require(`./calculoEnergia`);

console.log("=== PAINEL DE CONRTOLE - ENERGIA ===");

const maquina = entrada.question("Insira o nome da maquina: ");
const potencia = entrada.questionInt("Insira a sua potencia: ");
const horas = entrada.questionInt("Quantidade de horas ao uso do mes: ");
const precoKwh = entrada.questionFloat("Insira o valor: ");

const totalConsumo = projetoenergia.calcularKwh
const totalCusto = projetoenergia.calcularCusto
const classificar = projetoenergia.classificarConsumo

console.log("--- RELATORIO DO PAINEL ---")
console.log(`Nome ${maquina.toUpperCase()}`);
console.log(`Consumo total: ${totalConsumo(potencia, horas)} kWh`)
console.log(`Custo total: R$ ${totalCusto(totalConsumo(potencia, horas), precoKwh).toFixed(2)}`)
console.log(`Classificacao do consumo: ${classificar(totalConsumo(potencia, horas))}`)