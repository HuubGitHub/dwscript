# CPU options #

  * ### UsageLimit ###

> Usage limit for the server process expressed as percentage (0-100) of total system usage, unlimited by default.

> When process CPU usage goes above that limit, the server will delay the execution of scripts for incoming requests, and if CPU usage didn't go below the limit before the end of the delay, the request will be answered with a 503 error.

> This is a soft limit that can be exceeded.

> Zero is understood as unlimited.

  * ### Affinity ###

> Bitwise value that allows specifying the server process CPU affinity, no affinity by default.

> This can be used to assign the server process to specific CPU or for placing a hard limit on maximum CPU usage.

> Zero is understood as no affinity.