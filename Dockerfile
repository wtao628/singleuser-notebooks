FROM alpine

ARG USER=linux

ENV DEBIAN_FRONTEND=noninteractive

USER root

# Set up JupyterHub
RUN apk update \
    && apk upgrade --no-cache \
    && apk add --no-cache python3 py3-pip \
    && apk add --no-cache --virtual build-dep gcc linux-headers musl-dev python3-dev \
    && python3 -m pip install -U --break-system-packages pip setuptools \
    && python3 -m pip install --break-system-packages --no-cache-dir "jupyterhub==4.*" jupyterlab "notebook==7.*" \
    && apk del build-dep \
    && mkdir /srv/jupyterhub \
    && adduser -h /home/${USER} -D ${USER} \
    && chmod ug+rwx /home/${USER}

# Prevent running container as root
USER ${USER}

WORKDIR /home/${USER}

CMD ["jupyterhub-singleuser"]
