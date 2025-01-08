# ubuntu 22.04
FROM ubuntu:jammy-20240911.1 AS base
RUN apt-get update && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        git && \
    rm -rf /var/lib/apt/lists/*

FROM base AS conda
RUN curl -o miniconda.sh "https://repo.anaconda.com/miniconda/Miniconda3-py310_24.11.1-0-Linux-x86_64.sh" && \
    bash miniconda.sh -b -p /opt/conda && \
    rm miniconda.sh && \
    /opt/conda/bin/conda install gh==2.64.0 --channel conda-forge && \
    /opt/conda/bin/conda clean -ya
ENV PATH=/opt/conda/bin:$PATH
WORKDIR /workspace
