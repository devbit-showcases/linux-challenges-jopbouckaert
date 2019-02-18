# Solutions to Challenges

Name: PLACE_NAME_HERE

## Instructions

Place the solutions to the course challenges in this file. Document them thoroughly as they are also subject material for the exam and you will be graded on the content of this file. The challenges are meant to practice the material, so make sure to do them yourself unless instructed otherwise.

Some tips:

* Structure the challenges and solutions so this makes for nice report
* Also add the instructions of the challenge to this file.
* You are free to add screenshots or images, just make sure to place them inside a subdirectory.
* For the more advanced challenges you can also add scripts to this repository. Make sure to place them inside a subdirectory as well.

Happy Hacking.

### List of System Calls

The list all system calls is available on this link:
<http://man7.org/linux/man-pages/man2/syscalls.2.html>

### Standard C function wrappers

* open a file:
```c
FILE *fopen(const char *filename, const char *mode)
```

* write text to a file:
```c
int fputc( int c, FILE *fp );
```

* close the file:
```c
int fclose( FILE *fp );
```

* open an i2c device:
```c
```

* write to an i2c device
```c
```

* close the i2c device
```c
```

* create a child process / copy of current proces:
```c
```

* create a file
```c
```

#### What do you notice about the functions interact with a file and those to interact with an i2c device?
