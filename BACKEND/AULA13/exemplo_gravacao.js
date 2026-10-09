const fs = require('fs');

console.log("===SISTEMA DE REGISTRO DE MÁQUINAS ===");

// Adicionado o 's' em maquinasIndustriais aqui embaixo:
const maquinasIndustriais = [
    {id: 101, nome: "Torno Mecanico Universal", setor: "Usinagem", operational: true},
    {id: 102, nome: "Fresadora Ferramentaria", setor: "Usinagem", operational: false}, // Dica extra: mudei os IDs para não ficarem repetidos
    {id: 103, nome: "Prensa Hidraulica", setor: "Estamparia", operational: true}
]
fs.writeFileSync('maquinas_industriais.json', JSON.stringify(maquinasIndustriais, null, 2));

console.log(`\nGravacao concluida com sucesso, verifique o arquivo gravado na pasta.`);
