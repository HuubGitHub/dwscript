## If-then-else statement ##

In order to branch execution an if-then or if-then-else statement can be used. Its syntax is:
```
if expression then statement [else statement]
```
where the expression is typically a boolean expression. The else section is optional.

In case (and only in case) the expression is evaluated as true, the statement following the then is executed. If an else section is present, the statement following the else is executed in case the expression is false.

In addition to its use as a statement to branch execution, the if-then-else can also be used as an expression. In the example
```
a := if i > 0 then 42 else 7;
```
'a' will be set to 42 in case 'i' is greater than zero. Otherwise it is set to 7.