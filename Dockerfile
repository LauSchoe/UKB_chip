FROM ubuntu:22.04
# Install miniconda
RUN apt-get update && apt-get install -y wget
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-py39_24.5.0-0-Linux-x86_64.sh -O ~/miniconda.sh && \
/bin/bash ~/miniconda.sh -b -p /opt/conda
ENV PATH=/opt/conda/bin:${PATH}

COPY /workflows/environment.yml .
RUN conda update -y conda && \
    conda env update -n root -f environment.yml && \
    conda clean --all

# for bioconda to correctly install bcftools
RUN ln -s /lib/x86_64-linux-gnu/libgsl.so.27 /opt/conda/lib/libgsl.so.25