{**********************************************************************}
{                                                                      }
{    "The contents of this file are subject to the Mozilla Public      }
{    License Version 1.1 (the "License"); you may not use this         }
{    file except in compliance with the License. You may obtain        }
{    a copy of the License at http://www.mozilla.org/MPL/              }
{                                                                      }
{    Software distributed under the License is distributed on an       }
{    "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express       }
{    or implied. See the License for the specific language             }
{    governing rights and limitations under the License.               }
{                                                                      }
{    Eric Grange                                                       }
{                                                                      }
{**********************************************************************}
unit dwsJSCodeGen;

interface

uses Classes, SysUtils, dwsUtils, dwsSymbols, dwsCodeGen, dwsCoreExprs,
   dwsExprs, dwsRelExprs, dwsJSON, dwsMagicExprs;

type

   TdwsJSCodeGen = class (TdwsCodeGen)
      private

      protected

      public
         constructor Create; override;

         procedure CompileEnumerationSymbol(enum : TEnumerationSymbol); override;
         procedure CompileFuncSymbol(func : TSourceFuncSymbol); override;
         procedure CompileProgram(const prog : IdwsProgram); override;

         procedure CompileDependencies(destStream : TWriteOnlyBlockStream); override;
   end;

   TJSBlockInitExpr = class (TdwsExprCodeGen)
      procedure CodeGen(codeGen : TdwsCodeGen; expr : TExprBase); override;
   end;
   TJSBlockExprNoTable = class (TdwsExprCodeGen)
      procedure CodeGen(codeGen : TdwsCodeGen; expr : TExprBase); override;
   end;
   TJSExitExpr = class (TdwsExprCodeGen)
      procedure CodeGen(codeGen : TdwsCodeGen; expr : TExprBase); override;
   end;

   TJSAssignExpr = class (TdwsExprCodeGen)
      procedure CodeGen(codeGen : TdwsCodeGen; expr : TExprBase); override;
   end;

   TJSAssignConstToIntegerVarExpr = class (TdwsExprCodeGen)
      procedure CodeGen(codeGen : TdwsCodeGen; expr : TExprBase); override;
   end;
   TJSAssignConstToStringVarExpr = class (TdwsExprCodeGen)
      procedure CodeGen(codeGen : TdwsCodeGen; expr : TExprBase); override;
   end;
   TJSAssignConstToFloatVarExpr = class (TdwsExprCodeGen)
      procedure CodeGen(codeGen : TdwsCodeGen; expr : TExprBase); override;
   end;

   TJSAppendConstStringVarExpr = class (TdwsExprCodeGen)
      procedure CodeGen(codeGen : TdwsCodeGen; expr : TExprBase); override;
   end;

   TJSConstIntExpr = class (TdwsExprCodeGen)
      procedure CodeGen(codeGen : TdwsCodeGen; expr : TExprBase); override;
   end;
   TJSConstStringExpr = class (TdwsExprCodeGen)
      procedure CodeGen(codeGen : TdwsCodeGen; expr : TExprBase); override;
   end;
   TJSConstFloatExpr = class (TdwsExprCodeGen)
      procedure CodeGen(codeGen : TdwsCodeGen; expr : TExprBase); override;
   end;
   TJSConstBooleanExpr = class (TdwsExprCodeGen)
      procedure CodeGen(codeGen : TdwsCodeGen; expr : TExprBase); override;
   end;

   TJSVarExpr = class (TdwsExprCodeGen)
      procedure CodeGen(codeGen : TdwsCodeGen; expr : TExprBase); override;
   end;
   TJSVarParamExpr = class (TdwsExprCodeGen)
      procedure CodeGen(codeGen : TdwsCodeGen; expr : TExprBase); override;
   end;

   TJSCaseExpr = class (TdwsExprCodeGen)
      procedure CodeGen(codeGen : TdwsCodeGen; expr : TExprBase); override;
   end;

   TJSFuncBaseExpr = class (TdwsExprCodeGen)
      procedure CodeGen(codeGen : TdwsCodeGen; expr : TExprBase); override;
   end;

   TJSMagicFuncExpr = class (TJSFuncBaseExpr)
      procedure CodeGen(codeGen : TdwsCodeGen; expr : TExprBase); override;
   end;

// ------------------------------------------------------------------
// ------------------------------------------------------------------
// ------------------------------------------------------------------
implementation
// ------------------------------------------------------------------
// ------------------------------------------------------------------
// ------------------------------------------------------------------

const
   cBoolToJSBool : array [False..True] of String = ('false', 'true');

type
   TJSRTLDependency = record
      Name, Code : String;
   end;
const
   cJSRTLDependencies : array [0..1] of TJSRTLDependency = (
      (Name : 'IntToStr';
       Code : 'function IntToStr(i) { return i.toString() };'),
      (Name : 'Round';
       Code : 'function Round(v) { return Math.round(v) };')
   );

// ------------------
// ------------------ TdwsJSCodeGen ------------------
// ------------------

// Create
//
constructor TdwsJSCodeGen.Create;
begin
   inherited;

   RegisterCodeGen(TBlockInitExpr, TJSBlockInitExpr.Create);

   RegisterCodeGen(TBlockExprNoTable,     TJSBlockExprNoTable.Create);
   RegisterCodeGen(TBlockExprNoTable2,    TJSBlockExprNoTable.Create);
   RegisterCodeGen(TBlockExprNoTable3,    TJSBlockExprNoTable.Create);
   RegisterCodeGen(TBlockExprNoTable4,    TJSBlockExprNoTable.Create);

   RegisterCodeGen(TNullExpr,             TdwsExprGenericCodeGen.Create([]));
   RegisterCodeGen(TNoResultWrapperExpr,  TdwsExprGenericCodeGen.Create([0, ';']));

   RegisterCodeGen(TConstIntExpr,         TJSConstIntExpr.Create);
   RegisterCodeGen(TConstStringExpr,      TJSConstStringExpr.Create);
   RegisterCodeGen(TConstFloatExpr,       TJSConstFloatExpr.Create);
   RegisterCodeGen(TConstBooleanExpr,     TJSConstBooleanExpr.Create);

   RegisterCodeGen(TAssignExpr,           TJSAssignExpr.Create);

   RegisterCodeGen(TAssignConstToIntegerVarExpr,   TJSAssignConstToIntegerVarExpr.Create);
   RegisterCodeGen(TAssignConstToStringVarExpr,    TJSAssignConstToStringVarExpr.Create);
   RegisterCodeGen(TAssignConstToFloatVarExpr,     TJSAssignConstToFloatVarExpr.Create);

   RegisterCodeGen(TVarExpr,              TJSVarExpr.Create);
   RegisterCodeGen(TIntVarExpr,           TJSVarExpr.Create);
   RegisterCodeGen(TFloatVarExpr,         TJSVarExpr.Create);
   RegisterCodeGen(TStrVarExpr,           TJSVarExpr.Create);
   RegisterCodeGen(TBoolVarExpr,          TJSVarExpr.Create);
   RegisterCodeGen(TObjectVarExpr,        TJSVarExpr.Create);
   RegisterCodeGen(TVarParamExpr,         TJSVarParamExpr.Create);

   RegisterCodeGen(TConvIntegerExpr,
      TdwsExprGenericCodeGen.Create([0]));
   RegisterCodeGen(TConvFloatExpr,
      TdwsExprGenericCodeGen.Create(['Math.round(', 0, ')']));

   RegisterCodeGen(TAddStrExpr,
      TdwsExprGenericCodeGen.Create(['((', 0, ')+(', 1, '))']));

   RegisterCodeGen(TAddIntExpr,
      TdwsExprGenericCodeGen.Create(['((', 0, ')+(', 1, '))']));
   RegisterCodeGen(TAddFloatExpr,
      TdwsExprGenericCodeGen.Create(['((', 0, ')+(', 1, '))']));
   RegisterCodeGen(TSubIntExpr,
      TdwsExprGenericCodeGen.Create(['((', 0, ')-(', 1, '))']));
   RegisterCodeGen(TSubFloatExpr,
      TdwsExprGenericCodeGen.Create(['((', 0, ')-(', 1, '))']));
   RegisterCodeGen(TMultIntExpr,
      TdwsExprGenericCodeGen.Create(['((', 0, ')*(', 1, '))']));
   RegisterCodeGen(TMultFloatExpr,
      TdwsExprGenericCodeGen.Create(['((', 0, ')*(', 1, '))']));
   RegisterCodeGen(TDivideExpr,
      TdwsExprGenericCodeGen.Create(['((', 0, ')/(', 1, '))']));
   RegisterCodeGen(TDivExpr,
      TdwsExprGenericCodeGen.Create(['Math.floor((', 0, ')/(', 1, '))']));
   RegisterCodeGen(TModExpr,
      TdwsExprGenericCodeGen.Create(['((', 0, ')%(', 1, '))']));
   RegisterCodeGen(TSqrFloatExpr,
      TdwsExprGenericCodeGen.Create(['Math.pow(', 0, ',2)']));
   RegisterCodeGen(TNegIntExpr,
      TdwsExprGenericCodeGen.Create(['-(', 0, ')']));
   RegisterCodeGen(TNegFloatExpr,
      TdwsExprGenericCodeGen.Create(['-(', 0, ')']));

   RegisterCodeGen(TAppendStringVarExpr,
      TdwsExprGenericCodeGen.Create([0, '+=', 1, ';']));
   RegisterCodeGen(TAppendConstStringVarExpr,      TJSAppendConstStringVarExpr.Create);

   RegisterCodeGen(TPlusAssignIntExpr,
      TdwsExprGenericCodeGen.Create([0, '+=', 1, ';']));
   RegisterCodeGen(TPlusAssignFloatExpr,
      TdwsExprGenericCodeGen.Create([0, '+=', 1, ';']));
   RegisterCodeGen(TMinusAssignIntExpr,
      TdwsExprGenericCodeGen.Create([0, '-=', 1, ';']));
   RegisterCodeGen(TMinusAssignFloatExpr,
      TdwsExprGenericCodeGen.Create([0, '-=', 1, ';']));
   RegisterCodeGen(TMultAssignIntExpr,
      TdwsExprGenericCodeGen.Create([0, '*=', 1, ';']));
   RegisterCodeGen(TMultAssignFloatExpr,
      TdwsExprGenericCodeGen.Create([0, '*=', 1, ';']));

   RegisterCodeGen(TIncIntVarExpr,
      TdwsExprGenericCodeGen.Create([0, '+=', 1, ';']));
   RegisterCodeGen(TDecIntVarExpr,
      TdwsExprGenericCodeGen.Create([0, '-=', 1, ';']));

   RegisterCodeGen(TShrExpr,
      TdwsExprGenericCodeGen.Create(['((', 0, ')>>(', 1, '))']));
   RegisterCodeGen(TShlExpr,
      TdwsExprGenericCodeGen.Create(['((', 0, ')<<(', 1, '))']));
   RegisterCodeGen(TIntAndExpr,
      TdwsExprGenericCodeGen.Create(['((', 0, ')&(', 1, '))']));
   RegisterCodeGen(TIntOrExpr,
      TdwsExprGenericCodeGen.Create(['((', 0, ')|(', 1, '))']));
   RegisterCodeGen(TIntXorExpr,
      TdwsExprGenericCodeGen.Create(['((', 0, ')^(', 1, '))']));
   RegisterCodeGen(TNotIntExpr,
      TdwsExprGenericCodeGen.Create(['~(', 0, ')']));

   RegisterCodeGen(TBoolAndExpr,
      TdwsExprGenericCodeGen.Create(['((', 0, ')&&(', 1, '))']));
   RegisterCodeGen(TBoolOrExpr,
      TdwsExprGenericCodeGen.Create(['((', 0, ')||(', 1, '))']));
   RegisterCodeGen(TBoolXorExpr,
      TdwsExprGenericCodeGen.Create(['(!(', 0, ')!=!(', 1, '))']));
   RegisterCodeGen(TNotBoolExpr,
      TdwsExprGenericCodeGen.Create(['!(', 0, ')']));

   RegisterCodeGen(TRelEqualBoolExpr,
      TdwsExprGenericCodeGen.Create(['((', 0, ')==(', 1, '))']));
   RegisterCodeGen(TRelNotEqualBoolExpr,
      TdwsExprGenericCodeGen.Create(['((', 0, ')!=(', 1, '))']));

   RegisterCodeGen(TRelEqualIntExpr,
      TdwsExprGenericCodeGen.Create(['((', 0, ')==(', 1, '))']));
   RegisterCodeGen(TRelNotEqualIntExpr,
      TdwsExprGenericCodeGen.Create(['((', 0, ')!=(', 1, '))']));
   RegisterCodeGen(TRelGreaterEqualIntExpr,
      TdwsExprGenericCodeGen.Create(['((', 0, ')>=(', 1, '))']));
   RegisterCodeGen(TRelLessEqualIntExpr,
      TdwsExprGenericCodeGen.Create(['((', 0, ')<=(', 1, '))']));
   RegisterCodeGen(TRelGreaterIntExpr,
      TdwsExprGenericCodeGen.Create(['((', 0, ')>(', 1, '))']));
   RegisterCodeGen(TRelLessIntExpr,
      TdwsExprGenericCodeGen.Create(['((', 0, ')<(', 1, '))']));

   RegisterCodeGen(TRelEqualStringExpr,
      TdwsExprGenericCodeGen.Create(['((', 0, ')==(', 1, '))']));
   RegisterCodeGen(TRelNotEqualStringExpr,
      TdwsExprGenericCodeGen.Create(['((', 0, ')!=(', 1, '))']));
   RegisterCodeGen(TRelGreaterEqualStringExpr,
      TdwsExprGenericCodeGen.Create(['((', 0, ')>=(', 1, '))']));
   RegisterCodeGen(TRelLessEqualStringExpr,
      TdwsExprGenericCodeGen.Create(['((', 0, ')<=(', 1, '))']));
   RegisterCodeGen(TRelGreaterStringExpr,
      TdwsExprGenericCodeGen.Create(['((', 0, ')>(', 1, '))']));
   RegisterCodeGen(TRelLessStringExpr,
      TdwsExprGenericCodeGen.Create(['((', 0, ')<(', 1, '))']));

   RegisterCodeGen(TRelEqualFloatExpr,
      TdwsExprGenericCodeGen.Create(['((', 0, ')==(', 1, '))']));
   RegisterCodeGen(TRelNotEqualFloatExpr,
      TdwsExprGenericCodeGen.Create(['((', 0, ')!=(', 1, '))']));
   RegisterCodeGen(TRelGreaterEqualFloatExpr,
      TdwsExprGenericCodeGen.Create(['((', 0, ')>=(', 1, '))']));
   RegisterCodeGen(TRelLessEqualFloatExpr,
      TdwsExprGenericCodeGen.Create(['((', 0, ')<=(', 1, '))']));
   RegisterCodeGen(TRelGreaterFloatExpr,
      TdwsExprGenericCodeGen.Create(['((', 0, ')>(', 1, '))']));
   RegisterCodeGen(TRelLessFloatExpr,
      TdwsExprGenericCodeGen.Create(['((', 0, ')<(', 1, '))']));

   RegisterCodeGen(TIfThenExpr,
      TdwsExprGenericCodeGen.Create(['if (', 0, ') {'#13#10, 1, #13#10'};'#13#10]));
   RegisterCodeGen(TIfThenElseExpr,
      TdwsExprGenericCodeGen.Create(['if (', 0, ') {'#13#10, 1, #13#10'} else {'#13#10, 2, #13#10'};'#13#10]));

   RegisterCodeGen(TCaseExpr,    TJSCaseExpr.Create);

   RegisterCodeGen(TForUpwardExpr,
      TdwsExprGenericCodeGen.Create(['for (', 0, '=', 1, ';', 0, '<=', 2, ';', 0, '++) {'#13#10, 3, #13#10'};'#13#10]));
   RegisterCodeGen(TForDownwardExpr,
      TdwsExprGenericCodeGen.Create(['for (', 0, '=', 1, ';', 0, '>=', 2, ';', 0, '--) {'#13#10, 3, #13#10'};'#13#10]));

   RegisterCodeGen(TWhileExpr,
      TdwsExprGenericCodeGen.Create(['while (', 0, ') {', 1,'};']));
   RegisterCodeGen(TRepeatExpr,
      TdwsExprGenericCodeGen.Create(['do {', 1, '} while (!(', 0, '));']));
   RegisterCodeGen(TLoopExpr,
      TdwsExprGenericCodeGen.Create(['while (true) {', 1, '};']));

   RegisterCodeGen(TContinueExpr,         TdwsExprGenericCodeGen.Create(['continue;']));
   RegisterCodeGen(TBreakExpr,            TdwsExprGenericCodeGen.Create(['break;']));
   RegisterCodeGen(TExitValueExpr,        TdwsExprGenericCodeGen.Create(['return ', 0, ';']));
   RegisterCodeGen(TExitExpr,             TJSExitExpr.Create);

   RegisterCodeGen(TFinallyExpr,
      TdwsExprGenericCodeGen.Create(['try {', 0, '} finally {', 1, '};']));

   RegisterCodeGen(TStaticArrayExpr,
      TdwsExprGenericCodeGen.Create(['(', 0, ')[', 1, ']']));
   RegisterCodeGen(TStringArrayOpExpr,
      TdwsExprGenericCodeGen.Create(['(', 0, ').charAt((', 1, ')-1)']));
   RegisterCodeGen(TStringLengthExpr,
      TdwsExprGenericCodeGen.Create(['(', 0, ').length']));
   RegisterCodeGen(TOpenArrayLengthExpr,
      TdwsExprGenericCodeGen.Create(['(', 0, ').length']));

   RegisterCodeGen(TFuncExpr,             TJSFuncBaseExpr.Create);
   RegisterCodeGen(TMagicIntFuncExpr,     TJSMagicFuncExpr.Create);
   RegisterCodeGen(TMagicStringFuncExpr,  TJSMagicFuncExpr.Create);
   RegisterCodeGen(TMagicFloatFuncExpr,   TJSMagicFuncExpr.Create);
   RegisterCodeGen(TMagicProcedureExpr,   TJSMagicFuncExpr.Create);
end;

// CompileEnumerationSymbol
//
procedure TdwsJSCodeGen.CompileEnumerationSymbol(enum : TEnumerationSymbol);
var
   i : Integer;
   elem : TElementSymbol;
begin
   Output.WriteString('/* ');
   Output.WriteString(enum.QualifiedName);
   Output.WriteString('*/'#13#10);
   for i:=0 to enum.Elements.Count-1 do begin
      elem:=enum.Elements[i] as TElementSymbol;
      Output.WriteString(elem.Name);
      Output.WriteString('=');
      Output.WriteString(IntToStr(elem.UserDefValue));
      Output.WriteString(';'#13#10);
   end;
end;

// CompileFuncSymbol
//
procedure TdwsJSCodeGen.CompileFuncSymbol(func : TSourceFuncSymbol);
var
   i : Integer;
   resultTyp : TTypeSymbol;
   proc : TdwsProcedure;
begin
   proc:=(func.Executable as TdwsProcedure);
   if proc=nil then Exit;

   Output.WriteString('function ');
   Output.WriteString(func.Name);
   Output.WriteString('(');
   for i:=0 to func.Params.Count-1 do begin
      if i>0 then
         Output.WriteString(', ');
      Output.WriteString(func.Params[i].Name);
   end;
   Output.WriteString(') {'#13#10);
   resultTyp:=func.Typ;
   if resultTyp<>nil then begin
      while resultTyp is TAliasSymbol do
         resultTyp:=resultTyp.BaseType;
      Output.WriteString('var Result=');
      if resultTyp is TBaseIntegerSymbol then
         Output.WriteString('0')
      else if resultTyp is TBaseFloatSymbol then
         Output.WriteString('0.0')
      else if resultTyp is TBaseStringSymbol then
         Output.WriteString('""')
      else if resultTyp is TBaseBooleanSymbol then
         Output.WriteString('false')
      else raise ECodeGenUnsupportedSymbol.CreateFmt('Result of type %s', [resultTyp]);
      Output.WriteString(';'#13#10);
   end;
   inherited;
   if not (proc.Expr is TBlockExprBase) then
      Output.WriteString(#13#10);
   if resultTyp<>nil then
      Output.WriteString('return Result;'#13#10);
   Output.WriteString('};'#13#10);
end;

// CompileProgram
//
procedure TdwsJSCodeGen.CompileProgram(const prog : IdwsProgram);
begin
   Output.WriteString('function $dws() {'#13#10);
   inherited;
   Output.WriteString('}; $dws();'#13#10);
end;

// CompileDependencies
//
procedure TdwsJSCodeGen.CompileDependencies(destStream : TWriteOnlyBlockStream);
var
   i, j : Integer;
begin
   for i:=0 to Dependencies.Count-1 do begin
      for j:=Low(cJSRTLDependencies) to High(cJSRTLDependencies) do begin
         if cJSRTLDependencies[j].Name=Dependencies[i] then begin
            destStream.WriteString(cJSRTLDependencies[j].Code);
            destStream.WriteString(#13#10);
         end;
      end;
   end;
end;

// ------------------
// ------------------ TJSBlockInitExpr ------------------
// ------------------

// CodeGen
//
procedure TJSBlockInitExpr.CodeGen(codeGen : TdwsCodeGen; expr : TExprBase);
var
   i : Integer;
   blockInit : TBlockInitExpr;
begin
   blockInit:=TBlockInitExpr(expr);
   for i:=0 to blockInit.SubExprCount-1 do begin
      codeGen.Output.WriteString('var ');
      codeGen.Compile(blockInit.SubExpr[i]);
      codeGen.Output.WriteString(#13#10);
   end;
end;

// ------------------
// ------------------ TJSBlockExprNoTable ------------------
// ------------------

// CodeGen
//
procedure TJSBlockExprNoTable.CodeGen(codeGen : TdwsCodeGen; expr : TExprBase);
var
   i : Integer;
   blockInit : TBlockInitExpr;
begin
   blockInit:=TBlockInitExpr(expr);
   for i:=0 to blockInit.SubExprCount-1 do begin
      codeGen.Compile(blockInit.SubExpr[i]);
      codeGen.Output.WriteString(#13#10);
   end;
end;

// ------------------
// ------------------ TJSVarExpr ------------------
// ------------------

// CodeGen
//
procedure TJSVarExpr.CodeGen(codeGen : TdwsCodeGen; expr : TExprBase);
var
   varExpr : TVarExpr;
   sym : TDataSymbol;
begin
   varExpr:=TVarExpr(expr);
   sym:=codeGen.FindSymbolAtStackAddr(varExpr.StackAddr);
   if sym=nil then
      raise ECodeGenUnsupportedSymbol.Create(IntToStr(varExpr.StackAddr));
   codeGen.Output.WriteString(sym.Name);
end;

// ------------------
// ------------------ TJSVarParamExpr ------------------
// ------------------

// CodeGen
//
procedure TJSVarParamExpr.CodeGen(codeGen : TdwsCodeGen; expr : TExprBase);
begin
   inherited;
   codeGen.Output.WriteString('.value');
end;

// ------------------
// ------------------ TJSAssignConstToIntegerVarExpr ------------------
// ------------------

// CodeGen
//
procedure TJSAssignConstToIntegerVarExpr.CodeGen(codeGen : TdwsCodeGen; expr : TExprBase);
var
   e : TAssignConstToIntegerVarExpr;
begin
   e:=TAssignConstToIntegerVarExpr(expr);
   codeGen.Compile(e.Left);
   codeGen.Output.WriteString('=');
   codeGen.Output.WriteString(IntToStr(e.Right));
   codeGen.Output.WriteString(';');
end;

// ------------------
// ------------------ TJSAssignConstToStringVarExpr ------------------
// ------------------

// CodeGen
//
procedure TJSAssignConstToStringVarExpr.CodeGen(codeGen : TdwsCodeGen; expr : TExprBase);
var
   e : TAssignConstToStringVarExpr;
begin
   e:=TAssignConstToStringVarExpr(expr);
   codeGen.Compile(e.Left);
   codeGen.Output.WriteString('=');
   WriteJavaScriptString(codeGen.Output, e.Right);
   codeGen.Output.WriteString(';');
end;

// ------------------
// ------------------ TJSAssignConstToFloatVarExpr ------------------
// ------------------

// CodeGen
//
procedure TJSAssignConstToFloatVarExpr.CodeGen(codeGen : TdwsCodeGen; expr : TExprBase);
var
   e : TAssignConstToFloatVarExpr;
begin
   e:=TAssignConstToFloatVarExpr(expr);
   codeGen.Compile(e.Left);
   codeGen.Output.WriteString('=');
   codeGen.Output.WriteString(FloatToStr(e.Right));
   codeGen.Output.WriteString(';');
end;

// ------------------
// ------------------ TJSAppendConstStringVarExpr ------------------
// ------------------

// CodeGen
//
procedure TJSAppendConstStringVarExpr.CodeGen(codeGen : TdwsCodeGen; expr : TExprBase);
var
   e : TAppendConstStringVarExpr;
begin
   e:=TAppendConstStringVarExpr(expr);
   codeGen.Compile(e.Left);
   codeGen.Output.WriteString('+=');
   WriteJavaScriptString(codeGen.Output, e.AppendString);
   codeGen.Output.WriteString(';');
end;

// ------------------
// ------------------ TJSConstIntExpr ------------------
// ------------------

// CodeGen
//
procedure TJSConstIntExpr.CodeGen(codeGen : TdwsCodeGen; expr : TExprBase);
var
   e : TConstIntExpr;
begin
   e:=TConstIntExpr(expr);
   codeGen.Output.WriteString(IntToStr(e.Value));
end;

// ------------------
// ------------------ TJSConstStringExpr ------------------
// ------------------

// CodeGen
//
procedure TJSConstStringExpr.CodeGen(codeGen : TdwsCodeGen; expr : TExprBase);
var
   e : TConstStringExpr;
begin
   e:=TConstStringExpr(expr);
   WriteJavaScriptString(codeGen.Output, e.Value);
end;

// ------------------
// ------------------ TJSConstFloatExpr ------------------
// ------------------

// CodeGen
//
procedure TJSConstFloatExpr.CodeGen(codeGen : TdwsCodeGen; expr : TExprBase);
var
   e : TConstFloatExpr;
begin
   e:=TConstFloatExpr(expr);
   codeGen.Output.WriteString(FloatToStr(e.Value));
end;

// ------------------
// ------------------ TJSConstBooleanExpr ------------------
// ------------------

// CodeGen
//
procedure TJSConstBooleanExpr.CodeGen(codeGen : TdwsCodeGen; expr : TExprBase);
var
   e : TConstBooleanExpr;
begin
   e:=TConstBooleanExpr(expr);
   codeGen.Output.WriteString(cBoolToJSBool[e.Value]);
end;

// ------------------
// ------------------ TJSAssignExpr ------------------
// ------------------

// CodeGen
//
procedure TJSAssignExpr.CodeGen(codeGen : TdwsCodeGen; expr : TExprBase);
var
   e : TAssignExpr;
begin
   // TODO: deep copy of records & static arrays
   e:=TAssignExpr(expr);
   codeGen.Compile(e.Left);
   codeGen.Output.WriteChar('=');
   codeGen.Compile(e.Right);
   codeGen.Output.WriteString(';');
end;

// ------------------
// ------------------ TJSFuncBaseExpr ------------------
// ------------------

// CodeGen
//
procedure TJSFuncBaseExpr.CodeGen(codeGen : TdwsCodeGen; expr : TExprBase);
var
   e : TFuncExprBase;
   i : Integer;
   funcSym : TFuncSymbol;
   paramExpr : TExprBase;
   paramSymbol : TParamSymbol;
   readBack : TStringList;
   gotVarParam  : Boolean;
begin
   // TODO: handle deep copy of records, lazy params
   e:=TFuncExprBase(expr);
   funcSym:=e.FuncSym;

   readBack:=TStringList.Create;
   try
      gotVarParam:=False;
      for i:=0 to funcSym.Params.Count-1 do begin
         paramSymbol:=(funcSym.Params[i] as TParamSymbol);
         if paramSymbol is TVarParamSymbol then begin
            gotVarParam:=True;
            Break;
         end;
      end;

      if gotVarParam then begin
         codeGen.Output.WriteString('(function () {');
         for i:=0 to e.Args.Count-1 do begin
            paramExpr:=e.Args.ExprBase[i];
            paramSymbol:=(e.FuncSym.Params[i] as TParamSymbol);
            codeGen.Output.WriteString('var $param'+IntToStr(i)+'=');
            if paramSymbol is TVarParamSymbol then begin
               codeGen.Output.WriteString('{value:');
               codeGen.Compile(paramExpr);
               codeGen.Output.WriteString('}');
            end else begin
               codeGen.Compile(paramExpr);
            end;
            codeGen.Output.WriteString(';'#13#10);
         end;

         if funcSym.Typ<>nil then
            codeGen.Output.WriteString('return ');
      end;

      codeGen.Output.WriteString(funcSym.Name);
      codeGen.Output.WriteChar('(');
      for i:=0 to e.Args.Count-1 do begin
         if i>0 then
            codeGen.Output.WriteChar(',');
         paramExpr:=e.Args.ExprBase[i];
         if gotVarParam then
            codeGen.Output.WriteString('$param'+IntToStr(i))
         else codeGen.Compile(paramExpr);
      end;
      codeGen.Output.WriteString(')');

      if gotVarParam then begin

         for i:=0 to e.Args.Count-1 do begin
            paramExpr:=e.Args.ExprBase[i];
            paramSymbol:=(e.FuncSym.Params[i] as TParamSymbol);
            if paramSymbol is TVarParamSymbol then begin
               codeGen.Compile(paramExpr);
               codeGen.Output.WriteString('=$param'+IntToStr(i)+'.value;'#13#10);
            end;
            codeGen.Output.WriteString(';'#13#10);
         end;

         codeGen.Output.WriteString('}())');
      end;

   finally
      readBack.Free;
   end;
end;

// ------------------
// ------------------ TJSMagicFuncExpr ------------------
// ------------------

// CodeGen
//
procedure TJSMagicFuncExpr.CodeGen(codeGen : TdwsCodeGen; expr : TExprBase);
var
   e : TMagicFuncExpr;
begin
   e:=TMagicFuncExpr(expr);
   codeGen.Dependencies.Add(e.FuncSym.QualifiedName);
   inherited;
end;

// ------------------
// ------------------ TJSCaseExpr ------------------
// ------------------

// CodeGen
//
procedure TJSCaseExpr.CodeGen(codeGen : TdwsCodeGen; expr : TExprBase);
var
   i : Integer;
   e : TCaseExpr;
   cond : TCaseCondition;
begin
   e:=TCaseExpr(expr);
   codeGen.Output.WriteString('{var $case=');
   codeGen.Compile(e.ValueExpr);
   codeGen.Output.WriteString(';'#13#10);
   for i:=0 to e.CaseConditions.Count-1 do begin
      if i>0 then
         codeGen.Output.WriteString(' else ');
      codeGen.Output.WriteString('if (');
      cond:=TCaseCondition(e.CaseConditions.List[i]);
      if cond is TCompareCaseCondition then begin
         codeGen.Output.WriteString('$case==');
         codeGen.Compile(TCompareCaseCondition(cond).CompareExpr);
      end else if cond is TRangeCaseCondition then begin
         codeGen.Output.WriteString('($case>=');
         codeGen.Compile(TRangeCaseCondition(cond).FromExpr);
         codeGen.Output.WriteString(')&&($case<=');
         codeGen.Compile(TRangeCaseCondition(cond).ToExpr);
         codeGen.Output.WriteString(')');
      end else raise ECodeGenUnknownExpression.Create(cond.ClassName);
      codeGen.Output.WriteString(') {'#13#10);
      codeGen.Compile(cond.TrueExpr);
      codeGen.Output.WriteString(#13#10'break;'#13#10'}');
   end;
   if e.ElseExpr<>nil then begin
      codeGen.Output.WriteString(' else {'#13#10);
      codeGen.Compile(e.ElseExpr);
      codeGen.Output.WriteString(#13#10'};'#13#10);
   end;
   codeGen.Output.WriteString('};'#13#10);
end;

// ------------------
// ------------------ TJSExitExpr ------------------
// ------------------

// CodeGen
//
procedure TJSExitExpr.CodeGen(codeGen : TdwsCodeGen; expr : TExprBase);
begin
   if     (codeGen.Context is TdwsProcedure)
      and (TdwsProcedure(codeGen.Context).Func.Typ<>nil) then
      codeGen.Output.WriteString('return Result;')
   else codeGen.Output.WriteString('return;');
end;

end.
