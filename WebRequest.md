# Introduction #

WebRequest is a static class (not instantiated)

# Properties #

  * **`Header[name : String]`** retrieves an HTTP header
  * **`Cookie[name  : String]`** retrieves an HTTP cookie
  * **`QueryField[name  : String]`** retrieves an HTTP query string field

# Methods #

  * **`URL`** returns the raw url
  * **`Method`** returns the HTTP method
  * **`PathInfo`** returns the normalized path portion of the url
  * **`QueryString`** returns the decoded query string portion of the url
  * **`RemoteIP`** returns the remote  client IPv4 or IPv6
  * **`Headers`** returns the raw CRLF separated list of all headers
  * **`Cookies`** returns the raw CRLF separated cookies information
  * **`QueryFields`** returns a CRLF separated list of all query string fields
  * **`ContentType`** returns the Content-Type of the request
  * **`ContentData`** returns the payload data of the request
  * **`ContentLength`** returns the length of payload data of the request
  * **`Security`** returns a string describing connection encryption and strength, empty string if request was unencrypted http
  * **`UserAgent`** returns the client user agent as reported through HTTP header fields
  * **`AuthenticatedUser`** returns the WWW-Authenticate user (Domain\Login), empty string if non-authenticated
  * **`Authentication`** returns a WebAuthentication that indicates if and hiw the WWW-Authenticate protocol was successful