const entrada = require(`readline-sync`);

console.log("=== CADASTRO DE OPERADORES ===");

const operadores = [];

for (let i = 0; i < 5; i++) {
    const nome = entrada.question(`Insira o nome do operador ${i + 1}: `);
    operadores.push(nome);
}

console.log("--- LISTA DE OPERADORES ---");

for (let i = 0; i < operadores.length; i++) {
    console.log(`${i + 1} - ${operadores[i]}`);
}
