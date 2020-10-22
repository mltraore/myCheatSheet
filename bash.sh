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


UP ARROW       # Returns the last command ran

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

#####################   Adding to a file (Redirect)   ####################

# there are 3 ways  vi/(> >>)/echo > or >>

echo   "text to put"      >     <filename>     # Creates file if it doesn't exist and write in or overwrites if does exist 
echo   "text to append"   >>    <filename>

ls  -ltr >  <filename>

###############  standard Output to a file (tee cmd)   ####################

echo "text to put"  | tee <filename>      # Will write to file and display the text
echo "text to put"  | tee -a <filename>   # Will append to file and display the text
ls -l | tee <file1> <file2> ... <file_n>

#######################         PIPES              ######################

command1 [arguments]  |  command2 [arguments]   # takes the output of the first command as a of the second one
ls -l  | more                                   # Show one page at a time
ls     | tail -1                                # Returns the last line


#######################  FILE MAINTENACE COMMANDS   ######################

cp    -option  <source>  <destination>          # Copy files and directories
mv    
rm
rm -Rf                                          # Will forcefully remove sub-directories and its contents as well
mkdir
rmdir  or rm -r                                
chown
chgrp

chown   <ownership>:<group>   <filename>        # Will change both ownership and group at a time


#######################  FILE  DISPLAY  COMMANDS   ######################

cat     <filename>                                # Displays the content of the file, all at a time

more    <filename>                                # Displays the content of file page-by-page with percentage
less    <filename>                                # Displays the content of file page-by-page
                                                  # By typing j  line-by-line and k line-by-line(backup)

head -n <filename>                                # Displays the n first line of the file content                 
tail -n <filename>                                # Displays the n last  line of the file content


##############################################################################
#   FILTERS / TEXT PROCESSORS COMMANDS
##############################################################################

cut, awk, grep/egrep, uniq, sort and wc   commands



#######################  Cut  COMMAND   ######################

# Cut is a command line utility that allows us to cut parts of lines from specified files 
#     or piped data and print the result to standard output. It can be used to cut parts of 
#     a line by delimiter, byte position, and character. 


cut   <filename>                 # Doesn't work,  lack of option
cut   --version                  # Displays the version of cut command
cut   --help                     # Get information about each option of cut cmd
cut   -c1        <filename>      # Lists the first character of each line in the file
cut   -c1,2,4    <filename>      # Pick and Chose character (here first, 2th, 4th char of each line)     
cut   -c1-3      <filename>      # Lists range of characteres
cut   -c1-3,6-8  <filename>      # Lists specific range of characters
cut   -b1-3      <filename>      # List by byte Size

cut -d: -f 6    /etc/passwd      # List first 6th column separated by :
cut -d: -f 6-7  /etc/passwd      # List first 6 and 7th column separated by :
                                 # : cand be replaced by a desired character
                                 
ls  -l | cut -c2-4               # Only print user permissions of files/dir



