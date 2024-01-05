# backup_with_SCP_automatically
A batch script I created that backs up important files from my Windows computer over to my Raspberry Pi serving as a local network share.

0. This is a very simple .bat script I use to upload important documents and files from my computer over to a Raspberry Pi that serves as a local network share. 

-> You must setup a local network share using SAMBA or another program

1. Once a local network share is created, generate a SSH key on your local computer (The computer that hosts the documents/files you want to upload).
2. On Linux/MAC systems, SCP is typically already installed. On Windows (what I am using as the file host), I had to install PSCP.exe and set it up correctly to allow for SCP commands to execute.
3. On your backup system (Raspberry PI w/ Local Network Drive for my case) set up the local network drive so your file host can connect to it. This will involve creating a username and transferring SSH keys to allow both systems to work with SSH key authentication.
4. Once the initial steps are completed and verified as functional, you can begin to customize the 'upload_file_wSCP.bat' script.
   -> Be sure to use the correct username you setup for your local network share in the 'DESTINATION_USER' field.
   -> 'Destination_Server' is your network share's local IP
   -> 'Destination_Path' is the path you set for your network share
   -> In the "Execute SCP command' section, the only field you will need to identify is where your SSH key file is stored on the system with the file you'd like to upload
5. You can optionally add the following command to create a duplicate version of your file to use the duplicate for uploading: 'copy /y <location of primary file> <location and new file name for the copy>'
   -> I created a separate script just for the copy command as I needed to make more frequent backup copies of the specific file and I did not want to upload this backup more than once a day
6. Once the script(s) is setup, you can use a task scheduling system to execute the script at a specified interval or action. I used Windows task scheduler and I will post the instructions for that below:


Windows Task Scheduler:
1. Create a new task with Task Scheduler.
2. For triggers, I set it to trigger daily at 9:00pm.
3. For actions, I did the following:
   -> I chose "Start a program" as my action
   -> For the program/script section, I entered the location of CMD which is typically located here: 'C:\Windows\System32\cmd.exe'
   -> For my arguments, I added the following: '/c <location of bat file>.bat'
   -> That is basically all that was done
