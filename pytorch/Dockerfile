FROM nvidia/cuda:9.2-cudnn7-runtime

RUN apt-get update && apt-get install -y --no-install-recommends curl bzip2 && \
   rm -rf /var/lib/apt/lists/*

RUN curl -o ~/miniconda.sh -O https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh  && \
     chmod +x ~/miniconda.sh && \
     ~/miniconda.sh -b -p /opt/conda && \
     rm ~/miniconda.sh && \
     /opt/conda/bin/conda install numpy pyyaml scipy && \
     /opt/conda/bin/conda clean -ya

ENV PATH /opt/conda/bin:$PATH
RUN conda install pytorch torchvision cuda92 magma-cuda92 -c pytorch && conda clean -ya

ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64

WORKDIR /workspace
RUN chmod -R a+w /workspace

COPY main.py /workspace/main.py

RUN python main.py --epoch 0

COPY run.sh /workspace/run.sh

CMD /workspace/run.sh