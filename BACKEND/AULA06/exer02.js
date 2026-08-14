const entrada = require(`readline-sync`)

const produto = {
    nome: "Teclado Mecânico",
    preco: 150.00,
    estoque: 25,
    emOferta: true
}

const emOferta = entrada.keyInYNStrict(`O produto está em oferta?: `)
const desconto = 10 / 100
const valorFinal = produto.preco - (produto.preco * desconto);

console.log(`Produto ${produto.nome}`);
console.log(`Preco: R$ ${produto.preco.toFixed(2)}`);
console.log(`Estoque: A quantidade de produtos em estoque e: ${produto.estoque}`);
console.log(`Ao inserir 10% de desconto no produto, o valor final sera: R$ ${valorFinal.toFixed(2)}`);

if (emOferta) {
    console.log(`O produto esta em oferta!!`)
} else {
    console.log(`O produto nao esta em oferta!!`)
}

// --------------------------------------------------

const entrada = require(`readline-sync`)

const produto = {
    nome: "Teclado Mecânico",
    preco: 150.00,
    estoque: 25,
    emOferta: true
}

console.log(`Produto ${produto.nome}`);
console.log(`Preco: R$ ${produto.preco.toFixed(2)}`);
console.log(`Produto: ${produto.nome} | ${produto.preco} | ${produto.estoque} | ${produto.emOferta}`)