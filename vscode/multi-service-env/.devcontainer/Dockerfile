FROM llwydev/vsc-python-dev:v1.0

# RUN echo '{"hosts": ["tcp://0.0.0.0:2375", "unix:///var/run/docker.sock"], "group": "docker"}' > /etc/docker/daemon.json

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.0.30.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update