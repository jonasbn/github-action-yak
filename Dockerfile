# syntax=docker/dockerfile:1

FROM jonasbn/yak:0.23.0@sha256:fa6388385d604fa5eda857b996a399763cc220898d7646620866c53bcaa47121

LABEL org.opencontainers.image.title="github-action-yak"
LABEL org.opencontainers.image.description="GitHub Action for yak"
LABEL org.opencontainers.image.source="https://github.com/jonasbn/github-action-yak"
LABEL org.opencontainers.image.licenses="MIT"

COPY --chmod=755 entrypoint.sh /entrypoint.sh

# This is our staging work directory
WORKDIR /tmp

ENTRYPOINT ["/entrypoint.sh"]
