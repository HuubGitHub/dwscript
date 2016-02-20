## Source Code Inclusions ##

  * **`{$I 'filename'}`** : includes the specified file "verbatim" in the source.
  * **`{$INCLUDE 'filename'}`** : includes the specified file "verbatim" in the source.
  * **`{$INCLUDE_ONCE 'filename'}`** : includes the specified "verbatim" in the source only if it hasn't already been included (directly or through inclusion).
  * **`{$F 'filename'}`** : includes the specified file in the source after applying the filter on it.
  * **`{$FILTER 'filename'}`** : includes the specified file in the source after applying the filter on it.

## Special Inclusions ##

You can use them with either **`$I`** or **`$INCLUDE`**, they include a string literal with the relevant information.

  * **`{$I %FUNCTION%}`** : includes a string literal containing the name of the function or method where the directive is.
  * **`{$I %FILE%}`** : includes a string literal containing the current file name where the directive is.
  * **`{$I %LINE%}`** : includes a string literal containing the line number where the directive is.

  * **`{$I %DATE%}`** : includes a string literal containing the date of compilation (yyyy-mm-dd).
  * **`{$I %TIME%}`** : includes a string literal containing the time of compilation (hh:nn:ss).