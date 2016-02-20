# Navigation methods #

  * `Step : Boolean`
  * `EOF : Boolean`
  * `Next`
  * **destructor** Close

# Field access #

  * `Fields[index : Integer] : `[DataField](DataField.md)
  * `FieldCount : Integer`
  * `IndexOfField(fieldName : String) : Integer`
  * `FieldByName(fieldName : String) : `[DataField](DataField.md)

# Direct value access #

  * `AsInteger(index : Integer)`/`AsInteger(fieldName : String) : Integer`
  * `AsString(index : Integer)`/`AsString(fieldName : String) : String`
  * `AsFloat(index : Integer)`/`AsFloat(fieldName : String) : Float`
  * `AsBlob(index : Integer)`/`AsBlob(fieldName : String) : String`

# JSON generation #

  * `Stringify`
  * `StringifyAll`