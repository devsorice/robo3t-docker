#
# robo3t Dockerfile
#
# https://github.com/jlesage/docker-robo3t
#

# Pull base image.
FROM jlesage/baseimage-gui:ubuntu-18.04-v3

# Docker image version is provided via build arg.
ARG DOCKER_IMAGE_VERSION=unknown

# Define software download URLs.
#https://github.com/Studio3T/robomongo/releases/tag/v1.3.1
ARG ROBO_NAME=robo3t-1.3.1-linux-x86_64-7419c406
ENV ROBO_NAME=${ROBO_NAME}
ARG ROBO_URL=https://github.com/Studio3T/robomongo/releases/download/v1.3.1/${ROBO_NAME}.tar.gz

WORKDIR /tmp

# Download Robo3T.
RUN apt-get update && apt-get install -y   curl tar   && mkdir -p /defaults 
RUN curl -# -L -o /defaults/robo.tar.gz ${ROBO_URL} &&  cd /defaults 
RUN  mkdir -p /usr/local/bin/robo3t
RUN tar -xvzf  /defaults/robo.tar.gz  -C /tmp
RUN mv  /tmp/$ROBO_NAME/* /usr/local/bin/robo3t
RUN rm -rf /tmp/* /tmp/.[!.]*
RUN cd /usr/local/bin/robo3t/bin && chmod +x ./robo3t 
RUN apt-get install -y  libqt5x11extras5
RUN mkdir -p /tmp/run/user/app
RUN chmod 700 -R  /tmp/run/user/app





# Define working directory.
WORKDIR /usr/local/bin/robo3t/bin


# # Add files.
COPY rootfs/ /

# # Set environment variables.
ENV APP_NAME="Xvfb" \
    S6_KILL_GRACETIME=8000



# # Define mountable directories.
# VOLUME ["/config"]
# VOLUME ["/output"]

# # Expose ports.
# #   - 3129: For MyJDownloader in Direct Connection mode.
# #EXPOSE 3129

# Metadata.
LABEL \
      org.label-schema.name="robo3t" \
      org.label-schema.description="Docker container for Robo3t" \
      org.label-schema.version="$DOCKER_IMAGE_VERSION" \
      org.label-schema.vcs-url="https://github.com/jlesage/docker-robo3t" \
      org.label-schema.schema-version="1.0"


WORKDIR /

RUN ln -s /usr/local/bin/robo3t/bin/robo3t  /usr/bin/robo3t


#TEST
RUN add-pkg xterm
ENV APP_NAME="Xterm"