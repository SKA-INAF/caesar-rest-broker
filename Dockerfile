FROM rabbitmq:latest
MAINTAINER Simone Riggi "simone.riggi@gmail.com"

######################################
##   DEFINE CUSTOMIZABLE ARGS/ENVS
######################################
ARG USERNAME_ARG="caesar"
ENV USERNAME $USERNAME_ARG

ARG PASSWORD_ARG="caesar"
ENV PASSWORD $PASSWORD_ARG

######################################
##     RUN
######################################
# - Install packages
RUN apt-get update && apt-get --no-install-recommends install -y netcat iputils-ping nmap telnet

# - Create rabbitmq caesar user
RUN rabbitmqctl add_user ${USERNAME} ${PASSWORD}

# - Set user permissions
RUN rabbitmqctl set_permissions -p / ${USERNAME} ".*" ".*" ".*"

