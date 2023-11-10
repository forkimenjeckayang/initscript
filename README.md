**Documentation**

This script helps automate the creation of both Bash and Python script files, making it easier to start new projects. To get started, follow these steps:

1. **Make the Script Executable:** After downloading the script, ensure it's executable by running the command: `chmod +x initscript.sh`

2. **Run the Script:** You can now execute the script by running `./initscript.sh` from the directory where the script is located.

3. **Make the Script Accessible Everywhere:** If you want to run the script from any location on your system, you'll need to follow these steps:

   a. **Create a 'bin' Directory:** If it doesn't already exist, create a directory called 'bin' in your home directory.
      - Run the command: `mkdir ~/bin`

   b. **Add 'bin' Directory to Your PATH:** This ensures that your shell knows where to find the script. Open your shell profile file (e.g., `~/.bashrc` or `~/.bash_profile`) in a text editor, and add the following line to the end of the file:
      - `export PATH="~/bin:$PATH"`

   c. **Move the Script:** Place the script in the 'bin' directory by running the command: `mv initscript.sh ~/bin`

   d. **Make the Script Executable:** Skip this step if you've already made the script executable in the directory where you initially downloaded it.

   e. **Reload Your Shell Profile:** Use the command: `source ~/.bashrc` (or `~/.bash_profile`) to apply the changes.

After completing these steps, you'll be able to run this script from anywhere on your system by simply typing its name.

**For Python and Bash Script Options:**

When you create a new Python or Bash project using this script, a `README.md` file will be automatically generated in the specified directory. This file provides guidance on how to run your project.

Thank you for using this script!