Documentation
The script helps a user to automate the creating of a bash script file or a python script file
Once you have this script on your system, you will need to make it executable by using the command "chmod +x initscript.sh"

Now that it's executable, yu can now run it by using "./initscript.sh" form the directory where the script is found but to make the script accessibl from any where in your system you will need to follow the steps bellow

 1.Create a directory called 'bin' in your home directory (if not already present) 
 2. Run the command: mkdir ~/bin
 3. Add 'bin' directory to your PATH:
  - Open your shell profile file (e.g., ~/.bashrc or ~/.bash_profile) in a text editor.
   - Add the following line at the end of the file: export PATH="~/bin:$PATH"
   - Move this script to the 'bin' directory:
   - Run the command: mv initscript.sh ~/bin.
Make the script executable: Skip if you already made it executable in the diectory where you downloaded the script to
Reload your shell profile using the command : source ~/.bashrc (or ~/.bash_profile)
After completing these steps, you should be able to run this script from anywhere by simply typing its name.


For thr Python and Bash SCript Options
A README.md file will be automatically created in the directory name you specified on how to run the go about making it work.

THANK YOU
