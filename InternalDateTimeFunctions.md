### Internal Date/Time functions ###

These functions use a Float to represent a date time, similar to TDateTime (1 unit per day, same time origin as in Delphi).

  * [Now](InternalNow.md)() : returns the current date time
  * [Date](InternalDate.md)() : returns the current date
  * [Time](InternalTime.md)() : returns the current time

  * [UTCDateTime](InternalUTCDateTime.md)() : returns the current UTC date time

  * [DateTimeToStr](InternalDateTimeToStr.md)(dt : Float) : converts a date time to a string representation
  * [StrToDateTime](InternalStrToDateTime.md)(str : String) : parses a string representing a date time
  * [StrToDateTimeDef](InternalStrToDateTimeDef.md)(str : String; def : Float) : parses a string representing a date time, returns def if the string isn't a valid date time

  * [DateToStr](InternalDateToStr.md)(dt : Float)
  * [StrToDate](InternalStrToDate.md)(str : String)
  * [StrToDateDef](InternalStrToDateDef.md)(str : String; def : Float)

  * [DateToISO8601](InternalDateToISO8601.md)(dt : Float) : converts a date to its ISO8601 string representation
  * [DateTimeToISO8601](InternalDateTimeToISO8601.md)(dt : Float) : converts a date time to its ISO8601 string representation

  * [TimeToStr](InternalTimeToStr.md)(dt : Float)
  * [StrToTime](InternalStrToTime.md)(str : String)
  * [StrToTimeDef](InternalStrToTimeDef.md)(str : String; def : Float)

  * [DayOfWeek](InternalDayOfWeek.md)(dt : Float) : returns the day of the week between 1 and 7 with Sunday as the first day
  * [DayOfTheWeek](InternalDayOfTheWeek.md)(dt : Float) : returns the day of the week between 1 and 7 with Monday as the first day
  * [FormatDateTime](InternalFormatDateTime.md)(frm: String; dt: Float)
  * [IsLeapYear](InternalIsLeapYear.md)(year : Integer) : indicates if a year is a leap year
  * [IncMonth](InternalIncMonth.md)(dt : Float; nb : Integer) : returns a date time offset by nb months (nb can be negative or positive)
  * [DecodeDate](InternalDecodeDate.md)(dt : Float; var y, m, d : Integer)
  * [EncodeDate](InternalEncodeDate.md)(y, m, d) : Integer
  * [DecodeTime](InternalDecodeTime.md)(dt : Float; var h, m, s, ms : Integer)
  * [EncodeTime](InternalEncodeTime.md)(h, m, s, ms : Integer)

  * [FirstDayOfYear](InternalFirstDayOfYear.md)(dt : Float)
  * [FirstDayOfNextYear](InternalFirstDayOfNextYear.md)(dt : Float)
  * [FirstDayOfMonth](InternalFirstDayOfMonth.md)(dt : Float)
  * [FirstDayOfNextMonth](InternalFirstDayOfNextMonth.md)(dt : Float)
  * [FirstDayOfWeek](InternalFirstDayOfWeek.md)(dt : Float)
  * [DayOfYear](InternalDayOfYear.md)(dt : Float)
  * [MonthOfYear](InternalMonthOfYear.md)(dt : Float)
  * [DayOfMonth](InternalDayOfMonth.md)(dt : Float)

  * [DateToWeekNumber](InternalDateToWeekNumber.md)(dt : Float)
  * [WeekNumber](InternalWeekNumber.md)(dt : Float)
  * [DateToYearOfWeek](InternalDateToYearOfWeek.md)(dt : Float)
  * [YearOfWeek](InternalYearOfWeek.md)(dt : Float)