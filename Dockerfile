FROM pymesh/pymesh

RUN apt-get update -y && \
    apt-get install -y libglew-dev

RUN git clone https://github.com/Dingry/DeepJoin.git && \
    cd DeepJoin && \
    bash ./install_pymesh.sh && \
    bash ./install.sh && \
    source setup.sh
