FROM debian:jessie

RUN apt-get -y update
RUN apt-get -y install openssh-server
RUN apt-get -y install git-core
RUN apt-get -y install vim
RUN apt-get -y install sudo
RUN apt-get -y install man

# Setting openssh
RUN mkdir /var/run/sshd
RUN sed -i "s/#PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config

# Adding git user
RUN mkdir -p /home/git/.ssh

# Clearing and setting authorized ssh keys
# ...
# Clearing and setting authorized ssh keys
RUN echo '' >> /home/git/.ssh/authorized_keys
# ...

# Updating shell to bash

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
