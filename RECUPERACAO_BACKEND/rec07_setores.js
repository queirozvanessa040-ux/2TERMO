const entrada = require(`readline-sync`);

console.log("=== SETORES DE FABRICA ===");

const setoresFabric = [];

for (let i = 0; i < 6; i++) {
    const nome = entrada.question(`Insira o nome do setor ${i + 1}: `);
    setoresFabric.push(nome);
}

console.log("--- LISTA DE SETORES ---");

for (let i = 0; i < setoresFabric.length; i++) {
    console.log(`${i + 1} - ${setoresFabric[i]}`);
}
