## Enumerations ##

Enumerations are simple integer-based types, which may have explicit or automatically assigned values. Enumerations can be cast to and from Integer.

Explicitly scoped enumerations are supported using the _enum_ keyword:

```
type MyEnumeration = enum (First, Second, Third, Tenth = 10, Eleventh);
```

With this syntax, enumeration elements must be referred with the enumeration type as scope, as in _MyEnumeration.First_. If values aren't specified explicitly, they start from 0 and increase by 1 from the previous member.

Another variant of enumerations is when using the _flags_ keyword, in that case, values cannot be explicit, and they start from 1 and are multiplied by 2 from the previous member (1, 2, 4, 8 etc.)

```
type MyFlags = flags (Alpha, Beta, Gamma);
```

With the syntax too the elements can only be accessed through explicit scoping as in _MyFlags.Beta_.

Finally, the classic Object Pascal enumeration syntax is supported:

```
type TMyEnumeration = (firstEnum, secondEnum, thirdEnum);
type TMyExplicitEnum = (eeOne = 1, eeTwo = 3, eeFive = 5);
```

With this classic syntax, an enumeration element can be referred directly (_eeOne_) or prefixed with the enumeration type (_TMyExplicitEnum.eeOne_).