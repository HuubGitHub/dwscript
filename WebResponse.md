# Introduction #

WebResponse is a static class (not instantiated)

# Properties #

  * **`StatusCode`** use it to specify HTTP status code (200 by default)
  * **`ContentData`** use it to specify content data (will override and replace regular Print/PrintLn output)
  * **`ContentType`** use it to specify content MIME type ("text/html; charset=utf8" by default)
  * **`ContentText[textType : String]`** use it to specify content data and text mime type in one assignment (will override and replace regular Print/PrintLn output)
  * **`ContentEncoding`** use it to specify content encoding (empty by default)
  * **`Header[name : String]`** use it to specify any HTTP response header
  * **`Compression`** if set to false will disable HTTP compression

# Methods #

  * **`RequestAuthentication(method : WebAuthentication)`** can be used for the initial stage of WWW-Authenticate, it adjusts the header to the requested WebAuthentication and specifies an HTTP 403 status code