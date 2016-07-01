var express = require("express")

express()
  .get("*", (req, res, next) => {
    res.send("Test!");
  })
  .listen("3000")
