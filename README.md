# rpi-couchpotato

Dockerfile to set up a Couchpotato container, based on the Hypriot image

## Build

    docker build --tag qnm/rpi-couchpotato git://github.com/qnm/rpi-couchpotato.git

## Run

    docker run -d -p 5050:5050 -v <LOCAL_MOVIES_FOLDER>:/movies --restart=always --name couchpotato qnm/rpi-couchpotato


