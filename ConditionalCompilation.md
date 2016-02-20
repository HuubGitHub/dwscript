## Conditional Defines ##

  * **`{$DEFINE NAME_TOKEN}`** : define _NAME\_TOKEN_ conditional
  * **`{$UNDEF NAME_TOKEN}`** : un-defines _NAME\_TOKEN_ conditional

## Conditional Compilation ##

  * **`{$IFDEF NAME_TOKEN}`**
  * **`{$IFNDEF NAME_TOKEN}`**
  * **`{$IF expression}`**
  * **`{$ELSE}`**
  * **`{$ENDIF}`**

## Conditional expressions ##

**`$IF`** allows to specify a [Boolean](BaseTypes#Boolean.md) expression to control conditional compilation, that expression can use any constant defined previously, as well as any stateless built-in function.

It can also invoke the following special functions:
  * **`Defined(nameToken : String)`** : returns true if the token is defined when the compilation reaches the expression.
  * **`Declared(symbolName : String)`** : returns true if there is a symbol name in scope when compilation reaches the expression.

Note that the above special functions can also be used in regular code, but then, they'll be evaluated at runtime, when compilation has been completed.

## Detecting DWSCRIPT and version ##

The **`DWSCRIPT`** conditional is set by default and can be used to help make code compile across different Pascal compiler.

The **`CompilerVersion`** constant is also defined, it's a numeric floating-point value, at the format YYYYMMDD.SUB, so compiler version 20130524.0 corresponds to the main version of 24 may 2013.