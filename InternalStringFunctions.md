### Internal String functions ###

This section is not completed yet. It basically consists of a slightly formated copy-paste from the dwsStringFunctions.pas source.

  * [\_](InternalGetText.md)(str : String) : invokes the localizer on the specified string ([GNU GetText](http://en.wikipedia.org/wiki/Gettext) like)

  * [Chr](InternalChr.md)(i : Integer) : returns the string corresponding to the given Unicode codepoint (supports the whole Unicode range)

  * [IntToStr](InternalIntToStr.md)(i : Integer) : returns a string representing i in decimal notation

  * [StrToInt](InternalStrToInt.md)(str : String) : returns the conversion the passed string to a number

  * [StrToIntDef](InternalStrToIntDef.md)(str : String; def : Integer) :

  * [VarToIntDef](InternalVarToIntDef.md)(val : Variant; def : Integer) :

  * [IntToHex](InternalIntToHex.md) (v : Integer; digits : Integer) :

  * [HexToInt](InternalHexToInt.md) (hexa : String]) :

  * [IntToBin](InternalIntToBin.md) (v : Integer; digits : Integer) :

  * [BoolToStr](InternalBoolToStr.md) (b : Boolean) :

  * [StrToBool](InternalStrToBool.md) (str : String) :

  * [FloatToStr](InternalFloatToStr.md) (f : Float; p : Integer = 99) :

  * [StrToFloat](InternalStrToFloat.md) (str : String) :

  * [StrToFloatDef](InternalStrToFloatDef.md) (str : String; def : Float) :

  * [VarToFloatDef](InternalVarToFloatDef.md) (val : Variant; def : Float) :

  * [Format](InternalFormat.md) (fmt : String; args : array of const) :

  * [CharAt](InternalCharAt.md) (s : String; x : Integer) :

  * [Delete](InternalDelete.md) (s : String; index : Integer; Len : Integer) :

  * [Insert](InternalInsert.md) (src : String; s : String; index : Integer]) :

  * [LowerCase](InternalLowerCase.md) (str : String) :

  * [AnsiLowerCase](InternalAnsiLowerCase.md) (str : String) :

  * [UpperCase](InternalUpperCase.md) (str : String) :

  * [AnsiUpperCase](InternalAnsiUpperCase.md) (str : String) :

  * [Pos](InternalPos.md) (subStr : String; str : String) :

  * [PosEx](InternalPosEx.md) (subStr : String; str : String; offset : Integer) :

  * [RevPos](InternalRevPos.md) (subStr : String; str : String) :

  * [SetLength](InternalSetLength.md) (S : String; NewLength : Integer):

  * [TrimLeft](InternalTrimLeft.md) (str : String) :

  * [TrimRight](InternalTrimRight.md) (str : String) :

  * [Trim](InternalTrim.md) (str : String) :

  * [SameText](InternalSameText.md) (str1 : String; str2 : String) :

  * [CompareText](InternalCompareText.md) (str1 : String; str2 : String) :

  * [AnsiCompareText](InternalAnsiCompareText.md) (str1 : String; str2 : String) :

  * [CompareStr](InternalCompareStr.md) (str1 : String; str2 : String) :

  * [AnsiCompareStr](InternalAnsiCompareStr.md) (str1 : String; str2 : String) :

  * [IsDelimiter](InternalIsDelimiter.md) (delims : String; str : String; index : Integer) :

  * [LastDelimiter](InternalLastDelimiter.md) (delims : String; str : String) :

  * [FindDelimiter](InternalFindDelimiter.md) (delims : String; str : String; startIndex : Integer = 1) :

  * [QuotedStr](InternalQuotedStr.md) (str : String; quoteChar : String) :

  * [Copy](InternalCopy.md) (str : String; index : Integer; Len : Integer) :

  * [LeftStr](InternalLeftStr.md) (str : String; count : Integer) :

  * [RightStr](InternalRightStr.md) (str : String; count : Integer) :

  * [MidStr](InternalMidStr.md) (str : String; start : Integer; count : Integer) :

  * [SubStr](InternalSubStr.md) (str : String; start : Integer) :

  * [SubString](InternalSubString.md) (str : String; start : Integer; end : Integer) :

  * [StringOfChar](InternalStringOfChar.md) (ch : String; count : Integer) :

  * [StringOfString](InternalStringOfString.md) (str : String; count : Integer) :

  * [DupeString](InternalDupeString.md) (str : String; count : Integer) :

  * [StrBeginsWith](InternalStrBeginsWith.md) (str : String; beginStr : String) :

  * [StrEndsWith](InternalStrEndsWith.md) (str : String; endStr : String) :

  * [StrAfter](InternalStrAfter.md) (str : String; delimiter : String) :

  * [StrBefore](InternalStrBefore.md) (str : String; delimiter : String) :

  * [StrReplace](InternalStrReplace.md)(str, sub, newSub : String) : returns a string where all occurences of sub in str are replace by newSub

  * [StrSplit](InternalStrSplit.md)(str, delimiter : String) : returns the string splitted on the delimiters as an array of string

  * [StrJoin](InternalStrJoin.md)(strs : array of string; delimiter : String) : joins the strings in the array, concatenating them with delimiter in between each item and returns the resulting string

  * [ReverseString](InternalReverseString.md)(str : String) : returns a string that is a reversed version of str