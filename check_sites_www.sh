#!/bin/bash
if [ "$1" == "Debug" ] ; then set -x ; fi
clear
# color costants
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"
RC=0
# Basic Function
trap ctrl_c INT
function ctrl_c(){
	echo -e "\n\n${yellowColour}[*]${endColour}${grayColour} Saliendo de ${greenColour}${0}${grayColour} ...\n${endColour}${blueColour}(Ctrl+C)${endColour}"
	exit 1
}
function bannerDBZ(){
	echo -e "\n${redColour}'||''|.                     ||       '||  '||''|.                           '||''|.   '||''|.   |'''''||  "
        sleep 0.05
        echo -e " ||   ||   ....   .... ... ...     .. ||   ||   ||   ....     ....  ......   ||   ||   ||   ||      .|'   "
        sleep 0.05
        echo -e " ||    || '' .||   '|.  |   ||   .'  '||   ||'''|.  '' .||  .|...|| '  .|'   ||    ||  ||'''|.     ||     "
        sleep 0.05
        echo -e " ||    || .|' ||    '|.|    ||   |.   ||   ||    || .|' ||  ||       .|'     ||    ||  ||    ||  .|'     ${endColour}${yellowColour}(${endColour}${grayColour}Creado por ${endColour}${redColour} DBZ - ${endColour}${purpleColour} Script check_sites_www ${endColour}${yellowColour})${endColour}${redColour}"
        sleep 0.05
        echo -e ".||...|'  '|..'|'    '|    .||.  '|..'||. .||...|'  '|..'|'  '|...' ||....| .||...|'  .||...|'  ||......| ${endColour}\n\n"
        sleep 0.05
}
bannerDBZ
# Sitios a revisar
site=(
  "https://www.xxxx1.com/"
  "https://www.xxxx2.com/"
  "https://www.xxxx.com/"
  # add sites to check
)
# Array to save the fail and slow request . If you add other site add a other 0 on the three arrays
array_error=(0 0 0)
array_l=(0 0 0 )
array_l3=(0 0 0)
# do not print colors if we are redirecting output
COLOR(){
  if [ -t 1 ] ; then
    echo -ne $1
  fi
}
# total of sites
LEN=${#site[@]}
CICLO=1
while true;
do
    # counters
    SITES_DOWN=0
    SITES_SLOW=0
    for element in $(seq 0 $(($LEN - 1)))
    do
        # run curl
        RET=`curl -sL -w "%{http_code} %{time_total}\\n" "${site[$element]}" -o /dev/null`
        HTTP_CODE=`echo $RET | cut -d' ' -f1`
        TIME=`echo $RET | cut -d' ' -f2`
        # put cursor at 1st column
        echo -en "\033[1G";
        # UP - DOWN SITE
        if [ "$HTTP_CODE" -lt "400" ]; then
            # site up
            COLOR $greenColour
        else
            # site down
            SITES_DOWN=`expr $SITES_DOWN + 1`
            array_error[element]=`expr ${array_error[$element]} + 1`
            # i use wsl-notify-send.exe for send desktop alert
            /mnt/c/xxx/xxx/wsl-notify-send.exe --appId "ERROR -- Availability" -c "IT" "${site[$element]} the site is down."
            # write on log
            echo -en "${redColour}${HTTP_CODE} ${greenBlue}[${TIME}s] ${turquoiseColour}[*]Check $(date +%x) $(date +%X)->${yellowColour}${site[$element]}${purpleColour} ${greenColour}C=$CICLO ${redColour}E=${array_error[$element]} ${turquoiseColour}L=${array_l[$element]} ${redColour}L3=${array_l3[$element]}${endColour}\n" >> logwebstatus.log
            COLOR $redColour
        fi
        # print HTTP status code
        echo -en $HTTP_CODE
        COLOR $endColour
        # check if time is < 4 seconds
        if [ "`echo $TIME | cut -d'.' -f1`" -gt "3" ]
        then
            # site very slow (> 3s)
            SITES_SLOW=`expr $SITES_SLOW + 1`
            array_l3[element]=`expr ${array_l3[$element]} + 1`
            # i use wsl-notify-send.exe for send desktop alert
            /mnt/c/xxx/xxx/wsl-notify-send.exe --appId "ALERT -- SLOW 3s" -c "IT DBZ" "${site[$element]} slow site (4 Sec)."
            # write on log
            echo -en "${greenColour}${HTTP_CODE} ${greenBlue}[${TIME}s] ${turquoiseColour}[*]Check $(date +%x) $(date +%X)->${yellowColour}${site[$element]}${purpleColour} ${greenColour}C=$CICLO ${redColour}E=${array_error[$element]} ${turquoiseColour}L=${array_l[$element]} ${redColour}L3=${array_l3[$element]}${endColour}\n" >> logwebstatus.log
            COLOR "\e[1;33m"
        elif [ "`echo $TIME | cut -d'.' -f1`" -gt "0" ]
        then
            # site slow (1 < time 3 )
            array_l[element]=`expr ${array_l[$element]} + 1`
            #/mnt/c/xxx/xxx/wsl-notify-send.exe --appId "ALERT -- SLOW 1s" -c "IT DBZ" "${site[$element]} slow site(1 Sec)."
            # write on log
            echo -en "${greenColour}${HTTP_CODE} ${greenBlue}[${TIME}s] ${turquoiseColour}[*]Check $(date +%x) $(date +%X)->${yellowColour}${site[$element]}${purpleColour} ${greenColour}C=$CICLO ${redColour}E=${array_error[$element]} ${turquoiseColour}L=${array_l[$element]} ${redColour}L3=${array_l3[$element]}${endColour}\n" >> logwebstatus.log
            COLOR "\e[0;33m"
        else
            # site ok (< 1s)
            COLOR "\e[0;34m"
        fi
        # Time to load and summary
        echo -en " [${TIME}s]" "${turquoiseColour}[*]Check $(date +%x) $(date +%X)->${yellowColour}${site[$element]}${purpleColour} ${greenColour}C=$CICLO ${redColour}E=${array_error[$element]} ${turquoiseColour}L=${array_l[$element]} ${redColour}L3=${array_l3[$element]}${endColour}\n"
        COLOR $endColour
    done 
    echo -en "\n${turquoiseColour}***********************************************************************${endColour}"
    if [ $SITES_DOWN -gt 0 ]; then
        # Time to verify what happend and don't full with desktop alerts
        sleep 60
    else
        if [ -z $1 ]
        then
            sleep 5
        
        else
            sleep $1
        fi
    fi
    CICLO=$((CICLO+1))
done
