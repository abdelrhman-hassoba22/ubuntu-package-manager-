#!$BASH
# this script for manage and control apt easily  

# this variable for while statement. 
v1=0

while [ $v1 -eq 0 ];do
echo "Choose from these numbers to execute what you want."
echo "1- update and upgrade."
echo "2- search for an application."
echo "3- install apps."
echo "4- remove apps from your system."
echo "5- show source, installed or upgradable list for packages."
echo "6- to quit press q"

# The variable that the user will enter.
read num

# case statement.
case $num in
# option number 1. 
    1) echo "1- update only."
       echo "2- upgrade only."
       echo "3- both."
       read op1
       case $op1 in
           1) sudo apt update;;
           2) sudo apt upgrade -y;;
           3) sudo apt update && sudo apt upgrade -y
       esac;;
# option number 2.
    2) read -p "enter name of app " name_app
       if [[ -z "$name_app" ]]; then
       echo "There is no text in the input field."
       sleep 2
       elif [[ -n "$name_app" ]]; then
       apt search $name_app
       read -p "To return to the main menu, press b" none
       fi;;
# option number 3.
    3) read -p "Before install app you should update and upgrade your packages if you want to update, press y; if not, press enter." up
       if [[ -z "$up" ]]; then
       printf ""
       elif [ $up = y ]; then
       sudo update && sudo upgrade -y
       fi
       read -p "enter name of app " n_app
       if [[ -z "$n_app" ]]; then
       echo "There is no text in the input field."
       elif [[ -n "$n_app" ]]; then
       sudo apt install $n_app
       fi;;
# option number 4.
    4) read -p "enter name of app." n_a
       if [[ -z $n_a ]]; then
       echo "There is no text in the input field."
       elif [[ -n $n_a ]]; then
       echo "1- remove "
       echo "2- purge "
       read rm
       case $rm in
           1) sudo apt remove $n_a;;
           2) sudo apt purge $n_a
       esac
       fi;;
# option number 5.
    5) echo "1- show source.list packages "
       echo "2- show installed packages "
       echo "3- show upgradable packages "
       read show
       case $show in
           1) cat /etc/apt/sources.list
           read -p "To return to the main menu, press b";;
           2) apt list --installed
           read -p "To return to the main menu, press b";;
           3) apt list --upgradable
           read -p "To return to the main menu, press b"
       esac;;
# option number 6 to quit.  
    q) v1=$[++1];;
# this option forIf any user presses any key other than the ones listed in the menu, an error message will appear.
    *) echo "Choose any number from the previous menu or press q to exit."  
esac
 
done
