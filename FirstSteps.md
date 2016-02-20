## First Steps with DelphiWebScript ##

If DelphiWebScript is installed correctly, a new tab "dws" appears in your Delphi component palette.

1. Place a TDelphiWebScript component on your form.

2. Add the following code somewhere to your project:

```
uses
   dwsExprs, ...
var
   prog : IdwsProgram;
   exec : IdwsProgramExecution;
begin
   prog := DelphiWebScript1.Compile('PrintLn(''Hello World'');');

   exec := prog.Execute;

   ShowMessage(exec.Result.ToString);
end;
```

This is a very simple example. For more detailed information about using DelphiWebScript please have a look at the demo programs and the units tests. You can also check the snippets at [Rosetta Code](http://rosettacode.org/wiki/DWScript).

## Using TProgramInfo / IInfo ##

If you declare functions or methods in a TdwsUnit a TProgramInfo object is used to exchange data with the running script program. You can read and write parameteres, global variables and set the result value. But you can also call functions and create objects.

For the following explanations we assume that you have defined a function "Func" in a TdwsUnit. The following code could be part of the OnEval event handler:

```
procedure TForm1.dwsUnitFunctionsFuncEval(Info: TProgramInfo);
begin
   ...
end;
```

The following declaration are supposed to be made in a Tdws2Unit but are given in DWS syntax:

```
type TPoint = record x, y: Integer; end;
type TNames = array[1..10] of String;
var global: string;

function Func(i: Integer; point: TPoint; names: TNames): float;
begin
   // OnEval event handler
end;
```

## Parameters, Variables and Result ##

You can access the parameters and global variables by their name under the same rules as in a normal script function (e. g. you can't read local variables of other procedures).

Read the value of the parameter "i":
```
x := Info.Vars['i'].Value;
```
You can also use the default property of TProgramInfo to shortcut the expression above:
```
x := Info['i'];               
x := Info.ValueAsInteger['i'];   // strongly typed
```
Of course you can also assign a value to a local variable
```
Info['i'] := 12;
Info.ValueAsInteger['i'] := 12;  // strongly typed
```
Setting a result value for your function is very simple:
```
Info['Result'] := 3.141592;
```
... or safer and faster ...
```
Info.ResultAsFloat := 3.141592;
```
## Arrays and Records ##

If the parameter or the variable is of a complex type (array, record, class) you can read an write values like this:
```
x := Info.Vars['point'].Member['x'].Value;
Info.Vars['point'].Member['y'].Value := 3;

x := Info.Vars['names'].Element([2]).Value;
Info.Vars['names'].Element([2]).Value := 'Hello World';
```
Of course it's also possible to cascade such expressions:
```
Info.Vars['xyz'].Element([2, 4, 5]).Member['aaa'].Element([1]).Value := 'Hello World';
```
## Functions ##

You can also call functions using the TProgramInfo object:
```
Info.Func['IntToStr'].Call([345]);
```
keep in mind you need to compile the program beforehand, invoke BeginProgram before making your calls, and EndProgram when you're done.

Another possibility to call a function is given below.
```
var
   inf : IInfo;
   res : Integer;
begin
   inf := Info.Func['StrToInt'];
   inf.Parameter['value'] := '123';
   res := inf.Call.Value;
```
Use this way if you have to call a function that uses var-parameters and you're interested in the output value. You can use the "Parameter" property after the function call to read the output-value of the var-parameter.
Objects, Fields and Methods

You can also create objects using TProgramInfo. It's also possible to read and write properties and fields and to call methods.
```
var
   inf : IInfo;
begin
   inf := Info.Vars['TObject'].Method['Create'].Call;
   inf.Member['field'].Value := 'Hello';
   inf.Method['Free'].Call;
```


## Debugger ##

If you want to debug a DWS script program you need a debugger component. A ready-to-use debugger component is part of the DWSscript package: TdwsDebugger. To enable the debugging mode you have to assign an object that implements the IDebugger interface to IdwsProgram.Debugger.

The Debugger can also be used to implement a profiler, a ready-to-use sampling profiler is provided.

## Filter ##

A filter is also a component and has to be a descendant of TdwsFilter. A filter is responsible for preprocessing the input:

The input of the DWS compiler is a script program. But if there is a filter the DWS compiler passes the input to the filter. The filter is responsible to transform the input - whatever it is (not necessary a script program) - into a valid script program. E. g. the input could be a HTML page containing script code embedded in HTML comment tags. The TdwsHtmlFilter transforms this HTML page into a script program (extracting the script code from the HTML tags).

## Connector ##

The "naked" DWS component can't talk to the outer world. You have to add functions to a TdwsUnit component or to assign libraries. But you may also want to use COM objects in your DWS scripts or to call functions of your Delphi program. To connect DWS to external technologies like COM or RMI the Connector concept was introduced.

A connector is a component that is assigned to the TDelphiWebScript component. If the compiler finds an element that belongs to a connector it asks the connector to handle it. The connector returns the "executable code" needed to use this element. The DWS compiler inserts that "executable code" into the already compiled code not knowing what it exactly does.

At runtime the DWS code is executed by DWS and the connector-parts are executed by the responsible connector.