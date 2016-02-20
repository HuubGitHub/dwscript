### Internal Maths functions ###

  * [Odd](InternalOdd.md)(i : Integer) : returns True if i is odd

  * [Cos](InternalCos.md)(a : Float) : returns the cosine of an angle in radians
  * [Sin](InternalSin.md)(a : Float) : returns the sine of an angle in radians
  * [Tan](InternalTan.md)(a : Float) : returns the tangent of an angle in radians
  * [Cotan](InternalCotan.md)(a : Float) : returns the cotangent of an angle in radians

  * [Cosh](InternalSinh.md)(a : Float) : returns the hyperbolic cosine of a
  * [Sinh](InternalSinh.md)(a : Float) : returns the hyperbolic sine of a
  * [Tanh](InternalSinh.md)(a : Float) : returns the hyperbolic tangent of a

  * [ArcSin](InternalArcSin.md)(v : Float) : returns the arc-sine in radians
  * [ArcCos](InternalArcCos.md)(v : Float) : returns the arc-cosine in radians
  * [ArcTan](InternalArcTan.md)(v : Float) : returns the arc-tangent in radians
  * [ArcTan2](InternalArcTan2.md)(y, x : Float) : returns the arc-tangent in radians of the angle between y and x

  * [ArcSinh](InternalArcSinh.md)(v : Float) : returns the inverse hyperbolic sine of v
  * [ArcCosh](InternalArcCosh.md)(v : Float) : returns the inverse hyperbolic cosine of v
  * [ArcTanh](InternalArcTanh.md)(v : Float) : returns the inverse hyperbolic tangent of v

  * [Hypot](InternalHypot.md)(x, y : Float) : returns the length of the hypotenuse of a right triangle with sides of lengths x and y
  * [Factorial](InternalFactorial.md)(v : integer) : returns the factorial of v
  * [Exp](InternalExp.md)(v : Float) : returns the mathematical constant e, raised to the power of the argument v
  * [Ln](InternalLn.md)(v : Float) : returns the natural logarithm of v
  * [Log2](InternalLog2.md)(v : Float) : returns the base 2 logarithm of v
  * [Log10](InternalLog10.md)(v : Float) : returns the base 10 logarithm of v
  * [LogN](InternalLogN.md)(v : Float) : returns the base n logarithm of x
  * [Power](InternalPower.md)(base, exponent : Float) : returns the base value raised to the power of the exponent argument
  * [IntPower](InternalIntPower.md)(base : Float; exponent : integer) : returns the base value raised to the power of the exponent argument, where exponent is an integer
  * [Sqrt](InternalSqrt.md)(v : Float) : returns the square root of v
  * [Int](InternalInt.md)(v : Float) : returns the integer part of v
  * [Frac](InternalFrac.md)(v : Float) : returns the fractional part of v
  * [Floor](InternalFloor.md)(v : Float) : returns the next integer less than or equal to v
  * [Ceil](InternalCeil.md)(v : Float) : returns the next integer greater than or equal to v

  * [Trunc](InternalTrunc.md)(v : Float) : returns the integer part of v
  * [Round](InternalRound.md)(v : Float) : rounds v to the nearest integer

  * [DegToRad](InternalDegToRad.md)(a : Float) : converts the angle a from degrees to radians
  * [RadToDeg](InternalRadToDeg.md)(a : Float) : converts the angle a from radians to degrees

  * [Sign](InternalSign.md)(v : Float) : returns the sign of v: -1 for negative values, 0 for zero, or 1 for positive values
  * [Sign](InternalSign.md)(v : Integer) : returns the sign of v: -1 for negative values, 0 for zero, or 1 for positive values

  * [Max](InternalMax.md)(v1, v2 : Float) : returns v1 or v2, whichever is greater
  * [Max](InternalMax.md)(v1, v2 : Integer) : returns v1 or v2, whichever is greater
  * [MaxInt](InternalMax.md)(v1, v2 : Integer) : Same as the integer version of Max, above
  * [Min](InternalMin.md)(v1, v2 : Float) : returns v1 or v2, whichever is less
  * [Min](InternalMin.md)(v1, v2 : Integer) : returns v1 or v2, whichever is less
  * [MinInt](InternalMin.md)(v1, v2 : Integer) : Same as the integer version of Min, above
  * [Clamp](InternalClamp.md)(v, min, max : Float) : returns v if it is within the range defined by min and max, or either min or max, depending on whether v was less than min or greater than max
  * [ClampInt](InternalClampInt.md)(v, min, max : Integer) : returns v if it is within the range defined by min and max, or either min or max, depending on whether v was less than min or greater than max

  * [Pi](InternalPi.md) : returns the mathematical constant Pi

  * [Gcd](InternalGcd.md)(a, b : Integer) : returns the greatest common denominator of a and b
  * [Lcm](InternalLcm.md)(a, b : Integer) : returns the least common multiple of a and b
  * [IsPrime](InternalIsPrime.md)(n : Integer) : returns true if n is prime, or false otherwise
  * [LeastFactor](InternalLeastFactor.md)(n : Integer) : returns the smallest prime factor of n

  * [Random](InternalRandom.md) : returns a random float in the range [<= result < 1](0.md)
  * [RandomInt](InternalRandomInt.md)(range : Integer) : returns a random integer in the range [<= result < range](0.md)
  * [Randomize](InternalRandomize.md) : Initializes the random number generator
  * [RandG](InternalRandG.md)(mean, stdDev : Float) : returns a random value from the distribution curve described by the mean and standard deviation arguments
  * [RandSeed](InternalRandSeed.md) : Returns the current seed of the random number generator.  **Deprecated**
  * [SetRandSeed](InternalSetRandSeed.md)(seed : Integer) : Sets a new seed for the random number generator.