local HelloWorld = {
  PRIORITY = 1000,
  VERSION = "1.0.0",
}

function HelloWorld:access(conf)
  return kong.response.exit(200, "Hello World\n", {
    ["Content-Type"] = "text/plain; charset=utf-8",
  })
end

return HelloWorld
