const entrada = require(`readline-sync`);

console.log("=== SISTEMA DE CLASSIFICACAO ===");

const nivelEquipamento = entrada.questionFloat("Insira o nivel de vibracao deste equipamento(mm/s): ");

console.log(`Nivel de vibracao informada: ${nivelEquipamento}mm/s`);

if (nivelEquipamento <= 3) {
    console.log("situacao ESTAVEL");
} else if (nivelEquipamento <= 6) {
    console.log("situacao ATENCAO");
} else {
    console.log("situacao CRÍTICA");
}