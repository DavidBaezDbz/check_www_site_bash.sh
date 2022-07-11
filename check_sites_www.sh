#!/bin/bash
# Parameteres {1} = Duration on check  {2} = Send Evidence  {3} = only take a evidence and send and exit to the bach
# Basic Functions and parameters
if [ "$4" == "Debug" ] ; then set -x ; fi
clear
# color costants
black="\e[0;30m\033[1m"
redColour="\e[0;31m\033[1m"
lightredColour="\e[1;31m\033[1m"
greenColour="\e[0;32m\033[1m"
lightgreenColour="\e[1;32m\033[1m"
yellowColour="\e[1;33m\033[1m"
orangeColour="\e[0;33m\033[1m"
blueColour="\e[0;34m\033[1m"
lightblueColour="\e[1;34m\033[1m"
purpleColour="\e[0;35m\033[1m"
lightpurpleColour="\e[1;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
lightturquoiseColour="\e[1;36m\033[1m"
grayColour="\e[0;37m\033[1m"
white="\e[1;37m\033[1m"
endColour="\033[0m\e[0m"
RC=0
function exit_1(){
    echo -e "${yellowColour}[*]${endColour}${grayColour} Leaving ${greenColour}${0}${grayColour} ..."
    exit 1
}
#Validate the number of parameters
if [ "$#" -lt 3 ]  
then
    echo -en "${redColour}[*]3 argument required. ${greenColour} Date: $(date +%x) $(date +%X) --> These are the parameters do you type: ${yellowColour}${*}${endColour}\n"
    exit_1
fi
if ! [[ $1 =~ ^[0-9]+$ ]]
then
    echo -en "${redColour}[*]The first parameter is not a number, the first parameter is ${yellowColour}${1}. ${greenColour} Date: $(date +%x) $(date +%X) --> These are the parameters do you type: ${yellowColour}${*}${endColour}\n"
    exit_1
else
    if ! [[ $1 -ge 0  && $1 -le 1200 ]]
    then
        echo -en "${redColour}[*]The first parameter ${greenColour}is not between 0 to 1200${redColour}, but the first parameter is ${yellowColour}${1}. ${greenColour} Date: $(date +%x) $(date +%X) --> These are the parameters do you type: ${yellowColour}${*}${endColour}\n"
        exit_1
    fi
fi
if ! [[ $2 =~ ^[0-9]+$ ]]
then
   echo -en "${redColour}[*]The second parameter is not a number, the second parameter is ${yellowColour}${2}. ${greenColour} Date: $(date +%x) $(date +%X) --> These are the parameters do you type: ${yellowColour}${*}${endColour}\n"
   exit_1
else
    if ! [[ $2 -ge 0  && $2 -le 1 ]]
    then
        echo -en "${redColour}[*]The second parameter ${greenColour}is not between 0 to 1${redColour}, but the second parameter is ${yellowColour}${2}. ${greenColour} Date: $(date +%x) $(date +%X) --> These are the parameters do you type: ${yellowColour}${*}${endColour}\n"
        exit_1
    fi
fi
if ! [[ $3 =~ ^[0-9]+$ ]]
then
   echo -en "${redColour}[*]The thrid parameter is not a number, the thrid parameter is ${yellowColour}${3}. ${greenColour} Date: $(date +%x) $(date +%X) --> These are the parameters do you type: ${yellowColour}${*}${endColour}\n"
   exit_1
else
    if ! [[ $3 -ge 0  && $3 -le 1 ]]
    then
        echo -en "${redColour}[*]The thrid parameter ${greenColour}is not between 0 to 1${redColour}, but the thrid parameter is ${yellowColour}${3}. ${greenColour} Date: $(date +%x) $(date +%X) --> These are the parameters do you type: ${yellowColour}${*}${endColour}\n"
        exit_1
    fi
