#!/bin/bash


# Main script menu
main_menu() {
  while true; do
    read -p "Enter project type (1 for Python / 2 for Bash / 3 to exit): " project_type

    if [[ $project_type == 1 ]]; then
    python_project
    elif [[ $project_type == 2 ]]; then
    bash_project
   elif [[ $project_type == 3 ]]; then
   echo "Exiting now, sure do come back anytime.......3"
    exit 0
   else
    echo "Invalid project type. Please choose either 1, 2 or 3"
    main_menu
   fi
done
}

# Function to create Python project in the home directory
python_project() {
    read -p "Enter project name: " project_name
    project_directory="$HOME/$project_name"
    mkdir "$project_directory"
    cd "$project_directory"
    touch "$project_name.py"
    echo -e "import math\n\nprint('Hello, $project_name!')" > "$project_name.py"
    echo "Python project '$project_name' created successfully in $project_directory!"

    # Check if Python 3 is installed
    if ! command -v python3 &> /dev/null; then
        echo "Python 3 is not installed. Installing now..."
        # Install Python 3
        sudo apt-get update
        sudo apt-get install python3 -y
        echo "Python 3 installed successfully!"
    fi

    # Check if pip is installed
    if ! command -v pip &> /dev/null; then
        echo "pip is not installed. Installing now..."
        # Install pip
        sudo apt-get install python3-pip -y
        echo "pip installed successfully!"
    fi

    # Check if virtualenv is installed
    if ! command -v virtualenv &> /dev/null; then
        echo "virtualenv is not installed. Installing now..."
        # Install virtualenv
        sudo pip install virtualenv
        echo "virtualenv installed successfully!"
    fi

    # Create virtual environment
    read -p "Enter virtual environment name: " venv_name
    python3 -m venv "$venv_name"
    echo "virtual env '$venv_name' created successfully! "
    cd "$venv_name"
    
    echo -e "Activate the virtual environment on your terminal using:\nsource $venv_name/bin/activate\n\nTo run the project, use:\npython $project_name.py" > README.md
    echo "Python project '$project_name' created successfully! Check README file on how to activate your virtual enviroment "
main_menu
}

# Function to create Bash project in the home directory
bash_project() {
    read -p "Enter project name: " project_name
    project_directory="$HOME/$project_name"
    mkdir "$project_directory"
    cd "$project_directory"
    touch "$project_name.sh"
    echo -e "#!/bin/bash\n\necho 'Hello, $project_name!'" > "$project_name.sh"
    chmod +x "$project_name.sh"
    echo -e "To run the project:\n\n1. If the script has execution permissions:\n   - Navigate to the project directory: cd $project_directory\n   - Execute the script: ./$project_name.sh\n\n2. If the script does not have execution permissions:\n   - Navigate to the project directory: cd $project_directory\n   - Allow execution permissions for the script: chmod +x $project_name.sh\n   - Execute the script: ./$project_name.sh" > README.md
    echo "Bash project '$project_name' created successfully in $project_directory!"

    # Add project directory to PATH
    echo "export PATH=\"$project_directory:\$PATH\"" >> "$HOME/.bashrc"
    echo "export PATH=\"$project_directory:\$PATH\"" >> "$HOME/.bash_profile"

    # Source the .bashrc and .bash_profile files
    source "$HOME/.bashrc" 2>/dev/null || source "$HOME/.bash_profile" 2>/dev/null
}

main_menu
