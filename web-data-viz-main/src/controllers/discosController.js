var discosModel = require("../models/discosModel");

function cadastrar(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var idUsuario = req.params.usuarioId;
    var disco = req.body.discoServer;
    var artista = req.body.artistaServer;
    var ano = req.body.anoServer;
    var genero = req.body.generoServer;
    var condicao = req.body.condicaoServer;

    // Faça as validações dos valores
    if (idUsuario == undefined) {
        res.status(400).send("id do Usuario está undefined!");
    } else if (artista == undefined) {
        res.status(400).send("artista está undefined!");
    } else if (disco == undefined) {
        res.status(400).send("disco está undefined!");
    } else if (ano == undefined) {
        res.status(400).send("ano está undefinied!")
    } else if (genero == undefined) {
        res.status(400).send("genero está undefinied!")
    } else if (condicao == undefined) {
        res.status(400).send("condicao está undefined!");
    } 
    else {

        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        discosModel.cadastrar(idUsuario, disco, artista, ano, genero, condicao, disponivelTroca)
            .then(
                function (resultado) {

                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro do disco! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

module.exports = {
    cadastrar
};
