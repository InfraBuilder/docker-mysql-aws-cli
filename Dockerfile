FROM mysql:5.7
RUN	apt-get update \
	&& apt-get install -y \
		python3-pip \
		screen \
	&& pip3 install awscli \
	&& chmod 777 /run/screen \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

ENV	AWS_ACCESS_KEY_ID="" \
	AWS_SECRET_ACCESS_KEY="" \
	AWS_DEFAULT_REGION="" \
	AWS_DEFAULT_OUTPUT=""

CMD ["bash"]
