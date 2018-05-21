FROM alpine:edge

MAINTAINER Juan Darien Macías Hernández <darienmh@gmail.com>

# add openssh and clean
RUN \
  apk add --update openssh && \
  rm  -rf /tmp/* /var/cache/apk/* && \
  #make sure we get fresh keys
  rm -rf /etc/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_dsa_key
  
# add entrypoint script
ADD docker-entrypoint.sh /usr/local/bin

EXPOSE 22
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/usr/sbin/sshd","-D"]
