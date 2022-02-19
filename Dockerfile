FROM    ubuntu:20.04
USER    root
ARG     HOLLYWOOD_USER=mcbain
ENV     DEBIAN_FRONTEND=noninteractive
RUN     apt-get update \
  && apt-get dist-upgrade -y \
  && apt-get install hollywood -y \
  && apt-get clean  -y \
  && adduser --home /home/${HOLLYWOOD_USER} \
    --shell /bin/sh \
    --uid 1001 \
    --disabled-password ${HOLLYWOOD_USER}
USER    ${HOLLYWOOD_USER}
ENTRYPOINT [ "hollywood" ]