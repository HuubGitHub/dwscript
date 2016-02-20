## String ##

Mutable, copy-on-write, 1-based, UTF-16 string type.

### Description ###

Strings can be delimited by a single **'** or a double-quote **"**.

In a single-quoted string, a single quote can be expressed by doubling it.<br>
In a double-quoted string, a double-quote can be expressed by doubling it. Double-quoted strings can span multiple lines.<br>
<br>
Explicit Unicode characters can be specified by using # followed by an integer codepoint (decimal or hexadecimal). Characters specified this way are always understood as Unicode codepoint.<br>
<br>
<pre><code>Print('Hello'#13#$0D'World');<br>
</code></pre>

Will print 'Hello' followed by CR+LF (ASCII code 13 and 10), followed by 'World', it can also be defined with<br>
<br>
<pre><code>Print("Hello<br>
World");<br>
</code></pre>

Finally indented strings can also be defined with #" or #', the compiler will then ignore common indentation, and will additionally ignore an empty first line, so you can also write<br>
<br>
<pre><code>Print(#"<br>
   Hello<br>
   World");<br>
</code></pre>

<h3>Methods</h3>

<b>Informations</b>

<ul><li>High<br>
</li><li>Low<br>
</li><li>Length</li></ul>

<b>Testing</b>

<ul><li>Contains<br>
</li><li>StartsWith<br>
</li><li>EndsWith</li></ul>

<b>Case conversions</b>

<ul><li>LowerCase: ASCII lower case<br>
</li><li>UpperCase: ASCII upper case<br>
</li><li>ToLower: locale lower case<br>
</li><li>ToUpper: locale upper case</li></ul>

<b>Conversions</b>

<ul><li>ToBoolean<br>
</li><li>ToInteger, ToIntegerDef<br>
</li><li>ToFloat, ToFloatDef</li></ul>

<b>Manipulations</b>

<ul><li>After: returns characters after a delimiter<br>
</li><li>Before: returns characters before a delimiter<br>
</li><li>DeleteLeft: delete N characters to the left<br>
</li><li>DeleteRight: delete N characters to the right<br>
</li><li>Dupe: duplicate the string N times<br>
</li><li>Left: return N characters to the left<br>
</li><li>Reverse: returns a version of the string with the character reversed<br>
</li><li>Right: return N characters to the right<br>
</li><li>Split: split a string on a separator and returns an array of strings<br>
</li><li>Trim: trim control characters left & right<br>
</li><li>TrimLeft: trim left control characters<br>
</li><li>TrimRight: trim right control characters