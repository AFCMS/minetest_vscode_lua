---@meta

---@class HTTPRequest
---The URL
---@field url string
---Timeout for request to be completed in seconds. Default depends on engine settings.
---@field timeout number
---The http method to use. Defaults to `"GET"`.
---@field method '"GET"'|'"POST"'|'"PUT"'|'"DELETE"'
---Data for the POST, PUT or DELETE request.
---
---Accepts both a string and a table. If a table is specified, encodes table as `x-www-form-urlencoded` key-value pairs.
---@field data string|table
---Optional, if specified replaces the default minetest user agent with given string.
---@field user_agent string
---Optional, if specified adds additional headers to the HTTP request.
---
---You must make sure that the header strings follow HTTP specification ("Key: Value").
---@field extra_headers string[]
---Optional, if true performs a multipart HTTP request.
---
---Default is false.
---
---POST only, data must be array.
---@field multipart boolean


---@class HTTPRequestResult
---If true, the request has finished (either succeeded, failed or timed out).
---@field completed boolean
---If true, the request was successful.
---@field succeeded boolean
---If true, the request timed out.
---@field timeout boolean
---HTTP status code
---@field code integer
---Responce data.
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
---@nodiscard
function httpapitable.fetch_async_get(handle) end

---Returns `HTTPApiTable` containing http functions if the calling mod has been granted access by being listed in the `secure.http_mods` or `secure.trusted_mods` setting, otherwise returns `nil`.
---
---Only works at init time and must be called from the mod's main scope (not from a function).
---
---Function only exists if minetest server was built with cURL support.
---
---**DO NOT ALLOW ANY OTHER MODS TO ACCESS THE RETURNED TABLE, STORE IT IN A LOCAL VARIABLE!**
---@return HTTPApiTable
---@nodiscard
function minetest.request_http_api() end
