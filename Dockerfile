FROM ubuntu:14.04 as base

ARG DEBIAN_FRONTEND="noninteractive" 
ENV TZ="America/New_York"
RUN apt-get update && \
    apt-get -y install python3-dev \
                       wget \
                       curl \
                       tzdata \
                       libglib2.0-0 \
                       libsm6 \
                       libxext6 \
                       libxrender-dev

# GPU variant of Tensorflow
ENV TENSORFLOW_VARIANT gpu/tensorflow-1.5.0-cp34-none

#RUN ln -s /usr/bin/python3 /usr/bin/python
#RUN ln -s /usr/bin/pip3 /usr/bin/pip

RUN python3 -V

# Install Pip n Python modules
RUN wget https://bootstrap.pypa.io/pip/3.4/get-pip.py && \
    python3 get-pip.py && \
    rm get-pip.py

RUN pip3 install tensorflow==1.5.0 numpy==1.14.5 keras==2.1.4 scikit-learn==0.18.1 python-gflags protobuf==3.4.0 scipy==0.19 opencv-python==3.4.0.12 h5py


CMD ["/bin/bash"]
