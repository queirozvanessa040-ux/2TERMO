// Desafio 3: Calculadora de Área de Terrenos (Funções)
// Objetivo: Criar uma função que recebe parâmetros e
// retorna um valor.
// Enunciado: Crie uma função chamada calcularArea que
// receba a largura e o comprimento de um terreno e retorne
// a área total (largura * comprimento). No programa
// principal, peça os dados de 3 terrenos diferentes ao
// usuário, chame a função para cada um e mostre o
// resultado.

const entrada = require(`readline-sync`);

console.log("=== !!CALCULADORA TERRENA!! ===");

const largura = entrada.questionFloat(`Insira a largura: `)
const comprimento = entrada.questionFloat(`Insira o comprimento: `)
const calcularArea = (largura * comprimento)

const lar1 = entrada.questionFloat(`Insira a largura: `)
const com1 = entrada.questionFloat(`Insira o comprimento: `)
const calcularArea1 = (lar1 * com1)

const lar2 = entrada.questionFloat(`Insira a largura: `)
const com2 = entrada.questionFloat(`Insira o comprimento: `)
const calcularArea2 = (lar2 * com2)


const terrenos = ["Ter3", "Ter2", "Ter3"]

console.log(`Terreno[0] ${calcularArea}`)
console.log(`Terreno[1] ${calcularArea1}`)
console.log(`Terreno[2] ${calcularArea2}`)