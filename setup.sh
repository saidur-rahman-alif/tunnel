#!/bin/bash

# Configuration
BASE_URL="https://raw.githubusercontent.com/saidur-rahman-alif/tunnel/refs/heads/main/"
Arab_Emirates="tunnel-ae"
United_States="tunnel-us" 
FOLDER="/usr/local/bin"
FILE_AE="$FOLDER/$Arab_Emirates"
FILE_US="$FOLDER/$United_States" 

# Function to check and display status
check_status() {
    local file=$1
    local name=$2
    
    if [ -f "$file" ]; then
        echo -e "\e[32m✅ $name\e[0m"
    else
        echo -e "\e[31m❌ $name\e[0m"
    fi
}

# Function to display menu
show_menu() {
    clear
    echo "VexoCloud Tunnel Manager"
    echo "Installed Tunnels: "
    
    # Show status for Arab Emirates
    check_status "$FILE_AE" "Arab Emirates"
    
    # Show status for United States  
    check_status "$FILE_US" "United States"
    
    echo ""
    echo "1. Tunnel UAE"
    echo "2. Tunnel  US"
    echo "0. Exit"
    echo -n "Select [0-2]: "
}

# Main loop
while true; do
    show_menu
    read choice
    
    case $choice in
        1)
            # Option 1: Download and setup Arab Emirates tunnel
            echo ""
            sudo mkdir -p "$FOLDER"
            if sudo curl -L "${BASE_URL}${Arab_Emirates}" -o "$FILE_AE" 2>/dev/null; then
                sudo chmod 777 "$FILE_AE"  # All permissions for everyone
                echo "✅ Successfully installed Arab Emirates!"
                echo " File: $FILE_AE"
                echo " Permissions: 777 (read, write, execute for all)"
            else
                echo "❌ Error installing Arab Emirates!"
            fi
            echo -e "\nPress Enter to continue..."
            read
            ;;
            
        2)
            # Option 2: Download and setup United States tunnel
            echo ""
            sudo mkdir -p "$FOLDER"
            if sudo curl -L "${BASE_URL}${United_States}" -o "$FILE_US" 2>/dev/null; then
                sudo chmod 777 "$FILE_US"  # All permissions for everyone
                echo "✅ Successfully installed United States!"
                echo " File: $FILE_US"
                echo " Permissions: 777 (read, write, execute for all)"
            else
                echo "❌ Error installing United States!"
            fi
            echo -e "\nPress Enter to continue..."
            read
            ;;
            
        0)
            echo ""
            echo "Exiting. Goodbye!"
            exit 0
            ;;
            
        *)
            echo ""
            echo "Invalid choice!"
            echo "Press Enter to continue..."
            read
            ;;
    esac
done
