var express = require("express");
var router = express.Router();

var discosController = require("../controllers/discosController");

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/cadastrar", function (req, res) {
    console.log('Na rota');
    discosController.cadastrar(req, res);
})

module.exports = router;