FROM jonasbn/yak:latest

# We point to the original repository for the image
LABEL org.opencontainers.image.source https://github.com/jonasbn/github-action-yak

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# This is our staging work directory
WORKDIR /tmp

ENTRYPOINT ["/entrypoint.sh"]
