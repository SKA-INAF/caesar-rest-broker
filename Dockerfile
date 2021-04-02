FROM rabbitmq:latest

MAINTAINER Simone Riggi "simone.riggi@gmail.com"

# - Install packages
RUN apt-get update && apt-get --no-install-recommends install -y netcat iputils-ping nmap telnet

