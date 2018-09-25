FROM nvidia/cuda:9.2-cudnn7-runtime

RUN apt-get update && apt-get install -y --no-install-recommends curl bzip2 && \
   rm -rf /var/lib/apt/lists/*

RUN curl -o ~/miniconda.sh -O https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh  && \
     chmod +x ~/miniconda.sh && \
     ~/miniconda.sh -b -p /opt/conda && \
     rm ~/miniconda.sh && \
     /opt/conda/bin/conda install python=3.6 numpy pyyaml h5py scipy && \
     /opt/conda/bin/conda clean -ya

ENV PATH /opt/conda/bin:$PATH
RUN pip install https://github.com/evdcush/TensorFlow-wheels/releases/download/tf-1.10.0-gpu-9.2-tensorrt-mkl/tensorflow-1.10.0-cp36-cp36m-linux_x86_64.whl && \
  rm -rf /root/.cache

ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64

WORKDIR /workspace
RUN chmod -R a+w /workspace

COPY benchmark_deep.py /workspace/benchmark_deep.py
COPY run.sh /workspace/run.sh
ENV ngpu 1

CMD /workspace/run.sh