const controlador = require('./controlador');

// Teste 1: Tentando salvar sem nome
controlador.criarNovoUsuario(""); 
// Saída no terminal: Erro: digite um nome!

// Teste 2: Salvando com nome correto
controlador.criarNovoUsuario("Maria"); 
// Saída no terminal: Usuário Maria salvo com sucesso!