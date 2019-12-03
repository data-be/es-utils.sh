FROM bash:5.0.11

WORKDIR /opt/es-utils

COPY ./src /opt/es-utils

RUN chmod +x -R /opt/es-utils

ENTRYPOINT [ "bash", "/opt/es-utils/main.sh" ]
