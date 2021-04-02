FROM rabbitmq:latest
MAINTAINER Simone Riggi "simone.riggi@gmail.com"

######################################
##   DEFINE CUSTOMIZABLE ARGS/ENVS
######################################
#ARG RABBITMQ_USER_ARG="caesar"
#ENV RABBITMQ_USER $RABBITMQ_USER_ARG

#ARG RABBITMQ_PASSWORD_ARG="caesar"
#ENV RABBITMQ_PASSWORD $RABBITMQ_PASSWORD_ARG

######################################
##     RUN
######################################
# - Install packages
RUN apt-get update && apt-get --no-install-recommends install -y netcat iputils-ping nmap telnet

# - Create rabbitmq caesar user
##RUN rabbitmqctl add_user ${RABBITMQ_USER} ${RABBITMQ_PASSWORD}
##RUN rabbitmqctl set_user_tags {RABBITMQ_USER} administrator

# - Set user permissions
##RUN rabbitmqctl set_permissions -p / ${RABBITMQ_USER} ".*" ".*" ".*"

# - Copy config file
ADD rabbitmq.config /etc/rabbitmq/
RUN chown rabbitmq:rabbitmq /etc/rabbitmq/rabbitmq.config

# - Expose port and run server
#ENTRYPOINT ["docker-entrypoint.sh"]
#CMD ["rabbitmq-server"]

