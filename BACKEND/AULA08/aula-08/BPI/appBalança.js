const entrada = require(`readline-sync`);
const bpi = require(`./funcoesBalança.js`);

let sistemaAtivo = true;

while (sistemaAtivo) {
    try {
        const peso = entrada.question(`Digite o peso da peca em gramas (ou "sair" para encerrar): `);

        if (peso === `sair`) {
            console.log(`Encerrando o sistema da balanca...`);
            sistemaAtivo = false;
        } else {
            const resultado = bpi.verificarPeso(peso);
            console.log(resultado);
        }

    } catch (erro) {
        console.log(`ALERTA: ${erro}`);
    }
}