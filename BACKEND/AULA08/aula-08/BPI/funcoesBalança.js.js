function verificarPeso(leitura) {
    const peso = Number(leitura);

    if (isNaN(peso)) {
        throw new Error(`Peso fora do padrão (100g - 500g)! Peca descartada.`);
    } else {
        return (`Peca aprovada com ${peso}g.`)
    }
}

module.exports = {
    verificarPeso
}