local g = require("grapheme")
local function associate(list)
  local newlist = {}
  for i, el in ipairs(list) do
    newlist[el:getGrapheme()] = el
  end
  return newlist
end

local vowels = {
  g:new("a", "a", "v"),
  g:new("e", "e", "v"),
  g:new("i", "i", "v"),
  g:new("o", "o", "v"),
  g:new("u", "u", "v"),
  g:new("ɛ", "ə", "v")
}
local glides = {
  g.new("w", "w", "v"),
  g.new("y", "j", "v")
}
local consonants = {
  g:new("b", "b", "v"),
  g:new("c", "ç", "u"),
  g:new("d", "d", "v"),
  g:new("f", "f", "u"),
  g:new("g", "g", "v"),
  g:new("h", "h", "u"),
  g:new("j", "ʒ", "v"),
  g:new("k", "k", "u"),
  g:new("l", "l", "v"),
  g:new("m", "m", "v"),
  g:new("p", "p", "u"),
  g:new("r", "ɾ", "v"),
  g:new("s", "s", "u"),
  g:new("t", "t", "u"),
  g:new("v", "v", "v"),
  g:new("θ", "ʃ", "u"),
  g:new("z", "z", "v"),
  g:new("ḱ", "x", "u"),
  g:new("ǵ", "ɣ", "v"),
  g:new("t́", "θ", "u"),
  g:new("d́", "ð", "v"),
  g:new("ṕ", "ɸ", "u"),
  g:new("b́", "β", "v"),
  g:new("hr", "ʁ", "u"),
}
local alphabet = {
  vowels=associate(vowels),
  glides=associate(glides),
  consonants=associate(consonants)
}
return alphabet