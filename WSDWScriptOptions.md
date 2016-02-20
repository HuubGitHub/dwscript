# DWScript options #

  * ## TimeoutMSec ##

> Script timeout in milliseconds for pages, 3000 ms by default.

> Zero is understood as unlimited, this is not recommended as a script entering an infinite loop would then stay there forever.

  * ## WorkerTimeoutMSec ##

> Script timeout in milliseconds for workers, startup & shutdown, 30000 ms by default.

> Zero is understood as unlimited, this is not recommended as a script entering an infinite loop would then stay there forever.

  * ## StackChunkSize ##

> Size of stack growth chunks, 300 by default.

> Higher values will result in more memory being allocated at once, which will be beneficial for scripts that use a lot of memory.
> Lower values will result in less memory allocated at once, which will be beneficial for simple scripts and will also help keep server memory usage low.

  * ## StackMaxSize ##

> Maximum stack size per script, 10000 by default.

  * ## MaxRecursionDepth ##

> Maximum recursion depth per script, 512 by default.

  * ## LibraryPaths ##

> Library paths, an array of strings. None by default.

> Library paths can be outside of the www root.

  * ## PatternOpen, PatternEval, PatternClose ##

> Allows adjusting HTMLFilter patterns, by default these are "<?pas", "=" and "?>" respectively.

  * ## Startup, Shutdown ##

> Define the name of the startup script (executed at server startup before any other script) and shutdown (executed at server shutdown); But default those are "%www%\.startup.pas" and "%www%\.shutdown.pas" respectively.

  * ## JIT ##

> Boolean that specifies wether JIT compilation is active or not, false by default.