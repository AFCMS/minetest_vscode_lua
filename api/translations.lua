---@meta

---`minetest.get_translator(textdomain)` is a simple wrapper around `minetest.translate`.
---
---`minetest.get_translator(textdomain)(str, ...)` is equivalent to `minetest.translate(textdomain, str, ...)`.
---
---It is intended to be used in the following way, so that it avoids verbose repetitions of `minetest.translate`:
---
---```lua
---local S = minetest.get_translator(textdomain)
---S(str, ...)
---```
---@param textdomain string
---@return fun(str: string, ...: any): string
function minetest.get_translator(textdomain) end

---Translates the string `str` with the given `textdomain` for disambiguation.
---@param textdomain string
---@param str string
---@param ... string
function minetest.translate(textdomain, str, ...) end

---@alias lang_code
---| '"be"'
---| '"bg"'
---| '"ca"'
---| '"cs"'
---| '"da"'
---| '"de"'
---| '"el"'
---| '"en"'
---| '"eo"'
---| '"es"'
---| '"et"'
---| '"eu"'
---| '"fi"'
---| '"fr"'
---| '"gd"'
---| '"gl"'
---| '"hu"'
---| '"id"'
---| '"it"'
---| '"ja"'
---| '"jbo"'
---| '"kk"'
---| '"ko"'
---| '"lt"'
---| '"lv"'
---| '"ms"'
---| '"nb"'
---| '"nl"'
---| '"nn"'
---| '"pl"'
---| '"pt"'
---| '"pt_BR"'
---| '"ro"'
---| '"ru"'
---| '"sk"'
---| '"sl"'
---| '"sr_Cyrl"'
---| '"sr_Latn"'
---| '"sv"'
---| '"sw"'
---| '"tr"'
---| '"uk"'
---| '"vi"'
---| '"zh_CN"'
---| '"zh_TW"'


---Translates `string` using translations for `lang_code` language.
---
---It gives the same result as if the string was translated by the client.
---@param lang_code lang_code
---@param string string
---@return string
function minetest.get_translated_string(lang_code, string) end
