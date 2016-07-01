var express = require("express")

express()
  .get("*", (req, res, next) => {
    res.send("Success!");
  })
  .listen("3000")
