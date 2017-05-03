FROM amazonlinux

RUN yum install -y zip gcc gcc-c++ make openssl-devel git
RUN cd /tmp/ | curl -O https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py
RUN pip install awscli

# Install nodejs
RUN cd /tmp && \
    curl -O https://nodejs.org/dist/v6.10.0/node-v6.10.0.tar.gz && \
    tar -xvf node-v6.10.0.tar.gz && \
    rm node-v6.10.0.tar.gz && \
    cd node-v6.10.0 && \
    ./configure && make && make install

RUN mkdir /lambda/
RUN mkdir /deploy/

ENV NODE_ENV production

ADD upload-lambda /bin/
