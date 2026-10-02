// Uma lista simples para guardar os nomes
let listaDeUsuarios = [];

function salvarUsuario(nome) {
  // Se não mandou nome, avisa que deu erro
  if (!nome) {
    return "Erro: digite um nome!";
  }

  // Guarda na lista
  listaDeUsuarios.push(nome);
  return "Usuário " + nome + " salvo com sucesso!";
}

// Exporta para usar em outro arquivo
module.exports = { salvarUsuario };