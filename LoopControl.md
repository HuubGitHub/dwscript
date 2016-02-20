## Loop Control ##

Four forms of loops are supported:

  * [for in do](ForInDo.md) : loop on elements in a sequence
  * [for to/downto do](ForToDo.md) : loop on an integer variable
  * [repeat until](RepeatUntil.md) : loop on a final condition
  * [while do](WhileDo.md) : loop on an initial condition

All these loops can also be controlled by the following statements:

  * **`break`** : exits the current loop
  * **`continue`** : jump to the next iteration of loop

Note that **`break`** and **`continue`** are statements and [reserved names](ReservedNames.md). They're not functions like in classic Delphi.
It means that they're always and _unambiguously_ loop control instructions, and can't be overloaded by user functions or variables.

The [exit](exit.md) statement will also exit a loop as well as the whole function.