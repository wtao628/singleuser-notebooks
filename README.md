# Single-user JupyterHub Dockerfiles

This is the Alpine-based single-user JupyterHub Dockerfile for Docker containers that are designed to be spawned by the [JupyterHub Docker Spawner](https://jupyterhub-dockerspawner.readthedocs.io/en/latest/). This was designed to create the smallest image possible. This Dockerfile does not include the Conda package manager (Dockerfiles with Conda by the Jupyter Development Team [here](https://github.com/jupyter/docker-stacks), under the images directory).

## Prerequisites
Before building this Dockerfile, you will need:

- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- Optional: Visual Studio Code with the Docker extension 

## Building
To build this Dockerfile without Visual Studio Code, type the following command into a terminal:

`docker build -t your-image-name .`

If you have Visual Studio Code with the Docker extension, then right click the Dockerfile and click "Build Image".
