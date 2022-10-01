---@meta

---@class HTTPRequest
local http_request = {}

---@type string
http_request.url = nil

---Timeout for request to be completed in seconds. Default depends on engine settings.
---@type number
http_request.timeout = nil

---The http method to use. Defaults to `"GET"`.
---@type '"GET"'|'"POST"'|'"PUT"'|'"DELETE"'
http_request.method = nil

---Data for the POST, PUT or DELETE request.
---
---Accepts both a string and a table. If a table is specified, encodes table as `x-www-form-urlencoded` key-value pairs.
---@type string|table
http_request.data = nil

---Optional, if specified replaces the default minetest user agent with given string.
---@type string
http_request.user_agent = nil

---Optional, if specified adds additional headers to the HTTP request.
---
---You must make sure that the header strings follow HTTP specification ("Key: Value").
---@type string[]
http_request.extra_headers = nil

---Optional, if true performs a multipart HTTP request.
---
---Default is false.
---
---POST only, data must be array.
---@type boolean
http_request.multipart = nil


---@class HTTPRequestResult
local http_request_result = {}

---If true, the request has finished (either succeeded, failed or timed out).
---@type boolean
http_request_result.completed = nil

---If true, the request was successful.
---@type boolean
http_request_result.succeeded = nil

---If true, the request timed out.
---@type boolean
http_request_result.timeout = nil

---HTTP status code
---@type integer
http_request_result.code = nil

---Responce data.
---@type string
http_request_result.data = nil


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
