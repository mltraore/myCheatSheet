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
#   TERMINAL & System Maintenance commands
##############################################################################

exit                       # Exit out of shell, terminal or a user session
clear                      # clears content on window (hide displayed lines)
script <logFilename.log>   # stores terminal activities in a log file
more logFilename.log       # to see the content


shutdown 
reboot
halt
init

init 6         # reboot




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

# The cut command allows a portion of a file to be extracted for another use.
# cut  [option]   file     # Options:  -c -> character_list,  -d -> delimiter, -f -> field_list



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

##############################################################################
#   SYSTEM ADMINISTRATION
##############################################################################

###############################    Vi  Editor     ############################

#### Vi supplies commands for:  
      # Inserting and deleting text
      # Replacing text
      # Moving Around the file
      # Finding and substituting strings
      # Cutting and pasting text
      
### Most Common keys:
      #  i      insert
      #  Esc    Escape out of any mode
      #  r      Replace
      #  d      Delete
      # :q!     Quit without saving
      # :wq!    Save and quit     /  shift + zz
      #  u      undo the last op
      #  dd     delete the line under cursor
      #  x      delete a character
      
      # vim course   https://openvim.com/
      
      
###############################    sed   COMMAND     ############################      
 
    #  sed command can be used for:
    #     Replace a string in a file  
    #     Find and delete line
    #     Remove empty lines
    #     Remove the first or n lines in a file
    #     To replace tabs with spaces
    #     Show defined lines from a file
    #     Substitute within vi editor
    #     and much more...
    # g: for every,  i: insert,  d: delete,  s: subtitute
    
    # Examples
    
sed       's/<key1>/<key2>/g'    <filename>         # Will replace all key1 in the file by key2
                                                        # It only makes change to the screen and not inside the file
sed  -i   's/<key1>/<key2>/g'    <filename>         # insert the changes into the file
sed       's/<word>//g'          <filename>         # Delete all <key> in the file
sed       '/<key>/d'             <filename>         # Delete all line containning the key<character, string text>
sed       '/^$/d'                <filename>         # Delete all empty lines in the file   
sed       '<n>d'                 <filename>         # remove the nth line from the file
sed       '<n1>,<n2>d'           <filename>         # remove <n1>,<n2> range lines from the file
sed       's/\t/ /g'             <filename>         # Replace all tabs in the file by space
sed  -n   <n1>,<n2>p             <filename>         # Show lines from <n1> to <n2>
sed       <n1>,<n2>d             <filename>         # All except <n1>,<n2> range lines 
sed   G   <filename>                                # Put empty line between all lines of the file
sed      '<n1>!s/<key1>/<key2>/g' <filename>        # Except <n1>th key1 replace all other <key1> by <key2>
       
        
###############################   USER ACCOUNT MANAGEMENT     ############################     
 
# useradd, groupadd, userdel, groupdel, usermod
  # user, grouğ infos are stored in three diff files
  # /etc/passwd
  # /etc/group
  # /etc/shadow
  
  # -g (primary group assigned to the users) 
  # -G (Other groups the user belongs to)
  # -a (Add the user to the supplementary group(s))
  
  
useradd -g <groupname> -s <shellenvironment> -c "user description" -m -d <userhomedirectory> <username>
useradd -g superheros  -s /bin/bash  -c "New group member" -m -d /home/spiderman  spiderman
userdel -r <username>

groupadd   <groupname>
groupdel   <groupname>
usermod -G <groupname>  <username>       # Modify a user account here is how to add a user to a group
gpasswd -d <username>   <groupname>      # remove a user from a group
gpasswd -a <username>   <groupname>      # add a user to a group

sudo useradd    angelo
passwd angelo                            # angelo00
id angelo  

sudo groupadd   jokers
cat /etc/group

sudo usermod -a -G jokers angelo         # angelo added to jokers' group  
sudo usermod -g    jokers angelo         # set jokers group as angelo's primary group

gpasswd -d angelo jokers                 # remove angelo from jokers group

sudo userdel  -r  angelo
sudo groupdel  jokers


#########################   SWITCH USERS AND SUDO ACCESS     ######################## 

  # Commands: su - username, sudo command, visudo
  # File:     /etc/sudoers
  
su - angelo                               # Switch to angelo user account  
exit                                      # Exit to the default user account 
sudo visudo -f /etc/sudoers               # Edit sudoers file
angelo ALL=(ALL)   ALL                    # Adding that to sudoers file will allow angelo to run all commands                             

sudo fdisk --list
sudo dmidecode                            # Info about  system's hardware

############################        Monitor Users        ############################ 
# Commands:  who, last, w, finger, id

