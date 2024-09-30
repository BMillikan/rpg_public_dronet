FROM ubuntu:18.04 as base

ARG DEBIAN_FRONTEND="noninteractive" 
ENV TZ="America/New_York"
RUN apt-get update && \
    apt-get -y install python3 \
                       python3-pip \
                       wget \
                       curl \
                       tzdata \
                       python3-opencv 

# GPU variant of Tensorflow
ENV TENSORFLOW_VARIANT gpu/tensorflow-1.5.1-cp34-none

#RUN ln -s /usr/bin/python3 /usr/bin/python
#RUN ln -s /usr/bin/pip3 /usr/bin/pip

RUN python3 -V

RUN pip3 install tensorflow==1.5.0 numpy==1.14.5 keras==2.1.4 scikit-learn==0.18.1 python-gflags protobuf==3.4.0 scipy==0.19

CMD ["/bin/bash"]
