## Introduction to Linux challenges

### List of System Calls

The list all system calls is available on this link:
<http://man7.org/linux/man-pages/man2/syscalls.2.html>

### Standard C function wrappers

- open a file:

```c
FILE *fopen(const char *filename, const char *mode)
```

- write text to a file:

```c
int fputc( int c, FILE *fp );
```

- close the file:

```c
int fclose( FILE *fp );
```

- open an i2c device:

```c
int file;
char *filename = "/dev/i2c-2";
if ((file = open(filename, O_RDWR)) < 0) {
    /* ERROR HANDLING: you can check errno to see what went wrong */
    perror("Failed to open the i2c bus");
    exit(1);
}
```

- write to an i2c device

```c
buf[0] = 0b11110000;
if (write(file,buf,1) != 1) {
    /* ERROR HANDLING: i2c transaction failed */
    printf("Failed to write to the i2c bus.\n");
    buffer = g_strerror(errno);
    printf(buffer);
    printf("\n\n");
}
```

- close the i2c device

```c
/* Close i2c bus with library: https://github.com/amaork/libi2c */
void i2c_close(int bus);
```

- create a child process / copy of current proces:

```c
#include <stdio.h>
#include <sys/types.h>
int main()
{
    fork();
    fork();
    fork();
    printf("hello\n");
    return 0;
}
```

- create a file

```c
#include<stdio.h>
int main(){
FILE *fp;
fp=fopen("file.txt","w");
fclose(fp);
return 0;
}
```

#### What do you notice about the functions interact with a file and those to interact with an i2c device?

### Groups

#### Why would a system such as Linux need groups of users for?

> Linux uses groups as a way to organize users. Groups organize collections of accounts, primarily as a security measure. Control of group membership is administered through the `/ etc/group` file, which shows a list of groups and its members. Every user has a default or primary group. When a user logs in, the group membership is set for their primary group. This means that when a user launches a program or creates a file, both the file and the running program will be associated with the user’s current group membership. A user may access other files in other groups, as long as they are also a member of that group and the access permissions are set.

Source: <https://www.linode.com/docs/tools-reference/linux-users-and-groups/#working-with-groups>

### GitHub Repo

#### Can you find the GitHub repository that contains the source of the Linux kernel?

Link to the linux kernel GitHub repository: <https://github.com/torvalds/linux>

#### Who owns the repository?

[Linus Torvalds](https://github.com/torvalds)

#### What is the latest release?

Latest release (v5.0-rc7): <https://github.com/torvalds/linux/releases/tag/v5.0-rc7>
