local class = require("class")
local grapheme = class "grapheme"

function grapheme:init(grphm, sound, kind)
  self.grphm = grphm
  self.sound = sound
  self.kind = kind
end

function grapheme:tostring()
  return self:getGrapheme() .. " = /" .. self:getSound().."/"
end

function grapheme:getGrapheme()
  return self.grphm
end

function grapheme:getSound()
  return self.sound
end

function grapheme:getKind()
  return self.kind
end
return grapheme