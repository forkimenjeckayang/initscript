#!/bin/bash

# Main script menu
main_menu() {
    while true; do
        read -p "Select the project type (1 for Python / 2 for Bash / 3 to exit): " project_type
        case $project_type in
            1 ) python_project; break;;
            2 ) bash_project; break;;
            3 ) echo "Exiting now. Feel free to come back anytime..."; exit;;
            * ) echo "Error: Invalid input. Please choose either 1, 2, or 3.";;
        esac
    done
}

# Function to create a Python project in the home directory
python_project() {
    make_dir
    make_file "$project_name.py"
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

    # Create a virtual environment
    read -p "Enter a name for the virtual environment: " venv_name
    python3 -m venv "$venv_name"
    echo "Virtual environment '$venv_name' created successfully!"
    cd "$venv_name"
    
    echo -e "Activate the virtual environment in your terminal using:\nsource $venv_name/bin/activate\n\nTo run the project, use:\npython $project_name.py" > README.md
    echo "Python project '$project_name' created successfully! Check the README file for instructions on activating your virtual environment."
    main_menu
}

# Function to create a Bash project in the home directory
bash_project() {
    make_dir
    make_file "$project_name.sh"
    echo -e "#!/bin/bash\n\necho 'Hello, $project_name!'" > "$project_name.sh"
    chmod +x "$project_name.sh"
    echo -e "To run the project:\n\n1. If the script has execution permissions:\n   - Navigate to the project directory: cd $project_directory\n   - Execute the script: ./$project_name.sh\n\n2. If the script does not have execution permissions:\n   - Navigate to the project directory: cd $project_directory\n   - Allow execution permissions for the script: chmod +x $project_name.sh\n   - Execute the script: ./$project_name.sh" > README.md
    echo "Bash project '$project_name' created successfully in $project_directory!"

    # Add the project directory to the PATH
    echo "export PATH=\"$project_directory:\$PATH\"" >> "$HOME/.bashrc"
    echo "export PATH=\"$project_directory:\$PATH\"" >> "$HOME/.bash_profile"

    # Source the .bashrc and .bash_profile files
    source "$HOME/.bashrc" 2>/dev/null || source "$HOME/.bash_profile" 2>/dev/null
}

# Function to create a project directory
make_dir() {
    read -p "Enter the project name: " project_name
    project_directory="$HOME/$project_name"
    if [ -d "$project_directory" ]; then
        echo "Error: The specified directory '$project_directory' already exists."
        while true; do
            read -p "Would you like to rename this project? (y/n): " yn
            case $yn in
                [Yy]* ) make_dir; break;;
                [Nn]* ) cd "$project_directory"; return 0;;
                * ) echo "Please answer yes or no.";;
            esac
        done
    fi
    mkdir "$project_directory"
    cd "$project_directory"
}

# Function to create a project file
make_file() {
    if [ -f "$project_directory/$1" ]; then
        echo "Error: The specified file '$1' already exists within $project_directory."
        while true; do
            read -p "Would you like to override this file? (y/n): " yn
            case $yn in
                [Yy]* ) break;;
                [Nn]* ) echo "Aborting operation"; exit;;
                * ) echo "Please answer yes or no.";;
            esac
        done
    fi
    touch "$project_directory/$1"
}

main_menu
