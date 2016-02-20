## Base Types ##

The following types are standard:
  * **[Integer](Integer.md)** : 64bit signed integer
  * **[Float](Float.md)** : double-precision floating-point
  * **[Boolean](Boolean.md)** : True/False
  * **[String](String.md)** : mutable, copy-on-write, 1-based, UTF-16 string

The following types are optional:
  * Variant
  * COM support : OleVariant, ComVariant, ComVariantArray
  * RttiVariant : specializable interface to Delphi Rtti types
  * TComplex : double-precision complex numbers (dwsMathComplexFunctions)
  * Vector : double-precision 4D homogeneous vector (dwsMath3DFunctions)
  * Matrix : double-precision 4D matrix (dwsMath3DFunctions)