## Defined() ##

This [special function](SpecialFunctions.md) has two forms.

### In regular source code ###

```
function Defined( any_expression ) : Boolean;
```
Indicates if the value of the expression is defined, depending on execution context it could mean "empty" or "undefined", if such a value exists and is distinct from nil/null.

### In a conditional directive expression ###

```
function Defined( string_value ) : Boolean;
```
Indicates if the conditional whose name is specified by the string is defined.

This function is also available in source code a [ConditionalDefined()](SpecialConditionalDefined.md).