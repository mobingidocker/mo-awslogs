FROM amazonlinux:2017.03

RUN yum update -y && yum install -y \
		awslogs \
		cronie \
		logrotate \
	&& yum clean all \
	&& easy_install supervisor

COPY awslogs.conf /etc/awslogs/awslogs.conf
COPY logging.conf /etc/awslogs/logging.conf
COPY supervisord.conf /etc/supervisord.conf

COPY restart-awslogs /etc/cron.d/restart-awslogs
RUN chmod 644 /etc/cron.d/restart-awslogs

COPY restart-awslogs.sh /restart-awslogs.sh
RUN chmod 755 /restart-awslogs.sh

COPY run.sh /run.sh
RUN chmod 755 /run.sh

CMD ["/run.sh"]
