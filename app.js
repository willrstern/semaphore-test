var express = require("express")

express()
  .get("*", (req, res, next) => {
    res.send("Hello World");
  })
  .listen("3000")
