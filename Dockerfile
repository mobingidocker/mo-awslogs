FROM amazonlinux:2017.03

RUN yum update -y && yum install -y \
		awslogs \
		cronie \
		logrotate \
	&& yum clean all \
	&& easy_install supervisor

COPY awslogs.conf /etc/awslogs/awslogs.conf
COPY supervisord.conf /etc/supervisord.conf
COPY run.sh /run.sh
RUN chmod 755 /run.sh

CMD ["/run.sh"]
