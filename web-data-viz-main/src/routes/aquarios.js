var express = require("express");
var router = express.Router();

var aquarioController = require("../controllers/aquarioController");

router.get("/:discos", function (req, res) {
  aquarioController.buscarAquariosPorEmpresa(req, res);
});

module.exports = router;