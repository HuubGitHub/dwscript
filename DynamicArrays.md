## Dynamic Arrays ##

See also [static arrays](StaticArrays.md).

Dynamic arrays are supported as reference types, they are declared without bounds. Their lower bound is always zero.

In addition to **`Low`**, **`High`**, **`Length`** and **`Count`**, they also support the following pseudo-methods:
  * **`Add`**(item [,...]) / **Push**(item [,...]) : increases Length by one and adds one or more item at the end of the array, can also add arrays (concatenation).
  * **`Clear`**() : empties the array (equivalent to `SetLength`(0))
  * **`Copy`**(startIndex`[`, count`]`) : creates a new dynamic array containing count items from startIndex, if count isn't specified, copies to the end of the array.
  * **`Delete`**(index`[`, count`]`) : deletes the item at the specified index and reduces Length by count (default one).
  * **`IndexOf`**(`[startIndex, ]`item) : returns the index of an item, returns a negative value if not found.
  * **`Insert`**(index, item) : insert an item at the specified index.
  * **`Map`**(`[`map function`]`) : creates a new array by mapping elements of the array according to a map function. The map function takes a single parameter of the type of the array items and returns the mapped value.
  * **`Peek`**() : returns the last item.
  * **`Pop`**() : returns the last item and removes it from the array.
  * **`Remove`**(`[`startIndex, `]`item) : removes the item if it can be found and returns its previous index, returns a negative value if not found.
  * **`Reverse`**() : reverses the order of the items.
  * **`SetLength`**(newLength) : defines the length of a dynamic array
  * **`Sort`**(`[`compare function`]`) : sort an array according to the compare function, the comparison function can be omitted for arrays of String, Integer and Float.
  * **`Swap`**(index1, index2) : swaps to items of specified indexes.

You can use the **in** and **not in** operators to test the presence of an element in a static array.

Dynamic arrays can be initialized from inline or constant static arrays:
```
var dynamicArray : array of String;
...
dynamicArray := ['one', 'two', 'three'];
```