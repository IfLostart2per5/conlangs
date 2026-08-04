function molde(s)
		s = s:gsub("C", "%%s")
		return function(rt)
				return s:format(rt:sub(1,1), rt:sub(2,2))
		end
end
local Tempo = {
		PASSADO = "et",
		PRESENTE = "ut",
		FUTURO = "at"
}
local Aspecto = {
		INICIADO = "a",
		NAO_INICIADO = "i", --nao iniciado
		CONCLUIDO = "u"
}
local Volicao = {
		DESEJO = "m",
		ACIDENTE = "p",
		OBRIGADO = "g",
		NECESSIDADE = "x",
		OCULTA = "k"
}
function terminacao(t,a,v)
		return Tempo[t:upper()] .. Aspecto[a:upper()] .. Volicao[v:upper()]
end
local function conjugar(verbo, tempo, aspecto, volicao)
		return verbo .. terminacao(tempo, aspecto, volicao)
end
local verbo = molde("CeC")
local visao = "tn"
local ver = verbo(visao)
print("comjugando o verbo "..ver)
local formas = {}
for k, _ in pairs(Tempo) do
  for k2, _ in pairs(Aspecto) do
  		for k3, _ in pairs(Volicao) do
  				formas[#formas + 1] = conjugar(ver, k, k2, k3)
  		end
  end
end
print(#formas)