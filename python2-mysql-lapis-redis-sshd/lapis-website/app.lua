local lapis = require("lapis")
local app = lapis.Application()

app:get("/", function()
  return "0000000dmp8 out helloworld " .. require("lapis.version")
end)

return app
