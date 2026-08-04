local class = require("class")
local Kar = class "Kar"
function Kar:init(yagtda, ga)
  self.yagtda = yagtda --name
  self.ga = ga --color
end
--x here modifies g sound. It's because originally ǵ was used to represent this
function Kar:gxyag()
  return "Kar-he "..self.yagtda.."-ha, gahe "..self.ga.."-ha"
end

function Kar:ningto()
  return "ningtovo... VRUMM, VRUMM"
end

function Kar:feningto()
  return "feningtovo... phim"
end
--gonyoodahe (in these version of language i've simplified guon -> gon (good))
local vkwg = Kar:new("Volkswagen Gol", "ṕiiga") --#FFFFFFga, or sun color
print(vkwg:gxyag())
print(vkwg:ningto())
print(vkwg:feningto())
--kunjɛ nafftota, hulhe guondakhdo! 1no (ekhtɛno) fdakm tuta! 'ooooh potencia!'