who                        # show who is logged on / logged time and id
last                       # show a listing of last logged in users / users infos such as boot reboots times
last | awk '{print $1}'    # To see the first column only
last | cut -d' ' -f1       # Another option

last | awk '{print $1}'| sort | uniq
last | cut -d' '  -f1  | sort | uniq

w                          # Show who is logged on and what they are doing.

yum install finger -y   

id                         # Current user's infos, id, groups so and so...
id  <username>             # A specific user's infos

############################        Talking to Users        ############################
# Commands:  users, wall, write

wall
  Message Text
  -- SenderName
  CTRL+D
  
users                         # Display current open sessions' users 
write  <receivername>         # Send message to a specific user

############  Linux Directory Service - Linux Account Authentification ################

#Types of Accounts
     # Local accounts
     # Domain/ Directory accounts
     # Difference between Active directory, LDAP, IDM, WinBIND, OpenLDAP ...
     
     
#################  SYSTEM UTILITY COMMANDS ##################

date                          # print or set the system date and time
date -u                       # Condinated Universital Time (UTC)
$date -r file.txt             # last date when file has beeen modified
$date +%[format-option]
$date "+%D %T"                # Display date Time
$date "+%Y/%m/%d"             # Diaplay year, month, day

uptime                        # Tell how long the system has been running.

uname                         # print system information
                              # and get info about current kernel
hostname

which  <command>              # To get the location of a command
cal <day> <year>              # Calendar

bc                            # binary calculator

##########################    PROCESSES AND JOBS    ##########################

$ sudo systemctl restart ntp
$ sudo systemctl status  ntp
$ sudo systemctl stop    ntp
$ sudo systemctl enable  ntp           # ntp service will start at every boot time 

$ ps -ef | grep <processname>
$ top                                  # for more info about system and running processes

# the use of crontab 
# parameters: minute[0-59], hour[0-23], day of month[1-31], month[1-12], day of week[0-7]

$ crontab -e
22 13 * 3 * echo "This is my first crontab entry" > crontab-file

# there are 4 type of cronjobs, Hourly, Daily, Weekly, Monthly
$ cd /etc/
$ ls -l | grep cron                         # to see cron files i.e cron.daily, cron.monthly
$ cp  <scriptfilename>   /etc/cron.daily    # to run my script daily

##########################    PROCESSES Management   ##########################

# Background = CTRL+Z, jobs, bg
# Foreground = fg
# Run process even after exit =  nohup process &
#                             or nohup process > /dev/null 2>&1 &
# Kill a process by name = pkill
# Process priority = nice    (i.e   nice -n 5 process) [-20 19]
# Process monitoring = top
# Process list = ps

$ CTRL + Z            # stop processes and send to background
$ jobs                # to see  processes in the background
$ bg                  # send the process to the background & and run it
$ fg                  # bring stopped process(with ctrl+z) to foreground

$ nohup sleep 100 &   # run the command in backgound
$ nohup sleep 100  > /dev/null 2>&1 &  # to not see the message

##########################    System monitoring   ##########################

$ df -h             # report file system disk space usage
$ dmesg             # gives the of the system related warnings, error messages, failures
                    # info about ports and so
$ iostat            # input output statistic / Report Central Processing Unit (CPU) statistics and in...
$ iostat  1         # refresh th output at every 1 second

$ netstat           # Print network connections, routing tables, interface statistics, masquerade...
$ netstat -rnv      # Gateway info + Subnet mask + Used Interface info

$ free              # Display amount of free and used memory in the system

$ cat /proc/cpuinfo   # System ressource infos
$ cat /proc/meminfo   # Memory ressource infos

##########################    Log monitoring   ########################## 
# Directory = /var/log
$ more boot.log
$ more maillog               # All infos about mail traffic
$ more secure                # All about system security
$ more messages              # Every thing 

##########################    Changimg System Hostname   ########################## 
 
$ hostnamectl  set-hostname  <newhostname>
$ cat /etc/hostname

##########################    System Infos   ########################## 

$ uname -a
$ dmidecode

##########################    System Arch   ########################## 

$ arch
$ uname -m

##########################    Recover Root Password   ########################## 

# Restart the computer 
# Edit grup
# Change password
# reboot

# TOSEE

##########################    SOS Report     #########################

sosreport

##########################  Environment Variables  #########################

$ printenv                  # to view all environment variables
$ env
$ echo $SHELL               # to see the value of SHELL environment variable
$ export TEST=1             # To set the environment variables
 
$ vi .bashrc                # to set EV permanently
$ TEST='123'
$ export TEST

















