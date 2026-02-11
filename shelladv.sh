#!/bin/bash

# Q1: What is the difference between 'bash' and 'sh'?
# A1: 'sh' is the original Bourne shell. 'bash' is the Bourne Again Shell, an enhanced version.
#     Bash supports arrays, functions, arithmetic, extended string handling, and interactive features.
#     Example: 
#         sh myscript.sh         # runs script in sh shell (basic)
#         bash myscript.sh       # runs script in bash shell (supports advanced features)

# Q2: How do you find the largest files in a Linux directory?
# A2: Use 'du' to check disk usage and 'sort' to order by size.
#     Command:
#         du -ah /path/to/dir | sort -rh | head -n 10
#     Explanation:
#         du -ah : "disk usage", list all files and directories in human-readable sizes (KB/MB/GB)
#         sort -rh : sort by human-readable sizes in descending order
#         head -n 10 : show only top 10 largest files

# Q3: How to check which processes consume the most CPU?
# A3: Use 'ps' or 'top'.
#     Command:
#         ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 10
#     Explanation:
#         -eo : custom output format
#         pid : process ID
#         ppid : parent process ID
#         cmd : command name
#         %mem : memory usage
#         %cpu : CPU usage
#         --sort=-%cpu : sort by CPU usage in descending order
#         head -n 10 : display top 10 CPU-consuming processes

# Q4: Difference between 'grep', 'awk', and 'sed'?
# A4:
#     grep: searches for text patterns
#         Example: grep "error" logfile.log
#             - searches logfile.log for lines containing 'error'
#     awk: processes columns/fields, can do arithmetic or formatting
#         Example: awk '{print $2, $5}' logfile.log
#             - prints 2nd and 5th columns of each line
#     sed: stream editor for search/replace or in-place editing
#         Example: sed 's/old/new/g' file.txt
#             - replaces all occurrences of 'old' with 'new' in file.txt

# Q5: How to check disk space usage of all partitions?
# A5: Use 'df' command
#     Command: df -hT
#     Explanation:
#         -h : human-readable sizes
#         -T : show filesystem type
#         Output includes total size, used, available, and mount points

# Q6: Schedule a job to run every day at 2 AM
# A6: Use cron jobs
#     Command:
#         crontab -e
#         0 2 * * * /path/to/script.sh
#     Explanation:
#         0 2 * * * : minute 0, hour 2, every day/month/day-of-week
#         /path/to/script.sh : script to execute

# Q7: How to check network usage in Linux?
# A7: Commands:
#         sudo iftop -i eth0
#             - interactive display of network usage per connection
#         netstat -tulnp
#             - shows all listening ports, TCP/UDP, PID, and process names
#         ss -tulw
#             - modern replacement for netstat, shows socket info

# Q8: Error handling in bash scripts using 'set -e' and 'trap'
# A8:
#     set -e : stops script execution if any command fails
#     trap 'echo "Error occurred"; exit 1' ERR
#         - catches errors (ERR) and executes the trap commands
#     Example:
#         set -e
#         trap 'echo "Failed"; exit 1' ERR
#         cp /nonexistent/file /tmp/  # script stops if cp fails

# Q9: Find all files modified in last 7 days
# A9: Use 'find'
#     Command: find /path/to/dir -type f -mtime -7
#     Explanation:
#         -type f : search only files
#         -mtime -7 : modified in last 7 days

# Q10: Check and export environment variables
# A10:
#     printenv
#         - lists all environment variables for current session
#     env
#         - another way to list variables
#     export VAR_NAME=value
#         - sets an environment variable for current session
#     export VAR_NAME=value >> ~/.bashrc
#         - makes the environment variable permanent for user

# Q11: How to read user input in bash scripts?
# A11:
#     Command:
#         read -p "Enter your name: " username
#         echo "Hello $username"
#     Explanation:
#         read -p : prompts the user with a message
#         $username : stores input in variable
#         echo : prints the variable

# Q12: Loop over files in a directory
# A12:
#     Command:
#         for file in /path/to/dir/*; do
#             echo "Processing $file"
#         done
#     Explanation:
#         for file in ... : iterates over all files in directory
#         $file : current file in the loop
#         Useful for batch processing files

# Q13: Debug a bash script
# A13:
#     Commands:
#         bash -x script.sh        # run script with trace of all commands
#         set -x                   # enable tracing inside script
#         set -e                   # stop execution on first error
#     Explanation:
#         These help identify which commands are failing in scripts

# Q14: Difference between soft link and hard link
# A14:
#     Hard link: points to the same inode, changes reflect in all links, cannot cross filesystems
#     Soft link (symlink): points to file path, can cross filesystems, broken if target is deleted
#     Commands:
#         ln file.txt file_hard    # creates hard link
#         ln -s file.txt file_soft # creates symbolic link

# Q15: How to check memory usage and top memory-consuming processes
# A15:
#     Commands:
#         free -h                       # shows total, used, free memory in human-readable form
#         top                           # interactive display of processes sorted by CPU or memory
#         ps aux --sort=-%mem | head -n 10  # top 10 memory-consuming processes
#     Explanation:
#         Helps identify memory leaks or heavy processes

# Q16: Search recursively for a text in files
# A16:
#     Command:
#         grep -rnw '/path/to/dir' -e 'search_text'
#     Explanation:
#         -r : recursive search
#         -n : show line numbers
#         -w : match whole word only
#         Useful to quickly locate errors or config lines in multiple files

# Q17: Compress and extract files
# A17:
#     Commands:
#         tar -czvf archive.tar.gz /dir      # compress directory into tar.gz
#         tar -xzvf archive.tar.gz           # extract tar.gz archive
#         gzip file.txt                       # compress single file
#         gunzip file.txt.gz                  # extract single file
#     Explanation:
#         tar: combines multiple files into single archive
#         gzip: compresses individual file

# Q18: Check running services
# A18:
#     Commands:
#         systemctl status <service>         # check if service is running
#         systemctl start <service>          # start service
#         systemctl stop <service>           # stop service
#         systemctl restart <service>        # restart service
#     Explanation:
#         systemctl manages systemd services
#         Useful for troubleshooting services like nginx, docker, etc.

# Q19: Process substitution in bash
# A19:
#     Command:
#         diff <(ls dir1) <(ls dir2)
#     Explanation:
#         <(command) : allows command output to be used as a file input
#         diff compares contents of two directories without creating temporary files

# Q20: Schedule multiple commands in one cron job
# A20:
#     Command:
#         0 3 * * * /script1.sh && /script2.sh
#     Explanation:
#         '&&' ensures second command runs only if first succeeds
#         Alternatively, put multiple commands inside a single shell script
#         Cron syntax: minute hour day month day-of-week

