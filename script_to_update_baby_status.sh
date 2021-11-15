#! /bin/bash

if [ "$1" != "ON" ] && [ "$1" != "OFF" ]
  then
    echo -e "Usage:\nscript_to_update_baby_status.sh ON or OFF\n"
   else
    if [ $# != 1 ]
     then
      echo -e "Usage:\nscript_to_update_baby_status.sh ON or OFF\n"
    fi
fi


if [ $# == 1 ] && [ $1 == ON ]
  then
   echo -e "Lauching local baby cam to github pages \n"
   lt --port 6060 -l 192.168.15.14 | tee log.txt
     if pgrep -f "/usr/local/bin/lt" >/dev/null 2>&1 ;
      then
       URL=`cat log.txt`
       echo "Estamos online" ;
       sed -i '1d; 2 i title: A Cecília está ON' _config.ym
       sed -i '5d; 6 i \  baby_cam: https://blue-seahorse-wins.loca.lt\' _config.yml
  fi
fi
  
if [ $# == 1 ] && [ $1 == OFF ]
  then
     echo -e "Removing baby cam streaming from github pages: \n" ;
     sed -i '1d; 2 i title: A Cecília está offline :/' _config.ym
fi
