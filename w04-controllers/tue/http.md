* The internet is athing. You've all used it.

* Servers get requests and send responses. Request -> Response.
* The requests are in a format called HTTP. (HyperText Transfer Protocol)

* The requests are being sent around how?
  * TCP/IP (at some level)
  * DOMAIN NAMES (ease the pain) because we don't remember IP addresses.
  * IP Addresses
    * IPv4 - four octets from 0-255 joined by periods (e.g. 74.207.227.162)
      * Can only differentiate 4.3 billion addresses.
      * We've got lots of computers and phones.
    * IPv6 - coming more into widespread use (e.g. 2001:0db8:85a3:0042:1000:8a2e:0370:7334)

* Requests and Responses have _headers_.
  * The headers have a bunch of fields but only some of them matter.


## Making an API request

* HTTParty in Ruby, OR curl on the command line
* `response = HTTParty.get('https://api.github.com/foo')`
* Responses have headers and a body. So we can: `response.body` or `response.headers`.
* To just get a hash of the response body:

```
require 'json'
result = JSON.parse(response.body)
```
