FROM python:3.6-alpine
MAINTAINER Kacper Adler <kacper@kacperadler.info>

# Environment variables
ENV CLI_OPTIONS="-gd --noauth_local_webserver"
ENV CONFIG_FILE="/configFile.cfg"

# Add required binares
RUN pip3 install packt --upgrade

# Prepare entrypoint
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT /entrypoint.sh
