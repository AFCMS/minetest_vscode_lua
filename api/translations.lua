---`minetest.get_translator(textdomain)` is a simple wrapper around `minetest.translate`.
---
---`minetest.get_translator(textdomain)(str, ...)` is equivalent to `minetest.translate(textdomain, str, ...)`.
---
---It is intended to be used in the following way, so that it avoids verbose repetitions of `minetest.translate`:
---
---local S = minetest.get_translator(textdomain)
---
---S(str, ...)
---@param textdomain string
---@return fun(str: string, ...: string): string
function minetest.get_translator(textdomain) end

---Translates the string `str` with the given `textdomain` for disambiguation.
---@param textdomain string
---@param str string
---@param ... string
function minetest.translate(textdomain, str, ...) end


---@alias lang_code
---| '"be"'   # ---#DESTAIL 'lang_code.be'
---| '"bg"'   # ---#DESTAIL 'lang_code.bg'
---| '"ca"'   # ---#DESTAIL 'lang_code.ca'
---| '"cs"'   # ---#DESTAIL 'lang_code.cs'
---| '"da"'   # ---#DESTAIL 'lang_code.da'
---| '"de"'   # ---#DESTAIL 'lang_code.de'
---| '"el"'   # ---#DESTAIL 'lang_code.el'
---| '"en"'   # ---#DESTAIL 'lang_code.en'
---| '"eo"'   # ---#DESTAIL 'lang_code.eo'
---| '"es"'   # ---#DESTAIL 'lang_code.es'
---| '"et"'   # ---#DESTAIL 'lang_code.et'
---| '"eu"'   # ---#DESTAIL 'lang_code.eu'
---| '"fi"'   # ---#DESTAIL 'lang_code.fi'
---| '"fr"'   # ---#DESTAIL 'lang_code.fr'
---| '"gd"'   # ---#DESTAIL 'lang_code.gd'
---| '"gl"'   # ---#DESTAIL 'lang_code.gl'
---| '"hu"'   # ---#DESTAIL 'lang_code.hu'
---| '"id"'   # ---#DESTAIL 'lang_code.id'
---| '"it"'   # ---#DESTAIL 'lang_code.it'
---| '"ja"'   # ---#DESTAIL 'lang_code.ja'
---| '"jbo"'   # ---#DESTAIL 'lang_code.jbo'
---| '"kk"'   # ---#DESTAIL 'lang_code.kk'
---| '"ko"'   # ---#DESTAIL 'lang_code.ko'
---| '"lt"'   # ---#DESTAIL 'lang_code.lt'
---| '"lv"'   # ---#DESTAIL 'lang_code.lv'
---| '"ms"'   # ---#DESTAIL 'lang_code.ms'
---| '"nb"'   # ---#DESTAIL 'lang_code.nb'
---| '"nl"'   # ---#DESTAIL 'lang_code.nl'
---| '"nn"'   # ---#DESTAIL 'lang_code.nn'
---| '"pl"'   # ---#DESTAIL 'lang_code.pl'
---| '"pt"'   # ---#DESTAIL 'lang_code.pt'
---| '"pt_BR"'   # ---#DESTAIL 'lang_code.pt_BR'
---| '"ro"'   # ---#DESTAIL 'lang_code.ro'
---| '"ru"'   # ---#DESTAIL 'lang_code.ru'
---| '"sk"'   # ---#DESTAIL 'lang_code.sk'
---| '"sl"'   # ---#DESTAIL 'lang_code.sl'
---| '"sr_Cyrl"'   # ---#DESTAIL 'lang_code.sr_Cyrl'
---| '"sr_Latn"'   # ---#DESTAIL 'lang_code.sr_Latn'
---| '"sv"'   # ---#DESTAIL 'lang_code.sv'
---| '"sw"'   # ---#DESTAIL 'lang_code.sw'
---| '"tr"'   # ---#DESTAIL 'lang_code.tr'
---| '"uk"'   # ---#DESTAIL 'lang_code.uk'
---| '"vi"'   # ---#DESTAIL 'lang_code.vi'
---| '"zh_CN"'   # ---#DESTAIL 'lang_code.zh_CN'
---| '"zh_TW"'   # ---#DESTAIL 'lang_code.zh_TW'


---Translates `string` using translations for `lang_code` language.
---
---It gives the same result as if the string was translated by the client.
---@param lang_code lang_code
---@param string string
---@return string
function minetest.get_translated_string(lang_code, string) end