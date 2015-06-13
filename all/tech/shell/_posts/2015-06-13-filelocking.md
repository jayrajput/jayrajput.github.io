---
title: File locking on unix
---

If multiple processes are writing to a file at the same time, the result is non
deterministic. So before writing to a file, a lock needs to acquired on a file.
There are three C APIs which are provided for locking. Corresponding to these C
APIs, other programming language (shell, PHP, Perl, Python) also provide APIs.

- flock
- lockf
- fcntl

# flock

    int flock(int fd, int operation);

Easiest of the APIs. But provides locking at the file level. Does not work with
the NFS.

fd is the file descriptor obtained by call to open or fopen.  operation can be
one of these

    LOCK_SH Shared Lock (Read Lock)
    LOCK_EX Exclusive Lock (Write Lock)
    LOCK_UN Unlock

A call to flock will block if the file is already locked by another process. To
use non-blocking call, use LOCK_NB (by ORing).

# lockf

Considered as a simplified wrapper over fcntl. Some OS implementation may
choose to not create it as a wrapper over fcntl and provide a separate
implementation.

    int lockf(int fd, int cmd, off_t size);

fd is the file descriptor.  cmd can be one of these

    F_LOCK  Lock the file (blocking)
    F_TLOCK Lock the file (non blocking)
    F_ULOCK unlock
    F_TEST  test if lock exists.

size is the offset from the region to be locked. The locking is provided from
offset to the EOF.

# fcntl

Provides locking over a region of a file. Record level locking (vs file
locking).

    int fcntl(int fd, int cmd, ... /* int arg */);

fd is file descriptor.  cmd can be one of these for the locking

    F_OFD_GETLK  Test the lock (get lock)
    F_OFD_SETLK  Set or Clear Lock (non blocking)
    F_OFD_SETLKW Same as F_OFD_SETLKW but blocking

The third argument is a pointer to the flock structure.  flock structure
    
    struct flock {
        ...
        short l_type;    /* Type of lock: F_RDLCK, F_WRLCK, F_UNLCK */
        short l_whence;  /* How to interpret l_start:
                            SEEK_SET, SEEK_CUR, SEEK_END */
        off_t l_start;   /* Starting offset for lock */
        off_t l_len;     /* Number of bytes to lock */
        pid_t l_pid;     /* PID of process blocking our lock (F_GETLK only) */
        ...
    };

fcntl operates on the struct flock, so the call generally looks like this

    struct* flock lockp;
    fcntl(fd , F_OFD_SETLK  , lockp);
    fcntl(fd , F_OFD_SETLKW , lockp);
    fcntl(fd , F_OFD_GETLK  , lockp);

Read GNU article for more information on granularities and usage

    http://www.gnu.org/software/libc/manual/html_node/Open-File-Description-Locks.html#Open-File-Description-Locks

The locks obtained by the above APIs are advisory so works only for
co-operating processes.
