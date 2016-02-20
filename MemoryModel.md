# Memory Model #

## ARC + GC hybrid ##

The script engine uses an hybrid memory model, which is based upon Automatic Reference Counting to ensure timely, automated release of all dynamic objects (instances, strings, dynamic arrays).

Reference-counting cycles are taken care of automatically by a special garbage collector, so tagging weak reference is not necessary.

The garbage collector is not the primary mean of managing memory (reference-counting is), it runs only infrequently as its sole purpose is taking care of cycles.

## Manual management ##

Invoking destructors explicitly on object is supported.

Once an object has been destroyed, further attempts to access it or its methods will fail with a guaranteed exception and is considered "safe" (no memory corruption can occur).

Destroying objects can be used to release memory of large objects immediately.