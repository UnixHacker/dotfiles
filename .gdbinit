
# .gdbinit

set print pretty

# disable clumsy paging (use terminal scrollback buffer instead)
set height 0

# for freertos POSIX simulation:
handle SIGUSR1 nostop noignore noprint
handle SIG34 nostop noignore noprint

#set prompt [31m(gdb) [m


# log gdb output (defaults to gdb.txt in current directory)
#set logging on

set history save
set history filename ~/.gdb_history
set history size 10000

set confirm off

define bta
thread apply all backtrace
end
document bta
Alias for 'thread apply all backtrace'
end

define btaf
thread apply all backtrace full
end
document btaf
Alias for 'thread apply all backtrace full'
end

define lon
set scheduler-locking on
end
document lon
Alias for 'set scheduler-locking on'
end

define loff
set scheduler-locking off
end
document loff
Alias for 'set scheduler-locking off'
end

set auto-load safe-path /
python
import sys
import os
sys.path.insert(0, '/usr/share/gcc-%s/python/' % (os.popen('gcc -dumpversion').read().strip(),))
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers(None)
end