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
