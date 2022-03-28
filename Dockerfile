FROM ubuntu:20.04
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
	libxml2-utils
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]