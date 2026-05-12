var database = require("../database/config")

function cadastrar(idUsuario, disco, artista, ano, genero, condicao, disponivelTroca) {
    var instrucaoSql = `
        INSERT INTO colecao_usuario (usuario_id, titulo, artista, ano_lancamento, genero, condicao, disponivel_troca) VALUES ('${idUsuario}', '${disco}', '${artista}', ${ano}, '${genero}', '${condicao}', 1);
    `;
    
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
} 

module.exports = {
    cadastrar
};

