---@class HTTPRequest
---@field url string
---@field timeout number
---@field method '"GET"'|'"POST"'|'"PUT"'|'"DELETE"'
---@field data string|table
---@field user_agent string
---@field extra_headers string[]
---@field multipart boolean


---@class HTTPRequestResult
---@field completed boolean
---@field succeeded boolean
---@field timeout boolean
---@field code integer
---@field data string


---@class HTTPApiTable
local httpapitable = {}

---Performs given request asynchronously and calls callback upon completion.
---
---Use this HTTP function if you are unsure, the others are for advanced use.
---@param req HTTPRequest
---@param callback fun(res: HTTPRequestResult)
function httpapitable.fetch(req, callback) end

---Performs given request asynchronously and returns handle for `HTTPApiTable.fetch_async_get`.
---@param req HTTPRequest
---@return any
function httpapitable.fetch_async(req) end

---Return response data for given asynchronous HTTP request.
---@param handle any
---@return HTTPRequestResult
function httpapitable.fetch_async_get(handle) end

---Returns `HTTPApiTable` containing http functions if the calling mod has been granted access by being listed in the `secure.http_mods` or `secure.trusted_mods` setting, otherwise returns `nil`.
---
---Only works at init time and must be called from the mod's main scope (not from a function).
---
---Function only exists if minetest server was built with cURL support.
---
---**DO NOT ALLOW ANY OTHER MODS TO ACCESS THE RETURNED TABLE, STORE IT IN A LOCAL VARIABLE!**
---@return HTTPApiTable
function minetest.request_http_api() end