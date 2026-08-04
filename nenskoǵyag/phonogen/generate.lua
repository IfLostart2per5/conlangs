local alphabet = require("alphabet")
local class = require("class")

local function si(str, idx)
  local start = utf8.offset(str, idx)
  if not start then return nil end
  local end_ = utf8.offset(str, idx + 1)
  return str:sub(start, (end_ or (#str + 1)) - 1)
end

local Generator = class "Generator"
function Generator:init(source)
  self.current = 1
  self.finalsound = "/"
  self.src = source
end

function Generator:gen()
  while not self:iseof() do
    self:scanword()
  end
  self.finalsound = self.finalsound .. "/"
  return self.finalsound
end

function Generator:iseof()
  return self.current > utf8.len(self.src)
end
function Generator:peek(til)
  til = til or 1
  if self:iseof() then return "\0" end
  return si(self.src, self.current + til - 1)
end

function Generator:eat()
  local c = self:peek()
  self.current = self.current + 1
  return c
end

local VOWEL, GLIDE, CONSONANT = 1, 2, 4
local function letter(grphm, filters)
  filters = filters or 0
  if filters & VOWEL == VOWEL
  and alphabet.vowels[grphm] then
    return alphabet.vowels[grphm]
  end
  if filters & GLIDE == GLIDE
  and alphabet.glides[grphm] then
    return alphabet.glides[grphm]
  end
  if filters & CONSONANT == CONSONANT
  and alphabet.consonants[grphm] then
    return alphabet.consonants[grphm]
  end
  if filters == 0 then
    return alphabet.vowels[grphm] or
           alphabet.glides[grphm] or
           alphabet.consonants[grphm]
  end
end
function Generator:scanword()
  local sign = {}
  local c = self:eat()
  print(sign, 0, c)
  if c == " " or c == "-" then
    
    self:eat()
  else
    local l = letter(c)
    if l and l:getGrapheme() == "h" and self:peek(2) == "r" then
      l = letter("hr")
    end
    if l then
      local len = utf8.len(l:getGrapheme())
      for i = 1, len - 1 do
        self:eat()
      end
      local s = l:getSound()
      
      local posbl_copy = self:peek() .. (len > 1 and self:peek(2) or "")
      print(sign, 2, posbl_copy)
      if posbl_copy == l:getGrapheme() then
        print(" ", 1)
        for i = 1, len do self:eat() end
        s = s .. "ː"
        self.finalsound = self.finalsound .. s
        return
      end
      if self:peek() == "h" and letter(l:getGrapheme(), CONSONANT) then
        self:eat()
        s = s .. "ʰ"
      end
      if self:peek() == "z" and l:getKind() == "u" then
        print(" ", 3)
        self:eat()
        s = s .. "s"
      end
      self.finalsound = self.finalsound .. s
    end
  end
end

return Generator