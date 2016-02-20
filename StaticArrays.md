# DWScript Static Arrays

## Static Arrays ##

See also [dynamic arrays](DynamicArrays.md).

Static arrays are supported as value types, they have a fixed size with user-specified bounds:

```
type TZeroToTen = array [0..10] of Integer;
type TTenToTwenty = array [10..20] of String;
```

Multi-dimensional arrays are supported, with two forms:

```
type TCompactForm = array [1..3, 1..5] of Float;
type TVerboseForm = array [1..3] of array [1..5] of Float;
```

They support the special functions/methods **Low**, **High**, **Length** and **Count**. You can use them as either functions (legacy) or methods _Low(array)_ and _array.Low_ are equivalent.

You can use the **in** and **not in** operators to test the presence of an element in a static array.

Constant static arrays can be defined using square brackets [ ]:

```
const a : array [0..2] of String = ['zero', 'one', 'two'];
```

and they can also be defined inline for assignments to static or dynamic arrays:

```
var staticArray : array [0..2] of String;
var dynamicArray : array of String;
...
staticArray := ['zero', 'one', 'two'];
dynamicArray := ['one', 'two'];
```