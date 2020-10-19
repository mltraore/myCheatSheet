#!/bin/bash


##############################################################################
#   SHORTCUTS and HISTORY
##############################################################################

CTRL+A         # move to beginning of line
CTRL+B         # moves backward one character
CTRL+C         # halts the current command
CTRL+D         # deletes one character backward or logs out of current session, similar to exit
CTRL+E         # moves to end of line
CTRL+F         # moves forward one character
CTRL+G         # aborts the current editing command and ring the terminal bell
CTRL+H         # deletes one character under cursor (same as DELETE)
CTRL+J         # same as RETURN
CTRL+K         # deletes (kill) forward to end of line
CTRL+L         # clears screen and redisplay the line
CTRL+M         # same as RETURN
CTRL+N         # next line in command history
CTRL+O         # same as RETURN, then displays next line in history file
CTRL+P         # previous line in command history
CTRL+R         # searches backward
CTRL+S         # searches forward
CTRL+T         # transposes two characters
CTRL+U         # kills backward from point to the beginning of line
CTRL+V         # makes the next character typed verbatim
CTRL+W         # kills the word behind the cursor
CTRL+X         # lists the possible filename completions of the current word
CTRL+Y         # retrieves (yank) last item killed
CTRL+Z         # stops the current command, resume with fg in the foreground or bg in the background

ALT+B          # moves backward one word
ALT+D          # deletes next word
ALT+F          # moves forward one word
ALT+H          # deletes one character backward

BACKSPACE      # deletes one character backward
DELETE         # deletes one character under cursor

history        # shows command line history
!!             # repeats the last command
!<n>           # refers to command line 'n'
!<string>      # refers to command starting with 'string'


##############################################################################
#   TERMINAL
##############################################################################

exit           # logs out of current session
clear          # clears content on window (hide displayed lines)

##############################################################################
#   FILE SYSTEM STRUCTURE AND ITS DESCRIPTION
##############################################################################

/boot          # Contains files used by the boot loader (grub.cfg)
/root          # root user home directory. Different from /
/dev           # System devices (disk, cdrom, speakers, keyboard ...)
/etc           # Configuration files
/bin           # /usr/bin  Everyday user commands
/sbin          # /usr/sbin System / FileSystem commands
/opt           # Optional add-on applications (Not part of OS applications)
/lib           # /usr/lib  C programming library files needed by commands and apps to run
/tmp           # Directory of temporary files
/home          # Directory for user
/var           # System logs
/run           # System daemons that start very early (systemd, udev ...) and PID files' infos
/mnt           # To mount external fileSystems
/media         # For cdrom mounts


##############################################################################
#                        FILE TYPES                               
#     
#     File Symbol                           Meaning
#
#         -                               Regulary File
#         d                               Directory     
#         l                               Link
#         c                               Special File or Device
#         s                               Socket
#         p                               Named Pipe
#         b                               Block device
#
##############################################################################
#
#  Example:    drwxrwxrwx   
#              ----------
#              0123456789
#
#  0     d --> directory  
#  123   for user  : read(r) write(w) executable(x)
#  456   for group : read(r) write(w) executable(x)
#  789   for other : read(r) write(w) executable(x)
#
##############################################################################


######################    CREATE FILES AND DIRECTORY    ######################

touch    <filename>              
vi       <filename>           
vim      <filename>          
nano     <filename>           
gedit    <filename>            

mkdir    <dirname>       # Creates <dirname> named directory in current directory   for help: man mkdir


#####################     FIND FILES AND DIRECTORIES     #####################

find <directory> -name "filename"     # Starts searching for specified directory and returns a relatif path
locate  <filename>                    # locates any file and return an absolute path [Installation: yum install mlocate, Update: sudo updatedb

########################      GLOB PROGRAMMING     ###########################
#TODO

##################     FILE  PERMISSIONS & OWNERSHIP     #####################

chmod  g-w    <filename>    
chmod  a-r    <filename>
chmod  u-w    <filename>
chmod  u+rw   <filename>
chmod  ugo+x  <filename>

sudo  chown  <ownername>  <filename>
sudo  chgrp  <groupname>  <filename>


###################    FILE ACCESS CONTROL LIST  ACL      ###################

# Allow us to give permissions for any user or group to any disc resource.

setfacl  -m  u:user:rwx    /path/to/file         # Add permission for user
setfacl  -m  g:group:rwx   /path/to/file         # Add permission for group
setfacl  -x  u:user        /path/to/file         # Remove a specific entry
setfacl  -b  /path/to/file                       # Remove all entries

getfacl  <filename>     # get file access control list, gives all info about the file

#######################       HELP COMMANDS     ##########################

whatis       <command>             #  Display one-line manual page descriptions
<command>    --help                #  Give a help list of the command
man          <command>             #  An interface to the on-line reference manuals





