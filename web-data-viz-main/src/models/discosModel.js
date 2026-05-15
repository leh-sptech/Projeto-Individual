var database = require("../database/config")

function cadastrar(idUsuario, disco, artista, ano, genero, condicao, disponivelTroca) {
    var instrucaoSql = `
        INSERT INTO colecao_usuario (usuario_id, titulo, artista, ano_lancamento, genero, condicao) VALUES ('${idUsuario}', '${disco}', '${artista}', ${ano}, '${genero}', '${condicao}');
    `;
    
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
} 

module.exports = {
    cadastrar
};

