FROM ubuntu:22.04

ARG USER=linux

ENV DEBIAN_FRONTEND=noninteractive

USER root

# Set up JupyterHub
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends python3 python3-pip \
    && apt-get clean \
    && python3 -m pip install -U pip setuptools \
    && python3 -m pip install "jupyterhub==4.*" jupyterlab "notebook==7.*" \
    && mkdir /srv/jupyterhub \
    && useradd -m ${USER} \
    && chmod ug+rwx /home/${USER}

# Prevent running container as root
USER ${USER}

WORKDIR /home/${USER}

CMD ["jupyterhub-singleuser"]
