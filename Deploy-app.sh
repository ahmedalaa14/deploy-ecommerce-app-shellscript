#!bin/bash

function print_color(){
    NC='\033[0m' # No Color
    case $1 in
        "green") COLOR='\033[0;32m' ;;
        "red") COLOR='\033[0;31m' ;;
        "*") COLOR='\033[0m' ;;
    esac
    echo -e "${COLOR}$2${NC}"
}

#check the status of a given service. if not active exit script
#arguments
# service name. eg: firewalld , mariadb

function check_service_status(){
  service_is_active=$(sudo systemctl is-active $1)

  if [ $service_is_active = "active" ]
  then
    echo "$1 is active and running"
  else
    echo "$1 is not active/running"
    exit 1
  fi
}

#check the status of firewalld rule. if not configured exit.
#arguments
# port number eg:3306, 80

function is_firewalld_rule_configured(){

  firewalld_ports=$(sudo firewall-cmd --list-all --zone=public | grep ports)

  if [[ $firewalld_ports == *$1* ]]
  then
    echo "FirewallD has port $1 configured"
  else
    echo "FirewallD port $1 is not configured"
    exit 1
  fi
}

# Check if a given item is present in an output
# Arguments:
#   1 - Output
#   2 - Item

function check_item(){
  if [[ $1 = *$2* ]]
  then
    print_color "green" "Item $2 is present on the web page"
  else
    print_color "red" "Item $2 is not present on the web page"
  fi
}


echo "---------------- Setup Database Server ------------------"
# Install and configure firewalld
print_color "green" "Installing FirewallD.. "
sudo yum install -y firewalld

print_color "green" "Installing FirewallD.. "
sudo service firewalld start
sudo systemctl enable firewalld

# Check FirewallD Service is running
check_service_status firewalld
