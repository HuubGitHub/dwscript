# Introduction #

Hence the name, TdwsHtmlFilter does not filter HTML content, but instead processes script code tags inside a document. By default the document is assumed to be an HTML document, but in fact any text document can be used here.

# Details #

The TdwsHtmlFilter scans a given text for a certain pattern. Once this pattern is found the script contained in the pattern is compiled and evaluated. By default the pattern is set to
```
<?pas ... ?>
```
where '...' is a placeholder for the actual source code that is compiled and executed.

To further simplify working with the scripts an evaluation modifier can be used like this
```
<?pas= expression ?>
```
in which 'expression' ought to return any value. The value is then passed internally to the
```
Print()
```
function.

The pattern can be altered by changing the published properties:
  * PatternOpen
  * PatternClose
  * PatternEval

To process a document its text must be passed to the 'Process' function with the syntax:
```
function Process(const aText : UnicodeString; msgs: TdwsMessageList) : UnicodeString; override;
```

The return value of the function is the processed document text with now the evaluated script.