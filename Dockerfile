FROM ubuntu
RUN mkdir /aethir-node
RUN apt update && apt install -y ntpdate curl jshon
RUN curl -o /aethir-checker-cli.tar.gz $(curl 'https://app.aethir.com/console-api/client/download-conf?type=4' | jshon -e data -e 0 -e url -u)
RUN tar -zxf aethir-checker-cli.tar.gz -C /aethir-node --strip-components 1

RUN touch  /root/.yes_aethir
WORKDIR /aethir-node
ADD run_and_log.sh docker_update.sh /aethir-node/
COPY <<EOF /aethir-node/update.sh
#!bin/bash
./docker_update.sh
EOF
RUN chmod 755 update.sh

CMD ./run_and_log.sh

