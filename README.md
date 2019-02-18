# Solutions to Challenges

Name: Jop Bouckaert

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

### Groups
#### Why would a system such as Linux need groups of users for?
>Linux uses groups as a way to organize users. Groups organize collections of accounts, primarily as a security measure. Control of group membership is administered through the `/   etc/group` file, which shows a list of groups and its members. Every user has a default or primary group. When a user logs in, the group membership is set for their primary group. This means that when a user launches a program or creates a file, both the file and the running program will be associated with the user’s current group membership. A user may access other files in other groups, as long as they are also a member of that group and the access permissions are set.

Source: <https://www.linode.com/docs/tools-reference/linux-users-and-groups/#working-with-groups>

### GitHub Repo
#### Can you find the GitHub repository that contains the source of the Linux kernel?
Link to the linux kernel GitHub repository: <https://github.com/torvalds/linux>

####  Who owns the repository?
 [Linus Torvalds](https://github.com/torvalds)

#### What is the latest release?
Latest release (v5.0-rc7): <https://github.com/torvalds/linux/releases/tag/v5.0-rc7>

