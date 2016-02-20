## Exit statement ##

The **`exit`** statement will immediately exit the function where the execution is. It can take an optional parameter or operand which can be used to specify the return value for the current function.

The three following lines are equivalent

```
exit(value);

exit value;

Result:=value; exit;
```

If **`exit`** is used from within a [try..finally](TryFinallyExcept.md) statement, the code in the finally block will be executed before leaving the function.

Note that **`exit`** is a statement, and not a function like in classic Delphi. It means that it's always and _unambiguously_ specifies an exit, and can't be overloaded by user functions or variables.