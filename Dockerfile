FROM alpine:3.14

# Install curl so we can pull down Bertini
RUN apk --no-cache add curl

# Install aws cli so we can interact with S3
RUN apk add --no-cache \
        python3 \
        py3-pip \
    && pip3 install --upgrade pip \
    && pip3 install \
        awscli \
    && rm -rf /var/cache/apk/*

RUN aws --version

# Download and extract Bertini
RUN mkdir -p /bertini
WORKDIR /bertini
RUN curl https://bertini.nd.edu/BertiniLinux64_v1.6.tar.gz --output bertini.tar.gz && tar xzvf bertini.tar.gz

RUN mkdir -p /bertini/files

WORKDIR /bertini

COPY runbertini.sh /bertini
RUN chmod +x runbertini.sh

#ENTRYPOINT [ "", "" ]