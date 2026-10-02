const servico = require('./servico');

function criarNovoUsuario(nomeRecebido) {
  // Chama a função do serviço
  let resultado = servico.salvarUsuario(nomeRecebido);
  
  // Mostra a resposta no terminal
  console.log(resultado);
}

module.exports = { criarNovoUsuario };