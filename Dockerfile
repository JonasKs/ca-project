FROM ubuntu:14.04
MAINTAINER My-Klong "mike@praqma.com"
RUN apt-get update && \
	apt-get install -y \
		python \
		python-pip
RUN mkdir -p /tmp/ca-project
ADD .  /tmp/ca-project
#RUN pip install -r /tmp/ca-project/requirements.txt
