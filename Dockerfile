FROM ubuntu:jammy

RUN apt-get update && \
    apt-get install -y dnsutils && \
    rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
