## Getting Around in challenges

### What does the `dmsg` command do? Check the man pages.

`dmseg` is used to examine or control the kernel ring buffer. The default action is to display all messages from the kernel ring buffer.

### The free command

Free displays the total amount of free and used physical and swap memory in the system, as well as the buffers and caches used by the kernel. The information is gathered by parsing `/proc/meminfo`.

### Number of Cores

`grep -c ^processor /proc/cpuinfo`