fi
#Validate Parameters when take evidence
if [ "$2" == "0" ] &&  [ "$3" == "1" ]
then 
    echo -en "${lightgreenColour}[*]You choose take and send Evidence but the second parameter is ${yellowColour}${2}. ${endColour} ${lightgreenColour} TThe second parametes is has to be ${yellowColour}1${greenColour} Date: $(date +%x) $(date +%X) --> These are the parameters do you type: ${yellowColour}${*}${endColour}\n"
    exit_1
fi
trap ctrl_c INT
function ctrl_c(){
	echo -e "\n\n${yellowColour}[*]${endColour}${grayColour} Leaving ${greenColour}${0}${grayColour} ..."
    if [ -f wwwevidence/$DATECHECK/*.pdf ]
    then
        rm wwwevidence/$DATECHECK/*.pdf
    fi 
    echo -en "${greenColour}****************************************************************** ${lightpurpleColour}Completed $(date +%x) $(date +%X)${greenColour} ******************************************************************${endColour}\n" >> logwebstatus.log
	exit 0
}
function bannerDBZ(){
	echo -e "\n${redColour}'||''|.                     ||       '||  '||''|.                           '||''|.   '||''|.   |'''''||  "
        sleep 0.05
        echo -e " ||   ||   ....   .... ... ...     .. ||   ||   ||   ....     ....  ......   ||   ||   ||   ||      .|'   "
        sleep 0.05
        echo -e " ||    || '' .||   '|.  |   ||   .'  '||   ||'''|.  '' .||  .|...|| '  .|'   ||    ||  ||'''|.     ||     "
        sleep 0.05
        echo -e " ||    || .|' ||    '|.|    ||   |.   ||   ||    || .|' ||  ||       .|'     ||    ||  ||    ||  .|'     ${endColour}${yellowColour}(${endColour}${grayColour}Create By ${endColour}${redColour} DBZ - ${endColour}${purpleColour} Watch WebSite (V 2.0)..${endColour}${yellowColour})${endColour}${redColour}"
        sleep 0.05
        echo -e ".||...|'  '|..'|'    '|    .||.  '|..'||. .||...|'  '|..'|'  '|...' ||....| .||...|'  .||...|'  ||......| ${endColour}\n\n"
        sleep 0.05
}
function banner(){
        echo "+----------------------------------------------------------------------------------+"
        printf "| %-80s |\n" "`date`"
        echo "|                                                                                  |"
	    printf "|`tput setab 2``tput setaf 0` %-80s `tput sgr0`|\n" "$@"
        echo -e "+----------------------------------------------------------------------------------+\n\n"
}
# Create evidence directories
function archivo_evidencias(){
    if [ ! -d wwwevidence/ ]
    then
        mkdir wwwevidence
    fi
}
function archivo_evidencias_date(){
    if [ ! -d wwwevidence/${1} ]
    then
        mkdir wwwevidence/${1}
    fi
}
# Create evidence the website / Open in wsl firefox and save image on pdf file of the website
# sudo apt-get install cutycapt
function take_evidence(){
    echo -en "${lightgreenColour}[*]Evidence ${lightblueColour}${1}$(date +%x) $(date +%X) --> ${yellowColour}${1}${endColour}\n"
    #CAPT_FILE=$(date -u +"%Y-%m-%dT%H-%M-%SZ_%s")
    #CAPT_FILE=${2}
    CAPT_FILEHTML=$1-$2.html
    CAPT_FILEPDF=$1-$2.pdf
    CAPT_FILEHTML=$(echo $CAPT_FILEHTML | tr "/" "-" | sed s/://g | sed s/https//g | sed s/http//g | sed s/--//g | sed s/'#'//g )
    CAPT_FILEPDF=$(echo evidence$CAPT_FILEPDF | tr "/" "-" | sed s/://g | sed s/https//g | sed s/http//g | sed s/--//g | sed s/'#'//g)
    #echo CAPT_FILEHTML
    echo -en "${lightgreenColour}[*]Open Web page ${lightblueColour}${1}$(date +%x) $(date +%X) --> ${yellowColour}${1}${endColour}\n"
    #open the webste on firefox
    firefox $1 & 2>/dev/null
    echo -en "${lightgreenColour}[*]Save evidence ${lightblueColour}${1}$(date +%x) $(date +%X) --> ${yellowColour}${1}${endColour}\n"
    #save the website in the directory
    wget -O wwwevidence/$2/${CAPT_FILEHTML} -q - ${1}
    echo -en "${lightgreenColour}[*]Open evidence in the terminal ${lightblueColour}${1}$(date +%x) $(date +%X) --> ${yellowColour}${1}${endColour}\n"
    #view the website in the terminal
    cat  wwwevidence/$2/${CAPT_FILEHTML} | w3m -dump -T text/html
    echo -en "${lightgreenColour}[*]Save in evidence image of the website ${lightblueColour}${1}$(date +%x) $(date +%X) --> ${yellowColour}${1}${endColour}\n"
    # save the website image in pdf file
    cutycapt --max-wait=3000 --print-background=on --url=${1} --out=wwwevidence/$2/$CAPT_FILEPDF 2>/dev/null
}
function fill_array(){ 
    for (( i=0; i<$1; i++ ))
    do 
        array_error[${#array_error[@]}]=0
        array_l[${#array_l[@]}]=0
        array_l5[${#array_l5[@]}]=0
    done
}
bannerDBZ
# Check website array
readarray -t site < websitecheck
# Array para guardar errores
web_len="${#site[@]}"
#  Function to fill the three array
fill_array $web_len
# Counter for check websites
CICLO=1
#DATECHECK=$(date +%x)-$(date +%X)
DATECHECK=$(echo $(date +%x)$(date +%X) | tr "/" "-" | sed s/://g | sed s/https//g | sed s/http//g | sed s/-//g | sed s/'#'//g)
if [ ${2} -eq "1" ]
then
    SENDEVIDENCE="1"
    # Verify evidence directoryb
    archivo_evidencias
    archivo_evidencias_date $DATECHECK
else
    SENDEVIDENCE="0"
fi
FIRSTCHECKERROR=""
FIRSTCHECKSLOW=""
FIRSTCHESCKVERYLOW=""
echo -en "${greenColour}****************************************************************** ${blueColour}Checking $(date +%x) $(date +%X)${greenColour} ******************************************************************${endColour}\n" >> logwebstatus.log
while true;
do
    # counters
    SITES_DOWN=0
    for element in $(seq 0 $(($web_len - 1)))
    do
        # run curl
        RET=`curl -sL -w "%{http_code} %{time_total}\\n" "${site[$element]}" -o /dev/null`
        HTTP_CODE=`echo $RET | cut -d' ' -f1`
        TIME=`echo $RET | cut -d' ' -f2`
        CHECK=$greenColour"<[OK]>"
        # put cursor at 1st column
        if [ "$HTTP_CODE" -ge "400" ] || [ "$HTTP_CODE" -eq "000" ]; then
             # site down :( delay the checking
            SITES_DOWN=`expr $SITES_DOWN + 1`
            # increment error counter
            array_error[element]=`expr ${array_error[$element]} + 1`
            # Only for wsl
            /mnt/c/DBZ/DBZ/bash/notify-send/wsl-notify-send.exe --appId "ERROR -- WEBSITE IS DOWN" -c "Checking WebSites - IT" "${site[$element]} the website is not available."
            # For linux
            # DISPLAY=:0 notify-send -i dialog-error "Site check" "${SITES_DOWN} site(s) are not available"
            if [ $CICLO -eq "1" ]
            then
                if [ $2 -eq "1" ]
                then
                    FIRSTCHECKERROR=$(echo -e $FIRSTCHECKERROR'<h4><p><FONT COLOR="#003e6f">ERROR CODE ON THE WEBSITE IS: <FONT COLOR="#c04242">['$HTTP_CODE's]<FONT COLOR="#003e6f"> ON '${site[$element]}' AT <FONT COLOR="#209747">'$(date +%x) $(date +%X)'. <FONT COLOR="#c04242">**THE WEBSITE IS DOWN**</p></h4>')
                    HTTP_CODEFIRST=$HTTP_CODE
                    CHECKFIRST="<[FAIL]>"
                fi
            fi
            HTTP_CODE=$redColour$HTTP_CODE$endColour
            CHECK=$redColour"<[FAIL]>"
        else
           # site up :)
            if [ $CICLO -eq "1" ]
            then
                if [ $2 -eq "1" ]
                then
                    HTTP_CODEFIRST=$HTTP_CODE
                    CHECKFIRST="<[OK]>"
                fi
            fi
            HTTP_CODE=$greenColour$HTTP_CODE$endColour
        fi
        # check if time is < 5 seconds
        if [ "`echo $TIME | cut -d'.' -f1`" -gt "5" ]
        then
            # site very slow (> 5s) 
            array_l5[element]=`expr ${array_l5[$element]} + 1`
            /mnt/c/DBZ/DBZ/bash/notify-send/wsl-notify-send.exe --appId "ALERT -- VERY SLOW 5s" -c "IT" "${site[$element]} The website is very slow to load (5 Segundos)."
            if [ $CICLO -eq "1" ]
            then
                if [ $2 -eq "1" ]
                then
                    FIRSTCHESCKVERYLOW=$(echo -e $FIRSTCHESCKVERYLOW'<h4><p><FONT COLOR="#003e6f">TIME IS <FONT COLOR="#c04242">['$TIME's]<FONT COLOR="#003e6f"> LOAD THE WEBSITE '${site[$element]}' AT <FONT COLOR="#209747">'$(date +%x) $(date +%X)'. <FONT COLOR="#c04242">**THE WEBSITE IS VERY SLOW**</p></h4>')
                    TIMEFIRST=[${TIME}s]
                    CHECKFIRST="<[FAIL]>"
                fi
            fi
            TIME=$redColour[${TIME}s]$endColour
            CHECK=$redColour"<[FAIL]>"
        elif [ "`echo $TIME | cut -d'.' -f1`" -gt "0" ]
        then
            # site slow (1 < time 5 )
            array_l[element]=`expr ${array_l[$element]} + 1`
            if [ $CICLO -eq "1" ]
            then
                if [ $2 -eq "1" ]
                then
                    FIRSTCHECKSLOW=$(echo -e $FIRSTCHECKSLOW'<h4><p><FONT COLOR="#003e6f">TIME IS <FONT COLOR="#f9b233">['$TIME's]<FONT COLOR="#003e6f"> LOAD THE WEBSITE '${site[$element]}' AT <FONT COLOR="#209747">'$(date +%x) $(date +%X)'. <FONT COLOR="#f9b233">**THE WEBSITE IS SLOW**</p></h4>')
                    CHECKFIRST="<[FAIL]>"
                    TIMEFIRST=[${TIME}s]
                fi
            fi
            TIME=$yellowColour[${TIME}s]$endColour
            CHECK=$redColour"<[FAIL]>"
        else
            # site ok (< 1s)
            if [ $CICLO -eq "1" ]
            then
                if [ $2 -eq "1" ]
                then
                    CHECKFIRST="<[OK]>"
                    TIMEFIRST=[${TIME}s]
                fi
            fi
            TIME=$blueColour[${TIME}s]$endColour
        fi
        # send evidence for the first check
        if [ $CICLO -eq "1" ]
        then
            if [ $2 -eq "1" ]
            then
                take_evidence ${site[$element]} ${DATECHECK}
                SENDEVIDENCE="1"
                # Write in log and make a conclusion
                echo -en "${HTTP_CODEFIRST}" "${TIMEFIRST}" "[*]Checking $(date +%x) $(date +%X)--> ${site[$element]} [*] C=$CICLO -> S=${array_l[$element]} S5=${array_l5[$element]} E=${array_error[$element]} ${CHECKFIRST}\n" >> wwwevidence/$DATECHECK/logwebstatusfirst${DATECHECK}.log                  
            fi
        fi
        # Write in log
        echo -en "${HTTP_CODE}" "${TIME}" "${turquoiseColour}[*]Checking $(date +%x) $(date +%X)--> ${yellowColour}${site[$element]}${purpleColour} [*] ${greenColour}C=$CICLO -> ${turquoiseColour}S=${array_l[$element]} ${yellowColour}S5=${array_l5[$element]} ${redColour}E=${array_error[$element]} ${CHECK} ${endColour}\n" >> logwebstatus.log  
    done 
    # Create unique pdf and delete other -- compres file ans send email
    if [ $SENDEVIDENCE -eq "1" ]
    then
        SENDEVIDENCE="0"
        CAPT_FILEFINALPDF=file$DATECHECK.pdf
        #merge files pfd
        echo -en "${lightgreenColour}[*]Marge PDF ${lightblueColour}${0}$(date +%x) $(date +%X) --> ${yellowColour}${*}${endColour}\n"
        qpdf --empty --pages $(for i in wwwevidence/$DATECHECK/*.pdf; do echo $i 1-z; done) -- wwwevidence/$DATECHECK/$CAPT_FILEFINALPDF
        #delete files evidence
        echo -en "${lightgreenColour}[*]Delete PDF ${lightblueColour}${0}$(date +%x) $(date +%X) --> ${yellowColour}${*}${endColour}\n"
        rm wwwevidence/$DATECHECK/evidence*
        #open de file
        echo -en "${lightgreenColour}[*]Open Merge PDF ${lightblueColour}${0}$(date +%x) $(date +%X) --> ${yellowColour}${*}${endColour}\n"
        evince wwwevidence/$DATECHECK/$CAPT_FILEFINALPDF
        # compress pdf and html
        echo -en "${lightgreenColour}[*]Compress PDF - HTML files ${lightblueColour}${0}$(date +%x) $(date +%X) --> ${yellowColour}${*}${endColour}\n"
        7z a -mx=9 wwwevidence/$DATECHECK/PDF${DATECHECK}.7z wwwevidence/$DATECHECK/*.pdf >/dev/null
        7z a -mx=9 wwwevidence/$DATECHECK/HTML${DATECHECK}.7z wwwevidence/$DATECHECK/*.html -sdel >/dev/null
        # if the variables have information, the conclusion is modified
        CONCLUSION=$(echo -e '<h2><FONT COLOR="#003e6f">WEBCHECKING</h2><strong><p><FONT COLOR=black>Normal Status</p></strong><p>When reviewing <strong><FONT COLOR="#3396FF">"'"$web_len"'"</strong><FONT COLOR=black> websites: <h4><strong>NO PROBLEMS WERE FOUND</strong></h4> So the <strong>conclusion</strong> is that the monitored websites are in <strong><FONT COLOR="#209747">NORMAL CONDITION</strong>.</p>')
        if [ ${#FIRSTCHECKERROR} -gt "0" ]
        then
            CONCLUSION=$(echo -e '<h2><FONT COLOR="#003e6f">WEBCHECKING</h2><strong><h1><p><FONT COLOR="#c04242">Alert Status</p></h1><FONT COLOR=black></strong><p>When reviewing <strong><FONT COLOR="#0f70b7">"'"$web_len"'"</strong><FONT COLOR=black> websites: <h4><strong><FONT COLOR="#c04242">PROBLEMS WERE FOUND</strong></h4><FONT COLOR=black> So the <strong>conclusion</strong> is that the monitored websites are in <strong><FONT COLOR="#c04242">PROBLEM CONDITION</strong>.</p><h2><FONT COLOR="#c04242">Serious errors were found in the monitored websites, it is urgent that the websites be REVIEWED IMMEDATELY</h2>'$FIRSTCHECKERROR$FIRSTCHESCKVERYLOW$FIRSTCHECKSLOW)
        elif [ ${#FIRSTCHESCKVERYLOW} -gt "0" ]
        then
            CONCLUSION=$(echo -e '<h2><FONT COLOR="#003e6f">WEBCHECKING</h2><strong><h1><p><FONT COLOR="#c04242">Alert Status</p></h1><FONT COLOR=black></strong><p>When reviewing <strong><FONT COLOR="#0f70b7">"'"$web_len"'"</strong><FONT COLOR=black> websites: <h4><strong><FONT COLOR="#c04242">PROBLEMS WERE FOUND</strong></h4><FONT COLOR=black> So the <strong>conclusion</strong> is that the monitored websites are in <strong><FONT COLOR="#c04242">PROBLEM CONDITION</strong>.</p><h2><FONT COLOR="#c04242">There is a slowness of more than 5 seconds in opening the monitored websites, it is urgent that the websites are REVIEWED IMMEDATELY</h2>'$FIRSTCHESCKVERYLOW$FIRSTCHECKSLOW)
        elif [ ${#FIRSTCHECKSLOW} -gt "0" ]
        then
            CONCLUSION=$(echo -e '<h2><FONT COLOR="#003e6f">WEBCHECKING</h2><strong><h1><p><FONT COLOR="#f9b233">Alert Status</p></h1><FONT COLOR=black></strong><p>When reviewing <strong><FONT COLOR="#0f70b7">"'"$web_len"'"</strong><FONT COLOR=black> websites: <h4><strong><FONT COLOR="#f9b233">PROBLEMS WERE FOUND</strong></h4><FONT COLOR=black> So the <strong>conclusion</strong> is that the monitored websites are in <strong><FONT COLOR="#f9b233">PROBLEM CONDITION</strong>.</p><h2><FONT COLOR="#f9b233">There is a slowness of more than 1 second in opening the monitored websites, it is important to CHECK THE WEBSITES</h2>'$FIRSTCHECKSLOW)
        fi        
        #sudo apt install mailutils
        #send email 
        #https://tonyteaches.tech/postfix-gmail-smtp-on-ubuntu/
        #https://www.drupaladicto.com/actualidad/como-instalar-y-configurar-postfix-como-servidor-smtp-solo-de-envio-en-ubuntu-2004 Work but google block my ip
        echo -en "${lightgreenColour}[*]Start Send Evidence ${lightblueColour}${0}$(date +%x) $(date +%X) --> ${yellowColour}${*}${endColour}\n"
        emailcorreo=$(<email)
        mutt -e "set content_type=text/html" -s "WEBServer CHECKING $DATECHECK" -a wwwevidence/$DATECHECK/HTML${DATECHECK}.7z -a wwwevidence/$DATECHECK/PDF${DATECHECK}.7z -a wwwevidence/$DATECHECK/logwebstatusfirst${DATECHECK}.log -- ${emailcorreo} <<< ${CONCLUSION}
        echo -en "${lightgreenColour}[*]End Send Evidence ${lightblueColour}${0}$(date +%x) $(date +%X) --> ${yellowColour}${*}${endColour}\n"
        bannerDBZ
        #Only for take and send Evidence
        if [ ${3} -eq "1" ]
        then
            echo -en "${lightgreenColour}[*]Only for take and send Evidence ${lightblueColour}${0}$(date +%x) $(date +%X) --> ${yellowColour}${*}${endColour}\n"
            ctrl_c
        fi
    fi
    #echo -en "\n${turquoiseColour}***********************************************************************${endColour}"
    if [ $SITES_DOWN -gt 0 ]; then   
        sleep 60
    else
        if [ -z $1 ]
        then
            sleep 5
        else
            if [ $CICLO -eq "1" ]
            then
                sleep 0
            else
                sleep $1
            fi 
        fi
    fi
    CICLO=$((CICLO+1))
done