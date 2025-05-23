FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Install dependencies
RUN apt update && apt install -y \
    curl git software-properties-common openssh-client \
    tmate \
    bash \
    locales \
    && locale-gen en_US.UTF-8

# Optional: add a user (security)
RUN useradd -ms /bin/bash shelluser

# Set working directory
WORKDIR /home/shelluser

# Copy the start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# No port needs to be exposed for SSH, but ttyd users can enable this:
# EXPOSE 7681

CMD ["/start.sh"]
