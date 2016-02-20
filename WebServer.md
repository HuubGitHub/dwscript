# Introduction #

DWScript WebServer is based on http.sys 2.0 and requires under Windows 2008, Vista or above.

It is intended as an application server starting point. For production use, you're encouraged to add your own TdwsUnit and modules in it, so you get more than baseline capability.

Being http.sys 2.0 based means it can cooperate with other http.sys servers, including IIS, other applications or different instances of itself (cf. service options below to run multiple instances as different servcies).

# Built-in features #

Serves a directory as www root, by default the www folder in the directory where the executable is configured, though that can be changed.

In that directory:
  * all files with the ".dws" extensions will be processed as scripts
  * all folders or file whose name starts with '.' are hidden and won't be served (if queried, the error will be 404)
  * other files that are present will be served "as they are"
  * when a directory is queried, server will serve index.dws, index.htm or index.html (first present, in that order)

Changes to the WWW folder are monitored by the server, and will be honored ASAP.

Deflate compression will be applied if the client browser accepts it for text files (mime types "text/`*`" and selected "application/`*`") larger than 1024 bytes.

Windows single-sign-on authentication can be enabled (Server/Authentication option).

# Options.json #

The options.json files contains the standard server options in [JSON](http://json.org) format. All options are optional and have default values.

```
{
   "Server": { server options },
   "Service": { service options },
   "CPU": { cpu options },
   "DWScript": { DWScript options }
}
```

For a list of all options, see the following pages:

  * [Server options](WSServerOptions.md)
  * [Service options](WSServiceOptions.md)
  * [CPU options](WSCPUOptions.md)
  * [DWScript options](WSDWScriptOptions.md)

# Limitations #

The following limitations may be resolved in future versions, you can also speed up the process by helping resolve/implement them:

  * Standard package system hasn't been implemented yet.
  * POST content data (f.i. application/x-www-form-urlencoded) isn't currently parsed, some self-standing, high performance parser is needed (preferably MPL 1.1 compatible), in your own project you can use existing parsers if you want, like Indy's
  * Logging options currently exposed are still minimal (THttpApi2Server exposes more, but you need to request them in Delphi code)
  * Remote debugging hasn't been exposed yet
  * Realms/IP banning haven't been implemented, if you need them, you currently have to handle them in your FireWall instead (which might be preferable anyway).
  * URL rewriting isn't standardized yet, currently you have to hardcode it in the Delphi source.
  * Static text files are currently not compressed.
  * The COM connector isn't bundled in the demo, but if you include it that'll get you ADO databases, WMI, etc. Be aware that it will break sandboxing, so only activate if you trust the scripts that are run on the server.