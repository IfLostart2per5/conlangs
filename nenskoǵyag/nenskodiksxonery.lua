
local __core__ = require("core")  
local signal = __core__.signal  
local verb = __core__.verb  
local word = __core__.word  
local adjective = __core__.adjective  
local connective = __core__.connective  
--nout: yeekɛ θwipkaajjumz-ha kinjɛ θ-ha, ɛ-ha we c-ha, [∫]-de, [ɐ/ə]-de we [ç]-de jinjum-ho lee-vil  
--note: some characters like θ, ε and c, have [sounds of] [∫], [ə/ɐ] and [ç]  
--NESNKOǴYAG-de ǵyag-he  
--NENSKOǴYAG'S LANGUAGE  
--puff-o consoantθy-ha "´"-km kinjε "ṕ"-ha, "ǵ"-ha, "ḱ"-ha weugn. kihuly-de frikaty-o fleeda-ha psee-do  
--plosive consonants with "´" like "ṕ", "ǵ", "ḱ" etc. are their fricative versions
local mod = {}  
_G = _G or getfenv(1)  
setmetatable(_G, {  
        __newindex=function(t, k, v)  
                mod[k] = v  
        end,  
        __index=function(t, k)  
                return mod[k]  
        end  
})  
finale = signal.new(".")  
comma = signal.new(",")  
  
  
--yε ninkǵyagy (some suffixes)  
able = word.new("yok") --"yoho"-km tup-ta (derived from "yoho" (or literally, "made with 'yoho'"))  
superlative = adjective.new("b́ug") -- "wugrun"-km tup-ta.  
absolutive --[[ wo "absolute superlative" ]] = adjective.new("gst") --"wugrun"-km we "tstε"-km tup-ta.  
that_do = adjective.new("paḱ")  
ary = that_do --amerikaphapy-sor (to americans) (all anericans) - (to necessary (that "necessita", that needs), identitary (that identifies), partidary (that joins a "partido") etc.)  
nominalizer = word.new("da")  
--phapǵyag (pronouns)  
i = word.new("ekh")  
you = word.new("tzu")  
masc = word.new("ko")  
femi = word.new("ka")  
objct = word.new("ki")  
ref = word.new("hul")  
he = masc:compose(ref)  
she = femi:compose(ref)  
it = objct:compose(ref)  
some = word.new("yε")  
--sspɛǵyag (adjectives)
big = adjective.new("b́ub")  
small = adjective.new("hakk")  
beautiful = adjective.new("nensko")  
wish = word.new("yamε")  
local wish_adj = adjective.new("yami")  
s_hot --[[ "gon"-mε kaajda-km (in/with a "good" vision) ]] = wish_adj:compose(beautiful)  
good = adjective.new("gon")  
bad = adjective.new("nankio")  
every = adjective.new("sotε")  
floating = adjective.new("lumi")  
new = adjective.new("gaf")  
smooth = adjective.new("swif")  
spiritual = adjective.new("ricin")  
transcedent = spiritual  
whole = adjective.new("tin")  
retribute = adjective.new("ḱan")  
energic = adjective.new("sotin")  
strong = adjective.new("pent")  
resistant = strong  
more = adjective.new("umo")  
fast = adjective.new("fiif")  
beyond = adjective.new("wuṕṕ")  
strange = adjective.new("yank")  
explosive = adjective.new("puff")
un = adjective.new("fe")
--dakhǵyag (verbs)
desappear = verb.new("ṕu")
identify = verb.new("yagt")  
make = verb.new("tu")  
eat = verb.new("hem")  
drink = verb.new("gul")  
see = verb.new("kaaj")  
give = verb.new("hin")  
know = verb.new("hyoo")  
read = verb.new("θwip")  
kill = verb.new("cin")  
want = verb.new("laay")  
born = verb.new("yen")  
do_ = verb.new("dakh")  
hurt = verb.new("plokk")  
create = make:compose(born)  
die = verb.new("cinε")  
be = verb.new("psee")  
temp_be = verb.new("flee") --[[ "estar"-ha pohrtuges-km psee-do ]]  
float = verb.new("lum")  
wait = verb.new("wikh")  
have = verb.new("lee")  
throw = verb.new("pra")  
send = smooth:compose(throw)  
answer = retribute:compose(send)  
exist = verb.new("duum")  
mean = verb.new("tha")  
do_pain = verb.new("ḱya")  
bind = verb.new("ning")  
waste_time = verb.new("yakc")  
get_better = verb.new("zeinθa")
--engliθ-km, kihul-he "be better"-ha, "shape better"-ha, "forge better"-ha tha-do, kinjɛ tupyeinnphap-ha hul-ho fccaponk-km zeinθa-do  
--in english, it means "be better", "shape better", "forge better", like the artist forging himself with coal  
speak = verb.new("ǵyag")  
sorry = verb.new("nyaaguu")  
cry = verb.new("nyaag")  
share = verb.new("harenko")  
can = verb.new("yoo")  
need = verb.new("yanḱ")  
support --[[ wo "aguentar"-ho pohrtuges-km (or "aguentar" in portuguese) ]] = verb.new("hicto")  
hear = verb.new("jin")  
listen = hear  
shoot = verb.new("poṕ")  
lose = verb.new("kaǵ")  
forget = verb.new("ṕukɛnto")
walk = verb.new("taf") --we ekh-ha hul-ho ṕukɛnto-ta!!!! wub-mε pob́apa-km.  
--And I forgot this! for a while.  
move = walk
run = verb.new("tsof")
slash = verb.new("tsin")
cut = slash
set_little = word.new("hakuto")
wild_wish = word.new("θimɛ") --a intense and visceral wish to do something  
overwhelm = see:compose(do_pain)
like = word.new("kartai")
--jumǵyag (nouns)
below = word.new("wag")  
down = below  
above = word.new("fa")  
up = above  
word_ = word.new("ǵyag")  
language = word_  
person = word.new("phap")  
friend = person  
fear = word.new("klok")
someone = some:compose(person)  
man = masc:compose(person)  
woman = femi:compose(person)  
thing = word.new("jum")  
something = some:compose(thing)  
water = word.new("bloθ")  
liquid = word.new("fliθ")  
sky = word.new("woṕ")  
food = eat:compose(nominalizer)  
blade = word.new("zin")  
fish = water:compose(food)  
previous = word.new("laag")  
next = word.new("hume")  
kid = small:compose(person)  
boy = masc:compose(kid)  
girl = femi:compose(kid)  
death = word.new("cinɛda")  
day = word.new("fda")  
night = word.new("ṕa")  
dirt = word.new("ḱuru")  
sustain = verb.new("hic")  
yesterday = previous:compose(day)  
tomorrow = next:compose(day)  
tomorrow2 = new:compose(day)  
earth = floating:compose(dirt)  
truth = word.new("naf")  
lie = word.new("bulk")  
life = word.new("an")  
feet = word.new("mapo")  
leg = sustain  
arm = word.new("nyak")  
hand = word.new("tons")  
head = word.new("kuhaa")  
essence = word.new("tha")  
meaning = essence  
core = essence  
knowledge = know:compose(nominalizer)  
being = be:compose(nominalizer)  
state = temp_be:compose(nominalizer)  
place = word.new("θi")  
ball = word.new("wonb")  
pain = do_pain:compose(nominalizer)  
body = word.new("ḱθin")  
sun = word.new("ṕii")  
sensation = word.new("ṕui")  
mind = beyond:compose(body) --kihul-he ǵyag-do kinjɛ "wuṕḱθin"-ha  
--about it, it is spoken like "wuṕḱθin"  
number = word.new("ktε")  
one = i:compose(number)  
two = friend:compose(number)  
three = thing:compose(number)  
four = strong:compose(number)  
five = make:compose(number)  
six = essence:compose(number)  
seven = strange:compose(number)  
eight = spiritual:compose(number)  
nine = beyond:compose(number)  
ten = whole:compose(number)  
vision = see:compose(nominalizer)  
characteristic = word.new("sopɛ")  
name = word.new("yagt")  
stone = word.new("ponk")  
fire = word.new("fcca")  
coal = fire:compose(stone)  
chain = word.new("yin")  
river = word.new("luf")  
topic = river  
flow = river  
color = word.new("ga")  
blue = sky:compose(color)  
blood = life:compose(liquid)  
red = blood:compose(color)  
white = sun:compose(color)  
black = night:compose(color)  
cycle = word.new("pa")  
rhythm = cycle  
projectile = shoot:compose(nominalizer)  
esperance = word.new("hayaa")
oxided_esperance = word.new("nɛɛg")
--dakhjumǵyagz (verb-noun words)  
book = read:compose(thing)  
sword = kill:compose(blade)  
image = see:compose(thing)  
sound = hear:compose(thing)  
rule = need:compose(chain)  
time = projectile:compose(cycle) --kihul-ha guon-o psee-do yuhun ǵyag-de agaratha-ho hyoo-do, taθin, kihul-ha umo-odo wub-o psee-do! Kot ǵyag-ha wub-o psee-do! Ekh-ha yεǵyagz-ho hakkto-vil.  
--This is good to know the word's core, but, it is too big! This phrase is big! I'll reduce some words.  
time = word.new("pob́apa") -- kinjε kihul-ha.  
--ningǵyagz/hakkǵyagz (ekh-ha djerman-ho tullen-vil yunhu "we"-de we "wo"-de ningǵyagz-ho yagt-do, dahan kot ǵyagz-ha lua-km duum-do, engliθ-km)  
--connectives/particles (I'll use german to identify "we" and "wo" particles, because these already exists in lua, in english)  
und --[[ and ]] = connective.new("we")  
oder --[[ or ]] = connective.new("wo")  
that = connective.new("dee")  
so = word.new("yonu")  
althrough = word.new("toθin")  
but = word.new("taθin")  
well = word.new("mun")  
later = word.new("nink")  
_if = word.new("ḱuḱ")  
because = word.new("dahan")  
like = word.new("kinjɛ")  
to = word.new("yuhu")  
then_ = word.new("am")  
suffix = word.new("ninkǵyag")  
prefix = word.new("laagǵyag")  
etc = word.new("weugna")  
other = word.new("goko")  
setmetatable(_G, nil)  
return mod

