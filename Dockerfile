# syntax=docker/dockerfile:1

FROM jonasbn/yak:0.22.0@sha256:354e98cb28bb8eb7a6a73eff40687bc52512cc911261f64c65c03b9459f2151c

LABEL org.opencontainers.image.title="github-action-yak"
LABEL org.opencontainers.image.description="GitHub Action for yak"
LABEL org.opencontainers.image.source="https://github.com/jonasbn/github-action-yak"
LABEL org.opencontainers.image.licenses="MIT"

COPY --chmod=755 entrypoint.sh /entrypoint.sh

# This is our staging work directory
WORKDIR /tmp

ENTRYPOINT ["/entrypoint.sh"]
