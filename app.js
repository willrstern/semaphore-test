var express = require("express")

express()
  .get("*", (req, res, next) => {
    res.send("hello world");
  })
  .listen("3000")
