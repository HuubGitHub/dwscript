# Introduction #

DWScript language is an Object Pascal dialect, it borrows most elements from [Delphi](http://en.wikipedia.org/wiki/Delphi_(programming_language)), [FreePascal](http://en.wikipedia.org/wiki/Free_Pascal) and [Prism/Oxygene](http://en.wikipedia.org/wiki/Oxygene_(programming_language)), though with specificities of its own.

For Pascal users, you'll find below a summary of difference so you can get started right way.

# Dialect Specificities #

## Memory Model ##

A **garbage collector** ensures that no script-objects or structures are leaked, however, you can invoke destructors explicitly. Attempts to access a destroyed object will fail with an exception and is "safe".

## Data Types ##

See LanguageTypes for more details.

DWScript base types are **Integer**, **Float**, **Boolean** and **String**.<br>
Optional base types are Variant, TComplex, TVector and TMatrix.<br>
<br>
Classes, arrays (fixed-size and dynamic), records (with methods), enumerations, sets, meta-classes, interfaces and delegates are supported too.<br>
<br>
Dynamic arrays support a set of pseudo-methods and operators (Add, Delete, IndexOf, Length, SetLength in...), and are true reference types.<br>
<br>
As of v2.3, generics and closures are not yet supported.<br>
<br>
<h2>Statements</h2>

See LanguageStatements for more details.<br>
<br>
<ul><li>All standard structured Pascal statements (if, while, for, repeat...) are supported with the exception of with, goto and label.<br>
</li><li>"Case of" statement support is generalized: it can operate on any data type.<br>
</li><li>"For...in" support as of v2.2 is limited to enumerations and arrays.</li></ul>

<h2>Operators</h2>

See LanguageOperators for more details.<br>
<br>
<ul><li>All standard Pascal operators are supported (+, <code>*</code>, <, mod, shl, etc.).<br>
</li><li>Compound assignment operators are supported too: +=, -=, etc.<br>
</li><li>The <b>implies</b> operator is supported.<br>
</li><li>Operators can be overloaded.</li></ul>

Since pointers don't exist in the language, the <code>^</code> and <code>^</code>= operators are available for overloading.<br>
Note that compound operators are currently not allowed on properties, due to ambiguity (should "obj.Prop += val" mean "obj.Prop := Add(obj.Prop, val)" or "obj.Prop.Add(val)" ?).<br>
<br>
<h2>Code Structure</h2>

<a href='SourceStructure.md'>Source code structure</a> is essentially standard Pascal with the following specificities:<br>
<ul><li>variables, constants and procedures can be declared inline.<br>
</li><li>begin/end is optional for main program code.<br>
</li><li>var, const and type keywords have to be explicit before any var or type declaration in the main program (var/const blocks are allowed in procedure, before the first begin).<br>
</li><li>methods can be implemented inline (in the class declaration).</li></ul>

Variables are guaranteed to always be initialized.<br>
<br>
Variable declaration can feature an assignment, variable type can be inferred, for instance<br>
<pre><code>var i := 20;<br>
</code></pre>
is equivalent to<br>
<pre><code>var i : Integer;<br>
i:=20;<br>
</code></pre>
as well as<br>
<pre><code>var i : Integer := 20;<br>
</code></pre>

<h2>Array constants</h2>

Array constants are delimited with square brackets [ ] and not parenthesis ( ). The syntax change was necessary to allow supporting inline static arrays definition, and make provisions for operators operating on arrays and future array comprehension extensions.<br>
<br>
<pre><code>const a1 : array [0..2] of String = ['zero', 'one', 'two'];<br>
var a2 : array [0..2] of String;<br>
a2 := ['zero', 'one', 'two'];<br>
</code></pre>

<h2>Contracts Programming</h2>

Contracts programming is supported with a syntax similar to the Oxygene language, procedures can have "require" and "ensure" sections, the "ensure" sections also support the "old" keyword.<br>
<br>
<h2>Constructors</h2>

Classic constructor syntax is supported, but you can also specify a default constructor and use the "new" keyword to instantiate classes.<br>
<br>
Both lines of code below are equivalent:<br>
<pre><code>obj := TMyObject.Create(parameter);<br>
obj := new TMyObject(parameter);<br>
</code></pre>

<h2>Delegates</h2>

Function pointers are unified, there is no distinction between standalone function and method pointers.<br>
<br>
For instance the following code is valid:<br>
<pre><code>type TMyFunction = function (i : Integer) : String;<br>
<br>
var v : TMyFunction;<br>
<br>
v := IntToStr;<br>
<br>
v := someObject.SomeMethod;<br>
<br>
v := somInterface.SomeMethod;<br>
</code></pre>
As long as the function or method prototype matches.<br>
<br>
You can use the '@' operator to explicit a function reference to remove ambiguity.