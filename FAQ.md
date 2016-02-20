  * **What Delphi versions are supported?**
> Delphi 2009 is the current minimum version. Development happens on Delphi XE however, so SVN version may temporarily become incompatible with previous versions.

> FreePascal is currently not directly supported, though as FreePascal introduces support for recent Delphi language syntax, support could become possible. Check the [FreePascal wiki](http://wiki.freepascal.org/DelphiWebScript) for more info on the state of FreePascal support.

  * **Is DWS compiled or interpreted?**
> The scripts are compiled into an expression tree, which is executed via virtual method calls. It behaves somewhere in between a pure compiler and a pure interpreter. Some sub-expressions may actually be fully compiled (f.i. with the asm extension).

> A JIT compiler is available for Win32 and will perform partial compilation, an LLVM based compiler is under development.

  * **What optimizations are performed?**
> As of 2.2, only local optimizations are performed:
    * Constant expressions are evaluated at compile-time, this includes expressions involving internal functions marked as "stateless" (maths functions, string conversions, etc.).
    * Some "a := a op b" forms are optimized to compound operator variants " a op= b".
    * "while" & "repeat" loops with constant conditions can be eliminated or have their condition eliminated.
    * "if then else" with constant conditions can have their condition and unreachable branch eliminated.