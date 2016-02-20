## Message control ##

  * **`{$WARNINGS ON|OFF}`** : enable or disable compiler warnings.
  * **`{$HINTS ON|OFF|NORMAL|STRICT|PEDANTIC}`** : controls compiler hints.
    * **`ON`** : enables hints, at the level defined in the _`Config.HintsLevel`_
    * **`OFF`** : disables hints
    * **`NORMAL`** : enables hints at the normal level
    * **`STRICT`** : enables hints at the strict level
    * **`PEDANTIC`** : enables hints at the pedantic level

## Message command ##

  * **`{$HINT 'message'}`** : emits _message_ as a hint.
  * **`{$WARNING 'message'}`** : emits _message_ as a warning.
  * **`{$ERROR 'message'}`** : emits _message_ as an error (prevents execution).
  * **`{$FATAL 'message'}`** : emits _message_ as a fatal error (aborts compilation).