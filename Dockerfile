FROM ubuntu
ARG region=eu
RUN echo "\n\nUsing region: ${region}\n\n\n"
RUN apt update && apt install -y ntpdate
ADD https://checker-mainet-s3.s3.ap-southeast-1.amazonaws.com/${region}/AethirCheckerCLI-linux-1.0.2.3.tar.gz /
RUN mkdir /aethir-node
RUN tar -zxf AethirCheckerCLI-linux-1.0.2.3.tar.gz -C /aethir-node --strip-components 1

RUN touch  /root/.yes_aethir
WORKDIR /aethir-node
ADD run_and_log.sh docker_update.sh /aethir-node/
COPY <<EOF /aethir-node/update.sh
#!bin/bash
./docker_update.sh
EOF
RUN chmod 755 update.sh

CMD ./run_and_log.sh

