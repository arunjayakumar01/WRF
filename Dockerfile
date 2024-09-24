FROM ubuntu:22.04


ENV REPO_URL=https://github.com/HathewayWill/WRF-MOSIT.git


RUN apt-get update && apt-get install build-essential make cmake gcc git

RUN cd $HOME && git clone $REPO_URL WRF-MOSIT

WORKDIR $HOME/WRF-MOSIT

RUN cp scripts/install.sh ./WRF-MOSIT.sh

RUN chmod 775 *.sh

./WRF-MOSIT.sh 2>&1 | tee WRF_MOSIT.log

