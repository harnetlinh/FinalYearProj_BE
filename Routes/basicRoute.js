const express = require("express");

let router = express.Router();

let initRoutes = (app) => {
    // simple route
    router.get("/", (req, res) => {
        res.json({ message: "Welcome to HNL application." });
      });
  return app.use("/", router);
};


module.exports = initRoutes;