var level : Integer;

procedure Recursive;
begin
   Inc(level);
   try
      Recursive;
   except
   end;
end;

Recursive;

Println('Recursion Level is ' + IntToStr(level));