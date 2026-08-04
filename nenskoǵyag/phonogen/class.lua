local mod = {scope={}}
local function isinner(name)
  return name:sub(1, 2) == "__" and name:sub(#name - 1, #name) == "__"
end
local function innername(name)
  local isin = isinner(name)
  return isin, isin and name:sub(3, #name - 2) or nil
end

function mod.class(name, super)
  local class = setmetatable({name=name, super=super, attrs={}}, {
    __index=function(t, k)
      local i, n = innername(k)
      if i then
        return rawget(t, n)
      end
      return rawget(t, "attrs")[k] or super[k]
    end,
    __newindex=function(t, k, v)
      local i, n = innername(k)
      if i then
        rawset(t, n, v)
      else
        rawset(rawget(t, "attrs"), k, v)
      end
    end
  })
  local classmt = {__index=function(t, k)
    if k == "class" then
      return class
    else
      return class.__attrs__[k]
    end
  end,
    __tostring = function(t)
      if t.tostring then
        return t:tostring()
      end
      return "object()"
    end
  }
  class.init = function() end
  class.new = function(s, ...)
    local obj = setmetatable({}, classmt)
    class.init(obj, ...)
    return obj
  end
  mod.scope[name] = class
  return class
end

function mod.change_scope(sc)
  mod.scope = sc
end
setmetatable(mod, {
  __call=mod.class
})
return mod