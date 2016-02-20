## Server options ##

  * ### Name ###

> Server Name to report in HTTP responses & logs. 'DWScript' by default.

  * ### Port ###

> HTTP server port, 888 by default.

> If zero, no http port is opened.

  * ### DomainName ###

> DomainName for the HTTP server port, localhost by default.

  * ### RelativeURI ###

> Relative URI for the HTTP server port, empty by default.

> This specifies the relative URI, or URI root for the HTTP port, this features allows multiple application servers to operate on the same port.

  * ### SSLPort ###

> HTTPS server port, 0 by default (not opened).

> You'll need to have a valid certificate registered or this will fail. See [Configure a Port with an SSL Certificate](http://msdn.microsoft.com/en-us/library/ms733791.aspx), or you can use a GUI like [HTTPSysManager](http://httpsysmanager.codeplex.com/). If you don't have a certificate, you can use a self-signed certificate (will result in browser warnings), buy one, or get a free one from [StartCom](https://www.startssl.com/).

  * ### SSLDomainName ###

> DomainName for the HTTPS server port, localhost by default.

  * ### SSLRelativeURI ###

> Relative URI for the HTTPS server port, empty by default.

> This specifies the relative URI, or URI root for the HTTPS port, this features allows multiple application servers to operate on the same port.

  * ### WWWPath ###

> Base path for served files.

> If not defined or empty, will serve a www subfolder of the folder where the executable is.

> This path can be referred to in the other paths options as "%www%".

  * ### Compression ###

> Indicates if HTTP compression is supported by the server, True is the default value. HTTP Compression will reduce bandwidth at the expense of server CPU usage.

  * ### Authentication ###

> Array of enabled authentication schemes, allowed values are "Basic", "Digest", "NTLM", "Negotiate" and "`*`" for all.

> When enabled, pages can check authentication through WebRequest.Authentication and AuthenticatedUser properties, and can request authentication with WebResponse.RequestAuthentication method.

  * ### WorkerThreads ###

> Number of worker threads to use, 16 by default.

> Note that this number is not the number of simultaneous connections, but the number of script threads that can run at the same time. Optimal values will depend on your workload. High values will not be effective unless you have a high CPU core count or your scripts are "spending" most of their time waiting for I/O.


  * ### LogDirectory ###

> Directory for log files ([Common log format](http://en.wikipedia.org/wiki/NCSA_log_formats)).

> If empty, logs are not active.

  * ### MaxConnections ###

> Maximum number of simultaneous connections, infinite by default.

> Zero is understood as infinite.

  * ### MaxBandwidth ###

> Maximum bandwidth in bytes per second, infinite by default.

> You can use this to limit the maximum outgoing bandwidth of your server.

> Zero is understood as infinite.

  * ### MaxInputLength ###

> Maximum input http request length in bytes, 10 megabytes by default.

> Requests that go over this limit will be canceled. You can use this to limit the incoming bandwidth of your server as well as minimize memory usage in case of malformed requests or very huge requests.

> Zero is understood as 10 MBytes.

  * ### AutoRedirectFolders ###

> If true (default value) folder requests that don't include the trailing path delimiter will automatically be redirected to the same URL with a trailing path delimiter via a 301 error.