## Source Structure ##

DWScript supports two source structure styles: Script/Consolidated-Mode and Classic Unit/Program.

### Script / Consolidated Mode ###

Code structure is essentially standard Pascal with the following changes:
  * variables, constants, types and procedures can be declared inline.
  * **begin**/**end** is optional for main program code.
  * **var**, **const** and **type** keywords have to be explicit before any var or type declaration in the main program (var/const blocks are allowed in procedure, before the first begin).
  * methods can be implemented inline (in the class declaration).

### Unit / Program ###

If the source is a unit, ie. if it begins with **unit** clause, and has an **interface** section, then an **implementation** section will be required, and it will follow classic structure:

  * you can have variable, constant and type blocks
  * code cannot be inline and has to be in procedures
  * implementation are only accepted in the implementation section

Similarly a main program, ie. if source begins with a **program** clause, it will follow classic structure.

### Variables ###

Variables are guaranteed to always be initialized.

Variable declaration can feature an assignment, variable type can be inferred, for instance
```
var i := 20;
```
is equivalent to
```
var i : Integer;
i:=20;
```
as well as
```
var i : Integer := 20;
```