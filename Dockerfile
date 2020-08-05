FROM ewels/multiqc:1.8

USER root

ARG USER=cabana
ARG CABANA_USER_ID=1000
ARG CABANA_GROUP_ID=1000

ENV HOME /home/$USER

# Creates work user.
RUN \
    addgroup -g "${CABANA_USER_ID}" -S $USER; \
    adduser -u "${CABANA_GROUP_ID}" -D -S -s /bin/bash -G $USER $USER;

# Sets working directory.
WORKDIR $HOME

# Creates the tools folder.
RUN mkdir data tools

# Sets ownership.
RUN chown -R $USER:$USER $HOME && \
    mkdir -p $HOME/CABANA

# Changes to work user.
USER $USER

# Entrypoint to keep the container running.
ENTRYPOINT ["tail", "-f", "/dev/null"]