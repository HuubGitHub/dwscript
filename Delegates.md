## Delegates ##

Function pointers are unified, there is no distinction between standalone function and method pointers.

For instance the following code is valid:
```
type TMyFunction = function (i : Integer) : String;

var v : TMyFunction;

v := IntToStr;

v := someObject.SomeMethod;

v := somInterface.SomeMethod;
```
As long as the function or method prototype matches.

You can use the '@' operator to explicit a function reference to remove ambiguity.