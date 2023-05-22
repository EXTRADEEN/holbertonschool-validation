FROM ubuntu:20.04

RUN sed -i 's/archive.ubuntu.com/mirror.example.com/g' /etc/apt/sources.list

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y curl gnupg

# Install Node.js and Make
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y --no-install-recommends nodejs=14.* make=4.* && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install a specific version of npm
RUN npm install -g npm@9.5.1

# Install Golang from binary distribution
ARG GO_VERSION="1.20.4"
ARG GO_CHECKSUM="698ef3243972a51ddb4028e4a1ac63dc6d60821bf18e59a807e051fee0a385bd"

ENV CGO_ENABLED=0
ENV GO111MODULE=on

RUN curl --silent --show-error --location --output /tmp/go.tgz \
    "https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz" \
  && echo "${GO_CHECKSUM} /tmp/go.tgz" | sha256sum --check --status - \
  && tar -C /usr/local -xzf /tmp/go.tgz \
  && go version | grep "${GO_VERSION}" \
  && rm -f /tmp/go.tgz

# Create a new user called student
RUN useradd -m student

# Add the student user to the sudo group
RUN usermod -aG sudo student

# Allow the student user to use sudo without a password prompt
RUN echo 'student ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Switch to the student user
USER student

# Set the default command to run as the student user
CMD ["/bin/bash"]
